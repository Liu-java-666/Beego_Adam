package controllers

import (
	"Beego_Adam/im"
	"Beego_Adam/models"
	"Beego_Adam/public"
	"Beego_Adam/utils"
	"encoding/json"
	"fmt"
	"github.com/astaxie/beego"
	_ "github.com/astaxie/beego"
	"github.com/wonderivan/logger"
	"strconv"
	"strings"
)

type LoginController struct {
	BaseController
}


//获取验证码
// swagger注解配置
//@Title Get
//@Description post GetCapcha
//@router /post [GetCapcha]
func (c *LoginController) GetCapcha()  {
	phone := c.GetString("phone")
	//检查手机号格式
	if !public.ValidPhoneNumber(phone) {
		c.JsonResult(0,"手机号码不正确,请重新输入")
	}
	captcha := new(models.Captcha)
	//获取验证码数据对象
	captcha, err := captcha.Captcha_Get(phone)
	if err != nil {
		beego.Error(err)
		c.JsonResult(1, err.Error())
	}
	//插入/更新验证码
	if captcha.Id == 0 {
		if err := captcha.Captcha_Insert(phone, "123456");err != nil{
			beego.Error(err)
			c.JsonResult(1, err.Error())
		}
	} else {
		if err := captcha.UpdateCaptcha(captcha.Id,"123456");err != nil{
			beego.Error(err)
			c.JsonResult(1, err.Error())
		}
	}
	c.JsonResult(200,"true")
}

//登录
func (c *LoginController) Login(){
	phone := c.GetString("phone")
	captcha := c.GetString("captcha")
	req := c.Ctx.Request
	ip := req.RemoteAddr // "IP:port" "192.168.1.150:8889"

	index := strings.IndexRune(ip, ':')
	if index >= 0 {
		ip = req.RemoteAddr[:index]
	}
	//检查手机号格式
	if !public.ValidPhoneNumber(phone) {
		c.JsonResult(0,"手机号码不正确,请重新输入")
	}
	//检查验证码
	if captcha != "123456"{
		c.JsonResult(0,"验证码不正确")
	}

	//获取已登录对象
	tcaptcha := new(models.Captcha)
	//获取验证码数据对象
	tcaptcha, err := tcaptcha.Captcha_Get(phone)
	if err != nil {
		beego.Error(err)
		c.JsonResult(1, err.Error())
	}
	timenow := public.GetNowTimestamp()
	if tcaptcha == nil || tcaptcha.IsUsed >0 || tcaptcha.ExpireTime < timenow{
		c.JsonResult(0,"请先获取验证码")
	}
	//获取用户数据
	user := new(models.User)
	tUser, err := user.User_GetByPhone(phone)
	if err != nil {
		beego.Error(err)
		c.JsonResult(0,"数据库异常",err)
	}
	userkey := public.GetRandString(32)
	bRegister := tUser == nil
	if bRegister{
		tUser, err = user.User_Insert(phone, ip, userkey)
		if err != nil {
			beego.Error(err)
			c.JsonResult(0,"数据库异常",err)
		}
	}else{
		//更新最后登录信息
		tUser.UpdateLogin(ip,userkey)
	}

	//使用验证码
	tcaptcha.SetUsed()
	//IM
	AppId, _ := strconv.Atoi(beego.AppConfig.String("AppId"))
	sig, err := im.GenSig(AppId, beego.AppConfig.String("Key"), fmt.Sprintf("%s%d", beego.AppConfig.String("Pre"), tUser.Id), 60*60*24*180)
	if err != nil{
		c.JsonResult(0,"IM生成sig失败")
	}
	if bRegister {
		im.AccountImport(tUser.Id, OnAccountImport)
	}
	//返回成功消息
	result := struct{
		UserId int
		UserKey string
		Nickname string
		AvatarFile string
		AvatarAudit int
		Signature string
		Sex int
		Age int
		IMAppid int
		IMSig string
		IMPre string

	}{
		tUser.Id,
		userkey,
		tUser.Nickname,
		utils.MakeImageUrl(tUser.AvatarFile),
		tUser.AvatarAudit,
		tUser.Signature,
		tUser.Sex,
		tUser.Age,
		AppId,
		sig,
		beego.AppConfig.String("Pre"),
	}
	c.JsonResult(200,"true",result)
	c.Data["json"] = result
	c.ServeJSON()
}

//导入IM账号结果
func OnAccountImport(resultData string, err error, user_data interface{}) {
	userdata := user_data.(int)

	if err != nil {
		logger.Error("导入IM账号失败,userid=%d,err=%v", userdata, err)
		return
	}

	logger.Debug(resultData)

	revData := make(map[string]interface{})
	err = json.Unmarshal([]byte(resultData), &revData)
	if err != nil {
		logger.Error("导入IM账号失败,userid=%d,err=%v,resultData=%v", userdata, err, resultData)
		return
	}

	//logger.Debug(revData)

	ActionStatus := revData["ActionStatus"].(string)
	if ActionStatus != "OK" {
		ErrorCode := int(revData["ErrorCode"].(float64))
		ErrorInfo := revData["ErrorInfo"].(string)
		logger.Error("导入IM账号失败,userid=%d,errcode=%d,errinfo=%s", userdata, ErrorCode, ErrorInfo)
		return
	}
	//
	////发送欢迎消息
	//msg := "你好呀，欢迎欢迎！我是你的最佳小助手，有什么问题随时找我哦~"
	//im.SendMsg(1, userdata, 0, msg)
	//
	//database.Message_Insert("ChatMsg",0,1,userdata,msg)
}

//完善资料
func (c *LoginController)CompleteInfo(){
	userid, _ := strconv.Atoi(c.GetString("userid"))
	userkey := c.GetString("userkey")
	nickname := c.GetString("nickname")
	avatarid, _ := strconv.Atoi(c.GetString("avatarid"))
	sex, _ := strconv.Atoi(c.GetString("sex"))
	ck := c.CheckUser(userid, userkey)
	if nickname == "" {
		c.JsonResult(0,"昵称不能为空")
	}
	if sex != 0 &&  sex != 1 {
		c.JsonResult(0,"性别传入错误")
	}
	//保存资料
	err := ck.User.User_CompleteInfo(nickname, sex, avatarid)
	if err != nil{
		c.JsonResult(1,err.Error())
	}
	c.JsonResult(200,"true")
}



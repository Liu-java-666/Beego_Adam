package controllers

import (
	"Beego_Adam/models"
	"compress/gzip"
	"encoding/json"
	"fmt"
	"github.com/astaxie/beego"
	"io"
	"strings"
)

type BaseController struct {
	beego.Controller
}

type JsonReturn struct {
	Msg string   `json:"msg"`
	Code int	`json:"code"`
	Data interface{} 	`json:"data"`
}
// Ajax接口返回Json
func (c *BaseController) JsonResult(errCode int, errMsg string, data ...interface{}) {
	jsonData := make(map[string]interface{}, 3)
	jsonData["errcode"] = errCode
	jsonData["message"] = errMsg

	if len(data) > 0 && data[0] != nil {
		jsonData["data"] = data[0]
	}
	returnJSON, err := json.Marshal(jsonData)
	if err != nil {
		beego.Error(err)
	}
	c.Ctx.ResponseWriter.Header().Set("Content-Type", "application/json; charset=utf-8")
	//启用gzip压缩
	if strings.Contains(strings.ToLower(c.Ctx.Request.Header.Get("Accept-Encoding")), "gzip") {
		c.Ctx.ResponseWriter.Header().Set("Content-Encoding", "gzip")
		w := gzip.NewWriter(c.Ctx.ResponseWriter)
		defer w.Close()
		w.Write(returnJSON)
		w.Flush()
	} else {
		io.WriteString(c.Ctx.ResponseWriter, string(returnJSON))
	}
	c.StopRun()
}

func (c *BaseController)MakeImagePath(filename string)string{
	if filename == "" {
		return ""
	}
	return fmt.Sprintf("%s/%s/image/%s", beego.AppConfig.String("Root"),  beego.AppConfig.String("Path"), filename)
}

type CheckUserResult struct {
	Result bool
	User *models.User
	Error string
}

func (c *BaseController)CheckUser(userid int,userkey string)CheckUserResult{
	user, err := new(models.User).User_GetById(userid, true)
	result := CheckUserResult{}
	if err != nil{
		c.JsonResult(1,err.Error())
	}
	if user == nil{
		c.JsonResult(0,"用户不存在")
	}
	if user.UserKey != userkey{
		c.JsonResult(0,"用户数据异常，请重新登录")
	}
	result.Result = true
	result.Error = "true"
	result.User = user
	return result
}


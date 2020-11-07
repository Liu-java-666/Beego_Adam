package utils

import (
	"Beego_Adam/models"
	"fmt"
	"github.com/astaxie/beego"
	"io"
	"os"
)

const limit  int = 20 //分页限制
type Form map[string]interface{}

type tagError struct {
	Result bool
	ErrCode int
	ErrMsg string
}

type CheckUserResult struct {
	Result bool
	Error tagError
	User *models.User
}

//检查用户
func CheckUser(userid int, userkey string) CheckUserResult {
	result := CheckUserResult{}
	//读取用户数据
	tuser, err := new(models.User).User_GetById(userid, true)
	if err != nil {
		result.Error = ErrorResult("数据库异常")
		return result
	}
	//判断用户
	if tuser == nil {
		result.Error = ErrorResult("用户不存在")
		return result
	}
	//判断userkey
	if tuser.UserKey != userkey {
		result.Error = ErrorResultSpecial(1,"用户数据异常，请重新登录")
		return result
	}

	//返回成功消息
	result.Result = true
	result.Error.Result = true
	result.User = tuser

	return result
}

func ErrorResult(msg string) tagError {
	data := tagError{
		Result: false,
		ErrMsg: msg,
	}
	return data
}

func ErrorResultSpecial(code int, msg string) tagError {
	data := tagError{
		Result: false,
		ErrCode:code,
		ErrMsg: msg,
	}
	return data
}

//生成图片地址
func MakeImageUrl(filename string) string {
	if filename == "" {
		return ""
	}
	return fmt.Sprintf("%s/%s/image/%s", beego.AppConfig.String("Host"),beego.AppConfig.String("Path"), filename)
}

//生成图片路径
func MakeImagePath(filename string) string {
	if filename == "" {
		return ""
	}
	return fmt.Sprintf("%s/%s/image/%s", beego.AppConfig.String("Root"),beego.AppConfig.String("Path"), filename)
}

//生成声音地址
func MakeVioceUrl(filename string) string {
	if filename == "" {
		return ""
	}
	filename = "/voice/"+filename
	return fmt.Sprintf("%s/%s%s",beego.AppConfig.String("Host"), beego.AppConfig.String("Path"),filename)
}

//生成视频地址
func MakeVideoUrl(filename string) string {
	if filename == "" {
		return ""
	}
	filename = "/video/"+filename
	return fmt.Sprintf("%s/%s%s",beego.AppConfig.String("Host"), beego.AppConfig.String("Path"),filename)
}

//生成视频路径
func MakeVideoPath(filename string) string {
	if filename == "" {
		return ""
	}
	filename = "/video/"+filename
	return fmt.Sprintf("%s/%s%s",beego.AppConfig.String("Root"), beego.AppConfig.String("Path"),filename)
}
//生成房间ID
//func GenerateRoomID() int{
//	RoomID := 0
//	for i:=1;i<=10;i++ {
//		rd := rand.Intn(888888)+100001
//		room,err := database.Room_Get(rd)
//		if err==nil && room==nil{
//			RoomID = rd
//			break
//		}
//	}
//
//	return RoomID
//}


//拷贝文件
func CopyFile(srcName,  dstName string) (written int64, err error) {
	// 以读方式打开源文件
	src, err := os.Open(srcName)
	if err != nil {
		fmt.Printf("open %s failed, err:%v.\n", srcName, err)
		return
	}
	defer src.Close()
	// 以写|创建的方式打开目标文件
	dst, err := os.OpenFile(dstName, os.O_WRONLY|os.O_CREATE, 0644)
	if err != nil {
		fmt.Printf("open %s failed, err:%v.\n", dstName, err)
		return
	}
	defer dst.Close()
	return io.Copy(dst, src) //调用io.Copy()拷贝内容
}



//func TryCatch(){
//	if err:=recover();err!=nil{
//		switch err.(type) {
//		case runtime.Error: // 运行时错误
//			logger.Error("runtime error:",err)
//			//debug.PrintStack()
//			//写入日志文件
//			buff := make([]byte, 1<<10)
//			runtime.Stack(buff, false)
//			logger.Error(string(buff))
//		default: // 非运行时错误
//			logger.Error("error:",err)
//		}
//	}
//}
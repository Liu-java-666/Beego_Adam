package routers

import (
	"BestCP_Beego/controllers"
	"github.com/astaxie/beego"
)

func init() {
    beego.Router("/", &controllers.MainController{})

    //用户登录
    beego.Router("/get-capcha",&controllers.LoginController{},"*:GetCapcha")
    beego.Router("/login",&controllers.LoginController{},"*:Login")
    beego.Router("/complete-info",&controllers.LoginController{},"*:CompleteInfo")

    //上传
	beego.Router("/upload-image",&controllers.FileUploadController{},"*:UploadPhoto")
	beego.Router("/upload-video",&controllers.FileUploadController{},"*:UploadVideo")
	beego.Router("/upload-voice",&controllers.FileUploadController{},"*:UploadVoice")

	//首页
	beego.Router("/home-videolist",&controllers.HomeController{},"*:HomeVideoList")
}

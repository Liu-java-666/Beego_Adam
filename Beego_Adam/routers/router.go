package routers

import (
	"Beego_Adam/controllers"
	"github.com/astaxie/beego"
)

func init() {
	ns := beego.NewNamespace("/v1",
		// UserController的路由映射
		beego.NSNamespace("/user",
			beego.NSInclude(
				&controllers.UserController{},
			),
		),
		// 其余Controller的路由映射在这里添加...
		beego.NSNamespace("/GetCapcha",
			beego.NSInclude(
				&controllers.LoginController{},
			),
		),
	)
	beego.AddNamespace(ns)
    beego.Router("/", &controllers.MainController{})

	//用户登录
	//beego.Router("/get-capcha",&controllers.LoginController{},"*:GetCapcha")
	beego.Router("/login",&controllers.LoginController{},"*:Login")
	beego.Router("/complete-info",&controllers.LoginController{},"*:CompleteInfo")

	//上传
	beego.Router("/upload-image",&controllers.FileUploadController{},"*:UploadPhoto")
	beego.Router("/upload-video",&controllers.FileUploadController{},"*:UploadVideo")
	beego.Router("/upload-voice",&controllers.FileUploadController{},"*:UploadVoice")

	//首页
	beego.Router("/home-videolist",&controllers.HomeController{},"*:HomeVideoList")
	beego.Router("/home-photolist",&controllers.HomeController{},"*:HomePhotoList")
	beego.Router("/home-voicelist",&controllers.HomeController{},"*:HomeVoiceList")
	beego.Router("/home-video-detail",&controllers.HomeController{},"*:HomeVideoDetail")
}

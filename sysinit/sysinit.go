package sysinit

import (
	"strings"
	"github.com/astaxie/beego"
)

func sysinit() {
	//gob.Register(models.Member{}) //序列化Member对象,必须在encoding/gob编码解码前进行注册
	//
	////uploads静态路径
	//uploads := filepath.Join(conf.WorkingDirectory, "uploads")
	////os.MkdirAll(uploads, 0666)
	//beego.BConfig.WebConfig.StaticDir["/uploads"] = uploads
	//
	////注册前端使用函数
	//registerFunctions()
}

func registerFunctions() {
	beego.AddFuncMap("cdnjs", func(p string) string {
		cdn := beego.AppConfig.DefaultString("cdnjs", "")
		if strings.HasPrefix(p, "/") && strings.HasSuffix(cdn, "/") {
			return cdn + string(p[1:])
		}
		if !strings.HasPrefix(p, "/") && !strings.HasSuffix(cdn, "/") {
			return cdn + "/" + p
		}
		return cdn + p
	})
	beego.AddFuncMap("cdncss", func(p string) string {
		cdn := beego.AppConfig.DefaultString("cdncss", "")
		if strings.HasPrefix(p, "/") && strings.HasSuffix(cdn, "/") {
			return cdn + string(p[1:])
		}
		if !strings.HasPrefix(p, "/") && !strings.HasSuffix(cdn, "/") {
			return cdn + "/" + p
		}
		return cdn + p
	})

}

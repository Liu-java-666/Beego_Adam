package controllers

import "github.com/astaxie/beego"

// hello Api
type HelloWorld struct {
	beego.Controller
}

func (this*HelloWorld)UrlMapping(){
	this.Mapping("GetHello",this.GetHello)
}

// @Title GetHello
// @Description get all the staticblock by key
// @Param   key     path    string  true        "The email for login"
// @Success 200 {object} models.ZDTCustomer.Customer
// @Failure 400 Invalid email supplied
// @Failure 404 User not found
// @router /GetHello
func (this *HelloWorld)GetHello(){
	this.Data["json"]="HelloWorld"
	//输出json格式
	this.ServeJSON()
}

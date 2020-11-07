package controllers

import (
	"Beego_Adam/models"
	"github.com/astaxie/beego"
)

type UserController struct {
	beego.Controller
}
// swagger注解配置
//@Title Get
//@Description get user
//@router /get [Get]
func (userController *UserController) Get() {
	user := &models.Person{}
	newUser := user.GetPerson()
	userController.Data["json"] = newUser
	userController.ServeJSON()
}

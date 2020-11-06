package models

import (
	"BestCP_Beego/public"
	"fmt"
	"github.com/astaxie/beego/orm"
)

type Captcha struct {
	Id				int `json:"id" orm:"column(id)"`
	Captcha			string `json:"captcha" orm:"column(captcha)"`
	PhoneNumber	string `json:"phone_number" orm:"column(phone_number)"`
	GenerationTime	int   `json:"generation_time" orm:"column(generation_time)"`
	ExpireTime		int   `json:"expire_time" orm:"column(expire_time)"`
	IsUsed			int   `json:"is_used" orm:"column(is_used)"`
}

func (m *Captcha) TableName() string{
	return TNCategory()
}

func (m *Captcha)Captcha_Get(phone string) (*Captcha, error){
	captcha := &Captcha{}
	o := orm.NewOrm()
	captcha.PhoneNumber = phone
	err := o.Read(captcha, "phone_number")
	if err == orm.ErrNoRows {
		fmt.Println("查询不到")
		return captcha,nil
	}
	return captcha,nil
}

func (m *Captcha)Captcha_Insert(phone,captcha string) error{
	timenow := public.GetNowTimestamp()
	expiretime := timenow + 300
	o := orm.NewOrm()
	tcaptcha := &Captcha{}
	tcaptcha.PhoneNumber = phone
	tcaptcha.Captcha = captcha
	tcaptcha.GenerationTime = timenow
	tcaptcha.ExpireTime = expiretime
	_, err := o.Insert(tcaptcha)
	if err != nil {
		return err
	}
	return nil
}

func (m *Captcha)UpdateCaptcha(id int,str string) error {
	timenow := public.GetNowTimestamp()
	expiretime := timenow + 300
	o := orm.NewOrm()
	captcha := Captcha{Id:id}
	if o.Read(&captcha) == nil{
		captcha.Captcha = str
		captcha.GenerationTime = timenow
		captcha.ExpireTime = expiretime
		if _, err := o.Update(&captcha);err != nil{
			return err
		}
	}
	return  nil
}

func (m *Captcha) SetUsed(){
	m.IsUsed = 1
	if err :=orm.NewOrm().Read(m);err != nil{
		print(err)
	}
}


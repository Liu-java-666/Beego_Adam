package models

import (
	"Beego_Adam/public"
	"fmt"
	"github.com/astaxie/beego/orm"
	"time"
)

type User struct {
	Id					int   `json:"id" orm:"column(id)"`
	PhoneNumber		string `json:"phone_number" orm:"column(phone_number)"`
	RegistrationTime	time.Time  `orm:"auto_now;type(datetime)" json:"registration_time"`
	Nickname			string `json:"nickname" orm:"column(nickname)"`
	Sex					int    `json:"sex" orm:"column(sex)"`
	Age int						`json:"age" orm:"column(age)"`
	UserKey			string  `json:"user_key"  orm:"column(user_key)"`
	LastlogonTime		time.Time  `orm:"auto_now;type(datetime)" json:"lastlogon_time"`
	LastlogonIp		string  `json:"lastlogon_ip"  orm:"column(lastlogon_ip)"`
	AvatarId			int     `json:"avatar_id" orm:"column(avatar_id)"`
	PhotolistId		int    `json:"photolist_id" orm:"column(photolist_id)"`
	Signature			string  `json:"signature" orm:"column(signature)"`
	Hobbies				string  `json:"hobbies" orm:"column(hobbies)"`
	Cpsth				string  `json:"cpsth" orm:"column(cpsth)"`
	ChatId				int    `json:"chatId"  orm:"column(chatId)"`
	State				int    `json:"state" orm:"column(state)"`
	IsCp				bool   `json:"is_cp" orm:"column(is_cp)"`
	AvatarFile          string
	AvatarAudit			int
}

func (m *User) TableName() string{
	return TNUser()
}

func (m *User)User_GetById(id int, bMe bool) (*User, error) {
	t := User{}
	t.Id = id
	o := orm.NewOrm()
	err := o.Read(&t, "id")
	if err != nil {
		fmt.Println("err",err)
	}
	t.AvatarFile, t.AvatarAudit = new(Image).Image_GetMyAvatar(t.Id)
	return &t, nil
}

func (m *User)User_Insert(phone,ip , userkey string) (*User, error) {
	t := User{}
	t.PhoneNumber = phone
	t.LastlogonIp = ip
	t.UserKey = userkey
	_, err := orm.NewOrm().Insert(&t)
	if err != nil {
		fmt.Println("err",err)
	}
	return t.User_GetById(t.Id,true)
}

func (m *User)User_GetByPhone(phone string)(*User, error){
	t := User{}
	t.PhoneNumber = phone
	err := orm.NewOrm().Read(&t, "phone_number")
	if err != nil{
		fmt.Println("err",err)
	}
	if err == orm.ErrNoRows {
		return nil,nil
	}
	t.AvatarFile, t.AvatarAudit = new(Image).Image_GetMyAvatar(t.Id)
	return &t,nil
}

func ( m *User)UpdateLogin(ip , userkey string){
	m.UserKey = userkey
	m.LastlogonIp = ip
	m.LastlogonTime = public.GetNowTimestr()

	if _, err  := orm.NewOrm().Update(m) ; err!= nil{
		fmt.Println("err",err)
	}
}

func (m *User)User_CompleteInfo(nickname string,sex int,avatar_id int)error{
	m.Nickname = nickname
	m.Sex = sex
	m.AvatarId = avatar_id
	_, err := orm.NewOrm().Update(m)
	if err != nil{
		fmt.Println("err",err)
	}
	return nil
}


package models

import (
	"fmt"
	"github.com/astaxie/beego/orm"
	"time"
)

type BlackList struct {
	Id int  `orm:"pk;auto" json:"Id" orm:"column(id)"`
	UserId int `json:"UserId" orm:"column(user_id)"`
	ToUserId int `json:"ToUserId" orm:"column(to_user_id)"`
	Cdate time.Time `json:"Cdate" orm:"column(cdate)"`
}

func (m *BlackList) TableName() string{
	return TNBlack()
}

func (m *BlackList)GetBlackListIds(userid int) ([] orm.ParamsList) {
	var list [] orm.ParamsList
	_, err := orm.NewOrm().QueryTable(m.TableName()).Filter("user_id", userid).ValuesList(&list, "to_user_id")
	if err != nil{
		fmt.Println("err",err)
	}
	return list
}
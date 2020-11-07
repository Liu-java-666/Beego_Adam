package models

import (
	"github.com/astaxie/beego/orm"
	"time"
)

type Dynamic struct {
	Id		int `orm:"pk;auto" json:"id" orm:"column(id)"`
	UserId  int `json:"UserId" orm:"column(user_id)"`
	PostTime time.Time `json:"PostTime" orm:"column(post_time)"`
	Description string 	`json:"Description" orm:"column(description)"`
	Topic string 	`json:"Topic" orm:"column(topic)"`
	FileType string	`json:"FileType" orm:"column(filetype)"`
	FileList string `json:"FileList" orm:"column(filelist)"`
	VoiceId  int   `json:"VoiceId" orm:"column(voice_id)"`
	IsAudit int   `json:"IsAudit" orm:"column(is_audit)"`
	AuditTime time.Time  `json:"AuditTime" orm:"column(audit_time)"`
}

func (m *Dynamic) TableName() string{
	return TNDynamic()
}

//首页 动态类表
func (m *Dynamic)Dynamic_GetByType(userid int, filetype string, start, limit int) ([]Dynamic, error) {
	var list []Dynamic
	num, err := orm.NewOrm().Raw("select * from dynamic where is_audit=1 AND user_id NOT IN (SELECT to_user_id FROM blacklist WHERE user_id= ? ) And user_id <> ? And filetype = ? order by audit_time desc limit ?,?", userid , userid,filetype , start, limit ).QueryRows(&list)
	if err == nil && num > 0 {
		return list , nil
	}else{
		return list,err
	}
}

//根据id 得到动态
func Dynamic_Get(dynamicid int)(*Dynamic,error){
	var dynamic Dynamic
	dynamic.Id = dynamicid
	err := orm.NewOrm().Read(&dynamic, "id")
	if err != nil{
		return nil,err
	}
	return &dynamic,nil
}
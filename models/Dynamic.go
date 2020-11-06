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
func (m *Dynamic)Dynamic_GetByType(userid int, filetype string, start, limit int,num int) ([]*Dynamic,error) {
	var list []*Dynamic
	ids := new(BlackList).GetBlackListIds(userid)
	_, err := orm.NewOrm().QueryTable(m.TableName()).Filter("is_audit",num).Filter("filetype", filetype).Exclude("user_id", userid).Filter("user_id", ids).Limit(start, limit).All(&list)
	if err != nil {
		print("err",err)
		return nil,err
	}
	return list , nil
}
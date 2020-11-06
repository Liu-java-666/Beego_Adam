package models

import (
	"github.com/astaxie/beego/orm"
	"time"
)

type Image struct {
	Id				int   `orm:"pk;auto" json:"Id" orm:"column(id)"`
	UserId			int  `json:"user_id" orm:"column(user_id)"`
	PostTime		time.Time  `orm:"auto_now;type(datetime)"`
	FileName		string   `json:"file_name" orm:"column(file_name)" `
	FileType		string   `json:"file_type" orm:"column(file_type)"`
	UseType		string   `json:"use_type" orm:"column(use_type)"`
	IsAudit		int      `json:"is_audit" orm:"column(is_audit)"`
	AuditTime		time.Time  `orm:"auto_now;type(datetime)"`
	Pos int     `json:"pos" orm:"column(pos)"`
	DynamicId int   `json:"dynamic_id" orm:"column(dynamic_id)"`
}

func (m *Image) TableName() string{
	return TNImage()
}

func (m *Image)Image_Get(id int64) (*Image, error) {
	t := &Image{}
	t.Id = int(id)
	o := orm.NewOrm()
	o.Read(t, "id")
	return t, nil
}

func (m *Image)Image_GetMyAvatar(userid int) (string, int) {
	o := orm.NewOrm()
	image := new(Image)
	qs := o.QueryTable(image)
	qs.Filter("user_id",userid).Filter("use_type","avatar").Filter("is_audit_gte",0).OrderBy("-id").Limit(1)
	return image.FileName, image.IsAudit
}

func (m *Image)Image_Insert(userid int,fileName ,filetype , usertype string)(int64 , error){
	o := orm.NewOrm()
	image := new(Image)
	image.UserId = userid
	image.FileName = fileName
	image.FileType = filetype
	image.UseType = usertype
	i, err := o.Insert(image);
	if err != nil{
		return i,err
	}
	return i,nil
}


package models

import (
	"github.com/astaxie/beego/orm"
	"time"
)

type Video struct {
	Id int
	UserId int
	PostTime time.Time
	FileName string
	FileType string
	CoverName string
	CoverType string
	Rotation int
	UseType string
	IsAudit int
	AuditTime time.Time
}

func (m *Video) TableName() string{
	return TNVideo()
}

func Video_Insert(userid int, file, filetype, cover, covertype, usetype string, rotation int) (int64,error) {
	var video Video
	video.UserId = userid
	video.FileName = file
	video.CoverName = cover
	video.CoverType = covertype
	video.UseType = usetype
	video.Rotation = rotation
	video.FileType = filetype
	video.PostTime = time.Now()
	id, err := orm.NewOrm().Insert(&video)
	if err != nil {
		return id,err
	}
	return id,nil
}

func Video_Get(id int)(*Video,error){
	var video Video
	video.Id = id
	err := orm.NewOrm().Read(&video, "id")
	if err != nil{
		if err.Error() == "sql: no rows in result set" {
			return nil, nil
		}
		//logger.Error(err)
		return nil, err
	}
	return &video,nil
}
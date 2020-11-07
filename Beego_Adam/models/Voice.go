package models

import (
	"github.com/astaxie/beego/orm"
	"time"
)

type Voice struct {
	Id  int
	UserId  int
	PostTime time.Time
	FileName string
	FileType string
	FileSecond int
}

func (m *Voice) TableName() string{
	return TNVoice()
}

//插入声音
func Voice_Insert(userid int,filename string,filetype string,second int)(int64 , error){
	var voice Voice
	voice.UserId = userid
	voice.FileName = filename
	voice.FileType = filetype
	voice.FileSecond = second
	id, err := orm.NewOrm().Insert(&voice)
	if err != nil{
		return id,err
	}
	return id,nil
}

//查询声音
func Voice_Get(id int)(*Voice,error){
	var voice Voice
	voice.Id = id
	err := orm.NewOrm().Read(&voice, "id")
	if err != nil {
		return nil, err
	}
	return &voice,nil
}


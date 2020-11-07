package models

import "time"

type Message struct {
	Id int `orm:"pk;auto" json:"Id" orm:"column(id)"`
	Url string  `json:"Url" orm:"column(url)"`
	ElemType int `json:"ElemType" orm:"column(elem_type)"`
	FromUserId int  `json:"FromUserId" orm:"column(from_user_id)"`
	ToUserId int  `json:"ToUserId" orm:"column(to_user_id)"`
	TextElemContent string  `json:"TextElemContent" orm:"column(text_elem_content)"`
	MessageServerTime time.Time  `json:"MessageServerTime" orm:"column(message_server_time)"`
	IsRead int  `json:"IsRead" orm:"column(is_read)"`
	Status int  `json:"Status" orm:"column(status)"`
}

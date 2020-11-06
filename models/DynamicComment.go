package models

import "time"

type DynamicComment struct {
	Id  int  `orm:"pk;auto" json:"id" orm:"column(id)"`
	DynamicId int  `json:"DynamicId" orm:"column(dynamic_id)"`
	PostUserId int `json:"PostUserId" orm:"column(postuser_id)"`
	UserId int `json:"UserId" orm:"column(user_id)"`
	Content string  `json:"Content" orm:"column(content)"`
	CommentTime time.Time  `json:"CommentTime" orm:"column(comment_time)"`
}



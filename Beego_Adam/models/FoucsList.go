package models

type FocusList struct {
	Id int `orm:"pk;auto" json:"id" orm:"column(id)"`
	UserId int ` json:"UserId" orm:"column(user_id)"`
	ToUserId int ` json:"ToUserId" orm:"column(to_user_id)"`
	State int ` json:"State" orm:"column(state)"`
}

package models

import "github.com/astaxie/beego/orm"

type DynamicLike struct {
	DynamicId int   `orm:"pk;auto" json:"DynamicId" orm:"column(dynamic_id)"`
	UserId int		` json:"UserId" orm:"column(user_id)"`
	PostUserId int	` json:"PostUserId" orm:"column(postuser_id)"`
	LikeTime int	` json:"LikeTime" orm:"column(like_time)"`
}

func (m *DynamicLike) TableName() string{
	return TNDynamicLike()
}

//是否点赞
func (m *DynamicLike)DynamicLike_Get(userid , dynamicid int)bool{
	var t DynamicLike
	t.UserId = userid
	t.DynamicId = dynamicid
	err := orm.NewOrm().Read(&t, "user_id", "dynamic_id")
	if err == orm.ErrNoRows {
		return false
	}
	return true
}

//得到点赞的数量
func (m *DynamicLike)DynamicLike_GetCount(dynamicid int)(int64,error){
	cnt, err := orm.NewOrm().QueryTable(m.TableName()).Filter("dynamic_id", dynamicid).Count()
	if err != nil{
		return cnt,err
	}
	return cnt,nil
}
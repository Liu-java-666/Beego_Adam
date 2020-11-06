package models

type DynamicCommentLike struct {
	CommentId int  `orm:"pk;auto" json:"CommentId" orm:"column(comment_id)"`
	UserId  int  `json:"UserId" orm:"column(user_id)"`
	CommentUserId int  `json:"CommentUserId" orm:"column(commentuser_id)"`
	DynamicId int  `json:"DynamicId" orm:"column(dynamic_id)"`
}

package controllers

import (
	"BestCP_Beego/models"
	"BestCP_Beego/utils"
	"strconv"
)

type HomeController struct {
	BaseController
}

//视频列表
func (this *HomeController)HomeVideoList(){
	userid, _ := strconv.Atoi(this.GetString("userid"))
	userkey := this.GetString("userkey")
	page, _ := strconv.Atoi(this.GetString("page"))
	this.CheckUser(userid, userkey)
	//userid int, filetype string, start, limit int
	limit := 20
	list := []*models.Dynamic{}
	list ,err := new(models.Dynamic).Dynamic_GetByType(userid, "video", page*limit, limit,1)
	if err != nil{
		this.JsonResult(1,err.Error())
	}
	type tagDynamicItem struct {
		DynamicId		int
		UserId			int
		Nickname		string
		Signature string
		AvatarFile		string
		ImageUrl		string
		VideoUrl string
		IsLike			bool
		LikeNum			int64
	}
	dylist := []tagDynamicItem{}
	for _,v := range list{
		user, err := new(models.User).User_GetById(v.UserId, false)
		if err != nil{
			this.JsonResult(1,err.Error())
		}
		if user == nil{
			this.JsonResult(0,"数据库异常")
		}
		videoid, _ := strconv.Atoi(v.FileList)
		video, _ := models.Video_Get(videoid)
		isLike := new(models.DynamicLike).DynamicLike_Get(userid, v.Id)
		LikeNum, _ := new(models.DynamicLike).DynamicLike_GetCount(v.Id)
		Item := tagDynamicItem{
			DynamicId:  v.Id,
			UserId:     user.Id,
			Nickname:   user.Nickname,
			Signature:  user.Signature,
			AvatarFile: utils.MakeImageUrl(user.AvatarFile),
			ImageUrl:   utils.MakeVideoUrl(video.CoverName),
			VideoUrl:   utils.MakeVideoUrl(video.FileName),
			IsLike:     isLike,
			LikeNum:    LikeNum,
		}
		dylist = append(dylist,Item)
	}

	result := struct {
		IsEnd bool
		Data []tagDynamicItem
	}{
		len(dylist)<limit,
		dylist,
	}
	this.JsonResult(200,"true",result)
}



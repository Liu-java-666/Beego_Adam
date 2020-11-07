package controllers

import (
	"Beego_Adam/models"
	"Beego_Adam/utils"
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
	list ,err := new(models.Dynamic).Dynamic_GetByType(userid, "video", page*limit, limit)
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

//照片列表
func (this *HomeController)HomePhotoList(){
	userid, _ := strconv.Atoi(this.GetString("userid"))
	userkey := this.GetString("userkey")
	page, _ := strconv.Atoi(this.GetString("page"))
	this.CheckUser(userid, userkey)
	limit := 20
	list ,err := new(models.Dynamic).Dynamic_GetByType(userid, "image", page*limit, limit)
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
		imageid, _ := strconv.Atoi(v.FileList)
		image, _ := new(models.Image).Image_Get(int64(imageid))
		isLike := new(models.DynamicLike).DynamicLike_Get(userid, v.Id)
		LikeNum, _ := new(models.DynamicLike).DynamicLike_GetCount(v.Id)
		Item := tagDynamicItem{
			DynamicId:  v.Id,
			UserId:     user.Id,
			Nickname:   user.Nickname,
			Signature:  user.Signature,
			AvatarFile: utils.MakeImageUrl(user.AvatarFile),
			ImageUrl:   utils.MakeImageUrl(image.FileName),
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

//声音列表
func (this *HomeController)HomeVoiceList(){
	userid, _ := strconv.Atoi(this.GetString("userid"))
	userkey := this.GetString("userkey")
	page, _ := strconv.Atoi(this.GetString("page"))
	this.CheckUser(userid, userkey)
	limit := 20
	list ,err := new(models.Dynamic).Dynamic_GetByType(userid, "voice", page*limit, limit)
	if err != nil{
		this.JsonResult(1,err.Error())
	}
	type tagDynamicItem struct {
		UserId			int
		Nickname		string
		AvatarFile		string
		VoiceUrl		string
		IsLike			bool
		LikeNum			int64
		Description string
		DynamicId  int
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
		voiceid, _ := strconv.Atoi(v.FileList)
		voice, err := models.Voice_Get(voiceid)
		isLike := new(models.DynamicLike).DynamicLike_Get(userid, v.Id)
		LikeNum, _ := new(models.DynamicLike).DynamicLike_GetCount(v.Id)
		Item := tagDynamicItem{
			UserId:     user.Id,
			Nickname:   user.Nickname,
			AvatarFile: utils.MakeImageUrl(user.AvatarFile),
			VoiceUrl: utils.MakeVioceUrl(voice.FileName),
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

//视频详情
func (this *HomeController)HomeVideoDetail(){
	userid, _ := strconv.Atoi(this.GetString("userid"))
	userkey := this.GetString("userkey")
	dynamicid, _ := strconv.Atoi(this.GetString("dynamicid"))
	this.CheckUser(userid, userkey)

	dynamic, err := models.Dynamic_Get(dynamicid)
	if err != nil{
		this.JsonResult(1,err.Error())
	}
	result := struct{
		Result	bool
		DynamicId		int
		UserId			int
		Nickname		string
		Signature string
		AvatarFile		string
		ImageUrl		string
		VideoUrl string
		IsLike			bool
		LikeNum			int64
	}{
		Result:true,
	}
	dyUser, _ := new(models.User).User_GetById(dynamic.UserId, false)
	if dyUser == nil{
		this.JsonResult(0,"用户不存在")
	}
	videoid, _ := strconv.Atoi(dynamic.FileList)
	video, _ := models.Video_Get(videoid)
	islike := new(models.DynamicLike).DynamicLike_Get(userid, dynamic.Id)
	LikeNum, _ := new(models.DynamicLike).DynamicLike_GetCount(dynamic.Id)

	result.DynamicId = dynamic.Id
	result.UserId = dyUser.Id
	result.Nickname = dyUser.Nickname
	result.Signature = dyUser.Signature
	result.AvatarFile = utils.MakeImageUrl(dyUser.AvatarFile)
	result.ImageUrl = utils.MakeVideoUrl(video.CoverName)
	result.VideoUrl = utils.MakeVideoUrl(video.FileName)
	result.IsLike = islike
	result.LikeNum = LikeNum
	this.JsonResult(200,"true",result)
}

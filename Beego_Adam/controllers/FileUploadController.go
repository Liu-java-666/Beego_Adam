package controllers

import (
	"Beego_Adam/commons"
	"Beego_Adam/models"
	"Beego_Adam/public"
	"Beego_Adam/utils"
	"image"
	"image/jpeg"
	"image/png"
	"io"
	"os"
	"strconv"
)

type FileUploadController struct {
	BaseController
}

//上传照片
func (this *FileUploadController)UploadPhoto(){
	srcfile, header, err := this.GetFile("file")//获取上传的文件
	if err != nil{
		this.JsonResult(0,"读取文件数据错误")
	}
	if header.Size <= 0 {
		this.JsonResult(0,"获取上传文件错误：无法读取文件大小")
	}else if header.Size > 30*1024*1024 {
		this.JsonResult(0,"获取上传文件错误：文件大小超出30M")
	}
	filetype := this.GetString("filetype")
	if filetype != "jpg" && filetype != "png" {
		this.JsonResult(0,"文件格式错误")
	}
	userid, _ := strconv.Atoi(this.GetString("userid"))
	//userkey := this.GetString("userkey")
	index, _ := strconv.Atoi(this.GetString("index"))
	usetype := this.GetString("usetype")

	filename := public.MakeFileName(userid, index, filetype, usetype)
	filepath := this.MakeImagePath(filename)
	file, err := os.Create(filepath)
	if err != nil {
		this.JsonResult(0,"创建文件失败")
	}
	_, err = io.Copy(file, srcfile)
	if err != nil{
		this.JsonResult(0,"写文件失败")
	}
	file.Close()
	//插入图片表 userid int,fileName ,filetype , usertype string
	image := new(models.Image)
	id, err := image.Image_Insert(userid, filename, filetype, usetype)
	if err != nil{
		this.JsonResult(1,err.Error())
	}

	image,err = image.Image_Get(id)
	if err != nil {
		this.JsonResult(1,err.Error())
	}
	if image ==  nil {
		this.JsonResult(0,"图片不存在")
	}

	result := struct{
		Result bool
		UseType string
		Index int
		Id int64
		ImageUrl string
	}{
		true,
		usetype,
		index,
		id,
		utils.MakeImageUrl(image.FileName),
	}
	this.JsonResult(200,"true",result)
}

//上传视频
func (this *FileUploadController)UploadVideo(){
	sccover, sccoverheader, err := this.GetFile("cover")
	if err != nil{
		this.JsonResult(1,"读取封面文件数据错误")
	}
	if sccoverheader.Size <= 0{
		this.JsonResult(0,"获取封面文件错误，无法读取文件大小")
	}else if sccoverheader.Size > 30*1024*1024 {
		this.JsonResult(0,"获取蜂蜜那文件错误,文件大小超过30M")
	}

	covertype := this.GetString("covertype")
	if covertype != "jpg" && covertype != "png"{
		this.JsonResult(0,"封面文件格式错误")
	}
	
	scfile, scfileheader, err := this.GetFile("file")
	if err != nil{
		this.JsonResult(1,"读取视频文件数据错误")
	}
	if scfileheader.Size <= 0 {
		this.JsonResult(0,"获取视频文件错误，无法读取文件大小")
	}else  if scfileheader.Size > 30*1024*1024 {
		this.JsonResult(0,"获取视频文件错误，文件大小超过30M")
	}
	
	filetype := this.GetString("filetype")
	if filetype != "mp4" && filetype != "rmvb"{
		this.JsonResult(0,"视频文件格式错误")
	}

	//检查用户
	userid, _ := strconv.Atoi(this.GetString("userid"))
	userkey := this.GetString("userkey")
	this.CheckUser(userid, userkey)

	//保存封面
	usetype := this.GetString("usetype")
	index, _ := strconv.Atoi(this.GetString("index"))
	covername := public.MakeFileName(userid, index, covertype, usetype)
	coverpath := utils.MakeVideoUrl(covername)
	cover, err := os.Create(coverpath)
	if err != nil{
		this.JsonResult(0,"创建文件失败")
	}
	var img image.Image
	if covertype == "jpg"{
		img, err = jpeg.Decode(sccover)
	}else{
		img, err = png.Decode(sccover)
	}
	if err != nil{
		this.JsonResult(1,"解析图片失败")
	}

	rotation, _ := strconv.Atoi(this.GetString("rotation"))
	var newImg image.Image
	if rotation == 90{
		newImg = commons.Rotate90(img)
	}else if rotation == 180{
		newImg = commons.Rotate180(img)
	}else if rotation == 270{
		newImg = commons.Rotate270(img)
	}else{
		newImg = img
	}
	jpeg.Encode(cover,newImg,nil)
	cover.Close()
	//保存视频
	filename := public.ChangeFileType(covername, filetype)
	filepath := utils.MakeVideoPath(filename)
	file, err := os.Create(filepath)
	if err != nil{
		this.JsonResult(1,"创建文件失败")
	}
	_, err = io.Copy(file, scfile)
	if err != nil{
		this.JsonResult(1,"写文件失败")
	}
	file.Close()
	//插入视频表
	id,err := models.Video_Insert(userid, filename, filetype, covername, covertype, usetype, rotation)
	if err != nil{
		this.JsonResult(1,err.Error())
	}
	result := struct {
		UseType string
		Index int
		Id  int64
	}{
		usetype,
		index,
		id,
	}
	this.JsonResult(200,"true",result)
}

//上传声音
func (this *FileUploadController)UploadVoice(){
	srcfile, srcfileheader, err := this.GetFile("file")
	if err != nil{
		this.JsonResult(1,err.Error())
	}
	if srcfileheader.Size <= 0{
		this.JsonResult(0,"获取上传文件错误，无法读取文件大小")
	}else if srcfileheader.Size > 30*1024*1024 {
		this.JsonResult(0,"获取上传文件错误，文件大小超过30M")
	}
	userid, _ := strconv.Atoi(this.GetString("userid"))
	second, _ := strconv.Atoi(this.GetString("second"))
	userkey  := this.GetString("userkey")
	this.CheckUser(userid,userkey)
	//保存文件
	filename := public.MakeFileName(userid, 1, "mp3", "dy")
	filepath := utils.MakeVioceUrl(filename)
	file, err := os.Create(filepath)
	if err != nil{
		this.JsonResult(0,"创建文件失败")
	}
	_, err = io.Copy(file, srcfile)
	if err != nil{
		this.JsonResult(0,"写入文件失败")
	}
	file.Close()
	//插入声音表
	id, err := models.Voice_Insert(userid, filename, "mp3", second)
	if err !=  nil{
		this.JsonResult(1,err.Error())
	}
	result := struct {
		Id  int64
	}{
		id,
	}
	this.JsonResult(200,"true",result)
}


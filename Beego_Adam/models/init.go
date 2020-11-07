package models

import "github.com/astaxie/beego/orm"

func init(){
	orm.RegisterModel(
		new(Captcha),
		new(User),
		new(Image),
		new(Video),
		new(Voice),
		new(Dynamic),
		new(BlackList),
		new(DynamicLike))
}

/*
* Table Names
* */
func TNCategory() string{
	return "captcha"
}

func TNUser() string{
	return "user"
}

func TNDynamic() string{
	return "dynamic"
}
func  TNImage() string{
	return "image"
}
func TNVideo() string{
	return "video"
}

func TNVoice() string{
	return "voice"
}

func TNBlack() string{
	return "blacklist"
}

func TNDynamicLike()string{
	return "dynamic_like"
}
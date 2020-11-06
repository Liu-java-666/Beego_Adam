package im

import (
	"bytes"
	"encoding/json"
	"fmt"
	"github.com/astaxie/beego"
	"github.com/pkg/errors"
	"github.com/wonderivan/logger"
	"io/ioutil"
	"math/rand"
	"net/http"
)
func GetData(servicename, command string, sendData []byte) []byte {
	url := fmt.Sprintf("https://console.tim.qq.com/v4/%s/%s?sdkappid=%d&identifier=admin&usersig=%s&random=%d&contenttype=json",
		servicename, command, beego.AppConfig.String("AppId"), beego.AppConfig.String("AdminSig"), rand.Uint32())
	r,_ := http.NewRequest("POST", url, bytes.NewBuffer(sendData))
	r.Header.Set("Content-Type", "application/json")

	client := &http.Client{}
	res, err := client.Do(r)
	if err != nil {
		logger.Info("err=%v",err)
		return nil
	}
	defer res.Body.Close()

	if res.StatusCode != 200 {
		logger.Info("err=%v",err)
		return nil
	}

	resultData, err := ioutil.ReadAll(res.Body)
	if err != nil {
		logger.Info("err=%v",err)
		return nil
	}

	return resultData
}

func PostData(servicename, command string, sendData []byte, call func(resultData string, err error, user_data interface{}), user_data interface{}) {
	url := fmt.Sprintf("https://console.tim.qq.com/v4/%s/%s?sdkappid=%d&identifier=admin&usersig=%s&random=%d&contenttype=json",
		servicename, command, beego.AppConfig.String("AppId"), beego.AppConfig.String("AdminSig"), rand.Uint32())
	r,_ := http.NewRequest("POST", url, bytes.NewBuffer(sendData))
	r.Header.Set("Content-Type", "application/json")

	if call == nil {
		call = OnIMApiCallback
	}

	client := &http.Client{}
	res, err := client.Do(r)
	if err != nil {
		call("", err, user_data)
		return
	}
	defer res.Body.Close()


	if res.StatusCode != 200 {
		call("", errors.New(res.Status), user_data)
		return
	}

	resultData, err := ioutil.ReadAll(res.Body)
	if err != nil {
		call("", err, user_data)
		return
	}

	call(string(resultData), nil, user_data)
	return
}

func OnIMApiCallback(resultData string, err error, user_data interface{}) {
	if err != nil {
		logger.Error("错误：", err)
		return
	}

	logger.Debug(resultData)

	revData := make(map[string]interface{})
	err = json.Unmarshal([]byte(resultData), &revData)
	if err != nil {
		logger.Error("错误：%v,resultData=%v", err, resultData)
		return
	}

	//logger.Debug(revData)


}

//导入单个帐号
func AccountImport(userid int, call func(resultData string, err error, user_data interface{})) {
	sendData := struct {
		Identifier string
	}{
		fmt.Sprintf("%s%d",beego.AppConfig.String("Pre"), userid),
	}

	b, err := json.Marshal(sendData)
	if err != nil {
		logger.Error(err)
		return
	}
	PostData("im_open_login_svc", "account_import", b, call, userid)
}

//导入多个帐号
func MultiAccountImport(userid []int) {
	sendData := struct {
		Accounts []string
	}{}

	for _, v := range userid {
		sendData.Accounts = append(sendData.Accounts, fmt.Sprintf("%s%d", beego.AppConfig.String("Pre"), v))
	}

	b, err := json.Marshal(sendData)
	if err != nil {
		logger.Error(err)
		return
	}
	PostData("im_open_login_svc", "multiaccount_import", b, nil, nil)
}

//增加群组成员
func AddGroupMember(group, nickname string, userid int, call func(resultData string, err error, user_data interface{})) {
	type tagMember struct {
		Member_Account string
	}
	member := tagMember{fmt.Sprintf("%s%d", beego.AppConfig.String("Pre"), userid)}

	sendData := struct {
		GroupId string
		MemberList []tagMember
	}{
		group,
		[]tagMember{
			member,
		},
	}

	b, err := json.Marshal(sendData)
	if err != nil {
		logger.Error(err)
		return
	}

	user_data := []string{group, member.Member_Account, nickname}
	PostData("group_open_http_svc", "add_group_member", b, call, user_data)
}

//删除群组成员
func DeleteGroupMember(group string, userid int) {
	member := fmt.Sprintf("%s%d", beego.AppConfig.String("Pre"), userid)

	sendData := struct {
		GroupId string
		MemberToDel_Account []string
	}{
		group,
		[]string{
			member,
		},
	}

	b, err := json.Marshal(sendData)
	if err != nil {
		logger.Error(err)
		return
	}

	PostData("group_open_http_svc", "delete_group_member", b, nil, nil)
}

//获取群详细资料
func GroupInfo(group string, call func(resultData string, err error, user_data interface{})) {
	type tagResponseFilter struct {
		GroupBaseInfoFilter []string
		MemberInfoFilter []string
	}
	sendData := struct {
		GroupIdList []string
		ResponseFilter tagResponseFilter
	}{
		[]string{group},
		tagResponseFilter{
			[]string{"MemberNum"},
			[]string{"Member_Account","JoinTime"},
		},
	}

	b, err := json.Marshal(sendData)
	if err != nil {
		logger.Error(err)
		return
	}

	PostData("group_open_http_svc", "get_group_info", b, call, group)
}

//在群组中发送系统通知
// @Type 0 字符串 1 结构体
//
func SendGroupSysNotice(group string, msgdata interface{}) {
	content, err := json.Marshal(msgdata)
	if err != nil {
		logger.Error(err)
		return
	}

	sendData := struct {
		GroupId string
		Content string
	}{
		group,
		string(content),
	}

	b, err := json.Marshal(sendData)
	if err != nil {
		logger.Error(err)
		return
	}
	logger.Debug(string(b))
	PostData("group_open_http_svc", "send_group_system_notification", b, nil, nil)
}

//管理员向其他账号发消息
func AdminSendMsg(touserid, msgdata interface{}) {
	tmp, err := json.Marshal(msgdata)
	if err != nil {
		logger.Error(err)
		return
	}
	msg := string(tmp)

	type tagMsgContent struct {
		Text string
	}

	type tagMsgBody struct {
		MsgType string
		MsgContent tagMsgContent
	}

	sendData := struct {
		SyncOtherMachine int
		To_Account string
		MsgRandom int
		ForbidCallbackControl []string
		MsgBody []tagMsgBody
	}{
		2,//不希望将消息同步至 From_Account
		fmt.Sprintf("%s%d", beego.AppConfig.String("Pre"), touserid),
		rand.Intn(99999),
		[]string{
			"ForbidBeforeSendMsgCallback",
			"ForbidAfterSendMsgCallback",// 禁止回调控制选项
		},
		[]tagMsgBody{
			{
				"TIMTextElem",
				tagMsgContent{
					msg,
				},
			},
		},
	}

	b, err := json.Marshal(sendData)
	if err != nil {
		logger.Error(err)
		return
	}
	logger.Debug(string(b))
	PostData("openim", "sendmsg", b, nil, nil)
}

//单发单聊消息
func SendMsg(userid, touserid, Type int, msgdata interface{}) {
	var msg string
	if Type == 0 {
		msg = msgdata.(string)
	} else {
		tmp, err := json.Marshal(msgdata)
		if err != nil {
			logger.Error(err)
			return
		}
		msg = string(tmp)
	}

	type tagMsgContent struct {
		Text string
	}

	type tagMsgBody struct {
		MsgType string
		MsgContent tagMsgContent
	}

	sendData := struct {
		SyncOtherMachine int
		From_Account string
		To_Account string
		MsgRandom int
		MsgBody []tagMsgBody
	}{
		1,//希望将消息同步至 From_Account
		fmt.Sprintf("%s%d", beego.AppConfig.String("Pre"), userid),
		fmt.Sprintf("%s%d",beego.AppConfig.String("Pre"), touserid),
		rand.Intn(99999),
		[]tagMsgBody{
			{
				"TIMTextElem",
				tagMsgContent{
					msg,
				},
			},
		},
	}

	b, err := json.Marshal(sendData)
	if err != nil {
		logger.Error(err)
		return
	}
	logger.Debug(string(b))
	PostData("openim", "sendmsg", b, nil, nil)
}



//创建群组
func CreateGroup(OwnerId string,GroupName string, call func(resultData string, err error, user_data interface{})) {
	sendData := struct {
		Type string
		Name string
	}{
		//"Private",
		"Public",
		GroupName,

	}
	b, err := json.Marshal(sendData)
	if err != nil {
		logger.Error(err)
		return
	}
	user_data := []string{OwnerId, GroupName}
	PostData("group_open_http_svc", "create_group", b, call, user_data)
}

//解散群组
func DestroyGroup(groupId string, call func(resultData string, err error, user_data interface{})) {
	sendData := struct {
		GroupId string
	}{
		groupId,
	}
	b, err := json.Marshal(sendData)
	if err != nil {
		logger.Error(err)
		return
	}
	PostData("group_open_http_svc", "destroy_group", b, call, nil)
}

//查询帐号在线状态
func Querystate(ids []string) []byte{
	sendData := struct {
		To_Account []string
	}{
		ids,
	}
	b, err := json.Marshal(sendData)
	if err != nil {
		logger.Error(err)
		return nil
	}
	return GetData("openim", "querystate", b)
}

package sysinit

import (

	"github.com/astaxie/beego"
	"github.com/astaxie/beego/orm"
	_ "github.com/go-sql-driver/mysql"
)

//调用方式
//dbinit() 或 dbinit("w") 或 dbinit("default") //初始化主库
//dbinit("w","r")	//同时初始化主库和从库
//dbinit("w")
func Dbinit() {
	isDev := (beego.AppConfig.String("runmode") == "dev")
	registDatabase("default")
	orm.RunSyncdb("default", false, isDev)
}

func registDatabase(dbAlias string) {
	alias := "w"
	//数据库名称
	dbName := beego.AppConfig.String("db_" + alias + "_database")
	//数据库连接用户名
	dbUser := beego.AppConfig.String("db_" + alias + "_username")
	//数据库连接用户名
	dbPwd := beego.AppConfig.String("db_" + alias + "_password")
	//数据库IP（域名）
	dbHost := beego.AppConfig.String("db_" + alias + "_host")
	//数据库端口
	dbPort := beego.AppConfig.String("db_" + alias + "_port")

	orm.RegisterDataBase("default", "mysql", dbUser+":"+dbPwd+"@tcp("+dbHost+":"+dbPort+")/"+dbName+"?charset=utf8", 30)

}

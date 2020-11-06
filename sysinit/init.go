package sysinit

func init() {
	//sysinit()
	Dbinit() //初始化主库
	//dbinit("r")          //初始化从库
	//dbinit("uaw", "uar") //初始化社区库
}

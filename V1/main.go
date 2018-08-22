package main

import (
	"github.com/astaxie/beego"
	"github.com/alonCn/GoTask/models"
	_ "github.com/alonCn/GoTask/routers"
	"github.com/alonCn/GoTask/jobs"
)

const (
	VERSION = "1.0.0"
)

func init() {
	//初始化数据模型
	models.Init()
	jobs.InitJobs()
}

func main() {
	beego.BConfig.WebConfig.Session.SessionOn = true
	beego.Run()
}
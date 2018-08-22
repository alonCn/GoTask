Gotask定时任务管理系统 V2.0
===================
![](http://www.haodaquan.com/Uploads/article/2018-07-26/153262059813931.png)

GoTask是一款定时任务可视化的、多人多权限的管理系统，采用golang开发，安装方便，资源消耗少，支持大并发，可同时管理多台服务器上的定时任务。

前言：基于PPGo_Job

V2.0新增以下功能和特性：

- 1、全新UI,基于LayUI2.3构建全新页面，后端模板手工搭建，让操作更加人性化。后台模板地址：https://github.com/george518/PP_admin-template
- 2、新增权限管理功能，根据菜单权限、操作权限和数据权限进行划分，方便多用户多权限管理定时任务。
- 3、新增服务器复制功能，让服务器资源添加更加方便。
- 4、新增定时任务详情页面，将任务相关操作更加集中起来操作。
- 5、新增任务审核功能，提高任务的管控能力。
- 6、新增禁止命令管理功能，配合任务审核功能，提高任务运行安全性。
- 7、优化日志详情页面，查看日志更方便。



先看效果
----
![image](https://github.com/alonCn/GoTask/blob/master/static/imgs/1-index.png?raw=true "github")
![image](https://github.com/alonCn/GoTask/blob/master/static/imgs/2-task.png?raw=true "github")
![image](https://github.com/alonCn/GoTask/blob/master/static/imgs/3-task_detail.png?raw=true "github")
![image](https://github.com/alonCn/GoTask/blob/master/static/imgs/10-auth.png?raw=true "github")
![image](https://github.com/alonCn/GoTask/blob/master/static/imgs/11-role.png?raw=true "github")
![image](https://github.com/alonCn/GoTask/blob/master/static/imgs/12-role_add.png?raw=true "github")
![image](https://github.com/alonCn/GoTask/blob/master/static/imgs/15.log.png?raw=true "github")



=======
效果
---
![image](https://github.com/george518/PPGo_Job/blob/master/static/imgs/1-index.png?raw=true "github")
![image](https://github.com/george518/PPGo_Job/blob/master/static/imgs/2-task.png?raw=true "github")
![image](https://github.com/george518/PPGo_Job/blob/master/static/imgs/3-task_detail.png?raw=true "github")
![image](https://github.com/george518/PPGo_Job/blob/master/static/imgs/10-auth.png?raw=true "github")
![image](https://github.com/george518/PPGo_Job/blob/master/static/imgs/11-role.png?raw=true "github")
![image](https://github.com/george518/PPGo_Job/blob/master/static/imgs/12-role_add.png?raw=true "github")
![image](https://github.com/george518/PPGo_Job/blob/master/static/imgs/15.log.png?raw=true "github")

访问方式
----
前台访问：http://your_host:8080
用户名：admin 密码：123456

配置文件
----
根据自己的情况修改数据库和启动端口
```
appname = ToTask
httpport = 8080
runmode = dev

version= V2.2

# 允许同时运行的任务数
jobs.pool = 1000

# 站点名称
site.name = 定时任务管理器

#通知方式 0=邮件，1=信息
notify.type = 0


# 数据库配置
db.host = 127.0.0.1
db.user = root
db.password = "123456"
db.port = 3306
db.name = go_task
db.prefix = pp_
db.timezone = Asia/Shanghai

# 邮件通知配置
email.host = smtp.mxhichina.com
email.port = 25
email.from = ci@xxx.cn
email.user = ci@xxx.cn
email.password = "xxxxxx"
email.pool = 10


# 短信通知方式配置
msg.url = http://chanxiyou.com/api/tools/send_sms
msg.pool = 10
```

编译安装-可能会遇到的问题
----
go build 时遇到以下错误：
jobs/job.go:19:2: cannot find package "golang.org/x/crypto/ssh" in any of:

需要 git clone https://github.com/golang/crypto.git
并拷贝到 $GOPATH/src/golang.org/x/ 下就OK



package cn.edu.cup.os

import cn.edu.cup.system.SystemStatus
import cn.edu.cup.system.SystemUser
import grails.converters.JSON

class HomeController {

    def systemCommonService

    def countOnlineUsers() {
        def current = new Date()
        def start = current.getTime() - 10 * 60 * 1000
        def cc = SystemStatus.countByLogoutTimeIsNullAndLoginTimeGreaterThan(start)
        def result = [count: cc]
        if (request.xhr) {
            render(template: "onlineCount", model: result)
        } else {
            result
        }
    }

    def index() {}

    /*
    * 退出登录
    * */

    def logout() {
        def pscontext = request.session.servletContext
        Map serviceMap = pscontext.getAttribute("systemUserList")
        systemCommonService.updateSystemStatus(request, params)
        if (session.systemUser) {
            serviceMap.remove(session.systemUser.userName)
            println("${session.systemUser.userName}退出...")
            session.onlineCount = serviceMap.size()
            def logoutUser = session.systemUser.personName()
            session.invalidate()
            //redirect(uri: "/")
            println("拜拜...${logoutUser}")
            model:
            [logoutUser: logoutUser]
        } else {
            redirect(uri: "${createLink(uri: '/')}")
        }
    }

    /*
    * 登录
    * */

    def login() {
        String userName = params.userName;
        String p = params.password.encodeAsMD5()
        def systemUser = SystemUser.findByUserNameAndPassword(userName, p)
        if (systemUser) {
            //println("找到了：${systemUser}")
            session.systemUser = systemUser
            systemCommonService.updateSystemStatus(request, params)
            redirect(uri: "/home")
        } else {
            flash.message = "用户名或密码错误！"
            println("用户名或密码错误！")
            redirect(uri: "${createLink(uri: '/')}")
        }
    }

    /*
    * 显示登录界面
    * */

    def loginUI() {}

}

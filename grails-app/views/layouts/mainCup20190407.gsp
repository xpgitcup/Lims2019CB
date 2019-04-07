<%--
  Created by IntelliJ IDEA.
  User: LiXiaoping
  Date: 2019/4/7
  Time: 20:18
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<!doctype html>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="Grails"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>

    <!--设置Base-->
    <base href="<%=basePath%>"/>

    <asset:stylesheet src="application.css"/>

    <!--引入easyui的相关内容-->
    <asset:stylesheet src="easyui/themes/default/easyui.css"/>
    <asset:stylesheet src="easyui/themes/icon.css"/>
    <asset:stylesheet src="easyui/themes/color.css"/>

    <asset:stylesheet src="bootstrap/css/bootstrap.min.css"/>

    <!-- 加载石油大学的设置-->
    <asset:stylesheet src="cup/cup20190407.css"/>

    <!--JS加载-->
    <asset:javascript src="jquery-3.3.1.min.js"/>
    <asset:javascript src="easyui/jquery.min.js"/>
    <asset:javascript src="easyui/jquery.easyui.min.js"/>

    <asset:javascript src="bootstrap.js"/>

    <!-- 加载石油大学的设置-->
    <asset:javascript src="cn/edu/cup/common.js"/>
    <asset:javascript src="cn/edu/cup/commonUI20190206.js"/>
    <asset:javascript src="cn/edu/cup/os/home.js"/>

    <g:layoutHead/>
</head>

<body>
<div class="container-fluid">
    <div class="row-fluid">
        <div class="col-md-4 column">
            <div class="nav">
                <asset:image src="cup/${cn.edu.cup.basic.Caption.findByName("main")?.logo}" alt="程序Logo"/>
                <div class="application-title">
                    ${cn.edu.cup.basic.Caption.findByName("main")?.title}
                </div>
            </div>
        </div>

        <div class="col-md-7 column">这里应该是菜单</div>

        <div class="col-md-1 column">
            <ul class="application-status">
                <g:if test="${session.systemUser}">
                    <li>
                        当前用户：${session.systemUser.personName()}
                    </li>
                    <li>
                        <a href="${createLink(uri: '/home/logout')}">退出</a>
                    </li>
                </g:if>
                <g:else>
                    <li>
                        <a href="${createLink(uri: '/home/loginUI')}">去登录</a>
                    </li>
                </g:else>
            </ul>
        </div>
    </div>

    <div class="row-fluid">
        <g:layoutBody/>
    </div>

    <div class="row-fluid">
        <div class="col-md-6 column">
            <div class="application-copyright">
                中国石油大学（北京），Copyright 2019, Ver 0.9
            </div>
        </div>

        <div class="col-md-6 column">
            <div id="onlineCount" class="application-footer"></div>
        </div>
    </div>
</div>

</body>
</html>
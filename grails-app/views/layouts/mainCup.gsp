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
    <asset:stylesheet src="application.css"/>

    <!--设置Base-->
    <base href="<%=basePath%>"/>

    <!--引入easyui的相关内容-->
    <asset:stylesheet src="easyui/themes/default/easyui.css"/>
    <asset:stylesheet src="easyui/themes/icon.css"/>
    <asset:stylesheet src="easyui/themes/color.css"/>

    <asset:javascript src="easyui/jquery.easyui.min.js"/>

    <!-- 开始中国石油大学（北京）的设置 -->
    <!-- 界面的设置 -->
    <asset:stylesheet src="cup/easyui4cup.css"/>

    <!-- js-->
    <!--JS加载-->
    <asset:javascript src="jquery-3.3.1.min.js"/>

    <!--jquery ui-->
    <asset:javascript src="jquery-ui/jquery-ui.min.js"/>
    <asset:stylesheet src="jquery-ui/jquery-ui.min.css"/>

    <asset:javascript src="cn/edu/cup/common.js"/>
    <asset:javascript src="cn/edu/cup/commonUI20190206.js"/>
    <asset:javascript src="cn/edu/cup/os/home.js"/>

    <!-- 中国石油大学（北京）的设置结束 -->

    <g:layoutHead/>

</head>

<body>

<!-- 定义主框架 -->
<div id="mainFrame" class="easyui-layout" fit="true">
    <!-- 标题部分 -->
    <div data-options="region:'north'" class="applicationHead" style="height: 78px">
        <div class="header-EasyUI">
            <!-- 这里是图标 -->
            <a class="navbar-brand" href="${cn.edu.cup.basic.Caption.findByName("main").href}">
                <asset:image src="cup/${cn.edu.cup.basic.Caption.findByName("main").logo}" alt="本程序的 Logo"/>
            </a>
        </div>

        <!-- 这里是程序的标题 -->
        <div class="applicationTitle">
            <a>
                ${cn.edu.cup.basic.Caption.findByName("main")?.title}
            </a>
        </div>

        <!-- 这是右侧的状态栏-->
        <div class="applicationHeaderStatus">
            <div class="applicationNav">
                <ul>
                <!-- 显示当前用户 -->
                    <g:if test="${session.systemUser}">
                        <li><a href="${createLink(uri: '/home/logout')}">退出</a></li>
                        <li>当前用户：${session.systemUser.personName()}</li>
                    </g:if>
                    <g:else>
                        <li><a href="${createLink(uri: '/home/loginUI')}">去登录</a></li>
                    </g:else>
                    <li></li>
                    <li>1</li>
                    <li>2</li>
                    <li>3</li>
                </ul>
            </div>
        </div>
    </div>

    <!-- 主显示区 -->
    <div id="mainPanel" data-options="region:'center'" title="????">
        <!-- 这里插入显示主体 -->
        <g:layoutBody/>
    </div>

    <!-- 页脚 -->
    <div data-options="region:'south'" style="width: 100%">
        <div class="applicationFooter">
            <div class="applicationFooterLeft">
                <span>中国石油大学（北京），CopyRight 2017，Ver 1.0</span>
            </div>

            <div class="applicationFooterRight">
                <ul>
                    <li>
                        ${session?.systemUserList}
                    </li>
                    <li>
                        <div id="onlineCount"></div>
                    </li>
                </ul>
            </div>
        </div>
    </div>

</div>


<div id="spinner" class="spinner" style="display:none;">
    <g:message code="spinner.alt" default="Loading&hellip;"/>
</div>

<asset:javascript src="application.js"/>

</body>
</html>

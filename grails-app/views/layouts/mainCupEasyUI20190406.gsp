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

    <!--JS加载-->
    <asset:javascript src="jquery-3.3.1.min.js"/>
    <asset:javascript src="easyui/jquery.min.js"/>
    <asset:javascript src="easyui/jquery.easyui.min.js"/>

    <!-- 开始中国石油大学（北京）的设置 -->
    <!-- 界面的设置 -->
    <asset:stylesheet src="cup/cup-easyui-20190406.css"/>

    <!-- js-->

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
    <div data-options="region:'north'" style="height: 78px">
        <div class="header-EasyUI">
            <!-- 这是左上角图标，来自于白色的圣杯的大图的缩小版  -->
            <a href="${createLink(uri: '/')}">
                <asset:image src="cup/${cn.edu.cup.basic.Caption.findByName("main")?.logo}"/>
            </a>
        </div>

        <div class="applicationTitle">
            ${cn.edu.cup.basic.Caption.findByName("main")?.title}
        </div>

        <div class="applicationHeaderStatus">
            <ul>
            <!-- 显示当前用户 -->
                <g:if test="${session.systemUser}">
                    <li><a href="${createLink(uri: '/home/logout')}">退出</a></li>
                </g:if>
                <g:else>
                    <li><a href="${createLink(uri: '/home/loginUI')}">去登录 < /li>
                </g:else>
            </ul>
        </div>
    </div>
    <!-- 主显示区 -->
    <div id="mainPanel" data-options="region:'center'" class="mainContent" title="????">
        <!-- 这里插入显示主体 -->
        <g:layoutBody/>
    </div>
    <!-- 页脚 -->
    <div data-options="region:'south'" style="width: 100%">
        <div class="applicationFooterLeft">
            <span>中国石油大学（北京），CopyRight 2017，Ver 1.0</span>
        </div>
        <ul class="applicationFooter">
            <li>
                ${session?.systemUserList}
            </li>
            <li>
                在线:${session?.onlineCount}人:
            </li>
            <li>
                当前用户：${session?.systemUser?.userName}/${session?.realName}[${session?.systemUser?.roleAttribute}]
            </li>
        </ul>
    </div>
</div>

<div id="spinner" class="spinner" style="display:none;">
    <g:message code="spinner.alt" default="Loading&hellip;"/>
</div>

<asset:javascript src="application.js"/>

</body>
</html>

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
    <asset:stylesheet src="cup/cup-easyui.css"/>

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

<div class="easyui-layout" fit="true">
    <div data-options="region:'north'" style="height: 80px">

        <div class="easyui-layout" fit="true">
            <div data-options="region:'west'" style="width: 30%">
                <div class="application-logo">
                    <!-- 这里是图标 -->
                    <a class="navbar-brand" href="${cn.edu.cup.basic.Caption.findByName("main").href}">
                        <asset:image src="cup/${cn.edu.cup.basic.Caption.findByName("main").logo}" alt="本程序的 Logo"/>
                    </a>
                </div>

                <!-- 这里是程序的标题 -->
                <div class="application-title">
                    <a>
                        ${cn.edu.cup.basic.Caption.findByName("main")?.title}
                    </a>
                </div>

            </div>

            <div data-options="region:'center'">center</div>
            <div data-options="region:'east'" style="width: 10%">east</div>
        </div>

    </div>

    <div data-options="region:'center'">
        <g:layoutBody/>
    </div>

    <div data-options="region:'south'" style="height: 25px">
    </div>

</div>

<div id="spinner" class="spinner" style="display:none;">
    <g:message code="spinner.alt" default="Loading&hellip;"/>
</div>

<asset:javascript src="application.js"/>

</body>
</html>

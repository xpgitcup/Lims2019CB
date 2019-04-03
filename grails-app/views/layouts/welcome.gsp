<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="Grails"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

    <!-- 界面设置开始 -->
    <asset:stylesheet src="application.css"/>

    <!--引入CUP的相关内容-->
    <asset:stylesheet src="cup/cup.css"/>
    <asset:stylesheet src="cup/welcome.css"/>

    <!-- 界面设置结束 -->

    <g:layoutHead/>
</head>

<body>
<div class="container">

    %{--导航栏kq--}%
    <!--div class="navbar navbar-default navbar-static-top" role="navigation"-->
    <div class="navbar" role="navigation">

        %{--标题--}%
        <span class="navbar-header">
            <a href="${createLink(uri: '/')}">
                <asset:image src="cup/${cn.edu.cup.basic.Caption.findByName("main")?.logo}"
                             class="img-rounded"/>
            </a>
        </span>
        <span class="applicationTitle">
            <g:if test="${cn.edu.cup.basic.Caption.findByName("main")?.title}">
                ${cn.edu.cup.basic.Caption.findByName("main")?.title}
            </g:if>
            <g:else>
                替换成应用程序的标题
            </g:else>
        </span>

        <span class="navbar-collapse collapse  navbar-right" aria-expanded="false" style="height: 0.8px;">
            <ul class="nav navbar-nav">
                <g:pageProperty name="page.nav"/>
                %{--每页的nav可以不同--}%
            </ul>
        </span>
    </div>
    %{--页面正文--}%
    <g:layoutBody/>
</div>

<!--asset:javascript src="application.js"/-->

</body>
</html>

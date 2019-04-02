<!doctype html>
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

    <!-- 开始中国石油大学（北京）的设置 -->
    <asset:stylesheet src="cup/cup.css"/>
    <!-- 中国石油大学（北京）的设置结束 -->

    <g:layoutHead/>
</head>

<body>

<div class="container-fluid">
    <!-- 这里是图标 -->
    <a class="navbar-brand" href="${cn.edu.cup.basic.Caption.findByName("main").href}">
        <asset:image src="cup/${cn.edu.cup.basic.Caption.findByName("main").logo}" alt="本程序的 Logo"/>
    </a>

    <!-- 这里是程序的标题 -->
    <div class="applicationTitle">
        ${cn.edu.cup.basic.Caption.findByName("main")?.title}
    </div>

    <div class="applicationHeaderStatus">
        <ul>
            <g:if test="${session.systemUser}">
            </g:if>
            <g:else>
                <li>
                    <a href="${createLink(uri: '/home/loginUI')}">去登录</a>
                </li>
            </g:else>
        </ul>
    </div>

</div>

<nav class="navbar navbar-expand-lg navbar-dark navbar-static-top" role="navigation">

    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarContent"
            aria-controls="navbarContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <!--div class="collapse navbar-collapse" aria-expanded="false" style="height: 0.8px;" id="navbarContent"-->
    <div class="collapse navbar-collapse" aria-expanded="false" style="height: 0.8px;" id="navbarContent">
        <ul class="nav navbar-nav ml-auto">
            <g:pageProperty name="page.nav"/>
        </ul>
    </div>

</nav>

<g:layoutBody/>

<div class="footer row" role="contentinfo">
    <div class="col">
        <a href="http://guides.grails.org" target="_blank">
            <asset:image src="advancedgrails.svg" alt="Grails Guides" class="float-left"/>
        </a>
        <strong class="centered"><a href="http://guides.grails.org" target="_blank">Grails Guides</a></strong>

        <p>Building your first Grails app? Looking to add security, or create a Single-Page-App? Check out the <a
                href="http://guides.grails.org" target="_blank">Grails Guides</a> for step-by-step tutorials.</p>

    </div>

</div>


<div id="spinner" class="spinner" style="display:none;">
    <g:message code="spinner.alt" default="Loading&hellip;"/>
</div>

<asset:javascript src="application.js"/>

</body>
</html>

<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%--shiro 标签 --%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8"/>
    <title>11111</title>
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport"/>
    <link rel="icon" href="${basePath}/favicon.ico" type="image/x-icon"/>
    <link rel="shortcut icon" href="${basePath}/favicon.ico"/>
    <link href="${basePath}/js/common/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="${basePath}/css/common/base.css" rel="stylesheet"/>
    <script src="${basePath}/js/common/jquery/jquery1.8.3.min.js"></script>
    <script src="${basePath}/js/common/layer/layer.js"></script>
    <script src="${basePath}/js/common/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script src="${basePath}/js/user.login.js"></script>
</head>
<body>
<div class="navbar navbar-inverse navbar-fixed-top animated fadeInDown" style="z-index: 101;height: 41px;">
    <div class="container" style="padding-left: 0px; padding-right: 0px;">
        <div class="navbar-header">
            <button data-target=".navbar-collapse" data-toggle="collapse" type="button" class="navbar-toggle collapsed">
                <span class="sr-only">导航</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>
        <div role="navigation" class="navbar-collapse collapse">
            <a id="_logo" href="${basePath}" style="color:#fff; font-size: 24px;" class="navbar-brand hidden-sm">SSM +
                Shiro Demo 演示</a>
            <ul class="nav navbar-nav" id="topMenu">
                <li class="dropdown active">
                    <a aria-expanded="false" aria-haspopup="true" role="button" data-toggle="dropdown"
                       class="dropdown-toggle" href="${basePath}/user/index.shtml">
                        个人中心<span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="${basePath}/user/index.shtml">个人资料</a></li>
                        <li><a href="${basePath}/user/updateSelf.shtml">资料修改</a></li>
                        <li><a href="${basePath}/user/updatePswd.shtml">密码修改</a></li>
                        <li><a href="${basePath}/role/mypermission.shtml">我的权限</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</div>
</body>
</html>
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

<div id="one" class="col-md-2">
    <ul data-spy="affix" class="nav nav-list nav-tabs nav-stacked bs-docs-sidenav dropdown affix"
        style="top: 100px; z-index: 100;">
        <li class="active">
            <a href="${basePath}/user/index.shtml">
                <i class="glyphicon glyphicon-chevron-right"></i>个人资料
            </a>
            <ul class="dropdown-menu" aria-labelledby="dLabel" style="margin-left: 160px; margin-top: -40px;">
                <li><a href="${basePath}/user/updateSelf.shtml">资料修改</a></li>
                <li><a href="${basePath}/user/updatePswd.shtml">密码修改</a></li>
            </ul>
        </li>
        <li class="dropdown">
            <a href="${basePath}/role/mypermission.shtml">
                <i class="glyphicon glyphicon-chevron-right"></i>我的权限
            </a>
        </li>
    </ul>
</div>
</body>
</html>
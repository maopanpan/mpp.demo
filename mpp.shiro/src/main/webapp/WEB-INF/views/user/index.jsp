<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<%--shiro 标签 --%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard | Nifty - Admin Template</title>


    <!--STYLESHEET-->
    <!--=================================================-->

    <!--Open Sans Font [ OPTIONAL ]-->
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700' rel='stylesheet' type='text/css'>


    <!--Bootstrap Stylesheet [ REQUIRED ]-->
    <link href="${basePath}/static/css/bootstrap.min.css" rel="stylesheet">


    <!--Nifty Stylesheet [ REQUIRED ]-->
    <link href="${basePath}/static/css/nifty.min.css" rel="stylesheet">


    <!--Nifty Premium Icon [ DEMONSTRATION ]-->
    <link href="${basePath}/static/css/demo/nifty-demo-icons.min.css" rel="stylesheet">


    <!--Demo [ DEMONSTRATION ]-->
    <link href="${basePath}/static/css/demo/nifty-demo.min.css" rel="stylesheet">



    <!--Morris.js [ OPTIONAL ]-->
    <link href="${basePath}/static/plugins/morris-js/morris.min.css" rel="stylesheet">


    <!--Magic Checkbox [ OPTIONAL ]-->
    <link href="${basePath}/static/plugins/magic-check/css/magic-check.min.css" rel="stylesheet">






    <!--JAVASCRIPT-->
    <!--=================================================-->

    <!--Pace - Page Load Progress Par [OPTIONAL]-->
    <link href="${basePath}/static/plugins/pace/pace.min.css" rel="stylesheet">
    <script src="${basePath}/static/plugins/pace/pace.min.js"></script>


    <!--jQuery [ REQUIRED ]-->
    <script src="${basePath}/static/js/jquery-2.2.4.min.js"></script>


    <!--BootstrapJS [ RECOMMENDED ]-->
    <script src="${basePath}/static/js/bootstrap.min.js"></script>


    <!--NiftyJS [ RECOMMENDED ]-->
    <script src="${basePath}/static/js/nifty.min.js"></script>






    <!--=================================================-->

    <!--Demo script [ DEMONSTRATION ]-->
    <script src="${basePath}/static/js/demo/nifty-demo.min.js"></script>


    <!--Morris.js [ OPTIONAL ]-->
    <script src="${basePath}/static/plugins/morris-js/morris.min.js"></script>
    <script src="${basePath}/static/plugins/morris-js/raphael-js/raphael.min.js"></script>


    <!--Sparkline [ OPTIONAL ]-->
    <script src="${basePath}/static/plugins/sparkline/jquery.sparkline.min.js"></script>


    <!--Specify page [ SAMPLE ]-->
    <script src="${basePath}/static/js/demo/dashboard.js"></script>





    <!--=================================================

    REQUIRED
    You must include this in your project.


    RECOMMENDED
    This category must be included but you may modify which plugins or components which should be included in your project.


    OPTIONAL
    Optional plugins. You may choose whether to include it in your project or not.


    DEMONSTRATION
    This is to be removed, used for demonstration purposes only. This category must not be included in your project.


    SAMPLE
    Some script samples which explain how to initialize plugins or components. This category should not be included in your project.


    Detailed information and more samples can be found in the document.

    =================================================-->


</head>

<!--TIPS-->
<!--You may remove all ID or Class names which contain "demo-", they are only used for demonstration. -->
<body>
<div id="container" class="effect aside-float aside-bright mainnav-lg">

    <!--NAVBAR-->
    <!--===================================================-->
    <header id="navbar">
        <div id="navbar-container" class="boxed">

            <!--Brand logo & name-->
            <!--================================-->
            <div class="navbar-header">
                <a href="index.html" class="navbar-brand">
                    <img src="${basePath}/static/img/logo.png" alt="Nifty Logo" class="brand-icon">
                    <div class="brand-title">
                        <span class="brand-text">Nifty</span>
                    </div>
                </a>
            </div>
            <!--================================-->
            <!--End brand logo & name-->


            <!--Navbar Dropdown-->
            <!--================================-->
            <div class="navbar-content clearfix">
                <ul class="nav navbar-top-links pull-left">

                    <!--Navigation toogle button-->
                    <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                    <li class="tgl-menu-btn">
                        <a class="mainnav-toggle" href="#">
                            <i class="demo-pli-view-list"></i>
                        </a>
                    </li>
                    <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                    <!--End Navigation toogle button-->



                    <!--Notification dropdown-->
                    <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                    <li class="dropdown">
                        <a href="#" data-toggle="dropdown" class="dropdown-toggle">
                            <i class="demo-pli-bell"></i>
                            <span class="badge badge-header badge-danger"></span>
                        </a>

                        <!--Notification dropdown menu-->
                        <div class="dropdown-menu dropdown-menu-md">
                            <div class="pad-all bord-btm">
                                <p class="text-semibold text-main mar-no">You have 9 notifications.</p>
                            </div>
                            <div class="nano scrollable">
                                <div class="nano-content">
                                    <ul class="head-list">

                                        <!-- Dropdown list-->
                                        <li>
                                            <a href="#">
                                                <div class="clearfix">
                                                    <p class="pull-left">Database Repair</p>
                                                    <p class="pull-right">70%</p>
                                                </div>
                                                <div class="progress progress-sm">
                                                    <div style="width: 70%;" class="progress-bar">
                                                        <span class="sr-only">70% Complete</span>
                                                    </div>
                                                </div>
                                            </a>
                                        </li>

                                        <!-- Dropdown list-->
                                        <li>
                                            <a href="#">
                                                <div class="clearfix">
                                                    <p class="pull-left">Upgrade Progress</p>
                                                    <p class="pull-right">10%</p>
                                                </div>
                                                <div class="progress progress-sm">
                                                    <div style="width: 10%;" class="progress-bar progress-bar-warning">
                                                        <span class="sr-only">10% Complete</span>
                                                    </div>
                                                </div>
                                            </a>
                                        </li>

                                        <!-- Dropdown list-->
                                        <li>
                                            <a class="media" href="#">
                                                <span class="badge badge-success pull-right">90%</span>
                                                <div class="media-left">
                                                    <i class="demo-pli-data-settings icon-2x"></i>
                                                </div>
                                                <div class="media-body">
                                                    <div class="text-nowrap">HDD is full</div>
                                                    <small class="text-muted">50 minutes ago</small>
                                                </div>
                                            </a>
                                        </li>

                                        <!-- Dropdown list-->
                                        <li>
                                            <a class="media" href="#">
                                                <div class="media-left">
                                                    <i class="demo-pli-file-edit icon-2x"></i>
                                                </div>
                                                <div class="media-body">
                                                    <div class="text-nowrap">Write a news article</div>
                                                    <small class="text-muted">Last Update 8 hours ago</small>
                                                </div>
                                            </a>
                                        </li>

                                        <!-- Dropdown list-->
                                        <li>
                                            <a class="media" href="#">
                                                <span class="label label-danger pull-right">New</span>
                                                <div class="media-left">
                                                    <i class="demo-pli-speech-bubble-7 icon-2x"></i>
                                                </div>
                                                <div class="media-body">
                                                    <div class="text-nowrap">Comment Sorting</div>
                                                    <small class="text-muted">Last Update 8 hours ago</small>
                                                </div>
                                            </a>
                                        </li>

                                        <!-- Dropdown list-->
                                        <li>
                                            <a class="media" href="#">
                                                <div class="media-left">
                                                    <i class="demo-pli-add-user-plus-star icon-2x"></i>
                                                </div>
                                                <div class="media-body">
                                                    <div class="text-nowrap">New User Registered</div>
                                                    <small class="text-muted">4 minutes ago</small>
                                                </div>
                                            </a>
                                        </li>

                                        <!-- Dropdown list-->
                                        <li class="bg-gray">
                                            <a class="media" href="#">
                                                <div class="media-left">
                                                    <img class="img-circle img-sm" alt="Profile Picture" src="${basePath}/static/img/profile-photos/9.png">
                                                </div>
                                                <div class="media-body">
                                                    <div class="text-nowrap">Lucy sent you a message</div>
                                                    <small class="text-muted">30 minutes ago</small>
                                                </div>
                                            </a>
                                        </li>

                                        <!-- Dropdown list-->
                                        <li class="bg-gray">
                                            <a class="media" href="#">
                                                <div class="media-left">
                                                    <img class="img-circle img-sm" alt="Profile Picture" src="${basePath}/static/img/profile-photos/3.png">
                                                </div>
                                                <div class="media-body">
                                                    <div class="text-nowrap">Jackson sent you a message</div>
                                                    <small class="text-muted">40 minutes ago</small>
                                                </div>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>

                            <!--Dropdown footer-->
                            <div class="pad-all bord-top">
                                <a href="#" class="btn-link text-dark box-block">
                                    <i class="fa fa-angle-right fa-lg pull-right"></i>Show All Notifications
                                </a>
                            </div>
                        </div>
                    </li>
                    <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                    <!--End notifications dropdown-->



                    <!--Mega dropdown-->
                    <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                    <li class="mega-dropdown">
                        <a href="#" class="mega-dropdown-toggle">
                            <i class="demo-pli-layout-grid"></i>
                        </a>
                        <div class="dropdown-menu mega-dropdown-menu">
                            <div class="row">
                                <div class="col-sm-4 col-md-3">

                                    <!--Mega menu list-->
                                    <ul class="list-unstyled">
                                        <li class="dropdown-header"><i class="demo-pli-file icon-fw"></i> Pages</li>
                                        <li><a href="#">Profile</a></li>
                                        <li><a href="#">Search Result</a></li>
                                        <li><a href="#">FAQ</a></li>
                                        <li><a href="#">Sreen Lock</a></li>
                                        <li><a href="#" class="disabled">Disabled</a></li>                                        </ul>

                                </div>
                                <div class="col-sm-4 col-md-3">

                                    <!--Mega menu list-->
                                    <ul class="list-unstyled">
                                        <li class="dropdown-header"><i class="demo-pli-mail icon-fw"></i> Mailbox</li>
                                        <li><a href="#"><span class="pull-right label label-danger">Hot</span>Indox</a></li>
                                        <li><a href="#">Read Message</a></li>
                                        <li><a href="#">Compose</a></li>
                                    </ul>
                                    <p class="pad-top mar-top bord-top text-sm">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes.</p>
                                </div>
                                <div class="col-sm-4 col-md-3">
                                    <!--Mega menu list-->
                                    <ul class="list-unstyled">
                                        <li>
                                            <a href="#" class="media mar-btm">
                                                <span class="badge badge-success pull-right">90%</span>
                                                <div class="media-left">
                                                    <i class="demo-pli-data-settings icon-2x"></i>
                                                </div>
                                                <div class="media-body">
                                                    <p class="text-semibold text-dark mar-no">Data Backup</p>
                                                    <small class="text-muted">This is the item description</small>
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#" class="media mar-btm">
                                                <div class="media-left">
                                                    <i class="demo-pli-support icon-2x"></i>
                                                </div>
                                                <div class="media-body">
                                                    <p class="text-semibold text-dark mar-no">Support</p>
                                                    <small class="text-muted">This is the item description</small>
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#" class="media mar-btm">
                                                <div class="media-left">
                                                    <i class="demo-pli-computer-secure icon-2x"></i>
                                                </div>
                                                <div class="media-body">
                                                    <p class="text-semibold text-dark mar-no">Security</p>
                                                    <small class="text-muted">This is the item description</small>
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#" class="media mar-btm">
                                                <div class="media-left">
                                                    <i class="demo-pli-map-2 icon-2x"></i>
                                                </div>
                                                <div class="media-body">
                                                    <p class="text-semibold text-dark mar-no">Location</p>
                                                    <small class="text-muted">This is the item description</small>
                                                </div>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="col-sm-12 col-md-3">
                                    <p class="dropdown-header"><i class="demo-pli-file-jpg icon-fw"></i> Gallery</p>
                                    <ul class="list-unstyled list-inline text-justify">

                                        <li class="pad-btm">
                                            <img src="${basePath}/static/img/thumbs/mega-menu-2.jpg" alt="thumbs">
                                        </li>
                                        <li class="pad-btm">
                                            <img src="${basePath}/static/img/thumbs/mega-menu-3.jpg" alt="thumbs">
                                        </li>
                                        <li class="pad-btm">
                                            <img src="${basePath}/static/img/thumbs/mega-menu-1.jpg" alt="thumbs">
                                        </li>
                                        <li class="pad-btm">
                                            <img src="${basePath}/static/img/thumbs/mega-menu-4.jpg" alt="thumbs">
                                        </li>
                                        <li class="pad-btm">
                                            <img src="${basePath}/static/img/thumbs/mega-menu-5.jpg" alt="thumbs">
                                        </li>
                                        <li class="pad-btm">
                                            <img src="${basePath}/static/img/thumbs/mega-menu-6.jpg" alt="thumbs">
                                        </li>
                                    </ul>
                                    <a href="#" class="btn btn-sm btn-block btn-default">Browse Gallery</a>
                                </div>
                            </div>
                        </div>
                    </li>
                    <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                    <!--End mega dropdown-->

                </ul>
                <ul class="nav navbar-top-links pull-right">

                    <!--Language selector-->
                    <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                    <li class="dropdown">
                        <a id="demo-lang-switch" class="lang-selector dropdown-toggle" href="#" data-toggle="dropdown">
                                <span class="lang-selected">
                                    <img class="lang-flag" src="${basePath}/static/img/flags/united-kingdom.png" alt="English">
                                </span>
                        </a>

                        <!--Language selector menu-->
                        <ul class="head-list dropdown-menu">
                            <li>
                                <!--English-->
                                <a href="#" class="active">
                                    <img class="lang-flag" src="${basePath}/static/img/flags/united-kingdom.png" alt="English">
                                    <span class="lang-id">EN</span>
                                    <span class="lang-name">English</span>
                                </a>
                            </li>
                            <li>
                                <!--France-->
                                <a href="#">
                                    <img class="lang-flag" src="${basePath}/static/img/flags/france.png" alt="France">
                                    <span class="lang-id">FR</span>
                                    <span class="lang-name">Fran&ccedil;ais</span>
                                </a>
                            </li>
                            <li>
                                <!--Germany-->
                                <a href="#">
                                    <img class="lang-flag" src="${basePath}/static/img/flags/germany.png" alt="Germany">
                                    <span class="lang-id">DE</span>
                                    <span class="lang-name">Deutsch</span>
                                </a>
                            </li>
                            <li>
                                <!--Italy-->
                                <a href="#">
                                    <img class="lang-flag" src="${basePath}/static/img/flags/italy.png" alt="Italy">
                                    <span class="lang-id">IT</span>
                                    <span class="lang-name">Italiano</span>
                                </a>
                            </li>
                            <li>
                                <!--Spain-->
                                <a href="#">
                                    <img class="lang-flag" src="${basePath}/static/img/flags/spain.png" alt="Spain">
                                    <span class="lang-id">ES</span>
                                    <span class="lang-name">Espa&ntilde;ol</span>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                    <!--End language selector-->



                    <!--User dropdown-->
                    <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                    <li id="dropdown-user" class="dropdown">
                        <a href="#" data-toggle="dropdown" class="dropdown-toggle text-right">
                                <span class="pull-right">
                                    <!--<img class="img-circle img-user media-object" src="img/profile-photos/1.png" alt="Profile Picture">-->
                                    <i class="demo-pli-male ic-user"></i>
                                </span>
                            <div class="username hidden-xs">Aaron Chavez</div>
                        </a>


                        <div class="dropdown-menu dropdown-menu-md dropdown-menu-right panel-default">

                            <!-- Dropdown heading  -->
                            <div class="pad-all bord-btm">
                                <p class="text-main mar-btm"><span class="text-bold">750GB</span> of 1,000GB Used</p>
                                <div class="progress progress-sm">
                                    <div class="progress-bar" style="width: 70%;">
                                        <span class="sr-only">70%</span>
                                    </div>
                                </div>
                            </div>


                            <!-- User dropdown menu -->
                            <ul class="head-list">
                                <li>
                                    <a href="#">
                                        <i class="demo-pli-male icon-lg icon-fw"></i> Profile
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <span class="badge badge-danger pull-right">9</span>
                                        <i class="demo-pli-mail icon-lg icon-fw"></i> Messages
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <span class="label label-success pull-right">New</span>
                                        <i class="demo-pli-gear icon-lg icon-fw"></i> Settings
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <i class="demo-pli-information icon-lg icon-fw"></i> Help
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <i class="demo-pli-computer-secure icon-lg icon-fw"></i> Lock screen
                                    </a>
                                </li>
                            </ul>

                            <!-- Dropdown footer -->
                            <div class="pad-all text-right">
                                <a href="pages-login.html" class="btn btn-primary">
                                    <i class="demo-pli-unlock"></i> Logout
                                </a>
                            </div>
                        </div>
                    </li>
                    <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                    <!--End user dropdown-->

                    <li>
                        <a href="#" class="aside-toggle navbar-aside-icon">
                            <i class="pci-ver-dots"></i>
                        </a>
                    </li>
                </ul>
            </div>
            <!--================================-->
            <!--End Navbar Dropdown-->

        </div>
    </header>
    <!--===================================================-->
    <!--END NAVBAR-->

    <div class="boxed">

        <!--CONTENT CONTAINER-->
        <!--===================================================-->
       <div id="content-container">

            <!--Page Title-->
            <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
            <div id="page-title">
                <h1 class="page-header text-overflow">Dashboard</h1>

                <!--Searchbox-->
                <div class="searchbox">
                    <div class="input-group custom-search-form">
                        <input type="text" class="form-control" placeholder="Search..">
                        <span class="input-group-btn">
                                <button class="text-muted" type="button"><i class="demo-pli-magnifi-glass"></i></button>
                            </span>
                    </div>
                </div>
            </div>
            <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
            <!--End page title-->

            <!--Page content-->
            <!--===================================================-->
            <%--<div id="page-content">

                <div class="row">
                    <div class="col-lg-7">

                        <!--Network Line Chart-->
                        <!--===================================================-->
                        <div id="demo-panel-network" class="panel">
                            <div class="panel-heading">
                                <div class="panel-control">
                                    <button id="demo-panel-network-refresh" data-toggle="panel-overlay" data-target="#demo-panel-network" class="btn"><i class="demo-pli-repeat-2 icon-lg"></i></button>
                                    <div class="btn-group">
                                        <button class="dropdown-toggle btn" data-toggle="dropdown" aria-expanded="false"><i class="demo-pli-gear icon-lg"></i></button>
                                        <ul class="dropdown-menu dropdown-menu-right">
                                            <li><a href="#">Action</a></li>
                                            <li><a href="#">Another action</a></li>
                                            <li><a href="#">Something else here</a></li>
                                            <li class="divider"></li>
                                            <li><a href="#">Separated link</a></li>
                                        </ul>
                                    </div>
                                </div>
                                <h3 class="panel-title">Network</h3>
                            </div>

                            <!--Morris line chart placeholder-->
                            <div id="morris-chart-network" class="morris-full-content"></div>

                            <!--Chart information-->
                            <div class="panel-body">
                                <div class="row pad-top">
                                    <div class="col-lg-8">
                                        <div class="media">
                                            <div class="media-left">
                                                <div class="media">
                                                    <p class="text-semibold text-main">Temperature</p>
                                                    <div class="media-left pad-no">
					                                        <span class="text-2x text-semibold text-nowrap text-main">
					                                            <i class="demo-pli-temperature"></i> 43.7
					                                        </span>
                                                    </div>
                                                    <div class="media-body">
                                                        <p class="mar-no">°C</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="media-body pad-lft">
                                                <div class="pad-btm">
                                                    <p class="text-semibold text-main mar-no">Today Tips</p>
                                                    <small>A wonderful serenity has taken possession of my entire soul, like these sweet mornings of spring which I enjoy with my whole heart.</small>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-4">
                                        <p class="text-semibold text-main">Bandwidth Usage</p>
                                        <ul class="list-unstyled">
                                            <li>
                                                <div class="media">
                                                    <div class="media-left">
                                                        <span class="text-2x text-semibold text-main">75.9</span>
                                                    </div>
                                                    <div class="media-body">
                                                        <p class="mar-no">Mbps</p>
                                                    </div>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="clearfix">
                                                    <p class="pull-left mar-no">Outcome</p>
                                                    <p class="pull-right mar-no">75%</p>
                                                </div>
                                                <div class="progress progress-xs">
                                                    <div class="progress-bar progress-bar-info" style="width: 75%;">
                                                        <span class="sr-only">75%</span>
                                                    </div>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>


                        </div>
                        <!--===================================================-->
                        <!--End network line chart-->

                    </div>
                    <div class="col-lg-5">
                        <div class="row">
                            <div class="col-sm-6 col-lg-6">

                                <!--Sparkline Area Chart-->
                                <div class="panel panel-success panel-colorful">
                                    <div class="pad-all">
                                        <p class="text-lg text-semibold"><i class="demo-pli-data-storage icon-fw"></i> HDD Usage</p>
                                        <p class="mar-no">
                                            <span class="pull-right text-bold">132Gb</span>
                                            Free Space
                                        </p>
                                        <p class="mar-no">
                                            <span class="pull-right text-bold">1,45Gb</span>
                                            Used space
                                        </p>
                                    </div>
                                    <div class="pad-all text-center">
                                        <!--Placeholder-->
                                        <div id="demo-sparkline-area"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6 col-lg-6">

                                <!--Sparkline Line Chart-->
                                <div class="panel panel-info panel-colorful">
                                    <div class="pad-all">
                                        <p class="text-lg text-semibold"><i class="demo-pli-wallet-2 icon-fw"></i> Earning</p>
                                        <p class="mar-no">
                                            <span class="pull-right text-bold">$764</span>
                                            Today
                                        </p>
                                        <p class="mar-no">
                                            <span class="pull-right text-bold">$1,332</span>
                                            Last 7 Day
                                        </p>
                                    </div>
                                    <div class="pad-all text-center">

                                        <!--Placeholder-->
                                        <div id="demo-sparkline-line"></div>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6 col-lg-6">

                                <!--Sparkline bar chart -->
                                <div class="panel panel-purple panel-colorful">
                                    <div class="pad-all">
                                        <p class="text-lg text-semibold"><i class="demo-pli-bag-coins icon-fw"></i> Sales</p>
                                        <p class="mar-no">
                                            <span class="pull-right text-bold">$764</span>
                                            Today
                                        </p>
                                        <p class="mar-no">
                                            <span class="pull-right text-bold">$1,332</span>
                                            Last 7 Day
                                        </p>
                                    </div>
                                    <div class="pad-all text-center">

                                        <!--Placeholder-->
                                        <div id="demo-sparkline-bar" class="box-inline"></div>

                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6 col-lg-6">

                                <!--Sparkline pie chart -->
                                <div class="panel panel-warning panel-colorful">
                                    <div class="pad-all">
                                        <p class="text-lg text-semibold"><i class="demo-pli-check icon-fw"></i> Task Progress</p>
                                        <p class="mar-no">
                                            <span class="pull-right text-bold">34</span>
                                            Completed
                                        </p>
                                        <p class="mar-no">
                                            <span class="pull-right text-bold">79</span>
                                            Total
                                        </p>
                                    </div>
                                    <div class="pad-all">
                                        <ul class="list-group list-unstyled">
                                            <li class="mar-btm">
                                                <span class="label label-warning pull-right">15%</span>
                                                <p>Progress</p>
                                                <div class="progress progress-md">
                                                    <div style="width: 15%;" class="progress-bar progress-bar-light">
                                                        <span class="sr-only">15%</span>
                                                    </div>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-4">
                        <!--List Todo-->
                        <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                        <div class="panel panel-trans">
                            <div class="panel-heading">
                                <h3 class="panel-title">To do list</h3>
                            </div>
                            <div class="pad-ver">
                                <ul class="list-group bg-trans list-todo mar-no">
                                    <li class="list-group-item">
                                        <input id="demo-todolist-1" class="magic-checkbox" type="checkbox">
                                        <label for="demo-todolist-1"><span>Find an idea. <span class="label label-danger">Important</span></span></label>
                                    </li>
                                    <li class="list-group-item">
                                        <input id="demo-todolist-2" class="magic-checkbox" type="checkbox" checked>
                                        <label for="demo-todolist-2"><span>Do some work</span></label>
                                    </li>
                                    <li class="list-group-item">
                                        <input id="demo-todolist-3" class="magic-checkbox" type="checkbox">
                                        <label for="demo-todolist-3"><span>Read the book</span></label>
                                    </li>
                                    <li class="list-group-item">
                                        <input id="demo-todolist-4" class="magic-checkbox" type="checkbox">
                                        <label for="demo-todolist-4"><span>Upgrade server <span class="label label-warning">Warning</span></span></label>
                                    </li>
                                    <li class="list-group-item">
                                        <input id="demo-todolist-5" class="magic-checkbox" type="checkbox" checked>
                                        <label for="demo-todolist-5"><span>Redesign my logo <span class="label label-info">2 Mins</span></span></label>
                                    </li>
                                </ul>
                            </div>
                            <div class="input-group pad-all">
                                <input type="text" class="form-control" placeholder="New task" autocomplete="off">
                                <span class="input-group-btn">
					                    <button type="button" class="btn btn-success"><i class="demo-pli-add"></i></button>
					                </span>
                            </div>
                        </div>
                        <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                        <!--End todo list-->
                    </div>
                    <div class="col-lg-4">
                        <div class="panel panel-trans">
                            <div class="panel-heading">
                                <div class="panel-control">
                                    <a title="" data-html="true" data-container="body" data-original-title="&lt;p class='h4 text-semibold'&gt;Information&lt;/p&gt;&lt;p style='width:150px'&gt;This is an information bubble to help the user.&lt;/p&gt;" href="#" class="demo-psi-information icon-lg icon-fw unselectable text-info add-tooltip"></a>
                                </div>
                                <h3 class="panel-title">Services</h3>
                            </div>
                            <div class="bord-btm">
                                <ul class="list-group bg-trans">
                                    <li class="list-group-item">
                                        <div class="pull-right">
                                            <input id="demo-online-status-checkbox" class="toggle-switch" type="checkbox" checked>
                                            <label for="demo-online-status-checkbox"></label>
                                        </div>
                                        Online status
                                    </li>
                                    <li class="list-group-item">
                                        <div class="pull-right">
                                            <input id="demo-show-off-contact-checkbox" class="toggle-switch" type="checkbox" checked>
                                            <label for="demo-show-off-contact-checkbox"></label>
                                        </div>
                                        Show offline contact
                                    </li>
                                    <li class="list-group-item">
                                        <div class="pull-right">
                                            <input id="demo-show-device-checkbox" class="toggle-switch" type="checkbox">
                                            <label for="demo-show-device-checkbox"></label>
                                        </div>
                                        Show my device icon
                                    </li>
                                </ul>
                            </div>
                            <div class="panel-body">
                                <div class="pad-btm">
                                    <p class="text-semibold text-main">Upgrade Progress</p>
                                    <div class="progress progress-sm">
                                        <div class="progress-bar progress-bar-purple" aria-valuenow="15" aria-valuemin="0" aria-valuemax="100" style="width: 15%;" role="progressbar">
                                            <span class="sr-only">15%</span>
                                        </div>
                                    </div>
                                    <small>15% Completed</small>
                                </div>
                                <div class="pad-btm">
                                    <p class="text-semibold text-main">Database</p>
                                    <div class="progress progress-sm">
                                        <div class="progress-bar progress-bar-success" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" style="width: 70%;" role="progressbar">
                                            <span class="sr-only">70%</span>
                                        </div>
                                    </div>
                                    <small>70% Completed</small>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class='col-lg-4'>
                        <div class="panel panel-trans">
                            <div class="pad-all">
                                <div class="media mar-btm">
                                    <div class="media-left">
                                        <img src="${basePath}/static/img/profile-photos/2.png" class="img-md img-circle" alt="Avatar">
                                    </div>
                                    <div class="media-body">
                                        <p class="text-lg text-main text-semibold mar-no">Ralph West</p>
                                        <p>Project manager</p>
                                    </div>
                                </div>
                                <blockquote class="bq-sm bq-open bq-close">Lorem ipsum dolor sit amet, consecte tuer adipiscing elit, sed diam nonummy nibh euismod tincidunt.</blockquote>
                            </div>

                            <div class="bord-top">
                                <ul class="list-group bg-trans bord-no">
                                    <li class="list-group-item list-item-sm">
                                        <div class="media-left">
                                            <i class="demo-psi-facebook icon-lg"></i>
                                        </div>
                                        <div class="media-body">
                                            <a href="#" class="btn-link text-semibold">Facebook</a>
                                        </div>
                                    </li>
                                    <li class="list-group-item list-item-sm">
                                        <div class="media-left">
                                            <i class="demo-psi-twitter icon-lg"></i>
                                        </div>
                                        <div class="media-body">
                                            <a href="#" class="btn-link text-semibold">@RalphWe</a>
                                            <br>
                                            Design my themes with <a href="#" class="btn-link text-bold">#Bootstrap</a> Lorem ipsum dolor sit amet, consectetuer adipiscing elit.
                                        </div>
                                    </li>
                                    <li class="list-group-item list-item-sm">
                                        <div class="media-left">
                                            <i class="demo-psi-instagram icon-lg"></i>
                                        </div>
                                        <div class="media-body">
                                            <a href="#" class="btn-link text-semibold">Ralphz</a>
                                        </div>
                                    </li>
                                    <li class="list-group-item list-item-sm">
                                        <div class="media-body">

                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-xs-12">
                        <div class="panel">
                            <div class="panel-heading">
                                <h3 class="panel-title">Order Status</h3>
                            </div>

                            <!--Data Table-->
                            <!--===================================================-->
                            <div class="panel-body">
                                <div class="pad-btm form-inline">
                                    <div class="row">
                                        <div class="col-sm-6 table-toolbar-left">
                                            <button class="btn btn-purple"><i class="demo-pli-add icon-fw"></i>Add</button>
                                            <button class="btn btn-default"><i class="demo-pli-printer"></i></button>
                                            <div class="btn-group">
                                                <button class="btn btn-default"><i class="demo-pli-information"></i></button>
                                                <button class="btn btn-default"><i class="demo-pli-recycling"></i></button>
                                            </div>
                                        </div>
                                        <div class="col-sm-6 table-toolbar-right">
                                            <div class="form-group">
                                                <input type="text" autocomplete="off" class="form-control" placeholder="Search" id="demo-input-search2">
                                            </div>
                                            <div class="btn-group">
                                                <button class="btn btn-default"><i class="demo-pli-download-from-cloud"></i></button>
                                                <div class="btn-group">
                                                    <button class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                                                        <i class="demo-pli-gear"></i>
                                                        <span class="caret"></span>
                                                    </button>
                                                    <ul class="dropdown-menu dropdown-menu-right" role="menu">
                                                        <li><a href="#">Action</a></li>
                                                        <li><a href="#">Another action</a></li>
                                                        <li><a href="#">Something else here</a></li>
                                                        <li class="divider"></li>
                                                        <li><a href="#">Separated link</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="table-responsive">
                                    <table class="table table-striped">
                                        <thead>
                                        <tr>
                                            <th>Invoice</th>
                                            <th>User</th>
                                            <th>Order date</th>
                                            <th>Amount</th>
                                            <th class="text-center">Status</th>
                                            <th class="text-center">Tracking Number</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td><a href="#" class="btn-link"> Order #53431</a></td>
                                            <td>Steve N. Horton</td>
                                            <td><span class="text-muted"><i class="fa fa-clock-o"></i> Oct 22, 2014</span></td>
                                            <td>$45.00</td>
                                            <td class="text-center">
                                                <div class="label label-table label-success">Paid</div>
                                            </td>
                                            <td class="text-center">-</td>
                                        </tr>
                                        <tr>
                                            <td><a href="#" class="btn-link"> Order #53432</a></td>
                                            <td>Charles S Boyle</td>
                                            <td><span class="text-muted"><i class="fa fa-clock-o"></i> Oct 24, 2014</span></td>
                                            <td>$245.30</td>
                                            <td class="text-center">
                                                <div class="label label-table label-info">Shipped</div>
                                            </td>
                                            <td class="text-center"><i class="fa fa-plane"></i> CGX0089734531</td>
                                        </tr>
                                        <tr>
                                            <td><a href="#" class="btn-link"> Order #53433</a></td>
                                            <td>Lucy Doe</td>
                                            <td><span class="text-muted"><i class="fa fa-clock-o"></i> Oct 24, 2014</span></td>
                                            <td>$38.00</td>
                                            <td class="text-center">
                                                <div class="label label-table label-info">Shipped</div>
                                            </td>
                                            <td class="text-center"><i class="fa fa-plane"></i> CGX0089934571</td>
                                        </tr>
                                        <tr>
                                            <td><a href="#" class="btn-link"> Order #53434</a></td>
                                            <td>Teresa L. Doe</td>
                                            <td><span class="text-muted"><i class="fa fa-clock-o"></i> Oct 15, 2014</span></td>
                                            <td>$77.99</td>
                                            <td class="text-center">
                                                <div class="label label-table label-info">Shipped</div>
                                            </td>
                                            <td class="text-center"><i class="fa fa-plane"></i> CGX0089734574</td>
                                        </tr>
                                        <tr>
                                            <td><a href="#" class="btn-link"> Order #53435</a></td>
                                            <td>Teresa L. Doe</td>
                                            <td><span class="text-muted"><i class="fa fa-clock-o"></i> Oct 12, 2014</span></td>
                                            <td>$18.00</td>
                                            <td class="text-center">
                                                <div class="label label-table label-success">Paid</div>
                                            </td>
                                            <td class="text-center">-</td>
                                        </tr>
                                        <tr>
                                            <td><a href="#" class="btn-link">Order #53437</a></td>
                                            <td>Charles S Boyle</td>
                                            <td><span class="text-muted"><i class="fa fa-clock-o"></i> Oct 17, 2014</span></td>
                                            <td>$658.00</td>
                                            <td class="text-center">
                                                <div class="label label-table label-danger">Refunded</div>
                                            </td>
                                            <td class="text-center">-</td>
                                        </tr>
                                        <tr>
                                            <td><a href="#" class="btn-link">Order #536584</a></td>
                                            <td>Scott S. Calabrese</td>
                                            <td><span class="text-muted"><i class="fa fa-clock-o"></i> Oct 19, 2014</span></td>
                                            <td>$45.58</td>
                                            <td class="text-center">
                                                <div class="label label-table label-warning">Unpaid</div>
                                            </td>
                                            <td class="text-center">-</td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <hr>
                                <div class="pull-right">
                                    <ul class="pagination text-nowrap mar-no">
                                        <li class="page-pre disabled">
                                            <a href="#">&lt;</a>
                                        </li>
                                        <li class="page-number active">
                                            <span>1</span>
                                        </li>
                                        <li class="page-number">
                                            <a href="#">2</a>
                                        </li>
                                        <li class="page-number">
                                            <a href="#">3</a>
                                        </li>
                                        <li>
                                            <span>...</span>
                                        </li>
                                        <li class="page-number">
                                            <a href="#">9</a>
                                        </li>
                                        <li class="page-next">
                                            <a href="#">&gt;</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <!--===================================================-->
                            <!--End Data Table-->

                        </div>
                    </div>
                </div>



            </div>--%>
            <!--===================================================-->
            <!--End page content-->
           <iframe src="/user/mainContext.shtml"   name="mainFrame" id="mainFrame" frameborder="0" marginheight="0" marginwidth="0"  width="100%"></iframe>
            <script type="application/javascript">

                function setIframeHeight(iframe) {
                    if (iframe) {
                        var iframeWin = iframe.contentWindow || iframe.contentDocument.parentWindow;
                        if (iframeWin.document.body) {
                            iframe.height = iframeWin.document.documentElement.scrollHeight || iframeWin.document.body.scrollHeight;
                        }
                    }
                };

                window.onload = function () {
                    setIframeHeight(document.getElementById('mainFrame'));
                };
            </script>
        </div>
        <!--===================================================-->
        <!--END CONTENT CONTAINER-->



        <!--ASIDE-->
        <!--===================================================-->
        <aside id="aside-container">
            <div id="aside">
                <div class="nano">
                    <div class="nano-content">

                        <!--Nav tabs-->
                        <!--================================-->
                        <ul class="nav nav-tabs nav-justified">
                            <li class="active">
                                <a href="#demo-asd-tab-1" data-toggle="tab">
                                    <i class="demo-pli-speech-bubble-7"></i>
                                </a>
                            </li>
                            <li>
                                <a href="#demo-asd-tab-2" data-toggle="tab">
                                    <i class="demo-pli-information icon-fw"></i> Report
                                </a>
                            </li>
                            <li>
                                <a href="#demo-asd-tab-3" data-toggle="tab">
                                    <i class="demo-pli-wrench icon-fw"></i> Settings
                                </a>
                            </li>
                        </ul>
                        <!--================================-->
                        <!--End nav tabs-->



                        <!-- Tabs Content -->
                        <!--================================-->
                        <div class="tab-content">

                            <!--First tab (Contact list)-->
                            <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                            <div class="tab-pane fade in active" id="demo-asd-tab-1">
                                <p class="pad-hor mar-top text-semibold text-main">
                                    <span class="pull-right badge badge-warning">3</span> Family
                                </p>

                                <!--Family-->
                                <div class="list-group bg-trans">
                                    <a href="#" class="list-group-item">
                                        <div class="media-left pos-rel">
                                            <img class="img-circle img-xs" src="${basePath}/static/img/profile-photos/2.png" alt="Profile Picture">
                                            <i class="badge badge-success badge-stat badge-icon pull-left"></i>
                                        </div>
                                        <div class="media-body">
                                            <p class="mar-no">Stephen Tran</p>
                                            <small class="text-muted">Availabe</small>
                                        </div>
                                    </a>
                                    <a href="#" class="list-group-item">
                                        <div class="media-left pos-rel">
                                            <img class="img-circle img-xs" src="${basePath}/static/img/profile-photos/7.png" alt="Profile Picture">
                                        </div>
                                        <div class="media-body">
                                            <p class="mar-no">Brittany Meyer</p>
                                            <small class="text-muted">I think so</small>
                                        </div>
                                    </a>
                                    <a href="#" class="list-group-item">
                                        <div class="media-left pos-rel">
                                            <img class="img-circle img-xs" src="${basePath}/static/img/profile-photos/1.png" alt="Profile Picture">
                                            <i class="badge badge-info badge-stat badge-icon pull-left"></i>
                                        </div>
                                        <div class="media-body">
                                            <p class="mar-no">Jack George</p>
                                            <small class="text-muted">Last Seen 2 hours ago</small>
                                        </div>
                                    </a>
                                    <a href="#" class="list-group-item">
                                        <div class="media-left pos-rel">
                                            <img class="img-circle img-xs" src="${basePath}/static/img/profile-photos/4.png" alt="Profile Picture">
                                        </div>
                                        <div class="media-body">
                                            <p class="mar-no">Donald Brown</p>
                                            <small class="text-muted">Lorem ipsum dolor sit amet.</small>
                                        </div>
                                    </a>
                                    <a href="#" class="list-group-item">
                                        <div class="media-left pos-rel">
                                            <img class="img-circle img-xs" src="${basePath}/static/img/profile-photos/8.png" alt="Profile Picture">
                                            <i class="badge badge-warning badge-stat badge-icon pull-left"></i>
                                        </div>
                                        <div class="media-body">
                                            <p class="mar-no">Betty Murphy</p>
                                            <small class="text-muted">Idle</small>
                                        </div>
                                    </a>
                                    <a href="#" class="list-group-item">
                                        <div class="media-left pos-rel">
                                            <img class="img-circle img-xs" src="${basePath}/static/img/profile-photos/9.png" alt="Profile Picture">
                                            <i class="badge badge-danger badge-stat badge-icon pull-left"></i>
                                        </div>
                                        <div class="media-body">
                                            <p class="mar-no">Samantha Reid</p>
                                            <small class="text-muted">Offline</small>
                                        </div>
                                    </a>
                                </div>

                                <hr>
                                <p class="pad-hor text-semibold text-main">
                                    <span class="pull-right badge badge-success">Offline</span> Friends
                                </p>

                                <!--Works-->
                                <div class="list-group bg-trans">
                                    <a href="#" class="list-group-item">
                                        <span class="badge badge-purple badge-icon badge-fw pull-left"></span> Joey K. Greyson
                                    </a>
                                    <a href="#" class="list-group-item">
                                        <span class="badge badge-info badge-icon badge-fw pull-left"></span> Andrea Branden
                                    </a>
                                    <a href="#" class="list-group-item">
                                        <span class="badge badge-success badge-icon badge-fw pull-left"></span> Johny Juan
                                    </a>
                                    <a href="#" class="list-group-item">
                                        <span class="badge badge-danger badge-icon badge-fw pull-left"></span> Susan Sun
                                    </a>
                                </div>


                                <hr>
                                <p class="pad-hor mar-top text-semibold text-main">News</p>

                                <div class="pad-hor">
                                    <p class="text-muted">Lorem ipsum dolor sit amet, consectetuer
                                        <a data-title="45%" class="add-tooltip text-semibold" href="#">adipiscing elit</a>, sed diam nonummy nibh. Lorem ipsum dolor sit amet.
                                    </p>
                                    <small class="text-muted"><em>Last Update : Des 12, 2014</em></small>
                                </div>


                            </div>
                            <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                            <!--End first tab (Contact list)-->


                            <!--Second tab (Custom layout)-->
                            <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                            <div class="tab-pane fade" id="demo-asd-tab-2">

                                <!--Monthly billing-->
                                <div class="pad-all">
                                    <p class="text-semibold text-main">Billing &amp; reports</p>
                                    <p class="text-muted">Get <strong>$5.00</strong> off your next bill by making sure your full payment reaches us before August 5, 2016.</p>
                                </div>
                                <hr class="new-section-xs">
                                <div class="pad-all">
                                    <span class="text-semibold text-main">Amount Due On</span>
                                    <p class="text-muted text-sm">August 17, 2016</p>
                                    <p class="text-2x text-thin text-main">$83.09</p>
                                    <button class="btn btn-block btn-success mar-top">Pay Now</button>
                                </div>


                                <hr>

                                <p class="pad-hor text-semibold text-main">Additional Actions</p>

                                <!--Simple Menu-->
                                <div class="list-group bg-trans">
                                    <a href="#" class="list-group-item"><i class="demo-pli-information icon-lg icon-fw"></i> Service Information</a>
                                    <a href="#" class="list-group-item"><i class="demo-pli-mine icon-lg icon-fw"></i> Usage Profile</a>
                                    <a href="#" class="list-group-item"><span class="label label-info pull-right">New</span><i class="demo-pli-credit-card-2 icon-lg icon-fw"></i> Payment Options</a>
                                    <a href="#" class="list-group-item"><i class="demo-pli-support icon-lg icon-fw"></i> Message Center</a>
                                </div>


                                <hr>

                                <div class="text-center">
                                    <div><i class="demo-pli-old-telephone icon-3x"></i></div>
                                    Questions?
                                    <p class="text-lg text-semibold text-main"> (415) 234-53454 </p>
                                    <small><em>We are here 24/7</em></small>
                                </div>
                            </div>
                            <!--End second tab (Custom layout)-->
                            <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->


                            <!--Third tab (Settings)-->
                            <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                            <div class="tab-pane fade" id="demo-asd-tab-3">
                                <ul class="list-group bg-trans">
                                    <li class="pad-top list-header">
                                        <p class="text-semibold text-main mar-no">Account Settings</p>
                                    </li>
                                    <li class="list-group-item">
                                        <div class="pull-right">
                                            <input class="toggle-switch" id="demo-switch-1" type="checkbox" checked>
                                            <label for="demo-switch-1"></label>
                                        </div>
                                        <p class="mar-no">Show my personal status</p>
                                        <small class="text-muted">Lorem ipsum dolor sit amet, consectetuer adipiscing elit.</small>
                                    </li>
                                    <li class="list-group-item">
                                        <div class="pull-right">
                                            <input class="toggle-switch" id="demo-switch-2" type="checkbox" checked>
                                            <label for="demo-switch-2"></label>
                                        </div>
                                        <p class="mar-no">Show offline contact</p>
                                        <small class="text-muted">Aenean commodo ligula eget dolor. Aenean massa.</small>
                                    </li>
                                    <li class="list-group-item">
                                        <div class="pull-right">
                                            <input class="toggle-switch" id="demo-switch-3" type="checkbox">
                                            <label for="demo-switch-3"></label>
                                        </div>
                                        <p class="mar-no">Invisible mode </p>
                                        <small class="text-muted">Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. </small>
                                    </li>
                                </ul>


                                <hr>

                                <ul class="list-group pad-btm bg-trans">
                                    <li class="list-header"><p class="text-semibold text-main mar-no">Public Settings</p></li>
                                    <li class="list-group-item">
                                        <div class="pull-right">
                                            <input class="toggle-switch" id="demo-switch-4" type="checkbox" checked>
                                            <label for="demo-switch-4"></label>
                                        </div>
                                        Online status
                                    </li>
                                    <li class="list-group-item">
                                        <div class="pull-right">
                                            <input class="toggle-switch" id="demo-switch-5" type="checkbox" checked>
                                            <label for="demo-switch-5"></label>
                                        </div>
                                        Show offline contact
                                    </li>
                                    <li class="list-group-item">
                                        <div class="pull-right">
                                            <input class="toggle-switch" id="demo-switch-6" type="checkbox" checked>
                                            <label for="demo-switch-6"></label>
                                        </div>
                                        Show my device icon
                                    </li>
                                </ul>



                                <hr>

                                <p class="pad-hor text-semibold text-main mar-no">Task Progress</p>
                                <div class="pad-all">
                                    <p>Upgrade Progress</p>
                                    <div class="progress progress-sm">
                                        <div class="progress-bar progress-bar-success" style="width: 15%;"><span class="sr-only">15%</span></div>
                                    </div>
                                    <small class="text-muted">15% Completed</small>
                                </div>
                                <div class="pad-hor">
                                    <p>Database</p>
                                    <div class="progress progress-sm">
                                        <div class="progress-bar progress-bar-danger" style="width: 75%;"><span class="sr-only">75%</span></div>
                                    </div>
                                    <small class="text-muted">17/23 Database</small>
                                </div>

                            </div>
                            <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                            <!--Third tab (Settings)-->

                        </div>
                    </div>
                </div>
            </div>
        </aside>
        <!--===================================================-->
        <!--END ASIDE-->


        <!--MAIN NAVIGATION-->
        <!--===================================================-->
        <nav id="mainnav-container">
            <div id="mainnav">

                <!--Menu-->
                <!--================================-->
                <div id="mainnav-menu-wrap">
                    <div class="nano">
                        <div class="nano-content">

                            <!--Profile Widget-->
                            <!--================================-->
                            <div id="mainnav-profile" class="mainnav-profile">
                                <div class="profile-wrap">
                                    <div class="pad-btm">
                                        <span class="label label-success pull-right">New</span>
                                        <img class="img-circle img-sm img-border" src="${basePath}/static/img/profile-photos/1.png" alt="Profile Picture">
                                    </div>
                                    <a href="#profile-nav" class="box-block" data-toggle="collapse" aria-expanded="false">
                                            <span class="pull-right dropdown-toggle">
                                                <i class="dropdown-caret"></i>
                                            </span>
                                        <p class="mnp-name">Aaron Chavez</p>
                                        <span class="mnp-desc">aaron.cha@themeon.net</span>
                                    </a>
                                </div>
                                <div id="profile-nav" class="collapse list-group bg-trans">
                                    <a href="#" class="list-group-item">
                                        <i class="demo-pli-male icon-lg icon-fw"></i> View Profile
                                    </a>
                                    <a href="#" class="list-group-item">
                                        <i class="demo-pli-gear icon-lg icon-fw"></i> Settings
                                    </a>
                                    <a href="#" class="list-group-item">
                                        <i class="demo-pli-information icon-lg icon-fw"></i> Help
                                    </a>
                                    <a href="#" class="list-group-item">
                                        <i class="demo-pli-unlock icon-lg icon-fw"></i> Logout
                                    </a>
                                </div>
                            </div>


                            <!--Shortcut buttons-->
                            <!--================================-->
                            <div id="mainnav-shortcut">
                                <ul class="list-unstyled">
                                    <li class="col-xs-3" data-content="My Profile">
                                        <a class="shortcut-grid" href="#">
                                            <i class="demo-psi-male"></i>
                                        </a>
                                    </li>
                                    <li class="col-xs-3" data-content="Messages">
                                        <a class="shortcut-grid" href="#">
                                            <i class="demo-psi-speech-bubble-3"></i>
                                        </a>
                                    </li>
                                    <li class="col-xs-3" data-content="Activity">
                                        <a class="shortcut-grid" href="#">
                                            <i class="demo-psi-thunder"></i>
                                        </a>
                                    </li>
                                    <li class="col-xs-3" data-content="Lock Screen">
                                        <a class="shortcut-grid" href="#">
                                            <i class="demo-psi-lock-2"></i>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                            <!--================================-->
                            <!--End shortcut buttons-->


                            <ul id="mainnav-menu" class="list-group">

                                <!--Category name-->
                                <li class="list-header">Navigation</li>

                                <!--Menu list item-->
                                <li class="active-link">
                                    <a href="index.html">
                                        <i class="demo-psi-home"></i>
                                        <span class="menu-title">
												<strong>Dashboard</strong>
											</span>
                                    </a>
                                </li>

                                <!--Menu list item-->
                                <li>
                                    <a href="#">
                                        <i class="demo-psi-split-vertical-2"></i>
                                        <span class="menu-title">
												<strong>Layouts</strong>
											</span>
                                        <i class="arrow"></i>
                                    </a>

                                    <!--Submenu-->
                                    <ul class="collapse">
                                        <li><a href="layouts-collapsed-navigation.html">Collapsed Navigation</a></li>
                                        <li><a href="layouts-offcanvas-navigation.html">Off-Canvas Navigation</a></li>
                                        <li><a href="layouts-offcanvas-slide-in-navigation.html">Slide-in Navigation</a></li>
                                        <li><a href="layouts-offcanvas-revealing-navigation.html">Revealing Navigation</a></li>
                                        <li class="list-divider"></li>
                                        <li><a href="layouts-aside-right-side.html">Aside on the right side</a></li>
                                        <li><a href="layouts-aside-left-side.html">Aside on the left side</a></li>
                                        <li><a href="layouts-aside-dark-theme.html">Dark version of aside</a></li>
                                        <li class="list-divider"></li>
                                        <li><a href="layouts-fixed-navbar.html">Fixed Navbar</a></li>
                                        <li><a href="layouts-fixed-footer.html">Fixed Footer</a></li>

                                    </ul>
                                </li>

                                <!--Menu list item-->
                                <li>
                                    <a href="widgets.html">
                                        <i class="demo-psi-gear-2"></i>
                                        <span class="menu-title">
												<strong>Widgets</strong>
												<span class="pull-right badge badge-warning">24</span>
											</span>
                                    </a>
                                </li>

                                <li class="list-divider"></li>

                                <!--Category name-->
                                <li class="list-header">Components</li>

                                <!--Menu list item-->
                                <li>
                                    <a href="#">
                                        <i class="demo-psi-boot-2"></i>
                                        <span class="menu-title">UI Elements</span>
                                        <i class="arrow"></i>
                                    </a>

                                    <!--Submenu-->
                                    <ul class="collapse">
                                        <li><a href="ui-buttons.html">Buttons</a></li>
                                        <li><a href="ui-panels.html">Panels</a></li>
                                        <li><a href="ui-modals.html">Modals</a></li>
                                        <li><a href="ui-progress-bars.html">Progress bars</a></li>
                                        <li><a href="ui-components.html">Components</a></li>
                                        <li><a href="ui-typography.html">Typography</a></li>
                                        <li><a href="ui-list-group.html">List Group</a></li>
                                        <li><a href="ui-tabs-accordions.html">Tabs &amp; Accordions</a></li>
                                        <li><a href="ui-alerts-tooltips.html">Alerts &amp; Tooltips</a></li>

                                    </ul>
                                </li>

                                <!--Menu list item-->
                                <li>
                                    <a href="#">
                                        <i class="demo-psi-pen-5"></i>
                                        <span class="menu-title">Forms</span>
                                        <i class="arrow"></i>
                                    </a>

                                    <!--Submenu-->
                                    <ul class="collapse">
                                        <li><a href="forms-general.html">General</a></li>
                                        <li><a href="forms-components.html">Advanced Components</a></li>
                                        <li><a href="forms-validation.html">Validation</a></li>
                                        <li><a href="forms-wizard.html">Wizard</a></li>
                                        <li><a href="forms-file-upload.html">File Upload</a></li>
                                        <li><a href="forms-text-editor.html">Text Editor</a></li>
                                        <li><a href="forms-markdown.html">Markdown</a></li>

                                    </ul>
                                </li>

                                <!--Menu list item-->
                                <li>
                                    <a href="#">
                                        <i class="demo-psi-receipt-4"></i>
                                        <span class="menu-title">Tables</span>
                                        <i class="arrow"></i>
                                    </a>

                                    <!--Submenu-->
                                    <ul class="collapse">
                                        <li><a href="tables-static.html">Static Tables</a></li>
                                        <li><a href="tables-bootstrap.html">Bootstrap Tables</a></li>
                                        <li><a href="tables-datatable.html">Data Tables</a></li>
                                        <li><a href="tables-footable.html">Foo Tables</a></li>

                                    </ul>
                                </li>

                                <!--Menu list item-->
                                <li>
                                    <a href="charts.html">
                                        <i class="demo-psi-bar-chart"></i>
                                        <span class="menu-title">Charts</span>
                                    </a>
                                </li>

                                <li class="list-divider"></li>

                                <!--Category name-->
                                <li class="list-header">More</li>

                                <!--Menu list item-->
                                <li>
                                    <a href="#">
                                        <i class="demo-psi-repair"></i>
                                        <span class="menu-title">Miscellaneous</span>
                                        <i class="arrow"></i>
                                    </a>

                                    <!--Submenu-->
                                    <ul class="collapse">
                                        <li><a href="misc-timeline.html">Timeline</a></li>
                                        <li><a href="misc-calendar.html">Calendar</a></li>
                                        <li><a href="misc-maps.html">Google Maps</a></li>

                                    </ul>
                                </li>

                                <!--Menu list item-->
                                <li>
                                    <a href="#">
                                        <i class="demo-psi-mail"></i>
                                        <span class="menu-title">Email</span>
                                        <i class="arrow"></i>
                                    </a>

                                    <!--Submenu-->
                                    <ul class="collapse">
                                        <li><a href="mailbox.html">Inbox</a></li>
                                        <li><a href="mailbox-message.html">View Message</a></li>
                                        <li><a href="mailbox-compose.html">Compose Message</a></li>
                                        <li><a href="mailbox-templates.html">Email Templates<span class="label label-info pull-right">New</span></a></li>

                                    </ul>
                                </li>

                                <!--Menu list item-->
                                <li>
                                    <a href="#">
                                        <i class="demo-psi-file-html"></i>
                                        <span class="menu-title">Pages</span>
                                        <i class="arrow"></i>
                                    </a>

                                    <!--Submenu-->
                                    <ul class="collapse">
                                        <li><a href="pages-blank.html">Blank Page</a></li>
                                        <li><a href="pages-profile.html">Profile</a></li>
                                        <li><a href="pages-search-results.html">Search Results</a></li>
                                        <li><a href="pages-faq.html">FAQ</a></li>
                                        <li class="list-divider"></li>
                                        <li><a href="pages-404.html">404 Error</a></li>
                                        <li><a href="pages-500.html">500 Error</a></li>
                                        <li class="list-divider"></li>
                                        <li><a href="pages-login.html">Login</a></li>
                                        <li><a href="pages-register.html">Register</a></li>
                                        <li><a href="pages-password-reminder.html">Password Reminder</a></li>
                                        <li><a href="pages-lock-screen.html">Lock Screen</a></li>

                                    </ul>
                                </li>


                                <!--Menu list item-->
                                <li>
                                    <a href="#">
                                        <i class="demo-psi-tactic"></i>
                                        <span class="menu-title">Menu Level</span>
                                        <i class="arrow"></i>
                                    </a>

                                    <!--Submenu-->
                                    <ul class="collapse">
                                        <li><a href="#">Second Level Item</a></li>
                                        <li><a href="#">Second Level Item</a></li>
                                        <li><a href="#">Second Level Item</a></li>
                                        <li class="list-divider"></li>
                                        <li>
                                            <a href="#">Third Level<i class="arrow"></i></a>

                                            <!--Submenu-->
                                            <ul class="collapse">
                                                <li><a href="#">Third Level Item</a></li>
                                                <li><a href="#">Third Level Item</a></li>
                                                <li><a href="#">Third Level Item</a></li>
                                                <li><a href="#">Third Level Item</a></li>
                                            </ul>
                                        </li>
                                        <li>
                                            <a href="#">Third Level<i class="arrow"></i></a>

                                            <!--Submenu-->
                                            <ul class="collapse">
                                                <li><a href="#">Third Level Item</a></li>
                                                <li><a href="#">Third Level Item</a></li>
                                                <li><a href="#">Third Level Item</a></li>
                                                <li class="list-divider"></li>
                                                <li><a href="#">Third Level Item</a></li>
                                                <li><a href="#">Third Level Item</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </li>


                                <li class="list-divider"></li>

                                <!--Category name-->
                                <li class="list-header">Extras</li>

                                <!--Menu list item-->
                                <li>
                                    <a href="#">
                                        <i class="demo-psi-happy"></i>
                                        <span class="menu-title">Icons Pack</span>
                                        <i class="arrow"></i>
                                    </a>

                                    <!--Submenu-->
                                    <ul class="collapse">
                                        <li><a href="icons-ionicons.html">Ion Icons</a></li>
                                        <li><a href="icons-themify.html">Themify</a></li>
                                        <li><a href="icons-font-awesome.html">Font Awesome</a></li>

                                    </ul>
                                </li>

                                <!--Menu list item-->
                                <li>
                                    <a href="#">
                                        <i class="demo-psi-medal-2"></i>
                                        <span class="menu-title">
												PREMIUM ICONS
												<span class="label label-danger pull-right">BEST</span>
											</span>
                                    </a>

                                    <!--Submenu-->
                                    <ul class="collapse">
                                        <li><a href="premium-line-icons.html">Line Icons Pack</a></li>
                                        <li><a href="premium-solid-icons.html">Solid Icons Pack</a></li>

                                    </ul>
                                </li>

                                <!--Menu list item-->
                                <li>
                                    <a href="helper-classes.html">
                                        <i class="demo-psi-inbox-full"></i>
                                        <span class="menu-title">Helper Classes</span>
                                    </a>
                                </li>                                </ul>


                            <!--Widget-->
                            <!--================================-->
                            <div class="mainnav-widget">

                                <!-- Show the button on collapsed navigation -->
                                <div class="show-small">
                                    <a href="#" data-toggle="menu-widget" data-target="#demo-wg-server">
                                        <i class="demo-pli-monitor-2"></i>
                                    </a>
                                </div>

                                <!-- Hide the content on collapsed navigation -->
                                <div id="demo-wg-server" class="hide-small mainnav-widget-content">
                                    <ul class="list-group">
                                        <li class="list-header pad-no pad-ver">Server Status</li>
                                        <li class="mar-btm">
                                            <span class="label label-primary pull-right">15%</span>
                                            <p>CPU Usage</p>
                                            <div class="progress progress-sm">
                                                <div class="progress-bar progress-bar-primary" style="width: 15%;">
                                                    <span class="sr-only">15%</span>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="mar-btm">
                                            <span class="label label-purple pull-right">75%</span>
                                            <p>Bandwidth</p>
                                            <div class="progress progress-sm">
                                                <div class="progress-bar progress-bar-purple" style="width: 75%;">
                                                    <span class="sr-only">75%</span>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="pad-ver"><a href="#" class="btn btn-success btn-bock">View Details</a></li>
                                    </ul>
                                </div>
                            </div>
                            <!--================================-->
                            <!--End widget-->

                        </div>
                    </div>
                </div>
                <!--================================-->
                <!--End menu-->

            </div>
        </nav>
        <!--===================================================-->
        <!--END MAIN NAVIGATION-->

    </div>



    <!-- FOOTER -->
    <!--===================================================-->
    <footer id="footer">

        <!-- Visible when footer positions are fixed -->
        <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
        <div class="show-fixed pull-right">
            You have <a href="#" class="text-bold text-main"><span class="label label-danger">3</span> pending action.</a>
        </div>



        <!-- Visible when footer positions are static -->
        <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
        <div class="hide-fixed pull-right pad-rgt">
            14GB of <strong>512GB</strong> Free.
        </div>



        <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
        <!-- Remove the class "show-fixed" and "hide-fixed" to make the content always appears. -->
        <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->

        <p class="pad-lft">&#0169; 2016 Your Company</p>



    </footer>
    <!--===================================================-->
    <!-- END FOOTER -->


    <!-- SCROLL PAGE BUTTON -->
    <!--===================================================-->
    <button class="scroll-top btn">
        <i class="pci-chevron chevron-up"></i>
    </button>
    <!--===================================================-->



</div>
<!--===================================================-->
<!-- END OF CONTAINER -->



<!-- SETTINGS - DEMO PURPOSE ONLY -->
<!--===================================================-->
<div id="demo-set" class="demo-set">
    <div id="demo-set-body" class="demo-set-body collapse">
        <div id="demo-set-alert"></div>
        <div class="pad-hor bord-btm clearfix">
            <div class="pull-right pad-top">
                <button id="demo-btn-close-settings" class="btn btn-trans">
                    <i class="pci-cross pci-circle icon-lg"></i>
                </button>
            </div>
            <div class="media">
                <div class="media-left">
                    <i class="demo-pli-gear icon-2x"></i>
                </div>
                <div class="media-body">
                    <span class="text-semibold text-lg text-main">Costomize</span>
                    <p class="text-muted text-sm">Customize Nifty's layout, sidebars, and color schemes.</p>
                </div>
            </div>
        </div>
        <div class="demo-set-content clearfix">
            <div class="col-xs-6 col-md-3">
                <div class="pad-all bg-gray-light">
                    <p class="text-semibold text-main text-lg">Layout</p>
                    <p class="text-semibold text-main">Boxed Layout</p>
                    <div class="pad-btm">
                        <div class="pull-right">
                            <input id="demo-box-lay" class="toggle-switch" type="checkbox">
                            <label for="demo-box-lay"></label>
                        </div>
                        Boxed Layout
                    </div>
                    <div class="pad-btm">
                        <div class="pull-right">
                            <button id="demo-box-img" class="btn btn-sm btn-trans" disabled><i class="pci-hor-dots"></i></button>
                        </div>
                        Background Images <span class="label label-primary">New</span>
                    </div>

                    <hr class="new-section-xs bord-no">
                    <p class="text-semibold text-main">Animations</p>
                    <div class="pad-btm">
                        <div class="pull-right">
                            <input id="demo-anim" class="toggle-switch" type="checkbox" checked>
                            <label for="demo-anim"></label>
                        </div>
                        Enable Animations
                    </div>
                    <div class="pad-btm">
                        <div class="select pull-right">
                            <select id="demo-ease">
                                <option value="effect" selected>ease (Default)</option>
                                <option value="easeInQuart">easeInQuart</option>
                                <option value="easeOutQuart">easeOutQuart</option>
                                <option value="easeInBack">easeInBack</option>
                                <option value="easeOutBack">easeOutBack</option>
                                <option value="easeInOutBack">easeInOutBack</option>
                                <option value="steps">Steps</option>
                                <option value="jumping">Jumping</option>
                                <option value="rubber">Rubber</option>
                            </select>
                        </div>
                        Transitions
                    </div>

                    <hr class="new-section-xs bord-no">

                    <p class="text-semibold text-main text-lg">Header / Navbar</p>
                    <div>
                        <div class="pull-right">
                            <input id="demo-navbar-fixed" class="toggle-switch" type="checkbox">
                            <label for="demo-navbar-fixed"></label>
                        </div>
                        Fixed Position
                    </div>

                    <hr class="new-section-xs bord-no">

                    <p class="text-semibold text-main text-lg">Footer</p>
                    <div class="pad-btm">
                        <div class="pull-right">
                            <input id="demo-footer-fixed" class="toggle-switch" type="checkbox">
                            <label for="demo-footer-fixed"></label>
                        </div>
                        Fixed Position
                    </div>
                </div>
            </div>
            <div class="col-lg-9 pos-rel">
                <div class="row">
                    <div class="col-lg-4">
                        <div class="pad-all">
                            <p class="text-semibold text-main text-lg">Sidebars</p>
                            <p class="text-semibold text-main">Navigation</p>
                            <div class="mar-btm">
                                <div class="pull-right">
                                    <input id="demo-nav-fixed" class="toggle-switch" type="checkbox">
                                    <label for="demo-nav-fixed"></label>
                                </div>
                                Fixed Position
                            </div>
                            <div class="mar-btm">
                                <div class="pull-right">
                                    <input id="demo-nav-profile" class="toggle-switch" type="checkbox" checked>
                                    <label for="demo-nav-profile"></label>
                                </div>
                                Widget Profil <small class="label label-primary">New</small>
                            </div>
                            <div class="mar-btm">
                                <div class="pull-right">
                                    <input id="demo-nav-shortcut" class="toggle-switch" type="checkbox" checked>
                                    <label for="demo-nav-shortcut"></label>
                                </div>
                                Shortcut Buttons
                            </div>
                            <div class="mar-btm">
                                <div class="pull-right">
                                    <input id="demo-nav-coll" class="toggle-switch" type="checkbox">
                                    <label for="demo-nav-coll"></label>
                                </div>
                                Collapsed Mode
                            </div>

                            <div class="clearfix">
                                <div class="select pad-btm pull-right">
                                    <select id="demo-nav-offcanvas">
                                        <option value="none" selected disabled="disabled">-- Select Mode --</option>
                                        <option value="push">Push</option>
                                        <option value="slide">Slide in on top</option>
                                        <option value="reveal">Reveal</option>
                                    </select>
                                </div>
                                Off-Canvas
                            </div>

                            <p class="text-semibold text-main">Aside</p>
                            <div class="mar-btm">
                                <div class="pull-right">
                                    <input id="demo-asd-vis" class="toggle-switch" type="checkbox">
                                    <label for="demo-asd-vis"></label>
                                </div>
                                Visible
                            </div>
                            <div class="mar-btm">
                                <div class="pull-right">
                                    <input id="demo-asd-fixed" class="toggle-switch" type="checkbox" checked>
                                    <label for="demo-asd-fixed"></label>
                                </div>
                                Fixed Position
                            </div>
                            <div class="mar-btm">
                                <div class="pull-right">
                                    <input id="demo-asd-float" class="toggle-switch" type="checkbox" checked>
                                    <label for="demo-asd-float"></label>
                                </div>
                                Floating <span class="label label-primary">New</span>
                            </div>
                            <div class="mar-btm">
                                <div class="pull-right">
                                    <input id="demo-asd-align" class="toggle-switch" type="checkbox">
                                    <label for="demo-asd-align"></label>
                                </div>
                                Left Side
                            </div>
                            <div>
                                <div class="pull-right">
                                    <input id="demo-asd-themes" class="toggle-switch" type="checkbox">
                                    <label for="demo-asd-themes"></label>
                                </div>
                                Dark Version
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-8">
                        <div id="demo-theme">
                            <div class="row bg-gray-light pad-top">
                                <p class="text-semibold text-main text-lg pad-lft">Color Schemes</p>
                                <div class="demo-theme-btn col-md-4 pad-ver">
                                    <p class="text-semibold text-main">Header</p>
                                    <div class="demo-justify-theme">
                                        <a href="#" class="demo-theme demo-a-light add-tooltip" data-theme="theme-light" data-type="a" data-title="(A). Light">
                                            <div class="demo-theme-brand"></div>
                                            <div class="demo-theme-head"></div>
                                            <div class="demo-theme-nav"></div>
                                        </a>
                                        <a href="#" class="demo-theme demo-a-navy add-tooltip" data-theme="theme-navy" data-type="a" data-title="(A). Navy Blue">
                                            <div class="demo-theme-brand"></div>
                                            <div class="demo-theme-head"></div>
                                            <div class="demo-theme-nav"></div>
                                        </a>
                                        <a href="#" class="demo-theme demo-a-ocean add-tooltip" data-theme="theme-ocean" data-type="a" data-title="(A). Ocean">
                                            <div class="demo-theme-brand"></div>
                                            <div class="demo-theme-head"></div>
                                            <div class="demo-theme-nav"></div>
                                        </a>
                                    </div>
                                    <div class="demo-justify-theme">
                                        <a href="#" class="demo-theme demo-a-lime add-tooltip" data-theme="theme-lime" data-type="a" data-title="(A). Lime">
                                            <div class="demo-theme-brand"></div>
                                            <div class="demo-theme-head"></div>
                                            <div class="demo-theme-nav"></div>
                                        </a>
                                        <a href="#" class="demo-theme demo-a-purple add-tooltip" data-theme="theme-purple" data-type="a" data-title="(A). Purple">
                                            <div class="demo-theme-brand"></div>
                                            <div class="demo-theme-head"></div>
                                            <div class="demo-theme-nav"></div>
                                        </a>
                                        <a href="#" class="demo-theme demo-a-dust add-tooltip" data-theme="theme-dust" data-type="a" data-title="(A). Dust">
                                            <div class="demo-theme-brand"></div>
                                            <div class="demo-theme-head"></div>
                                            <div class="demo-theme-nav"></div>
                                        </a>
                                    </div>
                                    <div class="demo-justify-theme">
                                        <a href="#" class="demo-theme demo-a-mint add-tooltip" data-theme="theme-mint" data-type="a" data-title="(A). Mint">
                                            <div class="demo-theme-brand"></div>
                                            <div class="demo-theme-head"></div>
                                            <div class="demo-theme-nav"></div>
                                        </a>
                                        <a href="#" class="demo-theme demo-a-yellow add-tooltip" data-theme="theme-yellow" data-type="a" data-title="(A). Yellow">
                                            <div class="demo-theme-brand"></div>
                                            <div class="demo-theme-head"></div>
                                            <div class="demo-theme-nav"></div>
                                        </a>
                                        <a href="#" class="demo-theme demo-a-well-red add-tooltip" data-theme="theme-well-red" data-type="a" data-title="(A). Well Red">
                                            <div class="demo-theme-brand"></div>
                                            <div class="demo-theme-head"></div>
                                            <div class="demo-theme-nav"></div>
                                        </a>
                                    </div>
                                    <div class="demo-justify-theme">
                                        <a href="#" class="demo-theme demo-a-coffee add-tooltip" data-theme="theme-coffee" data-type="a" data-title="(A). Coffee">
                                            <div class="demo-theme-brand"></div>
                                            <div class="demo-theme-head"></div>
                                            <div class="demo-theme-nav"></div>
                                        </a>
                                        <a href="#" class="demo-theme demo-a-prickly-pear add-tooltip" data-theme="theme-prickly-pear" data-type="a" data-title="(A). Prickly pear">
                                            <div class="demo-theme-brand"></div>
                                            <div class="demo-theme-head"></div>
                                            <div class="demo-theme-nav"></div>
                                        </a>
                                        <a href="#" class="demo-theme demo-a-dark add-tooltip" data-theme="theme-dark" data-type="a" data-title="(A). Dark">
                                            <div class="demo-theme-brand"></div>
                                            <div class="demo-theme-head"></div>
                                            <div class="demo-theme-nav"></div>
                                        </a>
                                    </div>
                                </div>
                                <div class="demo-theme-btn col-md-4 pad-ver">
                                    <p class="text-semibold text-main">Brand</p>
                                    <div class="demo-justify-theme">
                                        <a href="#" class="demo-theme demo-b-light add-tooltip" data-theme="theme-light" data-type="b" data-title="(B). Light">
                                            <div class="demo-theme-brand"></div>
                                            <div class="demo-theme-head"></div>
                                            <div class="demo-theme-nav"></div>
                                        </a>
                                        <a href="#" class="demo-theme demo-b-navy add-tooltip" data-theme="theme-navy" data-type="b" data-title="(B). Navy Blue">
                                            <div class="demo-theme-brand"></div>
                                            <div class="demo-theme-head"></div>
                                            <div class="demo-theme-nav"></div>
                                        </a>
                                        <a href="#" class="demo-theme demo-b-ocean add-tooltip" data-theme="theme-ocean" data-type="b" data-title="(B). Ocean">
                                            <div class="demo-theme-brand"></div>
                                            <div class="demo-theme-head"></div>
                                            <div class="demo-theme-nav"></div>
                                        </a>
                                    </div>
                                    <div class="demo-justify-theme">
                                        <a href="#" class="demo-theme demo-b-lime add-tooltip" data-theme="theme-lime" data-type="b" data-title="(B). Lime">
                                            <div class="demo-theme-brand"></div>
                                            <div class="demo-theme-head"></div>
                                            <div class="demo-theme-nav"></div>
                                        </a>
                                        <a href="#" class="demo-theme demo-b-purple add-tooltip" data-theme="theme-purple" data-type="b" data-title="(B). Purple">
                                            <div class="demo-theme-brand"></div>
                                            <div class="demo-theme-head"></div>
                                            <div class="demo-theme-nav"></div>
                                        </a>
                                        <a href="#" class="demo-theme demo-b-dust add-tooltip" data-theme="theme-dust" data-type="b" data-title="(B). Dust">
                                            <div class="demo-theme-brand"></div>
                                            <div class="demo-theme-head"></div>
                                            <div class="demo-theme-nav"></div>
                                        </a>
                                    </div>
                                    <div class="demo-justify-theme">
                                        <a href="#" class="demo-theme demo-b-mint add-tooltip" data-theme="theme-mint" data-type="b" data-title="(B). Mint">
                                            <div class="demo-theme-brand"></div>
                                            <div class="demo-theme-head"></div>
                                            <div class="demo-theme-nav"></div>
                                        </a>
                                        <a href="#" class="demo-theme demo-b-yellow add-tooltip" data-theme="theme-yellow" data-type="b" data-title="(B). Yellow">
                                            <div class="demo-theme-brand"></div>
                                            <div class="demo-theme-head"></div>
                                            <div class="demo-theme-nav"></div>
                                        </a>
                                        <a href="#" class="demo-theme demo-b-well-red add-tooltip" data-theme="theme-well-red" data-type="b" data-title="(B). Well red">
                                            <div class="demo-theme-brand"></div>
                                            <div class="demo-theme-head"></div>
                                            <div class="demo-theme-nav"></div>
                                        </a>
                                    </div>
                                    <div class="demo-justify-theme">
                                        <a href="#" class="demo-theme demo-b-coffee add-tooltip" data-theme="theme-coffee" data-type="b" data-title="(B). Coofee">
                                            <div class="demo-theme-brand"></div>
                                            <div class="demo-theme-head"></div>
                                            <div class="demo-theme-nav"></div>
                                        </a>
                                        <a href="#" class="demo-theme demo-b-prickly-pear add-tooltip" data-theme="theme-prickly-pear" data-type="b" data-title="(B). Prickly pear">
                                            <div class="demo-theme-brand"></div>
                                            <div class="demo-theme-head"></div>
                                            <div class="demo-theme-nav"></div>
                                        </a>
                                        <a href="#" class="demo-theme demo-b-dark add-tooltip" data-theme="theme-dark" data-type="b" data-title="(B). Dark">
                                            <div class="demo-theme-brand"></div>
                                            <div class="demo-theme-head"></div>
                                            <div class="demo-theme-nav"></div>
                                        </a>
                                    </div>
                                </div>
                                <div class="demo-theme-btn col-md-4 pad-ver">
                                    <p class="text-semibold text-main">Navigation</p>
                                    <div class="demo-justify-theme">
                                        <a href="#" class="demo-theme demo-c-light add-tooltip" data-theme="theme-light" data-type="c" data-title="(C). Light">
                                            <div class="demo-theme-brand"></div>
                                            <div class="demo-theme-head"></div>
                                            <div class="demo-theme-nav"></div>
                                        </a>
                                        <a href="#" class="demo-theme demo-c-navy add-tooltip" data-theme="theme-navy" data-type="c" data-title="(C). Navy Blue">
                                            <div class="demo-theme-brand"></div>
                                            <div class="demo-theme-head"></div>
                                            <div class="demo-theme-nav"></div>
                                        </a>
                                        <a href="#" class="demo-theme demo-c-ocean add-tooltip" data-theme="theme-ocean" data-type="c" data-title="(C). Ocean">
                                            <div class="demo-theme-brand"></div>
                                            <div class="demo-theme-head"></div>
                                            <div class="demo-theme-nav"></div>
                                        </a>
                                    </div>
                                    <div class="demo-justify-theme">
                                        <a href="#" class="demo-theme demo-c-lime add-tooltip" data-theme="theme-lime" data-type="c" data-title="(C). Lime">
                                            <div class="demo-theme-brand"></div>
                                            <div class="demo-theme-head"></div>
                                            <div class="demo-theme-nav"></div>
                                        </a>
                                        <a href="#" class="demo-theme demo-c-purple add-tooltip" data-theme="theme-purple" data-type="c" data-title="(C). Purple">
                                            <div class="demo-theme-brand"></div>
                                            <div class="demo-theme-head"></div>
                                            <div class="demo-theme-nav"></div>
                                        </a>
                                        <a href="#" class="demo-theme demo-c-dust add-tooltip" data-theme="theme-dust" data-type="c" data-title="(C). Dust">
                                            <div class="demo-theme-brand"></div>
                                            <div class="demo-theme-head"></div>
                                            <div class="demo-theme-nav"></div>
                                        </a>
                                    </div>
                                    <div class="demo-justify-theme">
                                        <a href="#" class="demo-theme demo-c-mint add-tooltip" data-theme="theme-mint" data-type="c" data-title="(C). Mint">
                                            <div class="demo-theme-brand"></div>
                                            <div class="demo-theme-head"></div>
                                            <div class="demo-theme-nav"></div>
                                        </a>
                                        <a href="#" class="demo-theme demo-c-yellow add-tooltip" data-theme="theme-yellow" data-type="c" data-title="(C). Yellow">
                                            <div class="demo-theme-brand"></div>
                                            <div class="demo-theme-head"></div>
                                            <div class="demo-theme-nav"></div>
                                        </a>
                                        <a href="#" class="demo-theme demo-c-well-red add-tooltip" data-theme="theme-well-red" data-type="c" data-title="(C). Well Red">
                                            <div class="demo-theme-brand"></div>
                                            <div class="demo-theme-head"></div>
                                            <div class="demo-theme-nav"></div>
                                        </a>
                                    </div>
                                    <div class="demo-justify-theme">
                                        <a href="#" class="demo-theme demo-c-coffee add-tooltip" data-theme="theme-coffee" data-type="c" data-title="(C). Coffee">
                                            <div class="demo-theme-brand"></div>
                                            <div class="demo-theme-head"></div>
                                            <div class="demo-theme-nav"></div>
                                        </a>
                                        <a href="#" class="demo-theme demo-c-prickly-pear add-tooltip" data-theme="theme-prickly-pear" data-type="c" data-title="(C). Prickly pear">
                                            <div class="demo-theme-brand"></div>
                                            <div class="demo-theme-head"></div>
                                            <div class="demo-theme-nav"></div>
                                        </a>
                                        <a href="#" class="demo-theme demo-c-dark add-tooltip" data-theme="theme-dark" data-type="c" data-title="(C). Dark">
                                            <div class="demo-theme-brand"></div>
                                            <div class="demo-theme-head"></div>
                                            <div class="demo-theme-nav"></div>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="demo-bg-boxed" class="demo-bg-boxed">
                    <div class="demo-bg-boxed-content">
                        <p class="text-semibold text-main text-lg mar-no">Background Images</p>
                        <p class="text-sm text-muted">Add an image to replace the solid background color</p>
                        <div class="row">
                            <div class="col-lg-4 text-justify">
                                <p class="text-semibold text-main">Blurred</p>
                                <div id="demo-blurred-bg" class="text-justify">
                                    <!--Blurred Backgrounds-->
                                </div>
                            </div>
                            <div class="col-lg-4 text-justify">
                                <p class="text-semibold text-main">Polygon &amp; Geometric</p>
                                <div id="demo-polygon-bg" class="text-justify">
                                    <!--Polygon Backgrounds-->
                                </div>
                            </div>
                            <div class="col-lg-4 text-justify">
                                <p class="text-semibold text-main">Abstract</p>
                                <div id="demo-abstract-bg" class="text-justify">
                                    <!--Abstract Backgrounds-->
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="demo-bg-boxed-footer">
                        <button id="demo-close-boxed-img" class="btn btn-primary">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <button id="demo-set-btn" class="btn" data-toggle="collapse" data-target="#demo-set-body"><i class="demo-psi-gear icon-lg"></i></button>
</div>
<!--===================================================-->
<!-- END SETTINGS -->


</body>
</html>

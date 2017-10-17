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
    <title>Login page | Nifty - Admin Template</title>
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700' rel='stylesheet' type='text/css'>
    <link href="${basePath}/static/css/bootstrap.min.css" rel="stylesheet">
    <link href="${basePath}/static/css/nifty.min.css" rel="stylesheet">
    <link href="${basePath}/static/css/demo/nifty-demo-icons.min.css" rel="stylesheet">
    <link href="${basePath}/static/css/demo/nifty-demo.min.css" rel="stylesheet">
    <link href="${basePath}/static/plugins/magic-check/css/magic-check.min.css" rel="stylesheet">
    <link href="${basePath}/static/plugins/pace/pace.min.css" rel="stylesheet">
    <script src="${basePath}/static/plugins/pace/pace.min.js"></script>
    <script src="${basePath}/static/js/jquery-2.2.4.min.js"></script>
    <script src="${basePath}/static/js/bootstrap.min.js"></script>
    <script src="${basePath}/static/js/nifty.min.js"></script>
    <script src="${basePath}/static/js/demo/bg-images.js"></script>
        
	<script type="application/javascript">
		$(function(){
            //登录操作
            $('#login').click(function(){

                var username = $("input[name='username']").val();
                var password = $("input[name='password']").val();
                if(username == '') {
                    $('.error').fadeOut('fast', function(){
                        $('.error').css('top', '27px').show();
                    });
                    $('.error').fadeIn('fast', function(){
                        $('.username').focus();
                    });
                    return false;
                }
                if(password == '') {
                    $('.error').fadeOut('fast', function(){
                        $('.error').css('top', '96px').show();
                    });
                    $(this).find('.error').fadeIn('fast', function(){
                        $('.password').focus();
                    });
                    return false;
                }
                var pswd = MD5(username +"#" + password),
                    data = {pswd:pswd,email:username,rememberMe:$("#rememberMe").is(':checked')};
                var load = layer.load();

                $.ajax({
                    url:"${basePath}/u/submitLogin.shtml",
                    data:data,
                    type:"post",
                    dataType:"json",
                    beforeSend:function(){
                        layer.msg('开始登录，请注意后台控制台。');
                    },
                    success:function(result){
                        layer.close(load);
                        if(result && result.status != 200){
                            layer.msg(result.message,function(){});
                            $('.password').val('');
                            return;
                        }else{
                            layer.msg('登录成功！');
                            setTimeout(function(){
                                //登录返回
                                window.location.href= result.back_url || "${basePath}/";
                            },1000)
                        }
                    },
                    error:function(e){
                        console.log(e,e.message);
                        layer.msg('请看后台Java控制台，是否报错，确定已经配置数据库和Redis',new Function());
                    }
                });
            });

		});

	</script>
</head>

<body>
	<div id="container" class="cls-container">
		<div id="bg-overlay"></div>
		<div class="cls-content">
		    <div class="cls-content-sm panel">
		        <div class="panel-body">
		            <div class="mar-ver pad-btm">
		                <h3 class="h4 mar-no">Account Login</h3>
		                <p class="text-muted">Sign In to your account</p>
		            </div>
		            <form action="index.html">
		                <div class="form-group">
		                    <input type="text" name="username" class="form-control" placeholder="Username" autofocus>
		                </div>
		                <div class="form-group">
		                    <input type="password" name="password" class="form-control" placeholder="Password">
		                </div>
		                <div class="checkbox pad-btm text-left">
		                    <input id="demo-form-checkbox" class="magic-checkbox" type="checkbox">
		                    <label for="demo-form-checkbox">Remember me</label>
		                </div>
						<div class="error"><span>+</span></div>
		                <button class="btn btn-primary btn-lg btn-block" type="button" id="login">Sign In</button>

		            </form>
		        </div>
		
		        <div class="pad-all">
		            <a href="pages-password-reminder.html" class="btn-link mar-rgt">Forgot password ?</a>
		            <a href="pages-register.html" class="btn-link mar-lft">Create a new account</a>
		
		            <div class="media pad-top bord-top">
		                <div class="pull-right">
		                    <a href="#" class="pad-rgt"><i class="demo-psi-facebook icon-lg text-primary"></i></a>
		                    <a href="#" class="pad-rgt"><i class="demo-psi-twitter icon-lg text-info"></i></a>
		                    <a href="#" class="pad-rgt"><i class="demo-psi-google-plus icon-lg text-danger"></i></a>
		                </div>
		                <div class="media-body text-left">
		                    Login with
		                </div>
		            </div>
		        </div>
		    </div>
		</div>
		<div class="demo-bg">
		    <div id="demo-bg-list">
		        <div class="demo-loading"><i class="psi-repeat-2"></i></div>
		        <img class="demo-chg-bg bg-trans active" src="${basePath}/static/img/bg-img/thumbs/bg-trns.jpg" alt="Background Image">
		        <img class="demo-chg-bg" src="${basePath}/static/img/bg-img/thumbs/bg-img-1.jpg" alt="Background Image">
		        <img class="demo-chg-bg" src="${basePath}/static/img/bg-img/thumbs/bg-img-2.jpg" alt="Background Image">
		        <img class="demo-chg-bg" src="${basePath}/static/img/bg-img/thumbs/bg-img-3.jpg" alt="Background Image">
		        <img class="demo-chg-bg" src="${basePath}/static/img/bg-img/thumbs/bg-img-4.jpg" alt="Background Image">
		        <img class="demo-chg-bg" src="${basePath}/static/img/bg-img/thumbs/bg-img-5.jpg" alt="Background Image">
		        <img class="demo-chg-bg" src="${basePath}/static/img/bg-img/thumbs/bg-img-6.jpg" alt="Background Image">
		        <img class="demo-chg-bg" src="${basePath}/static/img/bg-img/thumbs/bg-img-7.jpg" alt="Background Image">
		    </div>
		</div>
	</div>
		</body>
</html>

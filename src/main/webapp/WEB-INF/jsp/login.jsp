<%--
  Created by IntelliJ IDEA.
  User: 11
  Date: 2018/10/4
  Time: 19:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <!--[if lt IE 9]>
    <script type="text/javascript" src="lib/html5shiv.js"></script>
    <script type="text/javascript" src="lib/respond.min.js"></script>
    <![endif]-->
    <link href="static/h-ui/css/H-ui.min.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/static/h-ui.admin/css/H-ui.login.css" rel="stylesheet" type="text/css" />
    <%--<link href="static/h-ui.admin/css/style.css" rel="stylesheet" type="text/css" />--%>
    <link href="lib/Hui-iconfont/1.0.8/iconfont.css" rel="stylesheet" type="text/css" />
    <!--[if IE 6]>
    <script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
    <script>DD_belatedPNG.fix('*');</script>
    <![endif]-->
    <title>登录</title>
    <!--<meta name="keywords" content="H-ui.admin v3.1,H-ui网站后台模版,后台模版下载,后台管理系统模版,HTML后台模版下载">
    <meta name="description" content="H-ui.admin v3.1，是一款由国人开发的轻量级扁平化网站\

    后台模板，完全免费开源的网站后台管理系统模版，适合中小型CMS后台系统。">-->
    <script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
    <script>
        // 判断是登录账号和密码是否为空
        $().ready(function(){
            console.log("dd");
            $("#formLogin").on("submit",function (){
                var usercode=$("#usercode").val();
                var password=$("#password").val();
                console.log(usercode);
                if(usercode==""||password==""){
                    $("#message").text("账号或密码不能为空");
                    return false;
                }else{
                    return true;
                }
            });

        });

    </script>
</head>
<body>

<div class="header">Boot客户管理系统</div>
<div class="loginWraper" >

    <div id="loginform" class="loginBox">
        <form class="form form-horizontal" id="formLogin" action="${pageContext.request.contextPath}/login.do" method="post">

            <div class="row cl">
                <font color="red">
                    <%-- 提示信息--%>
                    &nbsp;&nbsp;&nbsp;&nbsp;<span id="message" style="text-align: center">${msg}</span>
                </font>
                <label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60d;</i></label>
                <div class="formControls col-xs-8">
                    <input id="usercode" name="usercode" type="text" placeholder="账户" class="input-text size-L">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60e;</i></label>
                <div class="formControls col-xs-8">
                    <input id="password" name="password" type="password" placeholder="密码" class="input-text size-L">
                </div>
            </div>
            <%--<div class="row cl">--%>
                <%--<div class="formControls col-xs-8 col-xs-offset-3">--%>
                    <%--<input class="input-text size-L" type="text" placeholder="验证码" onblur="if(this.value==''){this.value='验证码:'}" onclick="if(this.value=='验证码:'){this.value='';}" value="验证码:" style="width:150px;">--%>
                    <%--<img src=""> <a id="kanbuq" href="javascript:;">看不清，换一张</a> </div>--%>
            <%--</div>--%>
            <div class="row cl">
                <div class="formControls col-xs-8 col-xs-offset-3">
                    <!--<label for="online">
                      <input type="checkbox" name="online" id="online" value="">
                      使我保持登录状态</label>-->
                </div>
            </div>
            <div class="row cl">
                <div class="formControls col-xs-8 col-xs-offset-3">
                    <input name="" type="submit" class="btn btn-success radius size-L" value="&nbsp;登&nbsp;&nbsp;&nbsp;&nbsp;录&nbsp;">
                    <input name="" type="reset" class="btn btn-default radius size-L" value="&nbsp;取&nbsp;&nbsp;&nbsp;&nbsp;消&nbsp;">
                </div>
            </div>
        </form>
    </div>
</div>
<div class="footer">Boot客户管理系统</div>

</body>
</html>

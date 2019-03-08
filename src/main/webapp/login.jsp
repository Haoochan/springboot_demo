<%--
  Created by IntelliJ IDEA.
  User: rayho.chen
  Date: 2018/12/19
  Time: 13:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>班主任工作管理系统登录</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="shortcut icon" href="./favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="./WeAdmin/static/css/font.css">
    <link rel="stylesheet" href="./WeAdmin/static/css/weadmin.css">
    <script src="./WeAdmin/lib/layui/layui.js" charset="utf-8"></script>

</head>
<body class="login-bg">

<div class="login">
    <div class="message">班主任工作管理系统</div>
    <div id="darkbannerwrap"></div>

    <form method="post" class="layui-form" action="/user/login">
        <input name="username" placeholder="用户名"  type="text" lay-verify="required" class="layui-input" >
        <hr class="hr15">
        <input name="password" lay-verify="required" placeholder="密码"  type="password" class="layui-input">
        <hr class="hr15">
        <div class="layui-form-item" style="width:100%;" >
            <div class="layui-input-block" style="margin-left: 0">
                <input type="radio" name="role" value="助班" title="助班" >
                <input type="radio" name="role" value="班主任" title="班主任" >
                <input type="radio" name="role" value="学院管理员" title="学院管理员" >
                <input type="radio" name="role" value="系统管理员" title="系统管理员" >
            </div>
        </div>

        <input class="loginin" value="登录" lay-submit lay-filter="login" style="width:100%;" type="submit">
        <hr class="hr20" >
        <input value="注册" lay-filter="register" style="width:100%;" type="button" onclick="window.location=('register1.jsp')">
        <hr class="hr20" >
    </form>
</div>

<script type="text/javascript">

    layui.use('form', function(){
        var form = layui.form;
        form.render();

        form.on('submit(login)', function (data) {
            console.log(data.field);
            if (!data.field.role){
                alert('请选择角色')
            }else {
                return true;
            }
            return false;

        });
    });
</script>
<!-- 底部结束 -->
</body>
</html>

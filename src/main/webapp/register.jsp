<!DOCTYPE html>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>

<%@ page contentType="text/html;charset=utf-8" %>

<html>



<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>
<script src="/js/CheckInput.js"></script>
<form method="post" action="${pageContext.request.contextPath }/user/register">
    姓名：<input type="text" name="username" id="username"/><br/><br/>
    密码<input type="password" name="password" id="password"/><br/><br/>
    角色：
    助班<input type="radio" name="role" value="助班">
    班主任<input type="radio" name="role" value="班主任">
    学院管理员<input type="radio" name="role" value="学院管理员">
    系统管理员<input type="radio" name="role" value="系统管理员"><br>
    <input type="submit" value="注册" onclick="return checkLoginAndRegister()"/>
</form>
</body>
</html>
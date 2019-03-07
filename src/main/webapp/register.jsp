<!DOCTYPE html>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>

<%@ page contentType="text/html;charset=utf-8" %>

<html>



<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>
<script src="/static/js/CheckInput.js"></script>
<form method="post" action="${pageContext.request.contextPath }/user/register">
    登录名：<input type="text" name="username" id="username"/><br/><br/>
    密码<input type="password" name="password" id="password"/><br/><br/>
    角色：
    助班<input type="radio" name="role" value="助班">
    班主任<input type="radio" name="role" value="班主任"><br>
    姓名：<input type="text" name="name" id="name"/><br/><br/>
    <%--性别：--%>
    <%--男<input type="radio" name="sex" value="男">--%>
    <%--女<input type="radio" name="sex" value="女"><br>--%>
    <%--电话号码：<input type="text" name="phone" id="phone"/><br/><br/>--%>
    <%--电子邮箱：<input type="text" name="email" id="email"/><br/><br/>--%>
    <input type="submit" value="注册" onclick="return checkLoginAndRegister()"/>
</form>
</body>
</html>
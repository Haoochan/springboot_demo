<!DOCTYPE html>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>

<%@ page contentType="text/html;charset=utf-8" %>

<html>
<body>
<script src="/js/CheckInput.js"></script>
<h2>Hello World!</h2>
<form method="post" action="${pageContext.request.contextPath }/user/login">
    用户名：<input type="text" name="username" id="username"/><br/><br/>
    密码：<input type="password" name="password" id="password"/><br/><br/>
    角色：
    助班<input type="radio" name="role" value="助班" />
    班主任<input type="radio" name="role" value="班主任" />
    学院管理员<input type="radio" name="role" value="学院管理员"/>
    系统管理员<input type="radio" name="role" value="系统管理员"/><br>
    <input type="submit"value="登录" onclick="return checkLoginAndRegister()"/>
</form>
<input type="button" value="注册" onclick="window.location.href=('/register.jsp')"/>
</body>
</html>

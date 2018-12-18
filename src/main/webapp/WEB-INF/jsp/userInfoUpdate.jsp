<%--
  Created by IntelliJ IDEA.
  User: rayho.chen
  Date: 2018/12/18
  Time: 14:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<script src="/static/js/CheckInput.js"></script>
<form method="post" action="${pageContext.request.contextPath }/user/userInfoUpdate">
    用户ID：<input type="text" name="id" value="${user.id}" readonly="readonly">
    登录名：<input type="text" name="username" id="username" value="${user.username}"/><br/><br/>
    密码:<input type="password" name="password" id="password" value="${user.password}"/><br/><br/>
    角色<input type="text" name="role" value="${user.role}" readonly="readonly"><br/><br/>
    姓名：<input type="text" name="name" id="name" value="${user.name}"/><br/><br/>
    性别：
    男<input type="radio" name="sex" value="男" <c:if test="${user.sex=='男' }">checked="checked"</c:if>>
    女<input type="radio" name="sex" value="女" <c:if test="${user.sex=='女' }">checked="checked"</c:if>><br>
    电话号码：<input type="text" name="phone" id="phone" value="${user.phone}"/><br/><br/>
    电子邮箱：<input type="text" name="email" id="email" value="${user.email}"/><br/><br/>
    <input type="submit" value="修改" />
</form>
</body>
</html>

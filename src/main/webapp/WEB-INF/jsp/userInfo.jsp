<%--
  Created by IntelliJ IDEA.
  User: rayho.chen
  Date: 2018/12/18
  Time: 13:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
${user.id}<br>
${user.username}<br>
${user.name}<br>
${user.role}<br>
${user.sex}<br>
${user.phone}<br>
${user.email}<br>
<input type="button" value="修改信息" onclick="window.location.href=('/user/goUserInfoUpdate')"/>
</body>
</html>

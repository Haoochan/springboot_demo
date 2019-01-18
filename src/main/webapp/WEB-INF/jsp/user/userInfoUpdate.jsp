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
    <title>修改基本资料</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="../../../static/layui/css/layui.css" media="all">
    <script src="../../../static/jquery-1.10.2.js"></script>
    <script src="../../../static/layui/layui.all.js"></script>
</head>
<body>
<script src="/static/js/CheckInput.js"></script>
<form class="layui-form layui-form-pane" action="/user/userInfoUpdate" method="post">
    <div class="layui-form-item" style="display: none">
        <label class="layui-form-label">ID</label>
        <div class="layui-input-inline">
            <input type="text"  name="id" value="${user.id}" class="layui-input" >
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">登录用户名</label>
        <div class="layui-input-inline">
            <input type="text"  name="username" value="${user.username}" class="layui-input" >
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">密码</label>
        <div class="layui-input-inline">
            <input type="text"  name="password" value="${user.password}" class="layui-input" >
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">姓名</label>
        <div class="layui-input-inline">
            <input type="text"  name="name" value="${user.name}" class="layui-input" >
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">角色</label>
        <div class="layui-input-inline">
            <input type="text"  name="role" value="${user.role}" class="layui-input" readonly >
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">性别</label>
        <div class="layui-input-inline">
            <input type="radio"  name="sex" value="男" title="男" <c:if test="${user.sex=='男' }">checked="checked"</c:if>>
            <input type="radio"  name="sex" value="女" title="女" <c:if test="${user.sex=='女' }">checked="checked"</c:if>>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">电话号码</label>
        <div class="layui-input-inline">
            <input type="text"  name="phone" value="${user.phone}" class="layui-input" >
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">邮箱</label>
        <div class="layui-input-inline">
            <input type="text"  name="email" value="${user.email}" class="layui-input" >
        </div>
    </div>
    </div>
    <div class="layui-form-item">
        <button class="layui-btn" lay-filter="add" lay-submit="">确定</button>
    </div>
</form>


<script>
    // 关闭弹窗 刷新列表
    function reload() {
        // window.parent.location.reload();
        var index = parent.layer.getFrameIndex(window.name);
        parent.layer.close(index);
    }

    //Demo
    layui.use('form', function(){
        var form = layui.form;
        form.render();
        //监听提交
        form.on('submit(add)', function(data){
            console.log(data)
            // layer.msg(JSON.stringify(data.field));
            // return false;
        });
    });
</script>

</body>
</html>

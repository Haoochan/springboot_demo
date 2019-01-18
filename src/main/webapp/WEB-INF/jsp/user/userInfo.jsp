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
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="../../../static/layui/css/layui.css" media="all">
    <script src="../../../static/jquery-1.10.2.js"></script>
    <script src="../../../static/layui/layui.all.js"></script>
</head>
<body>
<form class="layui-form layui-form-pane" action="">
    <div class="layui-form-item" style="display: none">
        <label class="layui-form-label">ID</label>
        <div class="layui-input-inline">
            <input type="text" name="id" value="${user.id}" class="layui-input" readonly>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">登录用户名</label>
        <div class="layui-input-inline">
            <input type="text" name="username" value="${user.username}" class="layui-input" readonly>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">姓名</label>
        <div class="layui-input-inline">
            <input type="text" name="name" value="${user.name}" class="layui-input" readonly>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">角色</label>
        <div class="layui-input-inline">
            <input type="text" id="role" name="role" value="${user.role}" class="layui-input" readonly>
        </div>
    </div>
    <div class="layui-form-item" id="collegeDiv">
        <label class="layui-form-label">学院</label>
        <div class="layui-input-inline">
            <input type="text" name="college" value="${user.college}" class="layui-input" readonly>
        </div>
    </div>
    <div class="layui-form-item" id="majorDiv">
        <label class="layui-form-label">专业</label>
        <div class="layui-input-inline">
            <input type="text" name="major" value="${user.major}" class="layui-input" readonly>
        </div>
    </div>
    <div class="layui-form-item" id="classesDiv">
        <label class="layui-form-label">班级</label>
        <div class="layui-input-inline">
            <input type="text" name="classes" value="${user.classes}" class="layui-input" readonly>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">性别</label>
        <div class="layui-input-inline">
            <input type="text" name="sex" value="${user.sex}" class="layui-input" readonly>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">电话号码</label>
        <div class="layui-input-inline">
            <input type="text" name="phone" value="${user.phone}" class="layui-input" readonly>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">邮箱</label>
        <div class="layui-input-inline">
            <input type="text" name="email" value="${user.email}" class="layui-input" readonly>
        </div>
    </div>
</form>

<button class="layui-btn" onclick="window.location.href=('/user/goUserInfoUpdate')">
<%--<button class="layui-btn" onclick="window.location.href=('/user/goEdit?id='+${user.id})">--%>
    <i class="layui-icon">&#xe608;</i> 修改信息
</button>
<script>
    //Demo
    layui.use('form', function(){
        var form = layui.form;

        //根据角色默认值隐藏展示下拉框
        {
            var roleShow = $('#role').val();
            if (roleShow == "系统管理员") {
                $('#collegeDiv').hide();
                $('#majorDiv').hide();
                $('#classesDiv').hide();
            } else if (roleShow == "学院管理员") {
                $('#collegeDiv').show();
                $('#majorDiv').hide();
                $('#classesDiv').hide();
            } else {
                $('#collegeDiv').show();
                $('#majorDiv').show();
                $('#classesDiv').show()
            }
            form.render();
        }

        //监听提交
        // form.on('submit(formDemo)', function(data){
        //     layer.msg(JSON.stringify(data.field));
        //     return false;
        // });
    });
</script>

</body>
</html>

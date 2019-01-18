<%--
  Created by IntelliJ IDEA.
  User: Rayho.chen
  Date: 2018/12/27
  Time: 10:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>添加会员-WeAdmin Frame型后台管理系统-WeAdmin 1.0</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="../../../static/layui/css/layui.css" media="all">
    <script src="../../../static/jquery-1.10.2.js"></script>
    <script src="../../../static/layui/layui.all.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<form class="layui-form layui-form-pane" action="">
    <div class="layui-form-item" style="display:none" >
        <label class="layui-form-label">id</label>
        <div class="layui-input-inline">
            <input type="text" name="id" id="id" value="${user.id}" readonly="readonly" autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label for="name" class="layui-form-label">姓名</label>
        <div class="layui-input-inline">
            <input type="text" id="name" name="name"  value="${user.name}" readonly="readonly" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label for="role" class="layui-form-label">角色</label>
        <div class="layui-input-inline">
            <input type="text" id="role" name="role"  value="${user.role}" readonly="readonly" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item" id="collegeDiv">
        <label for="college" class="layui-form-label">学院</label>
        <div class="layui-input-inline">
            <input type="text" id="college" name="college"  value="${user.college}" readonly="readonly" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item" id="majorDiv">
        <label for="major" class="layui-form-label">专业</label>
        <div class="layui-input-inline">
            <input type="text" id="major" name="major"  value="${user.major}" readonly="readonly" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item" id="classesDiv">
        <label for="classes" class="layui-form-label">班级</label>
        <div class="layui-input-inline">
            <input type="text" id="classes" name="classes"  value="${user.classes}" readonly="readonly" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label for="sex" class="layui-form-label">性别</label>
        <div class="layui-input-inline">
            <input type="text" id="sex" name="sex"  value="${user.sex}" readonly="readonly" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label for="phone" class="layui-form-label">电话</label>
        <div class="layui-input-inline">
            <input type="text" id="phone" name="phone"  value="${user.phone}" readonly="readonly" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label for="email" class="layui-form-label">邮箱</label>
        <div class="layui-input-inline">
            <input type="text" id="email" name="email"  value="${user.email}" readonly="readonly" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <button class="layui-btn" lay-filter="add" lay-submit="" onclick="reload()">确定</button>
    </div>
</form>

<%--<button class="layui-btn layui-btn-normal" onclick="window.location.href=('/user/goEdit?id='+${user.id})">修改</button>--%>



<script>
    // 关闭弹窗
    function reload() {
        // window.parent.location.reload();
        var index = parent.layer.getFrameIndex(window.name);
        parent.layer.close(index);
    }


    layui.use('form', function() {
        var form = layui.form;
        form.render();

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
            form.render('select');
        }
    });


</script>

</body>

</html>

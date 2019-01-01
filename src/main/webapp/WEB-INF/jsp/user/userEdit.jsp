<%--
  Created by IntelliJ IDEA.
  User: rayho.chen
  Date: 2018/12/19
  Time: 17:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<form class="layui-form layui-form-pane" action="/user/edit">
    <div class="layui-form-item" style="display: none">
        <label for="id" class="layui-form-label">ID</label>
        <div class="layui-input-inline">
            <input type="password" id="id" name="id" value="${user.id}" lay-verify="required" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label for="username" class="layui-form-label">
            <span class="we-red">*</span>用户名
        </label>
        <div class="layui-input-inline">
            <input type="text" id="username" name="username" value="${user.username}" lay-verify="required" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label for="password" class="layui-form-label">密码</label>
        <div class="layui-input-inline">
            <input type="password" id="password" name="password" value="${user.password}" lay-verify="required" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label for="name" class="layui-form-label">姓名</label>
        <div class="layui-input-inline">
            <input type="text" id="name" name="name" value="${user.name}" lay-verify="required" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">角色</label>
        <div class="layui-input-inline">
            <select  id="role" name="role" lay-verify="required">
                <option value="助班">助班</option>
                <option value="班主任">班主任</option>
                <option value="学院管理员">学院管理员</option>
                <option value="系统管理员">系统管理员</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">性别</label>
        <div class="layui-input-block">
            <input type="radio" name="sex" value="男" title="男" <c:if test="${user.sex=='男' }">checked="checked"</c:if>>
            <input type="radio" name="sex" value="女" title="女" <c:if test="${user.sex=='女' }">checked="checked"</c:if>>
        </div>
    </div>
    <div class="layui-form-item">
        <label for="phone" class="layui-form-label">电话</label>
        <div class="layui-input-inline">
            <input type="text" id="phone" name="phone" value="${user.phone}" lay-verify="required" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label for="email" class="layui-form-label">邮箱</label>
        <div class="layui-input-inline">
            <input type="text" id="email" name="email" value="${user.email}" lay-verify="required" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <%--<button class="layui-btn" lay-filter="add" lay-submit="" onclick="reload()">确定</button>--%>
        <button class="layui-btn" lay-filter="add" lay-submit="" >确定</button>
    </div>
</form>

<script>
    // 关闭弹窗 刷新列表
    function reload() {
        window.parent.location.reload();
        var index = parent.layer.getFrameIndex(window.name);
        parent.layer.close(index);
    }

    layui.use('form', function(){
        var form = layui.form;
        form.render();
        // form.render("select");

        //默认选中角色
        var role = $("#role").find("option"); //获取select下拉框的所有值
        for (var j = 1; j < role.length; j++) {
            if ($(role[j]).val() == '${user.role}') {
                $(role[j]).attr("selected", "selected");
            }
        }
        form.render();

        //监听提交
        // form.on('submit(add)', function(data){
        //     console.log(JSON.stringify(data.field));
        //     var Data = JSON.stringify(data.field);
        //     $.ajax({
        //         type: "POST",
        //         url: "/activityCategory/add",
        //         data: Data,
        //         dataType: "json",
        //         contentType:"application/json",
        //         success: function(){
        //                 //还没有实现关闭。。。。
        //         }
        //     });
        //     // return false;
        // });
    });
</script>
</body>

</html>

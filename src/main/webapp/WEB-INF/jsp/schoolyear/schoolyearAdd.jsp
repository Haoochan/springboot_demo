<%--
  Created by IntelliJ IDEA.
  User: rayho.chen
  Date: 2018/12/19
  Time: 17:08
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
<%--<form class="layui-form layui-form-pane" action="/activityCategory/add">--%>
<form class="layui-form layui-form-pane">

    <div class="layui-form-item">
        <label for="schoolyear" class="layui-form-label">
            <span class="we-red">*</span>学年
        </label>
        <div class="layui-input-inline">
            <input type="text" id="schoolyear" name="schoolyear" lay-verify="required" autocomplete="off" class="layui-input">
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

        // 监听提交
        form.on('submit(add)', function(data){
            var Data = JSON.stringify(data.field);
            $.ajax({
                type: "POST",
                url: "/schoolyear/add",
                data: Data,
                contentType:"application/json",
                success: function(data){
                    if (data=="ok"){
                        window.parent.location.reload();
                    }
                }
            });
            return false;
        });
    });
</script>
</body>

</html>

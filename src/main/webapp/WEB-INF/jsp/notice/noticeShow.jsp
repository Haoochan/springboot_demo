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
<form class="layui-form layui-form-pane" action="" id="form1" name="form1"  method="post">
    <div class="layui-form-item" style="display: none">
        <label class="layui-form-label">id</label>
        <div class="layui-input-inline">
            <input type="text" name="id" id="id" value="${notice.id}" readonly="readonly" autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label for="title" class="layui-form-label">标题</label>
        <div class="layui-input-inline">
            <input type="text" id="title" name="title" readonly="readonly" value="${notice.title}" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label for="category" class="layui-form-label">公告类别</label>
        <div class="layui-input-inline">
            <input type="text" id="category" name="category" readonly="readonly" value="${notice.category}" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">公告内容</label>
        <div class="layui-input-block">
            <textarea id="content" name="content" class="layui-textarea" readonly="readonly" style="height: 320px">${notice.content}</textarea>
        </div>
    </div>
    <div class="layui-form-item">
        <label for="time" class="layui-form-label">时间</label>
        <div class="layui-input-inline">
            <input type="text" id="time" name="time" readonly="readonly" value="${notice.time}" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label for="college" class="layui-form-label">学院</label>
        <div class="layui-input-inline">
            <input type="text" id="college" name="college" readonly="readonly" value="${notice.college}" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label for="major" class="layui-form-label">专业</label>
        <div class="layui-input-inline">
            <input type="text" id="major" name="major" readonly="readonly" value="${notice.major}" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <button class="layui-btn" lay-filter="add" lay-submit="" onclick="reload()">确定</button>
    </div>
</form>


<script>
    // 关闭弹窗 刷新列表
    function reload() {
        // window.parent.location.reload();
        var index = parent.layer.getFrameIndex(window.name);
        parent.layer.close(index);
    }
</script>
</body>

</html>

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
            <input type="text" id="title" name="title" value="${notice.title}" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label for="category" class="layui-form-label">公告类别</label>
        <div class="layui-input-inline">
            <select  id="category" name="category" lay-filter="category">
                <option></option>
            </select>
        </div>
    </div>
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">公告内容</label>
        <div class="layui-input-block">
            <textarea id="content" name="content" class="layui-textarea">${notice.content}</textarea>
        </div>
    </div>
    <div class="layui-form-item">
        <label for="time" class="layui-form-label">时间</label>
        <div class="layui-input-inline">
            <input type="text" id="time" name="time" value="${notice.time}" autocomplete="off" class="layui-input" >
        </div>
    </div>
    <div class="layui-form-item">
        <label for="college" class="layui-form-label">学院</label>
        <div class="layui-input-inline">
            <select  id="college" name="college" lay-filter="college">
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label for="major" class="layui-form-label">专业</label>
        <div class="layui-input-inline">
            <select  id="major" name="major" lay-filter="major">
            </select>
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
        // window.parent.location.reload();
        var index = parent.layer.getFrameIndex(window.name);
        parent.layer.close(index);
    }

    layui.use('form', function() {
        var form = layui.form;
        var laydate = layui.laydate;
        form.render();

        //日期插件
        laydate.render({
            elem: '#time', //指定元素
            type: 'datetime'
        });

        //公告列表添加到下拉框中 并默认选中
        $.ajax({
            url: '/noticeCategory/getNoticeCategory',
            dataType: 'json',
            type: 'get',
            success: function (category) {
                $.each(category, function (index, item) {
                    if (item.id==${notice.categoryId}){
                        $('#category').append(new Option(item.name, item.id,false,true));
                    }else {
                        $('#category').append(new Option(item.name, item.id));// 下拉菜单里添加元素
                    }
                });
                form.render("select");
                //重新渲染 固定写法
            }
        });

        //学院添加到下拉框中 并默认选中
        $.ajax({
            url: '/college/getCollege',
            dataType: 'json',
            type: 'get',
            success: function (college) {
                $.each(college, function (index, item) {
                    if (item.id==${notice.collegeId}){
                        $('#college').append(new Option(item.name, item.id,false,true));
                    }else {
                        $('#college').append(new Option(item.name, item.id));// 下拉菜单里添加元素
                    }
                });
                form.render("select");
                //重新渲染 固定写法
            }
        });

        //专业添加到下拉框中 并默认选中
        $.ajax({
            url: '/major/getMajor?id='+${notice.collegeId},
            dataType: 'json',
            type: 'get',
            success: function (major) {
                $.each(major, function (index, item) {
                    if (item.id==${notice.majorId}){
                        $('#major').append(new Option(item.name, item.id,false,true));
                    }else {
                        $('#major').append(new Option(item.name, item.id));// 下拉菜单里添加元素
                    }
                });
                form.render("select");
                //重新渲染 固定写法
            }
        });

        //监听学院下拉框选择变动 把专业添加到下拉框中
        form.on('select(college)', function(data){
            $('#major').html("");//清空下拉框
            form.render('select');
            var value = data.value;
            if (value!='') {
                $.ajax({
                    url: '/major/getMajor?id=' + value,
                    dataType: 'json',
                    type: 'get',
                    success: function (major) {
                        $.each(major, function (index, item) {
                            if (item.id==${notice.majorId}){
                                $('#major').append(new Option(item.name, item.id,false,true));
                            }else {
                                $('#major').append(new Option(item.name, item.id));// 下拉菜单里添加元素
                            }
                        });
                        form.render("select");
                        //重新渲染 固定写法
                    }
                });
            }
        });

        //监听提交
        form.on('submit(add)', function (data) {
            console.log(JSON.stringify(data.field));
            var Data = JSON.stringify(data.field);
            $.ajax({
                type: "POST",
                url: "/notice/edit",
                data: Data,
                contentType: "application/json",
                success: function (data) {
                    if (data == "ok") {
                        window.location.reload();
                    }
                }
            });
            // return false;
        });
    });
</script>
</body>

</html>

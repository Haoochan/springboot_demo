<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/28
  Time: 22:36
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
<form class="layui-form layui-form-pane" action="/notice/add">
    <div class="layui-form-item">
        <label for="title" class="layui-form-label">
            <span class="we-red">*</span>公告标题
        </label>
        <div class="layui-input-inline">
            <input type="text" id="title" name="title" lay-verify="required" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label for="categoryId" class="layui-form-label">公告类别</label>
        <div class="layui-input-inline ">
            <select  id="categoryId" name="categoryId" lay-verify="required">
                <option >请选择类别</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label for="time" class="layui-form-label">公告日期</label>
        <div class="layui-input-inline">
            <input type="text" id="time" name="time" lay-verify="required" placeholder="请选择日期" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item" >
        <label class="layui-form-label">工作内容</label>
        <div class="layui-input-inline" style ="width:350px">
            <textarea id="content" name="content" class="layui-textarea" lay-verify="required"></textarea>
        </div>
    </div>
    <div class="layui-form-item" id="collegeDiv">
        <label for="college" class="layui-form-label">学院</label>
        <div class="layui-input-inline" >
            <select  id="college" name="college" lay-filter="college">
                <option value="0">请选择学院</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label for="major" class="layui-form-label">专业</label>
        <div class="layui-input-inline">
            <select  id="major" name="major">
                <option value="0">请选择专业</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <button class="layui-btn" lay-filter="add" lay-submit="" onclick="reload()">确定</button>
    </div>
</form>

<script>

    // 关闭弹窗 刷新列表
    function reload() {
        window.parent.location.reload();
        var index = parent.layer.getFrameIndex(window.name);
        parent.layer.close(index);
    }

    layui.use(['form','laydate'], function() {
        var form = layui.form;
        var laydate = layui.laydate;
        form.render();

        //日期插件
        laydate.render({
            elem: '#time', //指定元素
            type: 'datetime'
        });

        //添加公告类别到下拉框
        $.ajax({
            url: '/noticeCategory/getNoticeCategory',
            dataType: 'json',
            type: 'get',
            success: function (category) {
                $.each(category, function (index, item) {
                    $('#categoryId').append(new Option(item.name, item.id));// 下拉菜单里添加元素
                });
                form.render("select");
                //重新渲染 固定写法
            }
        });

        //学院添加到下拉框中
        $.ajax({
            url: '/college/getCollege',
            dataType: 'json',
            type: 'get',
            success: function (college) {
                $.each(college, function (index, item) {
                    if (item.id==${sessionScope.userCollegeId}){
                        $('#college').append(new Option(item.name, item.id,false,true));
                    }else {
                        $('#college').append(new Option(item.name, item.id));// 下拉菜单里添加元素
                    }
                });
                form.render("select");
                //重新渲染 固定写法
            }
        });

        //本学院专业添加到下拉框中
        var role ="${sessionScope.loginUser.role}";
        if (role !== "系统管理员"){
            var userCollegeId =${sessionScope.userCollegeId};
            $('#collegeDiv').hide();
            $.ajax({
                url: '/major/getMajor?id='+userCollegeId,
                dataType: 'json',
                type: 'get',
                success: function (major) {
                    $.each(major, function (index, item) {
                        $('#major').append(new Option(item.name, item.id));// 下拉菜单里添加元素
                    });
                    form.render("select");
                }
            });
        }

        //监听学院下拉框 把专业添加到下拉框中
        form.on('select(college)', function(data){
            $('#major').html("");//清空下拉框
            $('#major').append(new Option("所有专业", "0"));//添加提示
            form.render('select');
            var value = data.value;
            if (value!=="0") {
                $.ajax({
                    url: '/major/getMajor?id=' + value,
                    dataType: 'json',
                    type: 'get',
                    success: function (major) {
                        console.log(major);
                        $.each(major, function (index, item) {
                            $('#major').append(new Option(item.name, item.id));// 下拉菜单里添加元素
                        });
                        form.render("select");
                        //重新渲染 固定写法
                    }
                });
            }
        });
    });
</script>

</body>
</html>

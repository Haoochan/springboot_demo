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
<form class="layui-form layui-form-pane" action="/classes/add">
    <%--<form class="layui-form">--%>

    <div class="layui-form-item">
        <label for="grade" class="layui-form-label">年级</label>
        <div class="layui-input-inline">
            <select  id="grade" name="grade" lay-filter="grade">
                <option value="">请选择年级</option>
                <option value="14">14级</option>
                <option value="15">15级</option>
                <option value="16">16级</option>
                <option value="17">17级</option>
                <option value="18">18级</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label for="name" class="layui-form-label">
            <span class="we-red">*</span>班级名称
        </label>
        <div class="layui-input-inline">
            <input type="text" id="name" name="name" lay-verify="required" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label for="count" class="layui-form-label">人数</label>
        <div class="layui-input-inline">
            <input type="text" id="count" name="count" lay-verify="required" placeholder="人数"   autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label for="college" class="layui-form-label">学院</label>
        <div class="layui-input-inline">
            <select  id="college" name="college" lay-filter="college">
                <option value="">请选择学院</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label for="major" class="layui-form-label">专业</label>
        <div class="layui-input-inline">
            <select  id="major" name="major" lay-filter="major">
                <option value="">请选择专业</option>
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

    layui.use('form', function(){
        var form = layui.form;

        //学院添加到下拉框中
        $.ajax({
            url: '/college/getCollege',
            dataType: 'json',
            type: 'get',
            success: function (college) {
                console.log(college);
                $.each(college, function (index, item) {
                    $('#college').append(new Option(item.name, item.id));// 下拉菜单里添加元素
                });
                form.render("select");
                //重新渲染 固定写法
            }
        });

        //监听学院下拉框 把专业添加到下拉框中
        form.on('select(college)', function(data){
            $('#major').html("");//清空下拉框
            $('#major').append(new Option("请选择专业", ''));//添加提示
            form.render('select');
            var value = data.value;
            console.log(value);
            if (value!='') {
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

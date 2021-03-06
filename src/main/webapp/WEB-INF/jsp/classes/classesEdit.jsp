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
<form class="layui-form layui-form-pane" action="/classes/edit" id="form1" name="form1"  method="post">
    <div class="layui-form-item" style="display: none">
        <label class="layui-form-label">id</label>
        <div class="layui-input-inline">
            <input type="text" name="id" id="id" value="${classes.id}" readonly="readonly" autocomplete="off" class="layui-input">
        </div>
    </div>
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
            <input type="text" id="name" name="name" lay-verify="required" value="${classes.name}" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label for="count" class="layui-form-label">班级人数</label>
        <div class="layui-input-inline">
            <input type="text" id="count" name="count" lay-verify="required" value="${classes.count}" autocomplete="off" class="layui-input">
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
    function close() {
        // window.parent.location.reload();
        var index = parent.layer.getFrameIndex(window.name);
        parent.layer.close(index);
    }

    layui.use('form', function(){
        var form = layui.form;

        //默认选中年级
        var grade = $("#grade").find("option"); //获取select下拉框的所有值
        for (var j = 1; j < grade.length; j++) {
            if ($(grade[j]).val() == '${classes.grade}') {
                $(grade[j]).attr("selected", "selected");
            }
        }
        form.render('select');

        //学院添加到下拉框中 并默认选中
        $.ajax({
            url: '/college/getCollege',
            dataType: 'json',
            type: 'get',
            success: function (college) {
                $.each(college, function (index, item) {
                    if (item.id==${classes.collegeId}){
                        $('#college').append(new Option(item.name, item.id,false,true));
                    }else {
                        $('#college').append(new Option(item.name, item.id));// 下拉菜单里添加元素
                    }
                });
                form.render("select");
                //重新渲染 固定写法
            }
        });

        //添加本学院专业到下拉框并且默认选中该班级专业
        $.ajax({
            url: '/major/getMajor?id=' + ${classes.collegeId},
            dataType: 'json',
            type: 'get',
            success: function (major) {
                console.log(major);
                $.each(major, function (index, item) {
                    if (item.id==${classes.majorId}){
                        $('#major').append(new Option(item.name, item.id,false,true));
                    }else {
                        $('#major').append(new Option(item.name, item.id));// 下拉菜单里添加元素
                    }
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
                            if (item.id==${classes.majorId}){
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
        // form.on('submit(formDemo)', function(data){
        //     layer.msg(JSON.stringify(data.field));
        //     return false;
        // });
    });
</script>
</body>

</html>

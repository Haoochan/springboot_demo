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
    <style type="text/css">
        .uploader-list {
            margin-left: -15px;
        }

        .uploader-list .info {
            position: relative;
            margin-top: -25px;
            background-color: black;
            color: white;
            filter: alpha(Opacity=80);
            -moz-opacity: 0.5;
            opacity: 0.5;
            width: 100px;
            height: 25px;
            text-align: center;
            display: none;
        }

        .uploader-list .handle {
            position: relative;
            background-color: black;
            color: white;
            filter: alpha(Opacity=80);
            -moz-opacity: 0.5;
            opacity: 0.5;
            width: 150px;
            text-align: right;
            height: 18px;
            margin-bottom: -18px;
            display: none;
        }

        .uploader-list .handle span {
            margin-right: 5px;
        }

        .uploader-list .handle span:hover {
            cursor: pointer;
        }

        .uploader-list .file-iteme {
            margin: 12px 0 0 15px;
            padding: 1px;
            float: left;
        }
    </style>
</head>
<body>
<form class="layui-form layui-form-pane" action="/activity/add">

    <div class="layui-form-item">
        <label for="topic" class="layui-form-label">
            <span class="we-red">*</span>工作主题
        </label>
        <div class="layui-input-inline">
            <input type="text" id="topic" name="topic" lay-verify="required" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label for="categoryId" class="layui-form-label">工作类别</label>
        <div class="layui-input-block ">
            <select  id="categoryId" name="categoryId" lay-verify="required">
                <option >请选择类别</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label for="time" class="layui-form-label">工作日期</label>
        <div class="layui-input-inline">
            <input type="text" id="time" name="time" lay-verify="required" placeholder="请选择日期" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label for="location" class="layui-form-label">地点</label>
        <div class="layui-input-inline">
            <input type="text" id="location" name="location" lay-verify="required" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label for="semester" class="layui-form-label">学期</label>
        <div class="layui-input-inline">
            <select  id="semester" name="semester" lay-verify="required">
                <option >请选择学期</option>
                <option value="1">1</option>
                <option value="2">2</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label for="schoolyear" class="layui-form-label">学年</label>
        <div class="layui-input-inline">
            <select  id="schoolyear" name="schoolyear" lay-verify="required">
                <option >请选择学年</option>
                <option value="2018-2019">2018-2019</option>
                <option value="2017-2018">2017-2018</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">工作内容</label>
        <div class="layui-input-block">
            <textarea id="content" name="content" class="layui-textarea"></textarea>
        </div>
    </div>

    <%--<button class="layui-btn" onclick="add();" type="button">--%>
        <%--<i class="layui-icon">&#xe608;</i> 图片上传--%>
    <%--</button>--%>
    <div class="layui-upload">
            <button type="button" class="layui-btn" id="test2">图片上传</button>
        <blockquote class="layui-elem-quote layui-quote-nm" style="margin-top: 10px;width: 88%" >
                预览图：
                <div class="layui-upload-list uploader-list" style="overflow: auto;" id="uploader-list">

                </div>
        </blockquote>
    </div>

    <div class="layui-form-item">
        <button class="layui-btn" lay-filter="add" lay-submit="" onclick="reload()">确定</button>
    </div>
</form>


<script>

    //上传图片方法
    function add() {
        layer.open({
            type: 2,
            title: '上传图片',
            skin: 'layui-layer-rim', //加上边框
            area: ['95%', '95%'], //宽高
            content: '/activity/goUpload'  //调到新增页面
        });
    }

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

        //检查项目添加到下拉框中
        $.ajax({
            url: '/activityCategory/getActivityCategory',
            dataType: 'json',
            type: 'get',
            success: function (category) {
                console.log(category);
                $.each(category, function (index, item) {
                        $('#categoryId').append(new Option(item.name, item.id));// 下拉菜单里添加元素
                });
                form.render("select");
                //重新渲染 固定写法
            }
        });
    });


    //图片模块
    layui.use('upload', function() {
        var $ = layui.jquery
            , upload = layui.upload;
        upload.render({
            elem: '#test2'
            , url: '/activity/upload'
            , multiple: true
            , before: function (obj) {
                layer.msg('图片上传中...', {
                    icon: 16,
                    shade: 0.01,
                    time: 0
                })
            }
            , done: function (res) {
                layer.close(layer.msg());//关闭上传提示窗口
                var id=res.imageId;
                //上传完毕
                $('#uploader-list').append(
                    '<div id="" class="file-iteme">' +
                    '<div id='+id+' class="handle"><span class="layui-icon layui-icon-delete"></span></div>' +
                    '<img style="width: 150px;height: 150px;" src=/image/' + res.src + '>' +
                    // '<div class="info">' + res.name + '</div>' +
                    '</div>'
                );
            }
        });
    });

    $(document).on("mouseenter mouseleave", ".file-iteme", function(event){
        if(event.type === "mouseenter"){
            //鼠标悬浮
            // $(this).children(".info").fadeIn("fast");
            $(this).children(".handle").fadeIn("fast");
        }else if(event.type === "mouseleave") {
            //鼠标离开
            // $(this).children(".info").hide();
            $(this).children(".handle").hide();
        }
    });

    // 删除图片
    $(document).on("click", ".file-iteme .handle", function(event){
        var self = this;
        var imageId = $(this).attr("id");
        layer.confirm('真的删除图片么', function (index) {
            $.ajax({
                url: "/activity/imageDelete",
                type: "POST",
                data: {"id": imageId},
                success: function (data) {
                    if (data == "ok") {
                        $(self).parent().remove();
                        layer.close(index);
                        layer.msg("删除成功", {icon: 6});
                    } else {
                        layer.msg("删除失败", {icon: 5});
                    }
                }
            });
        });
    });
</script>

</body>
</html>

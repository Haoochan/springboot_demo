<%--
  Created by IntelliJ IDEA.
  User: Rayho.chen
  Date: 2018/12/27
  Time: 10:43
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
<form class="layui-form layui-form-pane" action="/activity/edit">
    <div class="layui-form-item" style="display: none">
        <label class="layui-form-label">id</label>
        <div class="layui-input-inline">
            <input type="text" name="id" id="id" value="${activity.id}" readonly="readonly" autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label for="topic" class="layui-form-label">
            <span class="we-red">*</span>工作主题
        </label>
        <div class="layui-input-inline">
            <input type="text" id="topic" name="topic" lay-verify="required" value="${activity.topic}" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">工作内容</label>
        <div class="layui-input-block">
            <textarea id="content" name="content" class="layui-textarea">${activity.content}</textarea>
        </div>
    </div>
    <div class="layui-form-item">
        <label for="categoryId" class="layui-form-label">工作类别</label>
        <div class="layui-input-inline ">
                <select  id="categoryId" name="categoryId"></select>
        </div>
    </div>
    <div class="layui-form-item" style="display: none">
        <label for="createbyId" class="layui-form-label">创建者ID</label>
        <div class="layui-input-inline">
            <input type="text" id="createbyId" name="createbyId"  value="${activity.createbyId}" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label for="creator" class="layui-form-label">创建者</label>
        <div class="layui-input-inline">
            <input type="text" id="creator" name="creator" readonly="readonly" value="${activity.creator}" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label for="college" class="layui-form-label">学院</label>
        <div class="layui-input-inline">
            <input type="text" id="college" name="college" readonly="readonly" value="${activity.college}" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label for="creatorRole" class="layui-form-label">创建者角色</label>
        <div class="layui-input-inline">
            <input type="text" id="creatorRole" name="creatorRole" readonly="readonly" value="${activity.creatorRole}" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label for="time" class="layui-form-label">工作日期</label>
        <div class="layui-input-inline">
            <input type="text" id="time" name="time" lay-verify="required" value="${activity.time}" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label for="location" class="layui-form-label">地点</label>
        <div class="layui-input-inline">
            <input type="text" id="location" name="location" value="${activity.location}" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item" >
        <label for="semester" class="layui-form-label">学期</label>
        <div class="layui-input-inline">
                <select  id="semester" name="semester">
                    <option value="1">1</option>
                    <option value="2">2</option>
                </select>
        </div>
    </div>
    <div class="layui-form-item" >
        <label for="schoolyear" class="layui-form-label">学年</label>
        <div class="layui-input-inline">
                <select  id="schoolyear" name="schoolyear">
                </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label for="createTime" class="layui-form-label">创建时间</label>
        <div class="layui-input-inline">
            <input type="text" id="createTime" name="createTime" readonly="readonly" value="${activity.createTime}" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-upload">
            <button type="button" class="layui-btn" id="test2">图片上传</button>
        <blockquote class="layui-elem-quote layui-quote-nm" style="margin-top: 10px;width: 88%">
                预览图：
                <div class="layui-upload-list uploader-list" style="overflow: auto;" id="uploader-list">

                </div>
        </blockquote>
    </div>
    <div class="layui-form-item">
        <button class="layui-btn" lay-filter="add" lay-submit="">确定</button>
    </div>
</form>


<script>
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
                    if (item.id==${activity.categoryId}){
                        console.log("相等");
                        $('#categoryId').append(new Option(item.name, item.id,false,true));
                    }else {
                        console.log("不相等");
                        $('#categoryId').append(new Option(item.name, item.id));// 下拉菜单里添加元素
                    }
                });
                form.render('select');
                //重新渲染 固定写法
            }
        });

        //学年添加到下拉框中
        $.ajax({
            url:'/schoolyear/getSchoolyear',
            dataType:'json',
            type:'get',
            success:function (schoolyear) {
                $.each(schoolyear,function (index,item){
                    $('#schoolyear').append(new Option(item.schoolyear, item.schoolyear));
                });
                form.render("select");
            }
        });

        //默认选中学期
        var semester = $("#semester").find("option"); //获取select下拉框的所有值
        for (var j = 0; j < semester.length; j++) {
            if ($(semester[j]).val() == ${activity.semester}) {
                $(semester[j]).attr("selected", "selected");
            }
        }
            //默认选中学年
        var schoolyear = $("#schoolyear").find("option"); //获取select下拉框的所有值
        for (var j = 0; j < schoolyear.length; j++) {
            if ($(schoolyear[j]).val() == '${activity.schoolyear}') {
                $(schoolyear[j]).attr("selected", "selected");
            }
        }
        form.render('select');

    });

    //图片模块
    var imagePath;
    layui.use('upload', function() {
        var $ = layui.jquery
            , upload = layui.upload;
        //原有图片预览显示
        $.ajax({
            url: '/activity/getImage?id='+${activity.id},
            success: function(res) {
                var arr = JSON.parse(res);
                if (!arr.length) {
                    return;
                }
                var str = '';
                arr.forEach(function (item) {
                    // str = str + '<div><img src="' + item.path + '" height="440px" width="778px"></div>';
                    str = str+
                        '<div  class="file-iteme">' +
                        '<div id='+item.id+' class="handle"><span class="layui-icon layui-icon-delete"></span></div>' +
                        '<img style="width: 150px;height: 150px;" src='+item.path+ '>' +'</div>'
                });
                $('#uploader-list').append(str);
            }
        });
        //图片上传
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
        layer.confirm('真的删除图片么', {offset:"100px"},function (index) {
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

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
            <input type="text" name="id" id="id" value="${activity.id}" readonly="readonly" autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label for="topic" class="layui-form-label">
            <span class="we-red">*</span>工作主题
        </label>
        <div class="layui-input-inline" style="width: 800px">
            <input type="text" id="topic" name="topic"  value="${activity.topic}" readonly="readonly" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">工作内容</label>
        <div class="layui-input-block">
            <textarea id="content" name="content" class="layui-textarea" readonly="readonly">${activity.content}</textarea>
        </div>
    </div>
    <div class="layui-form-item" style="display:none">
        <label for="categoryId" class="layui-form-label">工作类别ID</label>
        <div class="layui-input-inline">
            <input type="text" id="categoryId" name="categoryId" readonly="readonly" value="${activity.categoryId}" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label for="category" class="layui-form-label">工作类别</label>
        <div class="layui-input-inline">
            <input type="text" id="category" name="category" readonly="readonly" value="${activity.category}" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item" style="display: none">
        <label for="createbyId" class="layui-form-label">创建者ID</label>
        <div class="layui-input-inline">
            <input type="text" id="createbyId" name="createbyId" readonly="readonly" value="${activity.createbyId}" autocomplete="off" class="layui-input">
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
            <input type="text" id="time" name="time" readonly="readonly" value="${activity.time}" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label for="location" class="layui-form-label">地点</label>
        <div class="layui-input-inline">
            <input type="text" id="location" name="location" readonly="readonly" value="${activity.location}" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label for="semester" class="layui-form-label">学期</label>
        <div class="layui-input-inline">
            <input type="text" id="semester" name="semester" readonly="readonly" value="${activity.semester}" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label for="schoolyear" class="layui-form-label">学年</label>
        <div class="layui-input-inline">
            <input type="text" id="schoolyear" name="schoolyear" readonly="readonly" value="${activity.schoolyear}" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label for="createTime" class="layui-form-label">创建时间</label>
        <div class="layui-input-inline">
            <input type="text" id="createTime" name="createTime" readonly="readonly" value="${activity.createTime}" autocomplete="off" class="layui-input">
        </div>
    </div>
</form>

<%--图片轮播 展示照片--%>
<div class="layui-carousel" id="test10">
    <div carousel-item="" class="carousel-wrapper">
    </div>
</div>

<button class="layui-btn layui-btn-normal" onclick="window.location.href=('/activity/goEdit?id='+${activity.id})">修改</button>

<script>
    //不是本人 修改按钮不出现
    if(${activity.createbyId}!=${sessionScope.loginUser.id}){
        $('.layui-btn').hide();
    }

    window.onload = function() {
        $.ajax({
            url: '/activity/getImage?id='+${activity.id},
            success: function(res) {
                var arr = JSON.parse(res);
                if (!arr.length) {
                    $('.layui-carousel').hide();
                    return;
                }
                var str = '';
                arr.forEach(function(item) {
                    str = str + '<div><img src="'+ item.path +'" height="440px" width="778px"></div>';
                });
                $('.carousel-wrapper').html(str);

                layui.use(['form','carousel'], function() {
                    var form = layui.form;
                    var carousel = layui.carousel;

                    form.render();
                    //图片轮播
                    carousel.render({
                        elem: '#test10'
                        ,width: '778px'
                        ,height: '440px'
                        ,interval: 5000
                    });
                });
            }
        })

    }

</script>

</body>

</html>

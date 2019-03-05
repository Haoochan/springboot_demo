<%--
  Created by IntelliJ IDEA.
  User: Rayho.chen
  Date: 2018/12/27
  Time: 17:01
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
</head>
<div class="layui-upload">
    <div class="layui-upload-list">
        <div class="upload-img"></div>
        <p id="demoText"></p>
        <button type="button" class="layui-btn layui-btn-img" lay-verify="required" id="test1">上传照片</button>
    </div>
</div>

<script>

    layui.use('upload', function(){
        var $ = layui.jquery
            ,upload = layui.upload;
        //普通图片上传
        var uploadInst = upload.render({
            elem: '#test1'
            ,method:'post'
            ,url: '/activity/upload'
            ,multiple:true
            ,done: function(res){
                //如果上传失败
                if(res.code > 0){
                    return layer.msg('上传失败');
                }
                //上传成功
                if(res.code==0){
                    $('.upload-img').html('<img class="layui-upload-img" style="width:80px;height:100px" src="/image/'+res.src+'" id="demo1"> <p id="demoText"></p>');
                    $('.layui-btn-img').css({"margin-left":"104px","width":"90px","margin-top":"6px"});
                    $('.layui-btn-img').text("重新上传");
                    return layer.msg('上传成功',{time:700});
                }
            }
        });
    });

</script>

</html>

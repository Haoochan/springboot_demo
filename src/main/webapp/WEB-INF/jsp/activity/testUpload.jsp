<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/4
  Time: 21:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

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
<div class="layui-upload">
        <button type="button" class="layui-btn" id="test2">图片上传</button>
    <blockquote class="layui-elem-quote layui-quote-nm" style="margin-top: 10px;width: 88%">
            预览图：
            <div class="layui-upload-list uploader-list" style="overflow: auto;" id="uploader-list">

            </div>
    </blockquote>
</div>

</body>
</html>

<script>
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
                console.log(id);
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
        console.log(imageId);
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

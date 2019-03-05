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
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
    <legend>多文件列表上传</legend>
</fieldset>
<div class="layui-upload">
    <button type="button" class="layui-btn layui-btn-normal" id="testList">选择多文件</button>
    <div class="layui-upload-list">
        <table class="layui-table">
            <thead>
            <tr><th>文件名</th>
                <th>大小</th>
                <th>状态</th>
                <th>操作</th>
            </tr></thead>
            <tbody id="demoList"></tbody>
        </table>
    </div>
    <button type="button" class="layui-btn" id="testListAction">开始上传</button>
</div>

<script>

    layui.use('upload', function(){
        var $ = layui.jquery
            ,upload = layui.upload;
        //多文件列表示例
        var demoListView = $('#demoList')
            ,uploadListIns = upload.render({
            elem: '#testList'
            ,url: '/activity/upload'
            ,accept: 'file'
            ,multiple: true
            ,auto: false
            ,bindAction: '#testListAction'
            ,choose: function(obj){
                var files = this.files = obj.pushFile(); //将每次选择的文件追加到文件队列
                //读取本地文件
                obj.preview(function(index, file, result){
                    var tr = $(['<tr id="upload-'+ index +'">'
                        ,'<td>'+ file.name +'</td>'
                        ,'<td>'+ (file.size/1014).toFixed(1) +'kb</td>'
                        ,'<td>等待上传</td>'
                        ,'<td>'
                        ,'<button class="layui-btn layui-btn-mini demo-reload layui-hide">重传</button>'
                        ,'<button class="layui-btn layui-btn-mini layui-btn-danger demo-delete">删除</button>'
                        ,'</td>'
                        ,'</tr>'].join(''));
                    //单个重传
                    tr.find('.demo-reload').on('click', function(){
                        obj.upload(index, file);
                    });
                    //删除
                    tr.find('.demo-delete').on('click', function(){
                        delete files[index]; //删除对应的文件
                        tr.remove();
                        uploadListIns.config.elem.next()[0].value = ''; //清空 input file 值，以免删除后出现同名文件不可选
                    });
                    demoListView.append(tr);
                });
            }
            ,done: function(res, index, upload){
                if(res.code == 0){ //上传成功
                    var tr = demoListView.find('tr#upload-'+ index)
                        ,tds = tr.children();
                    tds.eq(2).html('<span style="color: #5FB878;">上传成功</span>');
                    // tds.eq(3).html(''); //清空操作
                    tds.eq(3).html('<button class="layui-btn layui-btn-mini show">预览</button>' +
                        '<button class="layui-btn layui-btn-mini delete">删除</button>');
                    //预览
                    tr.find('.show').on('click', function(){
                        var img = '<img style="width:500px;height:500px" src="/image/'+res.src+'">';
                        layer.open({
                            type: 1,
                            title: false,
                            closeBtn: 0,
                            shadeClose: true,
                            skin: 'yourclass',
                            area: ['400px', '400px'],
                            content: img
                        });
                    });
                    //删除
                    tr.find('.delete').on('click', function(){
                        layer.confirm('真的删除图片么', function (index) {
                            $.ajax({
                                url: "/activity/imageDelete",
                                type: "POST",
                                data: {"id": res.imageId},
                                success: function (data) {
                                    if (data == "ok") {
                                        tr.remove();
                                        layer.close(index);
                                        layer.msg("删除成功", {icon: 6});

                                    } else {
                                        layer.msg("删除失败", {icon: 5});
                                    }
                                }
                            });
                        });
                        // tr.remove();
                        console.log("数据库删除操作");
                    });
                    return delete this.files[index]; //删除文件队列已经上传成功的文件
                }
                this.error(index, upload);
            }
            ,error: function(index, upload){
                var tr = demoListView.find('tr#upload-'+ index)
                    ,tds = tr.children();
                tds.eq(2).html('<span style="color: #FF5722;">上传失败</span>');
                tds.eq(3).find('.demo-reload').removeClass('layui-hide'); //显示重传
            }
        });
    });

</script>

</html>

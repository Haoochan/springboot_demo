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
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
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
        <div class="layui-input-block ">
                <select  id="categoryId" name="categoryId">
                </select>
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
    <div class="layui-form-item" >
        <label for="semester" class="layui-form-label">学期</label>
        <div class="layui-input-inline">
            <%--<input type="text" id="semester" name="semester" lay-verify="required" value="${activity.semester}" autocomplete="off" class="layui-input">--%>
                <select  id="semester" name="semester">
                    <option value="1">1</option>
                    <option value="2">2</option>
                </select>
        </div>
    </div>
    <div class="layui-form-item" >
        <label for="schoolyear" class="layui-form-label">学年</label>
        <div class="layui-input-inline">
            <%--<input type="text" id="schoolyear" name="schoolyear" lay-verify="required" value="${activity.schoolyear}" autocomplete="off" class="layui-input">--%>
                <select  id="schoolyear" name="schoolyear">
                    <option value="2018-2019">2018-2019</option>
                    <option value="2017-2018">2017-2018</option>
                </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label for="createTime" class="layui-form-label">创建时间</label>
        <div class="layui-input-inline">
            <input type="text" id="createTime" name="createTime" readonly="readonly" value="${activity.createTime}" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <button class="layui-btn" lay-filter="add" lay-submit="">确定</button>
    </div>
</form>
${activity.schoolyear}


<script>
    layui.use(['form','laydate'], function() {
        var form = layui.form;
        var laydate = layui.laydate;
        form.render();

        //日期插件
        laydate.render({
            elem: '#time' //指定元素
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
</script>

</body>

</html>

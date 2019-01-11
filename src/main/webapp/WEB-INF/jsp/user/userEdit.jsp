<%--
  Created by IntelliJ IDEA.
  User: rayho.chen
  Date: 2018/12/19
  Time: 17:08
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
<form class="layui-form layui-form-pane" action="/user/edit">
    <div class="layui-form-item" style="display: none">
        <label for="id" class="layui-form-label">ID</label>
        <div class="layui-input-inline">
            <input type="password" id="id" name="id" value="${user.id}" lay-verify="required" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label for="username" class="layui-form-label">
            <span class="we-red">*</span>用户名
        </label>
        <div class="layui-input-inline">
            <input type="text" id="username" name="username" value="${user.username}" lay-verify="required" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label for="password" class="layui-form-label">密码</label>
        <div class="layui-input-inline">
            <input type="password" id="password" name="password" value="${user.password}" lay-verify="required" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label for="name" class="layui-form-label">姓名</label>
        <div class="layui-input-inline">
            <input type="text" id="name" name="name" value="${user.name}" lay-verify="required" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">角色</label>
        <div class="layui-input-inline">
            <select  id="role" name="role" lay-verify="required" lay-filter="role">
                <option value="助班">助班</option>
                <option value="班主任">班主任</option>
                <option value="学院管理员">学院管理员</option>
                <option value="系统管理员">系统管理员</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item" id="collegeDiv">
        <label for="college" class="layui-form-label">学院</label>
        <div class="layui-input-inline">
            <select  id="college" name="college" lay-filter="college">
                <option value="0">请选择学院</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item" id="majorDiv">
        <label for="major" class="layui-form-label">专业</label>
        <div class="layui-input-inline">
            <select  id="major" name="major" lay-filter="major">
                <option value="0">请选择专业</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item" id="classesDiv" >
        <label for="classes" class="layui-form-label">班级</label>
        <div class="layui-input-inline">
            <select  id="classes" name="classes" lay-filter="classes">
                <option value="0">请选择班级</option>
            </select>
        </div>
    </div>
    <button class="layui-btn"  lay-filter="addClasses">
        <i class="layui-icon">&#xe608;</i> 添加班级
    </button>
    <div class="layui-form-item" id="classesDiv2" hidden="hidden">
        <label for="classes2" class="layui-form-label">班级</label>
        <div class="layui-input-inline">
            <select  id="classes2" name="classes2" lay-filter="classes2">
                <option value="0">请选择班级</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">性别</label>
        <div class="layui-input-block">
            <input type="radio" name="sex" value="男" title="男" <c:if test="${user.sex=='男' }">checked="checked"</c:if>>
            <input type="radio" name="sex" value="女" title="女" <c:if test="${user.sex=='女' }">checked="checked"</c:if>>
        </div>
    </div>
    <div class="layui-form-item">
        <label for="phone" class="layui-form-label">电话</label>
        <div class="layui-input-inline">
            <input type="text" id="phone" name="phone" value="${user.phone}" lay-verify="required" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label for="email" class="layui-form-label">邮箱</label>
        <div class="layui-input-inline">
            <input type="text" id="email" name="email" value="${user.email}" lay-verify="required" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <%--<button class="layui-btn" lay-filter="add" lay-submit="" onclick="reload()">确定</button>--%>
        <button class="layui-btn" lay-filter="add" lay-submit="" >确定</button>
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
        form.render();

        //默认选中角色
        var role = $("#role").find("option"); //获取select下拉框的所有值
        for (var j = 1; j < role.length; j++) {
            if ($(role[j]).val() == '${user.role}') {
                $(role[j]).attr("selected", "selected");
                form.render('select');
            }
        }

        //学院添加到下拉框中 并默认选中
        $.ajax({
            url: '/college/getCollege',
            dataType: 'json',
            type: 'get',
            success: function (college) {
                console.log(college);
                $.each(college, function (index, item) {
                    if (item.id==${user.collegeId}){
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
            url: '/major/getMajor?id=' + ${user.collegeId},
            dataType: 'json',
            type: 'get',
            success: function (major) {
                console.log(major);
                $.each(major, function (index, item) {
                    if (item.id==${user.majorId}){
                        $('#major').append(new Option(item.name, item.id,false,true));
                    }else {
                        $('#major').append(new Option(item.name, item.id));// 下拉菜单里添加元素
                    }
                });
                form.render("select");
                //重新渲染 固定写法
            }
        });

        //监听学院下拉框选择变动 把专业添加到下拉框中
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
                            if (item.id==${user.majorId}){
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

        //监听角色下拉框 根据角色去隐藏可选项
        form.on('select(role)', function(data){
            var value = data.value;
            if (value=="系统管理员") {
                //根据 div里面的id 去隐藏
                $('#collegeDiv').hide();
                $('#majorDiv').hide();
                $('#classesDiv').hide();
            }else if(value=="学院管理员"){
                $('#collegeDiv').show();
                $('#majorDiv').hide();
                $('#classesDiv').hide();
            }else{
                $('#collegeDiv').show();
                $('#majorDiv').show();
                $('#classesDiv').show()
            }
            form.render('select');
        });

        //根据角色默认值隐藏展示下拉框
        {
            var roleShow = $('#role').val();
            if (roleShow == "系统管理员") {
                //根据 div里面的id 去隐藏
                $('#collegeDiv').hide();
                $('#majorDiv').hide();
                $('#classesDiv').hide();
            } else if (roleShow == "学院管理员") {
                $('#collegeDiv').show();
                $('#majorDiv').hide();
                $('#classesDiv').hide();
            } else {
                $('#collegeDiv').show();
                $('#majorDiv').show();
                $('#classesDiv').show()
            }
            form.render('select');
        }

        //增加班级按钮，点击后增加多一个班级
        form.on('submit(addClasses)',function (data) {
            $('#addClasses').show();
            form.render();
            console.log(data.elem); //被执行事件的元素DOM对象，一般为button对象
            console.log(data.form); //被执行提交的form对象，一般在存在form标签时才会返回
            console.log(data.field);//当前容器的全部表单字段，名值对形式：{name: value}
            return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。

        })



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

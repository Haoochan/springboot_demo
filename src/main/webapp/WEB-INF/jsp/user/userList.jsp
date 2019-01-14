<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="../../../static/layui/css/layui.css" media="all">
    <script src="../../../static/jquery-1.10.2.js"></script>
    <script src="../../../static/layui/layui.all.js"></script>
    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->


</head>
<body>
<h3>用户列表</h3>

<%--搜索列表--%>
<form class="layui-form layui-form-pane" >
    <div class="layui-inline">
        <input class="layui-input" name="keyword" id="keyword" placeholder="请输入关键词" autocomplete="off">
    </div>
    <div class="layui-input-inline ">
        <select  id="role" name="role">
            <option value="">请选择用户角色</option>
            <option value="助班">助班</option>
            <option value="班主任">班主任</option>
            <option value="学院管理员">学院管理员</option>
            <option value="班主任">班主任</option>
        </select>
    </div>
    <div class="layui-input-inline">
        <select  id="sex" name="sex">
            <option value="">请选择性别</option>
            <option value="男">男</option>
            <option value="女">女</option>
        </select>
    </div>
    <div class="layui-input-inline">
        <select  id="college" name="college" lay-filter="college">
            <option value="">请选择学院</option>
        </select>
    </div>
    <div class="layui-input-inline">
        <select  id="major" name="major" lay-filter="major">
            <option value="">请选择专业</option>
        </select>
    </div>
    <div class="layui-input-inline">
        <select  id="classes" name="classes">
            <option value="">请选择班级</option>
        </select>
    </div>
    <div class="layui-form-item">
        <input type=button class="layui-btn" value="搜索" id="search"/>
    </div>
</form>

<button class="layui-btn" onclick="add();">
    <i class="layui-icon">&#xe608;</i> 添加
</button>

<table class="layui-table" lay-data="{height: 500, cellMinWidth: 80, url:'/user/list', page:true, limit:10, id:'idTest'}" lay-filter="demo">
    <thead>
    <tr>
        <th lay-data="{type:'checkbox', fixed: 'left'}"></th>
        <th lay-data="{title: '序号', width:80, type:'numbers'}">序号</th>
        <th lay-data="{field:'name', width:200}">名字</th>
        <th lay-data="{field:'role', width:200}">角色</th>
        <th lay-data="{field:'classes', width:200}">班级</th>
        <th lay-data="{field:'major', width:200}">专业</th>
        <th lay-data="{field:'college', width:200}">学院</th>
        <th lay-data="{field:'sex', width:200}">性别</th>
        <th lay-data="{field:'phone', width:300}">电话</th>
        <th lay-data="{field:'email', width:300}">邮箱</th>
        <th lay-data="{fixed: 'right', width:178, align:'center', toolbar: '#barDemo'}"></th>
    </tr>
    </thead>
</table>

<%--工具栏--%>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>


<script src="../../../static/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    //添加方法
    function add() {
//页面层
        layer.open({
            type: 2,
            title: '添加类别',
            skin: 'layui-layer-rim', //加上边框
            area: ['500px', '500px'], //宽高
            content: '/user/goAdd'  //调到新增页面
        });
    }
    //编辑方法
    function  edit(data) {
        console.log(data);
        var index = layui.layer.open({
            title : "编辑用户",
            type : 2,
            closeBtn: 2,         //是否显示关闭按钮
            area: ['500px', '560px'],
            content : "/user/goEdit?id="+data.id//弹出层页面
        })
    }
    //查看方法
    function show(data) {
        console.log(data);
        var index = layui.layer.open({
            title : "查看用户",
            type : 2,
            closeBtn: 2,         //是否显示关闭按钮
            area: ['500px', '560px'],
            content : "/user/goShow?id="+data.id//弹出层页面
        })
    }


</script>
<script>
    layui.use(['table','form'], function(){
        var table = layui.table;
        var form = layui.form;
        table.render();
        form.render();

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

        //监听专业下拉框 把班级添加到下拉框中
        form.on('select(major)', function(data){
            $('#classes').html("");//清空下拉框
            $('#classes').append(new Option("请选择班级",''));//添加提示
            form.render('select');
            var value = data.value;
            console.log(value);
            if (value!='') {
                $.ajax({
                    url: '/classes/getClasses?id=' + value,
                    dataType: 'json',
                    type: 'get',
                    success: function (classes) {
                        console.log(classes);
                        $.each(classes, function (index, item) {
                            $('#classes').append(new Option(item.name, item.id));// 下拉菜单里添加元素
                        });
                        form.render("select");
                        //重新渲染 固定写法
                    }
                });
            }
        });



        //条件搜索
        $("#search").click(function () {
            var keyword = $('#keyword');
            var role = $('#role');
            var sex = $('#sex');
            var college = $('#college');
            var major = $('#major');
            var classes = $('#classes');
            //idTest 是表单lay-data 里面的id
            table.reload('idTest', {
                where: {
                    keyword: keyword.val(),
                    role:role.val(),
                    sex:sex.val(),
                    college:college.val(),
                    major:major.val(),
                    classes:classes.val()
                }
            });
        });


        //监听表格复选框选择
        table.on('checkbox(demo)', function(obj){
            console.log(obj)
        });
        //监听工具条
        table.on('tool(demo)', function(obj){
            var data = obj.data;
            if(obj.event === 'detail'){
                show(data);
            } else if(obj.event === 'del'){
                layer.confirm('真的删除行么', function(index){
                    console.log(data);
                    $.ajax({
                        url: "/user/delete",
                        type: "POST",
                        data:{"id":data.id},
                        // dataType: "json",
                        success: function(data){
                            if(data=="ok"){
                                //前端页面删除这一行 有下面提示出来的
                                obj.del();
                                //页面刷新 没有下面提示出来的
                                // location.reload();
                                //关闭弹框
                                layer.close(index);
                                layer.msg("删除成功", {icon: 6});
                            }else{
                                layer.msg("删除失败", {icon: 5});
                            }
                        }

                    });
                });
            } else if(obj.event === 'edit'){
                //这里一般是发送修改的Ajax请求
                edit(data);
            }
        });

        $('.demoTable .layui-btn').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });
    });
</script>

</body>
</html>
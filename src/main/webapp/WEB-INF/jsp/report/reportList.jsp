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
<h3>工作记录列表</h3>

<%--搜索列表--%>
<form class="layui-form layui-form-pane" >
    <div class="layui-inline">
        <input class="layui-input" name="keyword" id="keyword" placeholder="请输入用户名" autocomplete="off">
    </div>
    <div class="layui-input-inline " id="college">
        <select  id="collegeId" name="collegeId">
            <option value="">请选择学院</option>
        </select>
    </div>
    <div class="layui-input-inline ">
        <select  id="createbyId" name="createbyId">
            <option value="">请选择创建者</option>
        </select>
    </div>
    <div class="layui-input-inline ">
        <select  id="creatorRole" name="creatorRole">
            <option value="">请选择创建者角色</option>
            <option value="助班">助班</option>
            <option value="班主任">班主任</option>
            <option value="学院管理员">学院管理员</option>
            <option value="系统管理员">系统管理员</option>
        </select>
    </div>
    <div class="layui-input-inline">
        <select  id="schoolyear" name="schoolyear">
            <option value="">请选择学年</option>
            <option value="2018-2019" selected="selected">2018-2019</option>
            <option value="2017-2018">2017-2018</option>
        </select>
    </div>
    <div class="layui-input-inline">
        <select  id="semester" name="semester">
            <option value="">请选择学期</option>
            <option value="1">1</option>
            <option value="2">2</option>
        </select>
    </div>

    <div class="layui-form-item">
        <input type=button class="layui-btn" value="搜索" id="search"/>
    </div>
</form>

<table class="layui-table" lay-data="{height: 500, cellMinWidth: 80, url:'/report/list', where:{schoolyear:'2018-2019'}, page:true, limit:10, id:'idTest'}" lay-filter="demo">
    <thead>
    <tr>
        <th lay-data="{type:'checkbox', fixed: 'left'}"></th>
        <th lay-data="{title: '序号', width:50, type:'numbers'}">序号</th>
        <th lay-data="{field:'username', width:200}">用户</th>
        <th lay-data="{field:'categoryCountA', width:100}">工作会议</th>
        <th lay-data="{field:'categoryCountB', width:100}">工作反馈</th>
        <th lay-data="{field:'categoryCountC', width:100}">学生活动</th>
        <th lay-data="{field:'categoryCountD', width:100}">学生交流</th>
        <th lay-data="{field:'categoryCountE', width:80}">其他</th>
        <th lay-data="{field:'totalCountByUser', width:80}">总数</th>
        <th lay-data="{fixed: 'right', width:178, align:'center', toolbar: '#barDemo'}"></th>
    </tr>
    </thead>
</table>


<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看工作</a>
</script>


<script src="../../../static/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>

    function show(data) {
        console.log(data.userId);
        var schoolyear =$('#schoolyear').val();
        var index = layui.layer.open({
            title : "查看工作",
            type : 2,
            closeBtn: 2,         //是否显示关闭按钮
            area: ['90%', '90%'],
            content : "/activity/goUserList?userId="+data.userId+"&schoolyear="+schoolyear//弹出层页面

        })
    }


</script>
<script>
    //渲染表单
    layui.use(['table','form'], function(){
        var table = layui.table;
        var form = layui.form;
        table.render();

        //如果不是系统管理员 无法搜索学院
        var role ="${sessionScope.loginUser.role}";
        if (role !== "系统管理员")
        {
            $('#college').hide();
            form.render();
        }

        //条件搜索
        $("#search").click(function () {
            var keyword = $('#keyword');
            var createbyId = $('#createbyId');
            var creatorRole = $('#creatorRole');
            var semester = $('#semester');
            var schoolyear = $('#schoolyear');
            var collegeId = $('#collegeId');

            //idTest 是表单lay-data 里面的id
            table.reload('idTest', {
                where: {
                    keyword: keyword.val(),
                    creatorId: createbyId.val(),
                    role:creatorRole.val(),
                    semester:semester.val(),
                    schoolyear:schoolyear.val(),
                    collegeId:collegeId.val()
                }
            });
        });

        //创建者添加到下拉框中
        $.ajax({
            url: '/user/getUser',
            dataType: 'json',
            type: 'get',
            success: function (creator) {
                console.log(creator);
                $.each(creator, function (index, item) {
                    $('#createbyId').append(new Option(item.name, item.id));// 下拉菜单里添加元素
                });
                form.render("select");
                //重新渲染 固定写法
            }
        });

        //学院添加到下拉框中
        $.ajax({
            url: '/college/getCollege',
            dataType: 'json',
            type: 'get',
            success: function (college) {
                $.each(college, function (index, item) {
                    $('#collegeId').append(new Option(item.name, item.id));// 下拉菜单里添加元素
                });
                form.render("select");
                //重新渲染 固定写法
            }
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
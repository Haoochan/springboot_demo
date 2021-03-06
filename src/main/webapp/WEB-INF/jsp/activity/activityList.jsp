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
<%--<h3>工作记录列表</h3>--%>

<%--搜索列表--%>
<form class="layui-form layui-form-pane" >
    <div class="layui-input-inline" style="width: 150px">
        <input class="layui-input" name="keyword" id="keyword" placeholder="请输入关键词" autocomplete="off">
    </div>
    <div class="layui-input-inline " style="width: 150px">
        <select  id="categoryId" name="categoryId">
            <option value="">请选择工作类别</option>
        </select>
    </div>
    <div class="layui-input-inline " id="college" style="width: 150px">
        <select  id="collegeId" name="collegeId">
            <option value="">请选择学院</option>
        </select>
    </div>
    <div class="layui-input-inline " style="width: 150px">
        <select  id="createbyId" name="createbyId">
            <option value="">请选择创建者</option>
        </select>
    </div>
    <div class="layui-input-inline " style="width: 150px">
        <select  id="creatorRole" name="creatorRole">
            <option value="">请选择创建者角色</option>
            <option value="助班">助班</option>
            <option value="班主任">班主任</option>
            <option value="学院管理员">学院管理员</option>
            <option value="系统管理员">系统管理员</option>
        </select>
    </div>
    <div class="layui-input-inline" style="width: 150px">
        <select  id="semester" name="semester">
            <option value="">请选择学期</option>
            <option value="1">1</option>
            <option value="2">2</option>
        </select>
    </div>
    <div class="layui-input-inline" style="width: 150px">
        <select  id="schoolyear" name="schoolyear" >
            <option value="">请选择学年</option>
        </select>
    </div>
    <div class="layui-input-inline">
        <input type=button class="layui-btn" value="搜索" id="search"/>
    </div>
</form>

<button class="layui-btn" onclick="add();">
    <i class="layui-icon">&#xe608;</i> 添加
</button>


<table class="layui-table" lay-data="{height: 500, cellMinWidth: 80, url:'/activity/list', page:true, limit:10, id:'idTest',
           initSort:{field:'time',type:'desc'}}" lay-filter="demo">
    <thead>
    <tr>
        <%--<th lay-data="{type:'checkbox', fixed: 'left'}"></th>--%>
        <th lay-data="{title: '序号', width:50, type:'numbers'}">序号</th>
        <th lay-data="{field:'topic', width:200}">主题</th>
        <th lay-data="{field:'category', width:150}">类别</th>
        <th lay-data="{field:'creator', width:150}">用户</th>
        <th lay-data="{field:'college', width:150}">学院</th>
        <th lay-data="{field:'creatorRole', width:100}">角色</th>
        <th lay-data="{field:'time', width:150}">时间</th>
        <th lay-data="{field:'location', width:150}">地点</th>
        <th lay-data="{field:'schoolyear', width:100}">学年</th>
        <th lay-data="{field:'semester', width:80}">学期</th>
        <th lay-data="{fixed: 'right', width:178, align:'center', toolbar: '#barDemo'}"></th>
    </tr>
    </thead>
</table>


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
        layer.open({
            type: 2,
            title: '添加工作',
            skin: 'layui-layer-rim', //加上边框
            area: ['95%', '95%'], //宽高
            content: '/activity/goAdd'  //调到新增页面
        });
    }
    function  edit(data) {
        var userId =${sessionScope.loginUser.id};
        if (userId ===data.createbyId){
        var index = layui.layer.open({
            title : "编辑工作",
            type : 2,
            closeBtn: 2,         //是否显示关闭按钮
            area: ['90%', '90%'],
            content : "/activity/goEdit?id="+data.id,//弹出层页面
            end: function () {
                window.location.reload();
            }
        })
        }else {
            layer.msg("没有权限");
        }
    }

    function show(data) {
        var role ="${sessionScope.loginUser.role}";
        var userId =${sessionScope.loginUser.id};
        if (userId ===data.createbyId ||role === "系统管理员" || role === "学院管理员"){
        var index = layui.layer.open({
            title : "查看工作",
            type : 2,
            closeBtn: 2,         //是否显示关闭按钮
            area: ['90%', '90%'],
            content : "/activity/goShow?id="+data.id,//弹出层页面
            //点击关闭按钮 页面刷新
            end: function () {
                // window.location.reload();
            }
        })
        }else {
            layer.msg("没有权限");
        }
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
                var categoryId = $('#categoryId');
                var createbyId = $('#createbyId');
                var creatorRole = $('#creatorRole');
                var semester = $('#semester');
                var schoolyear = $('#schoolyear');
                var collegeId = $('#collegeId');

                //idTest 是表单lay-data 里面的id
                table.reload('idTest', {
                    // url:'/activity/list',
                    where: {
                        keyword: keyword.val(),
                        categoryId: categoryId.val(),
                        createbyId: createbyId.val(),
                        creatorRole:creatorRole.val(),
                        semester:semester.val(),
                        schoolyear:schoolyear.val(),
                        collegeId:collegeId.val()
                    }
                });
        });

        //工作类别添加到下拉框中
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
                var role ="${sessionScope.loginUser.role}";
                var userId =${sessionScope.loginUser.id};
                if (userId ===data.createbyId ||role === "系统管理员" || role === "学院管理员") {
                    layer.confirm('真的删除行么', function (index) {
                        $.ajax({
                            url: "/activity/delete",
                            type: "POST",
                            data: {"id": data.id},
                            success: function (data) {
                                if (data == "ok") {
                                    //前端页面删除这一行 有下面提示出来的
                                    obj.del();
                                    //页面刷新 没有下面提示出来的
                                    // location.reload();
                                    //关闭弹框
                                    layer.close(index);
                                    layer.msg("删除成功", {icon: 6});

                                } else {
                                    layer.msg("删除失败", {icon: 5});
                                }
                            }
                        });
                    });
                }else {
                    layer.msg("没有权限");
                }
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
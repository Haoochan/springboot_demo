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
</head>
<body>
<%--<h3>公告列表</h3>--%>

<%--搜索列表--%>
<form class="layui-form layui-form-pane" >
    <%--<label for="keyword" class="layui-form-label">关键词</label>--%>
    <div class="layui-inline">
        <input class="layui-input" name="keyword" id="keyword" placeholder="请输入关键词" autocomplete="off">
    </div>
    <%--<label for="categoryId" class="layui-form-label">工作类别</label>--%>
    <div class="layui-input-inline ">
        <select  id="categoryId" name="categoryId">
            <option value="">请选择公告类别</option>
        </select>
    </div>
    <div class="layui-input-inline " id="college">
        <select  id="collegeId" name="collegeId" lay-filter="collegeId">
            <option value="">请选择学院</option>
        </select>
    </div>
    <div class="layui-input-inline ">
        <select  id="majorId" name="majorId">
            <option value="">请选择专业</option>
        </select>
    </div>
    <div class="layui-input-inline">
        <input type=button class="layui-btn" value="搜索" id="search"/>
    </div>
</form>

<button class="layui-btn" onclick="add();">
    <i class="layui-icon">&#xe608;</i> 添加
</button>


<table class="layui-table" lay-data="{height: 500, cellMinWidth: 80, url:'/notice/list', page:true, limit:10, id:'idTest',
           initSort:{field:'time',type:'desc'} }" lay-filter="demo">
    <thead>
    <tr>
        <%--<th lay-data="{type:'checkbox', fixed: 'left'}"></th>--%>
        <th lay-data="{title: '序号', width:80, type:'numbers'}">序号</th>
        <th lay-data="{field:'title', width:400}">标题</th>
        <th lay-data="{field:'category', width:80}">类别</th>
        <th lay-data="{field:'time', width:200}">时间</th>
        <th lay-data="{field:'user', width:150}">用户</th>
        <th lay-data="{field:'college', width:150}">学院</th>
        <th lay-data="{field:'major', width:150}">专业</th>
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
        var role ="${sessionScope.loginUser.role}";
        if (role === "系统管理员" || role === "学院管理员") {
            layer.open({
                type: 2,
                title: '添加公告',
                skin: 'layui-layer-rim', //加上边框
                area: ['90%', '90%'], //宽高
                content: '/notice/goAdd'  //调到新增页面
            });
        } else {
            layer.msg("没有权限");
        }
    }
    function  edit(data) {
        var role ="${sessionScope.loginUser.role}";
        if (role === "系统管理员" || role === "学院管理员") {
            var index = layui.layer.open({
                title: "编辑公告",
                type: 2,
                closeBtn: 2,         //是否显示关闭按钮
                area: ['90%', '90%'],
                content: "/notice/goEdit?id=" + data.id,//弹出层页面
                end: function () {
                    location.reload();
                }
            })
        } else {
            layer.msg("没有权限");
        }
    }

    function show(data) {
        var index = layui.layer.open({
            title : "查看公告",
            type : 2,
            closeBtn: 2,         //是否显示关闭按钮
            area: ['90%', '90%'],
            content : "/notice/goShow?id="+data.id,//弹出层页面
            //点击关闭按钮 页面刷新
            end: function () {
                location.reload();
            }
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
            var categoryId = $('#categoryId');
            var collegeId = $('#collegeId');
            var majorId = $('#majorId');

            //idTest 是表单lay-data 里面的id
            table.reload('idTest', {
                url:'/notice/list',
                where: {
                    keyword: keyword.val(),
                    categoryId: categoryId.val(),
                    collegeId: collegeId.val(),
                    majorId: majorId.val()
                }
            });
        });

        //工作类别添加到下拉框中
        $.ajax({
            url: '/noticeCategory/getNoticeCategory',
            dataType: 'json',
            type: 'get',
            success: function (category) {
                $.each(category, function (index, item) {
                    $('#categoryId').append(new Option(item.name, item.id));// 下拉菜单里添加元素
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

        //本学院专业添加到下拉框中
        var role ="${sessionScope.loginUser.role}";
        if (role !== "系统管理员"){
            var userCollegeId =${sessionScope.userCollegeId};
            $.ajax({
                url: '/major/getMajor?id='+userCollegeId,
                dataType: 'json',
                type: 'get',
                success: function (major) {
                    $.each(major, function (index, item) {
                        $('#majorId').append(new Option(item.name, item.id));// 下拉菜单里添加元素
                    });
                    form.render("select");
                    //重新渲染 固定写法
                }
            });
        }


        //监听学院下拉框 把专业添加到下拉框中
        form.on('select(collegeId)', function(data){
            $('#majorId').html("");//清空下拉框
            $('#majorId').append(new Option("请选择专业",""));//添加提示
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
                            $('#majorId').append(new Option(item.name, item.id));// 下拉菜单里添加元素
                        });
                        form.render("select");
                        //重新渲染 固定写法
                    }
                });
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
                if (role ==="系统管理员" || role ==="学院管理员"){
                    layer.confirm('真的删除行么', function (index) {
                        $.ajax({
                            url: "/notice/delete",
                            type: "POST",
                            data: {"id": data.id},
                            // dataType: "json",
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
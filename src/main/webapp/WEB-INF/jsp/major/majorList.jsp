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
<%--<h3>专业列表</h3>--%>

<%--搜索列表--%>
<form class="layui-form layui-form-pane" >
    <div class="layui-inline">
        <input class="layui-input" name="keyword" id="keyword" placeholder="请输入关键词" autocomplete="off">
    </div>
    <div class="layui-input-inline" style="display: none">
        <select  id="college" name="college" lay-filter="college">
            <option value="">请选择学院</option>
        </select>
    </div>
    <div class="layui-input-inline">
        <input type=button class="layui-btn" value="搜索" id="search"/>
    </div>
</form>

<button class="layui-btn" onclick="add();">
    <i class="layui-icon">&#xe608;</i> 添加
</button>

<table class="layui-table" lay-data="{height: 500, cellMinWidth: 80, url:'/major/list', page:true, limit:10, id:'idTest'}" lay-filter="demo">
    <thead>
    <tr>
        <%--<th lay-data="{type:'checkbox', fixed: 'left'}"></th>--%>
        <th lay-data="{title: '序号', width:50, type:'numbers'}">序号</th>
        <th lay-data="{field:'name', width:200}">专业名称</th>
        <th lay-data="{field:'description', width:300}">描述</th>
        <th lay-data="{field:'collegeName', width:300}">学院</th>
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
        if (role ==="系统管理员" || role ==="学院管理员"){
            layer.open({
                type: 2,
                title: '添加专业',
                skin: 'layui-layer-rim', //加上边框
                area: ['500px', '500px'], //宽高
                content: '/major/goAdd'  //调到新增页面
            });
        }else {
            layer.msg("没有权限");
    }
    }
    function  edit(data) {
        var role ="${sessionScope.loginUser.role}";
        if (role ==="系统管理员" || role ==="学院管理员"){
            var index = layui.layer.open({
                title : "编辑专业",
                type : 2,
                closeBtn: 2,         //是否显示关闭按钮
                area: ['500px', '560px'],
                content : "/major/goEdit?id="+data.id//弹出层页面
            })
        }else {
            layer.msg("没有权限");
    }
    }

    function show(data) {
        console.log(data);
        var index = layui.layer.open({
            title : "查看专业",
            type : 2,
            closeBtn: 2,         //是否显示关闭按钮
            area: ['500px', '560px'],
            content : "/major/goShow?id="+data.id//弹出层页面
        })
    }


</script>
<script>
    layui.use(['table','form'], function(){
        var table = layui.table;
        var form = layui.form;
        table.render();

        var role ="${sessionScope.loginUser.role}";
        if (role ==="系统管理员"){
            $('.layui-input-inline').show();
            console.log(role);
        }
        form.render();

        // 学院添加到下拉框中
        $.ajax({
            url: '/college/getCollege',
            dataType: 'json',
            type: 'get',
            success: function (college) {
                $.each(college, function (index, item) {
                    $('#college').append(new Option(item.name, item.id));// 下拉菜单里添加元素
                });
                form.render("select");
                //重新渲染 固定写法
            }
        });

        //条件搜索
        $("#search").click(function () {
            var keyword = $('#keyword');
            var college = $('#college');
            //idTest 是表单lay-data 里面的id
            table.reload('idTest', {
                where: {
                    keyword: keyword.val(),
                    collegeId:college.val()
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
                var role ="${sessionScope.loginUser.role}";
                if (role ==="系统管理员" || role ==="学院管理员"){
                    layer.confirm('真的删除行么', function (index) {
                        console.log(data);
                        $.ajax({
                            url: "/major/delete",
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
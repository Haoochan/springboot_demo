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
<h3>公告类别列表</h3>

<button class="layui-btn" onclick="add();">
    <i class="layui-icon">&#xe608;</i> 添加
</button>

<table class="layui-table" lay-data="{height: 500, cellMinWidth: 80, url:'/noticeCategory/list', page:true, limit:10, id:'idTest'}" lay-filter="demo">
    <thead>
    <tr>
        <th lay-data="{type:'checkbox', fixed: 'left'}"></th>
        <th lay-data="{title: '序号', width:80, type:'numbers'}">序号</th>
        <th lay-data="{field:'name', width:200}">名称</th>
        <th lay-data="{field:'description', width:300}">描述</th>
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
        if (role !=="系统管理员"){
            layer.msg("没有权限");
        }else {
//页面层
        layer.open({
            type: 2,
            title: '添加公告类别',
            skin: 'layui-layer-rim', //加上边框
            area: ['500px', '500px'], //宽高
            content: '/noticeCategory/goAdd'  //调到新增页面
        });
    }
    }
    function  edit(data) {
        var role ="${sessionScope.loginUser.role}";
        if (role !=="系统管理员"){
            layer.msg("没有权限");
        }else {
        var index = layui.layer.open({
            title : "编辑公告类别",
            type : 2,
            closeBtn: 2,         //是否显示关闭按钮
            area: ['500px', '560px'],
            content : "/noticeCategory/goEdit?id="+data.id//弹出层页面
        })
    }
    }

    function show(data) {
        var index = layui.layer.open({
            title : "查看公告类别",
            type : 2,
            closeBtn: 2,         //是否显示关闭按钮
            area: ['500px', '560px'],
            content : "/noticeCategory/goShow?id="+data.id//弹出层页面
        })
    }


</script>
<script>
    layui.use('table', function(){
        var table = layui.table;
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
                if (role !=="系统管理员"){
                    layer.msg("没有权限");
                }else {
                    layer.confirm('真的删除行么', function (index) {
                        console.log(data);
                        $.ajax({
                            url: "/noticeCategory/delete",
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
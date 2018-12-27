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

<button class="layui-btn" onclick="add();">
    <i class="layui-icon">&#xe608;</i> 添加
</button>


<table class="layui-table" lay-data="{height: 500, cellMinWidth: 80, url:'/activity/list', page:true, limit:10, id:'idTest'}" lay-filter="demo">
    <thead>
    <tr>
        <th lay-data="{type:'checkbox', fixed: 'left'}"></th>
        <th lay-data="{title: '序号', width:80, type:'numbers'}">序号</th>
        <th lay-data="{field:'topic', width:200}">主题</th>
        <th lay-data="{field:'category', width:200}">类别</th>
        <th lay-data="{field:'creator', width:150}">用户</th>
        <th lay-data="{field:'creatorRole', width:100}">角色</th>
        <th lay-data="{field:'time', width:150}">时间</th>
        <th lay-data="{field:'schoolyear', width:150}">学年</th>
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
//页面层
        layer.open({
            type: 2,
            title: '添加类别',
            skin: 'layui-layer-rim', //加上边框
            area: ['90%', '90%'], //宽高
            content: '/activityCategory/goAdd'  //调到新增页面
        });
    }
    function  edit(data) {
        console.log(data);
        var index = layui.layer.open({
            title : "编辑用户",
            type : 2,
            closeBtn: 2,         //是否显示关闭按钮
            area: ['500px', '560px'],
            content : "/activityCategory/goEdit?id="+data.id//弹出层页面
        })
    }

    function show(data) {
        console.log(data);
        var index = layui.layer.open({
            title : "查看用户",
            type : 2,
            closeBtn: 2,         //是否显示关闭按钮
            area: ['90%', '90%'],
            content : "/activity/goShow?id="+data.id//弹出层页面
        })
    }


</script>
<script>
    //渲染表单
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
                layer.confirm('真的删除行么', function(index){
                    console.log(data);
                    $.ajax({
                        url: "/activityCategory/delete",
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
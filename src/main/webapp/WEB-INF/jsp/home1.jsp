<%--
  Created by IntelliJ IDEA.
  User: rayho.chen
  Date: 2018/12/14
  Time: 17:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>华南农业大学班主任工作管理平台</title>
    <link rel="stylesheet" href="/static/layui/css/layui.css">
    <script src="/static/layui/layui.js"></script>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo" style="width: 400px"><img src="/image/indexImage/logo.jpg" class="layui-nav-img" style="width: 50px;height: 50px">华南农业大学班主任工作管理平台</div>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    ${user.name}
                </a>
                <dl class="layui-nav-child">
                    <dd><a onclick="goUserInfo()">基本资料</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="../login.jsp">安全退出</a></li>
        </ul>
    </div>

    <%--左侧菜单栏--%>
    <div class="layui-side layui-bg-black" style="width: 150px">
        <div class="layui-side-scroll" style="width: 100%">
            <!-- 左侧垂直导航区域-->
            <ul class="layui-nav layui-nav-tree" lay-filter="test" style="width: 100%">
                <li class="layui-nav-item">
                    <a class="" href="javascript:;">类别管理</a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="javascript:;" data-id="1" data-title="工作类别管理" data-url="/activityCategory/golist"
                               class="site-demo-active" data-type="tabAdd">工作类别管理</a>
                        </dd>
                    </dl>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="javascript:;" data-id="9" data-title="公告类别管理" data-url="/noticeCategory/golist"
                               class="site-demo-active" data-type="tabAdd">公告类别管理</a>
                        </dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                <a class="" href="javascript:;">工作管理</a>
                <dl class="layui-nav-child">
                    <dd>
                        <a href="javascript:;" data-id="2" data-title="工作列表" data-url="/activity/goList"
                           class="site-demo-active" data-type="tabAdd">工作列表</a>
                    </dd>
                </dl>
                <dl class="layui-nav-child">
                    <dd>
                        <a href="javascript:;" data-id="3" data-title="我的工作" data-url="/activity/goMyList"
                           class="site-demo-active" data-type="tabAdd">我的工作</a>
                    </dd>
                </dl>
                </li>
                <li class="layui-nav-item">
                    <a class="" href="javascript:;">公告管理</a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="javascript:;" data-id="10" data-title="公告列表" data-url="/notice/goList"
                               class="site-demo-active" data-type="tabAdd">公告列表</a>
                        </dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a class="" href="javascript:;">用户管理</a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="javascript:;" data-id="4" data-title="用户列表" data-url="/user/goList"
                               class="site-demo-active" data-type="tabAdd">用户列表</a>
                        </dd>
                    </dl>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="javascript:;" data-id="5" data-title="我的信息" data-url="/user/goUserInfo"
                               class="site-demo-active" data-type="tabAdd">我的信息</a>
                        </dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a class="" href="javascript:;">单位管理</a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="javascript:;" data-id="6" data-title="班级管理" data-url="/classes/goList"
                               class="site-demo-active" data-type="tabAdd">班级管理</a>
                        </dd>
                    </dl>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="javascript:;" data-id="7" data-title="专业管理" data-url="/major/goList"
                               class="site-demo-active" data-type="tabAdd">专业管理</a>
                        </dd>
                    </dl>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="javascript:;" data-id="8" data-title="学院管理" data-url="/college/goList"
                               class="site-demo-active" data-type="tabAdd">学院管理</a>
                        </dd>
                    </dl>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="javascript:;" data-id="" data-title="学年管理" data-url="/schoolyear/goList"
                               class="site-demo-active" data-type="tabAdd">学年管理</a>
                        </dd>
                    </dl>

                </li>
                <li class="layui-nav-item" style="display: none" id="work-statistics">
                    <a class="" href="javascript:;">工作统计</a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="javascript:;" data-id="12" data-title="工作统计报表" data-url="/report/goList"
                               class="site-demo-active" data-type="tabAdd">工作统计报表</a>
                        </dd>
                    </dl>
                </li>
                <%--<li class="layui-nav-item">--%>
                    <%--<a href="javascript:;" data-id="" data-title="图片上传" data-url="/activity/goUpload"--%>
                       <%--class="site-demo-active" data-type="tabAdd">图片上传</a>--%>
                <%--</li>--%>
            </ul>
        </div>
    </div>

    <!--右部tab标签-->
    <div class="layui-tab" lay-filter="demo" lay-allowclose="true" style="margin-left: 150px;">
        <ul class="layui-tab-title"></ul>
        <div class="layui-tab-content"></div>
    </div>

    <div class="layui-footer" style="text-align:center;">
        <!-- 底部固定区域 -->
        <img src="/image/indexImage/logo.jpg" class="layui-nav-img">
        华南农业大学班主任工作管理平台
    </div>
</div>

<script>
    <!--这里是放置js代码区域-->
    layui.use(['element', 'layer', 'jquery'], function () {
        var element = layui.element;
        // var layer = layui.layer;

        //判断用户角色，普通用户则隐藏工作统计
        var role = "${user.role}";
        if (role === "系统管理员" || role === "学院管理员"){
            var $ = layui.$;
            $('#work-statistics').show();
        }

        //点击tab 刷新页面
        element.on('tab(demo)', function(data){
            var src=$(".layui-tab-item.layui-show").find("iframe").attr("src");
            $(".layui-tab-item.layui-show").find("iframe").attr("src",src);
        });
        var $ = layui.$;
        // 配置tab实践在下面无法获取到菜单元素
        $('.site-demo-active').on('click', function () {
            var dataid = $(this);
            //这时会判断右侧.layui-tab-title属性下的有lay-id属性的li的数目，即已经打开的tab项数目
            if ($(".layui-tab-title li[lay-id]").length <= 0) {
                //如果比零小，则直接打开新的tab项
                active.tabAdd(dataid.attr("data-url"), dataid.attr("data-id"), dataid.attr("data-title"));
            } else {
                //否则判断该tab项是否以及存在
                var isData = false; //初始化一个标志，为false说明未打开该tab项 为true则说明已有
                $.each($(".layui-tab-title li[lay-id]"), function () {
                    //如果点击左侧菜单栏所传入的id 在右侧tab项中的lay-id属性可以找到，则说明该tab项已经打开
                    if ($(this).attr("lay-id") == dataid.attr("data-id")) {
                        isData = true;
                    }
                });
                if (isData == false) {
                    //标志为false 新增一个tab项
                    active.tabAdd(dataid.attr("data-url"), dataid.attr("data-id"), dataid.attr("data-title"));
                }
            }
            //最后不管是否新增tab，最后都转到要打开的选项页面上
            active.tabChange(dataid.attr("data-id"));
        });

        var active = {
            //在这里给active绑定几项事件，后面可通过active调用这些事件
            tabAdd: function (url, id, name) {
                //新增一个Tab项 传入三个参数，分别对应其标题，tab页面的地址，还有一个规定的id，是标签中data-id的属性值
                //关于tabAdd的方法所传入的参数可看layui的开发文档中基础方法部分
                element.tabAdd('demo', {
                    title: name,
                    content: '<iframe data-frameid="' + id + '" scrolling="auto" frameborder="0" src="' + url + '" style="width:100%;height:99%;"></iframe>',
                    id: id //规定好的id
                });
                FrameWH();  //计算ifram层的大小
            },
            tabChange: function (id) {
                //切换到指定Tab项
                element.tabChange('demo', id); //根据传入的id传入到指定的tab项
            },
            tabDelete: function (id) {
                element.tabDelete("demo", id);//删除
            }
        };
        function FrameWH() {
            // -150 否则会被遮挡
            var h = $(window).height()-150;
            $("iframe").css("height",h+"px");
        }
    });
    
    <!--跳转方法-->
    function goUserInfo() {
        layer.open({
            type: 2,
            title: '基本资料',
            skin: 'layui-layer-rim', //加上边框
            area: ['500px', '500px'], //宽高
            content: '/user/goUserInfo'  //调到新增页面
        });
    }
</script>
</body>
</html>

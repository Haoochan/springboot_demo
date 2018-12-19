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
    <title>黄宝康个人搭建的后台管理页面</title>
    <link rel="stylesheet" href="/static/layui/css/layui.css">
    <script src="/static/layui/layui.js"></script>
</head>
<body>
<div class="layui-layout-admin">
    <!--头部-->
    <div class="layui-header">
        <div class="layui-logo">Huang BaoKang</div>
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="javascript:void(0)">控制台</a></li>
            <li class="layui-nav-item"><a href="javascript:;">商品管理</a></li>
            <li class="layui-nav-item">
                <a href="javascript:;">其他系统</a>
                <dl class="layui-nav-child">
                    <dd><a href="javascript:;">邮件管理</a></dd>
                    <dd><a href="javascript:;">消息管理</a></dd>
                    <dd><a href="javascript:;">授权管理</a></dd>
                </dl>
            </li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href=""><img src="http://m.zhengjinfan.cn/images/0.jpg" class="layui-nav-img">Huang BaoKang</a>
                <dl class="layui-nav-child">
                    <dd><a href="">基本资料</a></dd>
                    <dd><a href="">安全设置</a></dd>
                </dl>
            </li>
        </ul>
    </div>

    <!--左侧-->
    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <ul class="layui-nav layui-nav-tree layui-nav-side" lay-filter="treenav">
                <li class="layui-nav-item"><a href="javascript:;" class="site-url" data-id="1" data-title="控制台" data-url="http://www.sohu.com">控制台</a></li>
                <li class="layui-nav-item"><a href="javascript:;" class="site-url" data-title="组件" data-id="2" data-url="http://www.baidu.com">组件</a></li>
                <li class="layui-nav-item"><a href="javascript:;" class="site-url" data-title="应用" data-id="3" data-url="http://news.qq.com">应用</a></li>
                <li class="layui-nav-item">
                    <a href="javascript:;">设置</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" class="site-url" data-title="系统设置" data-id="4" data-url="http://www.sina.com.cn">系统设置</a></dd>
                        <dd><a href="javascript:;" class="site-url" data-title="网站设置" data-id="5" data-url="http://www.163.com">网站设置</a></dd>
                        <dd><a href="javascript:;" class="site-url" data-title="修改密码" data-id="6" data-url="http://www.tmall.com">修改密码</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item"><a href="javascript:;" class="site-url" data-title="社区" data-id="7" data-url="http://fly.layui.com/">社区</a></li>
            </ul>
            <div class="layui-tab layui-tab-brief" lay-filter="contentnav" lay-allowClose="true" style="margin-left:200px;margin-top:0;">
                <ul class="layui-tab-title">
                    <li class="layui-this">首页</li>
                </ul>
                <ul class="layui-bg-green rightmenu" style="display: none;position: absolute;">
                    <li data-type="closethis">关闭当前</li>
                    <li data-type="closeall">关闭所有</li>
                </ul>
                <div class="layui-tab-content" style="padding:0;">
                    <div class="layui-tab-item layui-show">首页内容...</div>
                </div>
            </div>
        </div>
    </div>

    <!--中间主体-->
    <div class="layui-body" id="container">
        <div class="layui-tab" lay-filter="tabs" lay-allowClose="true">
            <ul class="layui-tab-title">
                <li class="layui-this">首页</li>
            </ul>
            <div class="layui-tab-content">
                <div class="layui-tab-item layui-show">首页内容</div>
            </div>
        </div>
    </div>

    <!--底部-->
    <div class="layui-footer">
        <center>黄宝康版权所有&copy;Tel:18679758769</center>
    </div>
</div>

<script type="text/javascript">
        layui.use('element', function(){
            var element = layui.element;
            var active={
                tabAdd:function(url,id,name){
                    element.tabAdd('contentnav',{
                        title:name,
                        content:'<iframe data-frameid="'+id+'" scrolling="auto" frameborder="0" src="'+url+'" style="width:100%;"></iframe>',
                        id:id
                    });
                    rightMenu();
                    iframeWH();
                },
                tabChange:function(id){
                    element.tabChange('contentnav',id);
                },
                tabDelete:function(id){
                    element.tabDelete('contentnav',id);
                },
                tabDeleteAll:function(ids){
                    $.each(ids,function(index,item){
                        element.tabDelete('contentnav',item);
                    });
                }
            };
            $(".site-url").on('click',function(){
                var nav=$(this);
                var length = $("ul.layui-tab-title li").length;
                if(length<=0){
                    active.tabAdd(nav.attr("data-url"),nav.attr("data-id"),nav.attr("data-title"));
                }else{
                    var isData=false;
                    $.each($("ul.layui-tab-title li"),function(){
                        if($(this).attr("lay-id")==nav.attr("data-id")){
                            isData=true;
                        }
                    });
                    if(isData==false){
                        active.tabAdd(nav.attr("data-url"),nav.attr("data-id"),nav.attr("data-title"));
                    }
                    active.tabChange(nav.attr("data-id"));
                }
            });
            function rightMenu(){
                //右击弹出
                $(".layui-tab-title li").on('contextmenu',function(e){
                    var menu=$(".rightmenu");
                    menu.find("li").attr('data-id',$(this).attr("lay-id"));
                    l = e.clientX;
                    t = e.clientY;
                    menu.css({ left:l, top:t}).show();
                    return false;
                });
                //左键点击隐藏
                $("body,.layui-tab-title li").click(function(){
                    $(".rightmenu").hide();
                });
            }
            $(".rightmenu li").click(function(){
                if($(this).attr("data-type")=="closethis"){
                    active.tabDelete($(this).attr("data-id"));
                }else if($(this).attr("data-type")=="closeall"){
                    var tabtitle = $(".layui-tab-title li");
                    var ids = new Array();
                    tabtitle.each(function(i){
                        ids.push($(this).attr("lay-id"));
                    });
                    //如果关闭所有 ，即将所有的lay-id放进数组，执行tabDeleteAll
                    active.tabDeleteAll(ids);
                }
                $('.rightmenu').hide(); //最后再隐藏右键菜单
            });
            function iframeWH(){
                var H = $(window).height()-80;
                $("iframe").css("height",H+"px");
            }
            $(window).resize(function(){
                iframeWH();
            });
        });
</script>
</body>
</html>

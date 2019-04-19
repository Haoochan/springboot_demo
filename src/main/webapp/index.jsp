<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>华南农业大学班主任工作管理系统欢迎你！</title>
    <link href="http://jwc.scau.edu.cn/jwc/statics/css/common.css" rel="stylesheet">
    <link href="http://jwc.scau.edu.cn/jwc/statics/css/index.css" rel="stylesheet">
    <link href="http://jwc.scau.edu.cn/jwc/statics/css/jquery.datetimepicker.css" rel="stylesheet">
    <link rel="stylesheet" href="../../../static/layui/css/layui.css" media="all">
    <script src="../../../static/jquery-1.10.2.js"></script>
    <script src="../../../static/layui/layui.all.js"></script>
</head>

<body>
<div id="box">
    <div id="header" class="w1000 mc">
        <a href="#"><img style="width:1000px; height: 170px ;" src="../image/indexImage/班主任3.jpg" title="华南农业大学教务处"></a>
    </div>

    <div id="nav">
        <ul class="nav w1000 mc">
            <li style="width: 1000px"><a href="/login.jsp"><span style="width: 100%">欢迎访问华南农业大学班主任工作管理系统！登录请点击</span></a></li>
            <div class="clear"></div>
        </ul>
    </div>


    <script language="javascript">
        <!--
        var count=0;
        window.onload = function (){
            var url = window.location.href;
            var parent = window.parent;
            var length = parent.frames.length;
            var win = parent.frames["zhuti"];

            if(length > 0 && win != undefined){
                parent.location.href = url;
            }

            document.getElementById("TextBox1").focus();
        };
        function show(me)
        {
            if (count==0)
            {
                me.value="";
            }
        }
        function reloadcode()
        {
            var verify=document.getElementById('icode');
            verify.src=verify.src+'?';
        }
        function keydown(me)
        {
            if (count==0)
            {
                me.value="";
                count=1;
                me.style.color="black";
            }
        }
        function yzblur(me)
        {
            if(me.value=="")
            {
                me.value="请输入验证码";
                me.style.color="#92a4bf";
                count=0;
            }
        }
        //-->
        function changeURL($type) {
            var url1 = "http://202.116.160.170";
            var url2 = "http://202.116.160.171";
            var actionEnd = "/default2.aspx";
            var imgSrcEnd = "/CheckCode.aspx";
            if ($type == 2) {
                $("#form1").attr("action", url2 + actionEnd);
                $("#icode").attr("src", url2 + imgSrcEnd);
            } else {
                $("#form1").attr("action", url1 + actionEnd);
                $("#icode").attr("src", url1 + imgSrcEnd);
            }
        }

    </script>

    <div id="section1" class="w1000 mc">
        <!--活动图片-->
        <div class="jwcgg fl border w490" style="height:380px;width: 100%;margin-left: 0px">
            <div class="title" style="background-color: #e0ffd2">
                <h3>活动图片</h3>
            </div>
            <%--图片轮播 展示照片--%>
            <div class="layui-carousel" id="test1">
                <div carousel-item >
                    <div><img src="/image/indexImage/1.jpg" style="width: 100%;height: 95%"></div>
                    <div><img src="/image/indexImage/2.jpg" style="width: 100%;height: 95%"></div>
                    <div><img src="/image/indexImage/3.jpg" style="width: 100%;height: 95%"></div>
                    <div><img src="/image/indexImage/4.jpg" style="width: 100%;height: 95%"></div>
                    <div><img src="/image/indexImage/5.jpg" style="width: 100%;height: 95%"></div>
                    <div><img src="/image/indexImage/班会.jpg" style="width: 100%;height: 95%"></div>
                    <div><img src="/image/indexImage/网工分享1.png" style="width: 100%;height: 95%"></div>
                    <div><img src="/image/indexImage/网工分享2.png" style="width: 100%;height: 95%"></div>
                    <div><img src="/image/indexImage/网工分享3.png" style="width: 100%;height: 95%"></div>
                    <div><img src="/image/indexImage/网工分享4.png" style="width: 100%;height: 95%"></div>
                </div>
            </div>
        </div>

        <div class="clear" style="height: 20px;"></div>
    </div>

    <%--图片轮播--%>
    <script>
        layui.use('carousel', function(){
            var carousel = layui.carousel;
            //建造实例
            carousel.render({
                elem: '#test1'
                ,width: '100%' //设置容器宽度
                ,height: '95%'
                ,arrow: 'always' //始终显示箭头
                ,interval:4000
                ,indicator:'none'
            });
        });
    </script>

    <div id="section2" class="w1000 mc">
        <!--教学周-->
        <div class="datebox w242 border fl" style="height:340px;">
            <div class="datebox_t" style="background-color: #e0ffd2">
                <p>&nbsp;&nbsp;&nbsp;&nbsp;<span><b class="date">0000年00月00日</b><b class="weekday">星期一</b></span><br>       本学期第<span class='week'>4</span>个教学周                                            </p>
            </div>
            <br><br>
            <div class="datebox_b">
                <input type="text" id="datetimepicker3" />
            </div>
            <div class="datebox_b1" style="text-align:center;">
                <a href="http://jwc.scau.edu.cn/jwc/index.php?m=calendar&c=index&a=lists">校历</a>
            </div>
        </div>
        <!--教务新闻-->
        <div class="jwcgg fl border w490" style="height:340px;width: 740px">
            <div class="title" style="background-color: #e0ffd2">
                <h3>工作记录</h3>
            </div>
            <ul class="mc" style="padding-top:20px;">
                <li><div style="width:370px;white-space:nowrap;overflow:hidden;text-overflow: ellipsis;"><a href="info2.jsp" alt="数信与信息学院召开2019年转专业学生见面会" title="数信与信息学院召开2019年转专业学生见面会">数信与信息学院召开2019年转专业学生见面会</a></div><span>2019-03-01</span></li>
                <li><div style="width:370px;white-space:nowrap;overflow:hidden;text-overflow: ellipsis;"><a href="info3.jsp" alt="分类指导 搭建平台 协同推进—数信院做实做细毕业生相关工作" title="分类指导 搭建平台 协同推进—数信院做实做细毕业生相关工作">分类指导 搭建平台 协同推进—数信院做实做细毕业生相关工作</a></div><span>2018-12-17</span></li>
                <li><div style="width:370px;white-space:nowrap;overflow:hidden;text-overflow: ellipsis;"><a href="info4.jsp" alt="数学与信息学院举办2019届毕业生就业相关政策解读会" title="数学与信息学院举办2019届毕业生就业相关政策解读会">数学与信息学院举办2019届毕业生就业相关政策解读会</a></div><span>2018-11-15</span></li>
                <li><div style="width:370px;white-space:nowrap;overflow:hidden;text-overflow: ellipsis;"><a href="info5.jsp" alt="考研？就业？我有问题问师兄！——记本科生网络工程党支部专业分享会" title="考研？就业？我有问题问师兄！——记本科生网络工程党支部专业分享会">考研？就业？我有问题问师兄！——记本科生网络工程党支部专业分享会</a></div><span>2018-10-27</span></li>
                <li><div style="width:370px;white-space:nowrap;overflow:hidden;text-overflow: ellipsis;"><a href="info1.jsp" alt="2018学年第一学期15信管4班开学班主任工作会议" title="2018学年第一学期15信管4班开学班主任工作会议">2018学年第一学期15信管4班开学班主任工作会议</a></div><span>2018-09-14</span></li>

            </ul>
        </div>

        <div class="clear"></div>
    </div>
    <div id="footer">
        <p><a href="http://www.scau.edu.cn/">华南农业大学首页</a>
        </p>
        <p>华南农业大学班主任工作管理系统</p>
    </div>

</div>

<script src="http://jwc.scau.edu.cn/jwc/statics/js/jquery.min.js"></script>
<script src="http://jwc.scau.edu.cn/jwc/statics/js/jquery.datetimepicker.js"></script>
<script>
    //获取时间
    function getCurDate(){
        var d = new Date();
        var week;
        switch (d.getDay()){
            case 1: week="星期一"; break;
            case 2: week="星期二"; break;
            case 3: week="星期三"; break;
            case 4: week="星期四"; break;
            case 5: week="星期五"; break;
            case 6: week="星期六"; break;
            default: week="星期天";
        }
        var years = d.getFullYear();
        var month = add_zero(d.getMonth()+1);
        var days = add_zero(d.getDate());
        var hours = add_zero(d.getHours());
        var minutes = add_zero(d.getMinutes());
        var seconds=add_zero(d.getSeconds());
        $('.date').html(years+"年"+month+"月"+days+"日");
        $('.weekday').html(week);
    }
    function add_zero(temp){
        if(temp<10) return "0"+temp;
        else return temp;
    }
    //日历
    $('#datetimepicker3').datetimepicker({
        inline:true,
        timepicker:false,
        lang:"ch"
    });

    //加载日期时间星期函数
    getCurDate();



</script>
</body>
</html>
<!-- 飘窗元素 -->
<script type="text/javascript">
    //定义插件
    !function($){
        /**
         * Description: jquery飘窗插件，可自适应浏览器宽高的变化
         * Author: YZCS
         * CreateTime: 2015-04-25
         * param: args={startL:default, startT:default, angle:-Math.PI/4, speed: 125}
         * 参数说名: startL飘窗初始时距离左边的距离, startT飘窗初始化距离顶部的距离, angle飘窗初始运动方向, speed运动速度(px/s)
         * CopyRight: GPL
         */
        $.fn.autoMove = function(args){
            //先定义一些工具函数判断边距
            function isTop(pos, w_w, w_h, d_w, d_h){//飘窗到达上边距
                if(pos.top<=0){
                    return true;
                }else{
                    return false;
                }
            }
            function isBottom(pos, w_w, w_h, d_w, d_h){//飘窗到达下边距
                if(pos.top>=(w_h-d_h)){
                    return true;
                }else{
                    return false;
                }
            }
            function isLeft(pos, w_w, w_h, d_w, d_h){//飘窗到达左边距
                if(pos.left<=0){
                    return true;
                }else{
                    return false;
                }
            }
            function isRight(pos, w_w, w_h, d_w, d_h){//飘窗到达右边距
                if(pos.left>=(w_w-d_w)){
                    return true;
                }else{
                    return false;
                }
            }
            return this.each(function(){
                var w_w = parseInt($(window).width()),
                    w_h = parseInt($(window).height()),
                    d_w = parseInt($(this).width()),
                    d_h = parseInt($(this).height()),
                    d_l = (w_w-d_w)/2,
                    d_t = (w_h-d_h)/2,
                    max_l = w_w - d_w;
                max_t = w_h - d_h;
                //位置及参数的初始化
                var setobj = $.extend({startL:d_l, startT:d_t, angle:Math.PI/4, speed:100}, args);
                $(this).css({position: 'absolute', left: setobj['startL']+'px', top: setobj['startT']+'px'});
                var position = {left: setobj['startL'], top: setobj['startT']};//飘窗位置对象
                var that = $(this);
                var angle= setobj.angle;
                var time = 10;//控制飘窗运动效果，值越小越细腻
                var step = setobj.speed * (time/1000);//计算运动步长
                var decoration = {x:step*Math.cos(angle), y:step*Math.sin(angle)};//计算二维上的运动增量
                var mvtid;
                $(window).on('resize', function(){//窗口大小变动时重新设置运动相关参数
                    w_w = parseInt($(window).width()),
                        w_h = parseInt($(window).height()),
                        max_l = w_w - d_w;
                    max_t = w_h - d_h;
                });
                function move(){
                    position.left += decoration.x;
                    position.top  += decoration.y;
                    if(isLeft(position, w_w, w_h, d_w, d_h)||isRight(position, w_w, w_h, d_w, d_h)){
                        decoration.x = -1*decoration.x;
                    }
                    if(isRight(position, w_w, w_h, d_w, d_h)){
                        position.left = max_l;
                    }
                    if(isTop(position, w_w, w_h, d_w, d_h)||isBottom(position, w_w, w_h, d_w, d_h)){
                        decoration.y = -1*decoration.y;
                    }
                    if(isBottom(position, w_w, w_h, d_w, d_h)){
                        position.top = max_t;
                    }
                    //that.css({left:position.left, top:position.top});
                    that.animate({left:position.left, top:position.top}, time);//改用jquery动画函数使其更加平滑
                    mvtid = setTimeout(move, time);//递归调用，使飘窗连续运动
                }
                move();//触发动作
                that.on('mouseenter', function(){ clearTimeout(mvtid) });//添加鼠标事件
                that.on('mouseleave', function(){ move() });
            });
        }//end plugin definition
    }(jQuery);
</script>
<script type="text/javascript">
    //测试插件
    $('.automv').autoMove({angle:-Math.PI/4, speed:120});
</script>
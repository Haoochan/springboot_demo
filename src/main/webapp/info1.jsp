<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/20
  Time: 16:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>华南农业大学教务处欢迎你！</title>
    <link href="http://jwc.scau.edu.cn/jwc/statics/css/common.css" rel="stylesheet">
    <link href="http://jwc.scau.edu.cn/jwc/statics/css/index.css" rel="stylesheet">
    <link href="http://jwc.scau.edu.cn/jwc/statics/css/jquery.datetimepicker.css" rel="stylesheet">
</head>

<body>
<div id="box">
    <div id="header" class="w1000 mc">
        <a href="#"><img style="width:1000px; height: 170px ;" src="image/indexImage/班主任3.jpg" title="华南农业大学教务处"></a>
    </div>

    <div id="nav">
        <ul class="nav w1000 mc">
            <li style="width: 100%"><a href="/index.jsp"><span style="width: 100%">首页</span></a></li>
            <div class="clear"></div>
        </ul>
    </div><script type="text/javascript" src="http://jwc.scau.edu.cn/jwc/statics/js/jquery.min.js"></script>
    <link href="http://jwc.scau.edu.cn/jwc/statics/css/other.css" rel="stylesheet">
    <!--box-->
    <div id="box" class="w1000 mc">
        <div class="section w1000 mc">
            <div class="detail fl w736 border" style="width: 100%">
                <div class="detail_title mc">
                    <h1 style="font-size: 23px">2018学年第一学期15信管4班开学班主任工作会议</h1>
                </div>
                <!--编辑器输出内容-->
                <div id="content" class="detail_main mc" style="height: 100%">
                    <p style="TEXT-INDENT: 43px"><span style="FONT-SIZE: 21px; FONT-FAMILY: 仿宋">2018年9月14日上午，15信管4班全体同学在助班的组织下，邀请班主任杨振刚老师出席并开展2018学年第一学期开学班主任工作会议。</span></p><p style="TEXT-ALIGN: center; TEXT-INDENT: 43px"><span style="FONT-SIZE: 21px; FONT-FAMILY: 仿宋"><img title="班会.jpg" style="HEIGHT: 351px; WIDTH: 484px" alt="班会.jpg" src="/image/indexImage/班会.jpg" width="767" height="574"/></span></p><p style="TEXT-INDENT: 43px"><span style="FONT-SIZE: 21px; FONT-FAMILY: 仿宋">期间，进行了班级委员会班干部的换届选举活动。随后邀请每位同学上台分享过去一学期的学习与生活收获心得，并且对新学期进行了新的展望。最后，班主任杨老师进行上学期考试成绩以及学习生活的总结，并对新学期的学习生活提出建设性指导。

            <div class="clear"></div>
        </div>
    </div>
    <script type="text/javascript" src="http://jwc.scau.edu.cn/jwc/statics/js/ueditor/ueditor.parse.js"></script>
    <script type="text/javascript">
        setTimeout(function</span></p>
        </div>
        <!--编辑器输出内容-->
        </div>(){ uParse('#content', {
            'highlightJsUrl':'http://jwc.scau.edu.cn/jwc/statics/js/ueditor/third-party/SyntaxHighlighter/shCore.js',
            'highlightCssUrl':'http://jwc.scau.edu.cn/jwc/statics/js/ueditor/third-party/SyntaxHighlighter/shCoreDefault.css'})
        }, 300);
    </script>
    <div id="footer">
        <p><a href="http://www.scau.edu.cn/">华南农业大学首页</a>
            &nbsp;&nbsp;
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


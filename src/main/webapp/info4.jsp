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
                    <h1 style="font-size: 23px">数学与信息学院举办2019届毕业生就业相关政策解读会</h1>
                </div>
                <!--编辑器输出内容-->
                <div id="content" class="detail_main mc" style="height: 100%">
                    <p style="TEXT-INDENT: 43px"><span style="FONT-SIZE: 21px; FONT-FAMILY: 仿宋">为了做好毕业生就业服务工作，切实增强大学生对就业政策的理解和自我保护意识，避免在就业择业过程出现纠纷等问题。应学院邀请，校就业指导中心孙同彪老师于2018年11月15日晚在新学活为我院2015级1021人作题为“毕业生不得不知道的几件事”的讲座。</span></p>
                    <p style="TEXT-INDENT: 43px"><span style="FONT-SIZE: 21px; FONT-FAMILY: 仿宋">会上，孙老师从“了解就业政策和流程，如何轻松就业”的内在要求出发。围绕“毕业生就业派遣分析”、“就业手续注意事项”、“就业政策（基层、征兵入伍、创业）”、“就业方案上报”、“档案去向填报说明”等五个方面展开深入细致讲解。特别针对毕业生就业程序相关问题，孙老师强调毕业生应当做到签约前应慎重，做到诚信就业。与此同时，孙老师也提醒毕业生在签署三方和实习期应当注意个人合法权益的维护，特别是就实习内容和违约金等方面内容要仔细研判，减少日后可能存在的劳动纠纷争议。会后，同学们就三方签订、档案派遣和大学生西部计划等问题向孙老师发问，现场气氛热烈。</span></p>
                    <p style="TEXT-ALIGN: center; TEXT-INDENT: 43px"><span style="FONT-SIZE: 21px; FONT-FAMILY: 仿宋"><img title="数学与信息学院举办2019届毕业生就业相关政策解读会.jpg" style="HEIGHT: 351px; WIDTH: 484px" alt="数学与信息学院举办2019届毕业生就业相关政策解读会.jpg" src="/image/indexImage/2.jpg" width="767" height="574"/></span></p>
                    <p style="TEXT-INDENT: 43px"><span style="FONT-SIZE: 21px; FONT-FAMILY: 仿宋">据悉，本次讲座为数学与信息学院就业有关系列讲座，通过本次讲座有助于我院学生在今后就业过程中增强对就业政策和程序的了解，培育大学生契约精神，做到诚信就业。</span></p>
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


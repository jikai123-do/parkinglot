<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
 
    <meta charset="utf-8">
    <title></title>
    <link href="../../Content/css/blue.css" rel="stylesheet" type="text/css" />
    <link href="../../Content/css/recharge.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../../Content/js/jquery-1.11.3.js"></script>
    <script type="text/javascript" src="../../Content/js/layout.js"></script>
    <script type="text/javascript" src="../../Content/js/menu.js"></script>
    <script src="../../Content/js/index.js"></script>
    <style>
        .v01 {background: url(../Content/images/cut.png) no-repeat;}
        .v02 {background: url(../Content/images/spread.png) no-repeat;}
        .menu2 p a {background: url(../Content/images/dian1.png) no-repeat;}
        .menu2 p a.tab2 {background: url(../Content/images/dian.png) no-repeat;}
        .m_ip ul li {background: url(../../Content/images/ip_icon.png) no-repeat;}
        .recharge p a.my_1 {background: #F30;color: #fff; border:1px solid #f30}
    </style>
    <script>
        $(function () {
            $(".recharge p a").click(function () {
                if ($(this).has("my_1")) {
                    $(this).addClass("my_1").siblings().removeClass("my_1");
                }
            })
        });

        setInterval(function () {
            $('#rightBox dt:first').animate({ 'height': '0', 'opacity': '0' }, 'slow', function () {
                $(this).removeAttr('style').insertAfter('#rightBox dt:last');
            });
        }, 2000);

        function IndexPage() {
            parent.top.location.href = "Index";
        }
    </script>
</head>

<body>
    <div class="right">
        <div class="m_ip">
            <ul>
                <li><a href="javascript:;" onclick="IndexPage()">当前位置：首页</a><a href="javascript:;">>></a><a href="javascript:;" onclick="PService()">停车服务</a><a>>></a><a href="javascript:;">快速充值</a></li>
            </ul>
        </div>
        <div class="my">
            <h3 style="color: red">${erromsg }</h3>
    </div>
    </div>
</body>

</html>

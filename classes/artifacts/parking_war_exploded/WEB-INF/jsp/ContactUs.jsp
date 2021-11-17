<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>联系我们</title>
    <link rel="shortcut icon" href="http://www.wuhanparking.com/Content/images/logo.ico" />
    <link href="../../Content/css/layout.css" rel="stylesheet" />
    <script type="text/javascript" src="../../Content/js/jquery-1.11.3.js"></script>
    <script type="text/javascript" src="../../Content/js/layout.js"></script>
    <style>
       .search{background:url(../../Content/images/search.png)}
    </style>
</head>
<body>


<!-- Copyright � 2005. Spidersoft Ltd -->
<style>
A.applink:hover {border: 2px dotted #DCE6F4;padding:2px;background-color:#ffff00;color:green;text-decoration:none}
A.applink       {border: 2px dotted #DCE6F4;padding:2px;color:#2F5BFF;background:transparent;text-decoration:none}
A.info          {color:#2F5BFF;background:transparent;text-decoration:none}
A.info:hover    {color:green;background:transparent;text-decoration:underline}
</style>


    <!--head开始-->
<jsp:include page="MyJsp.jsp"></jsp:include>


<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>武汉停车官联系我们界面</title>
    <link href="../../Content/css/blue.css" rel="stylesheet" type="text/css">
    <style>
        .ips ul li {width: 98%;height: 50px;line-height: 50px;background: url(../../Content/images/ip_icon.png) no-repeat;padding-left: 25px;border-bottom: 1px solid #03a9f5;}
    </style>
</head>

<body>
    <!--导航开始-->
<jsp:include page="guidInclude.jsp"></jsp:include>
    <!--信息公开详情页-->
    <div class="details">
        <div class="detailnews">
            <div class="ips">
                <ul>
                    <li><a href="Index.jsp">当前位置：首页</a><a href="javascript:;">>></a><a href="javascript:;">联系我们</a></li>
                </ul>
            </div>
            <div class="detail" style="min-height:500px">
                <h2 style="width:90%; margin-left:5%; border-bottom:1px solid #ccc"><p style="color:#03a9f5; line-height:50px; font-size:22px; text-indent:0; margin:0; border-bottom:2px solid #999; text-align:center; width:100px">联系我们</p></h2>
                <div style="position:relative">
                    <img src="../../Content/images/cont.jpg" style="margin-left:5%">
                    <ul style="position:absolute; bottom:50px; right:300px; width:400px">
                        <li>单位名称：</li>
                        <li>联系电话：</li>
                        <li>联系地址：</li>
                        <li>邮政编码：</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</body>
</html>



    <!--底部-->
    <div class="boot">
        <div class="bot">
            <ul style="margin-top:10px">
              
            </ul>
        </div>
    </div>
</body>

</html>

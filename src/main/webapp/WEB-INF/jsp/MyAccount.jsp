<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta charset="utf-8">
    <title>访问错误</title>
    <meta http-equiv=content-type content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="refresh" content="500;url=#">
    <style type="text/css">
        body {
            background-position: 40% 0px;
            font-family: "微软雅黑";
            font: normal 100% Helvetica, Arial,sans-serif 900;
        }

        a {
            text-decoration: none;
        }

        * {
            margin: 0px;
            padding: 0px;
        }

        a:link {
            color: #fff;
            text-decoration: none;
            text-decoration: none;
        }

        a:visited {
            color: #fff;
            text-decoration: none;
        }

        a:hover {
            color: #fff;
            text-decoration: none;
        }

        .container {
            margin-left: auto;
            width: 100%;
            margin-right: auto;
            text-align: center;
            margin-top: 100px;
        }

        .container_1 img {
            width: 250px;
            height: 120px;
        }

        .container_2 img {
            margin-top: -2%;
        }

        .container_3 img {
            width: 25%;
            height: 7.5%;
        }

        .container_3 {
            width: 28%;
            margin: auto;
        }

        .container_3_1 {
            color: #6bbaa3;
            font-size: 28px;
            text-align: left;
        }

        .container_3_2 {
            color: #6bbaa3;
            font-size: 20px;
            text-align: left;
        }

        .maincolumn {
            margin-left: auto;
            width: 100%;
            margin-right: auto;
            text-align: center;
            display: block;
            margin-top: 10px;
        }

            .maincolumn .maincolumn_bg {
                width: 28%;
                height: 50px;
                line-height: 50px;
                background-color: #6bbaa3;
                margin: auto;
            }

                .maincolumn .maincolumn_bg ul {
                    list-style-type: none;
                }

                    .maincolumn .maincolumn_bg ul li {
                        float: left;
                        width: 100%;
                    }

                        .maincolumn .maincolumn_bg ul li a {
                            font-size: 18px;
                        }

                            .maincolumn .maincolumn_bg ul li a:hover {
                                width: 100%;
                                height: 50px;
                                background-color: #47997d;
                                display: block;
                            }
    </style>
    <script>
        function IndexPage() {
            parent.top.location.href = "/HomePage/Index";
        }
    </script>
</head>
<!--gif图-->
<body>
    <div class="container">
        <div class="container_1"><img src="http://www.wuhanparking.com:80/Content/images/500.png"></div>
        <div class="container_2"><img src="http://www.wuhanparking.com:80/Content/images/3.22.gif"></div>
        <div class="container_3">
            <div class="container_3_1"><span>SORRY系统出错了，程序猿正在抢修......</span></div>
            <div class="container_3_2"><span>要不您去我们的首页逛逛......</span></div>
        </div>
    </div>
    <div class="maincolumn">
        <div class="maincolumn_bg">
            <ul>
                <li><a href="javascript:;" onclick="IndexPage()">返回首页</a></li>
            </ul>
        </div>
    </div>
</body>
</html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>投诉建议</title>
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
    <title></title>
    <link href="../../Content/css/blue.css" rel="stylesheet" type="text/css" />
    <link href="../../Content/css/recharge.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../../Content/js/jquery-1.11.3.js"></script>
    <script type="text/javascript" src="../../Content/js/index.js"></script>
    <style>
        .ips ul li{background:url(../../Content/images/ip_icon.png) no-repeat; padding-left:25px; line-height:50px}
    </style>
    <script>
        function menuOver(obj) {
            if (obj == '1') {
                if ($("#hidden").attr('value') == undefined) {
                    location.href = "http://www.wuhanparking.com:80/HomePage/Login";
                }
            }
            for (var i = 0; i < 2; i++) {
                if (i == parseInt(obj)) {
                    document.getElementById("tb" + obj).style.display = 'block';

                } else {
                    document.getElementById("tb" + i).style.display = 'none';
                }
            }

        };
        $(function () {
            var $a = $('#more a');
            $a.click(function () {
                var $this = $(this);
                var $t = $this.index();
                $a.removeClass();
                $this.addClass('current');
            })
        });

        function createSug() {
            if ($("#comtitle").val() == "" || $("#comtitle").val().length > 30) {
                alert("请输入30字以内的标题！");
                return false;
            }
            if ($("#type").find("option:selected").text() == "--请选择--") {
                alert("请选择投诉类型");
                return false;
            }
            if ($("#comcontent").val() == "") {
                alert("请输入建议内容");
                return false;
            }
            $("#lookupKey").val($("#type").find("option:selected").attr('id'));
            $("#sugForm").submit();

        }
    </script>
</head>

<body>
 <!--导航开始-->
<jsp:include page="guidInclude.jsp"></jsp:include>
    <!--投诉建议-->
    <div class="details">
        
        <div class="detailnews">
            <div class="ips">
                <ul>
                    <li><a href="../HomePage/Index.html">当前位置：首页</a><a href="javascript:;">>></a><a href="javascript:;">投诉建议</a><a href="javascript:;"></a></li>
                </ul>
            </div>
            <h1 id="more"><a href="javascript:;" class="current" onclick="menuOver('0')">问题中心</a><a href="javascript:;" style="margin-left:20px;" onclick="menuOver('1')">投诉建议</a></h1>
            <div class="detail" style="min-height:400px">
                <div class="formbody">
                    <div id="tb0">
                        <div class="formtitle"><span style="width:120px">全部问题</span></div>
                        <table class="tablelist1">
                            <tbody>
                                <tr>
                                    <td>
                                    </td>
                                </tr>

                            </tbody>
                        </table>
                    </div>
                    <div style="display:none" id="tb1">
                        <div class="formtitle"><span>请将您的问题跟建议告诉我们，我们将第一时间及时为您反馈</span></div>
                        <input type="hidden" id="hidden" />
                        <form action="/Suggestion/SugIndex" method="post" role="form" id="sugForm">
                            <table class="tablelist1">
                                <thead>
                                    <tr>
                                        <th colspan="2"><span style="color:#fff; background:#fff">标题</span>标题：<input type="text" value="" name="comtitle" id="comtitle" />（标题在30字以内）</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            投诉类型：<select id="type">
                                                <option>--请选择--</option>
                                            </select>
                                            <input type="hidden" name="lookupKey" id="lookupKey" />
                                        </td>
                                        <th style="border-bottom:2px solid #03a9f5; color:#03a9f5">意见反馈</th>
                                    </tr>
                                    </tr>
                                    <tr>
                                        <td><span style="color:#fff; background:#fff">建议</span>建议：<textarea name="comcontent" id="comcontent" rows="10" cols="80" style="vertical-align:top; width:600px"></textarea></td>
                                        <td style="width:400px">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><input type="button" value="提&nbsp;&nbsp;交" class="questionbt" onclick="createSug()"></td>
                                        <td><a href="LogSuggestion.html" class="sc">查看更多反馈</a></td>
                                    </tr>
                                </tbody>
                            </table>
                        </form>
                    </div>
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
                <li class="bot_menu"><a href="../ParkingMap/Map.html">网站地图</a><span>|</span><a href="../ParkingGuide/GuideIndex.html"> 操作指引</a><span>|</span><a href="../HomePage/ContactUs.html"> 联系我们</a><span>|</span><a href="../HomePage/Privacy.html"> 版权声明</a></li>
                <li><a href="javascript:;">武汉城投停车场投资建设管理有限公司</a></li>
                <li><a href="javascript:;" class="ip">地址：武汉市汉口区发展二路俊隆科技园</a></li>
                <li><a href="javascript:;">版权所有：Copyright © 2016 WHTC  Corporation</a></li>
                <li><a href="javascript:;">鄂ICP备15007950号-2</a></li>
                <li><a target="_blank" href="https://www.beian.gov.cn/portal/registerSystemInfo?recordcode=42010302000702"><span><img src="../../Content/images/beian.png" style="vertical-align:middle;"/></span>鄂公网安备42010302000702</a></li>
            </ul>
        </div>
    </div>
</body>

</html>
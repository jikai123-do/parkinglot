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
    <link href="../../Content/css/blue.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="../../Content/js/jquery-1.11.3.js"></script>
    <script src="../../Content/js/index.js"></script>
    <script type="text/javascript" src="../Content/js/format.js"></script>
    <style>
        .m_ip ul li {background: url("../../Content/images/ip_icon.png") no-repeat;}
    </style>
    <script>

        $(function(){
            $(window.parent.parent.selectBills());   //实现页面和菜单左侧菜单栏的联动
        });

        function IndexPage(){
            parent.top.location.href="/HomePage/Index";
        }


        var tempPageIndex = 0;//当前页  从0起，0是第1页
        var strPageTotal = 0;//总页数
        var strPageSize = 6;//每页的条数

        //设置分页时跳转的页码
        function SetPageIndex(obj) {

            if (obj == "first") {
                if (tempPageIndex == 0) {
                    return false;
                } else {
                    tempPageIndex = 0;
                }
            }
            else if (obj == "last") {
                tempPageIndex--;
                if (tempPageIndex == -1) {
                    tempPageIndex = 0;
                    return false;
                }
            }
            else if (obj == "next") {
                tempPageIndex++;
                if (tempPageIndex > (strPageTotal-1)) {
                    tempPageIndex = strPageTotal-1;
                    return false;
                }
            }
            else if (obj == "end") {
                tempPageIndex = strPageTotal-1;
            } else {
                tempPageIndex = -1;
            }
            $("#listMethod").val($("#select").find("option:selected").text()); //点击下一步时给下拉框的隐藏域赋值
            $("#tempPageIndex").val(tempPageIndex);//给 当前页的隐藏域 赋值
            $("input[name=length]").val(strPageSize);
            $("#listForm").submit();//提交表单
        }

        function selectList(){
            $("#listMethod").val($("#select").find("option:selected").text());
            $("#tempPageIndex").val(0);  //每当下拉框的值改变时，分页从第一页开始
            $("input[name=length]").val(strPageSize);
            $("#listForm").submit();
        }

        $(function () {
            $(".paginList li a").click(function(){if($(this).has("current")){
                $(this).addClass("current").parent().siblings().find("a").removeClass("current");}})

            for (var i = 0; i < parseInt($("#listsTime").val()); i++) {
                $(".tablelist tbody tr td:last-child").eq(i).text(format(parseInt($(".tablelist tbody tr td:last-child").eq(i).text()), 'yyyy-MM-dd HH:mm:ss').substring(0, 19));
            }

            var obj = document.getElementsByTagName("option")
            for (var i = 0; i < obj.length; i++) {
                if (obj[i].value=="充值") {
                    obj[i].selected=true;//相等则选中
                }
            }
            if ($("#select").find("option:selected").text()=="充值")
            {
                strPageTotal = Math.ceil($("#payList").val()/strPageSize);//总页数
            }
            else
            {
                strPageTotal = Math.ceil($("#listsResult").val()/strPageSize);//总页数
            }
            $("#spanPageTotal").html(strPageTotal);//给 共计*页 赋值
            if (strPageTotal!=0) {
                $("#perpage").html(strPageSize);
                $("#spanPageNum").html((0+1) + "/" + strPageTotal);  //当前页 0/0
            }

        });
    </script>
</head>

<body>
    <div class="right">
        <div class="m_ip">
            <ul>
                <li><a href="javascript:;" onclick="IndexPage()">当前位置：首页</a><a href="javascript:;">>></a><a href="javascript:;" onclick="PService()">停车服务</a><a href="javascript:;">>></a><a href="javascript:;">账单查询</a></li>
            </ul>
        </div>
        <form action="/ParkingService/BillingQuery" method="post" id="listForm" role="form">
            <div class="my" style="height:435px; position:relative">
                <br />
                <p style="font-size:18px">用户账单<span style="margin:0 5px 0 5px">|</span>用户<span style="color:#299ded">${user.phone }</span></p>
                <br />
                <div>
                    <table class="tablelist">
                        <thead>
                            <tr class="bill_search">
                                <th style="text-align:left" colspan="8">账单类型：<select id="select"><option>充值</option><option>预付</option><option>后付</option><option>退费</option><option>续费</option><option>欠费补交</option><option>自动付费</option></select><input type="hidden" id="listMethod" name="listMethod" /><input type="button" value="查询" onclick="selectList()" style="float:right; margin-right:530px;margin-top:1px"></th>
                            </tr>
                            <tr>
                                <th>账单号</th>
                                <th>账单类型</th>
                                <th>账单金额（元）</th>
                                <th>账单日期</th>
                            </tr>
                        </thead>
                        <tbody>
                                    <input type="hidden" id="payList" value="0" />
                        </tbody>
                    </table>
                </div>
                <div style="position:absolute; right:0; bottom:0" class="pagin">
                    <ul class="bot">
                        <li class="bot1">共计<span id="spanPageTotal">0</span>页，每页<span id="perpage">0</span>条记录</li>
                        <li class="bot2" style="width:100px">,当前页<span id="spanPageNum">0/0</span><input type="hidden" id="tempPageIndex" name="tempPageIndex" /><input type="hidden" name="length" /></li>
                        <li style="width:60px"><a href="javascript:void(0);" onclick="SetPageIndex('first')"><<首页 </a></li>
                        <li class="line">|</li>
                        <li style="width:60px"><a href="javascript:void(0);" onclick="SetPageIndex('last')">上一页</a></li>
                        <li class="line">|</li>
                        <li style="width:60px"><a href="javascript:void(0);" onclick="SetPageIndex('next')">下一页</a></li>
                        <li class="line">|</li>
                        <li style="width:60px"><a href="javascript:void(0);" onclick="SetPageIndex('end')">尾页>></a></li>
                    </ul>
                </div>
            </div>
        </form>
    </div>
</body>
</html>

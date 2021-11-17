<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <html>
<head>
    <meta charset="utf-8">
    <title></title>
    <link href="../../Content/css/blue.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../../Content/js/jquery-1.11.3.js"></script>
    <script type="text/javascript" src="../../Content/js/layout.js"></script>
    <script type="text/javascript" src="../../Content/js/menu.js"></script>
    <script src="../../Content/js/index.js"></script>
    <script src="../Content/js/format.js"></script>
    <style>
        .m_ip ul li {background: url("../../Content/images/ip_icon.png") no-repeat;}
    </style>
    <script>
        $(function () {
            $("#cancel").on('click', function () {
                $(".renew").fadeOut("fast");
                $("#mask").css({ display: 'none' });
            })

            for(var i=1;i<25;i++){
                $("#renewTime").append("<option>"+i+"小时</option>");
            }
        })

        function IndexPage(){
            parent.top.location.href="/HomePage/Index";
        }
    </script>
</head>

<body>
    <!--信息公开详情页-->
    <!--当前续费-->
    <div class="right" style="position:relative">
        <div class="renew">
            <ul>
                <li>
                    <span>订单编号：</span><span style="color:red"></span>
                </li>
                <li>
                    <span>泊位编号：</span><span></span>
                </li>
                <li>
                    <span>车牌编号：</span><span></span>
                </li>
                <li>
                    <span>续费时长：</span><span>
                        <select id="renewTime" onchange="getMoney()"><option>--请选择小时--</option></select>
                        
                    </span>
                </li>
                <li>
                    <span>续费金额：</span>
                    <span style="color:red">0.00元</span>
                </li>
                <li><span>支付密码：</span><input type="password" id="paypwd" placeholder="请输入支付密码"></li>
                <li style="margin:20px 0 20px 0">
                    <a href="javascript:;" id="cancel">取&nbsp;&nbsp;消</a>
                    <a href="javascript:;" onclick="sub()"style="margin-right:40px">确&nbsp;&nbsp;认</a>
                </li>
            </ul>
        </div>

        <div class="m_ip">
            <ul>
                <li><a href="javascript:;" onclick="IndexPage()">当前位置：首页</a><a href="javascript:;">>></a><a href="javascript:;" onclick="PService()">停车服务</a><a href="javascript:;">>></a><a href="javascript:;">待续费清单</a></li>
            </ul>
        </div>
        <form action="/ParkingService/Renew" method="post" id="renewForm" role="form">

            <div class="my" style="height:320px;position:relative">
                
                <div>
                    <table class="tablelist" style="border-top:none">
                        <thead>
                            <tr>
                                
                                <th>续费编号</th>
                                <th>泊位号</th>
                                <th>停车地点</th>
                                <th>车牌号</th>
                                <th>泊车时长</th>
                                <th>驶入时间</th>
                                <th>订单生成</th>
                                <th style="border-right:none">操作</th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                    <input type="hidden" name="tradeOrderCode" />
                    <input type="hidden" name="applyactualduration" />
                    <input type="hidden" name="money" />
                    <input type="hidden" name="renewLeaveTime" />
                    <input type="hidden" name="payPsw" />
                    <input type="hidden" name="length" />
                </div>
                <div style="position:absolute; right:0; bottom:0" class="pagin">
                    <ul class="bot">
                        <li class="bot1">共计<span id="spanPageTotal">0</span>页，每页<span id="perpage">0</span>条记录</li>
                        <li class="bot2" style="width:100px">当前页<span id="spanPageNum">0/0</span><input type="hidden" id="tempPageIndex" name="tempPageIndex" /></li>
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
    <!--当前续费结束-->
</body>
<script type="text/javascript">
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
        $("#tempPageIndex").val(tempPageIndex);//给 当前页的隐藏域 赋值
        $("input[name=length]").val(strPageSize);
        $("#renewForm").submit();//提交表单
    }
    $(function () {

        for (var i = 0; i < 0; i++) {  //把时间从毫秒转换成时间格式
            $(".tablelist tbody tr td:nth-last-child(2)").eq(i).text(format(parseInt($(".tablelist tbody tr td:nth-last-child(2)").eq(i).text()), 'yyyy-MM-dd HH:mm').substring(0, 19));
        }

        strPageTotal = Math.ceil(0/strPageSize);//总页数
        $("#spanPageTotal").html(strPageTotal);//给 共计*页 赋值
        if (strPageTotal!=0) {
            $("#perpage").html(strPageSize);
            $("#spanPageNum").html((0+1) + "/" + strPageTotal);  //当前页 0/0
        }
        // $("#spanPageNum").html((0+1) + "/" + strPageTotal);  //当前页 0/0
    });

    function showWin(obj){
        //续费窗口赋值
        $(".renew ul li:nth-child(1) span:nth-child(2)").text($(obj).parent().siblings().eq(0).text());
        $(".renew ul li:nth-child(2) span:nth-child(2)").text($(obj).parent().siblings().eq(1).text());
        $(".renew ul li:nth-child(3) span:nth-child(2)").text($(obj).parent().siblings().eq(3).text());

        //显示续费窗口
        $("body").append("<div id='mask'></div>");
        $("#mask").addClass("mask").fadeIn("slow");
        $(".renew").fadeIn("slow");
    }

    var isOK=false;  //是否可以续费
    var moneyResult;
    function getMoney() {  //获取续费金额
        if ($("option:selected").text() == "--请选择小时--") {
            isOK=false;
            alert("请选择续费时长!");
            $(".renew ul li:nth-child(5) span:nth-child(2)").text("0.00元");
            return false;
        }
        var tradeOrderCode=$(".renew ul li:nth-child(1) span:nth-child(2)").text();
        var applyactualduration=$("option:selected").text().substring(0, $("option:selected").text().indexOf("小"));

        var url = "/ParkingService/GerRenewMoney";
        var data = { tradeOrderCode,applyactualduration};

        $.post(url, data, function (result) {
            if(result.resultCode=="000000"){
                isOK=true;
                moneyResult=result;
                $(".renew ul li:nth-child(5) span:nth-child(2)").text(result.data.money+"元");
            }
            else{
                $("option:eq(0)").attr('selected','selected');
                $(".renew ul li:nth-child(5) span:nth-child(2)").text("0.00元");
                alert(result.resultMsg+",请重新选择续费时长！");
            }
        });
    }

    function sub(){
        if(isOK){
            if($("#paypwd").val()==""){
                alert("请输入支付密码！");
                return false;
            }
            else{
                $("[name='tradeOrderCode']").val($(".renew ul li:nth-child(1) span:nth-child(2)").text());
                $("[name='applyactualduration']").val($("option:selected").text().substring(0, $("option:selected").text().indexOf("小")));
                $("[name='money']").val(moneyResult.data.money);
                $("[name='renewLeaveTime']").val(moneyResult.data.leaveTime);
                $("[name='payPsw']").val($("#paypwd").val());
                $("#renewForm").submit();
            }
        }else{
            alert("续费金额不正确，请重新选择续费时长！");
        }
    }
</script>
</html>

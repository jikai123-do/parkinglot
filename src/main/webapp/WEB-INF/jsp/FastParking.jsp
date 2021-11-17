<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta charset="utf-8">
    <title>武汉停车官网快速泊车界面</title>
    <link href="../../Content/css/blue.css" rel="stylesheet" type="text/css">
    <link href="../../Content/css/recharge.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="../../Content/js/jquery-1.11.3.js"></script>
    <script type="text/javascript" src="../../Content/js/index.js"></script>
    <style>
        .m_ip ul li {
            background: url(../../Content/images/ip_icon.png) no-repeat;
        }
    </style>
</head>

<body>
    <div class="right">
        <div class="m_ip">
            <ul>
                <li><a href="#" onclick="IndexPage()">当前位置：首页</a><a href="javascript:;">>></a><a href="javascript:;" onclick="PService()">停车服务</a><a href="javascript:;">>></a><a href="javascript:;">快速泊车</a></li>
            </ul>
        </div>
        <div class="my">
            <h3>我的账户</h3>
            <p>手机号：18502273727</p>
          
            <form action="/ParkingService/FastParking" id="fastparking" method="post" role="form">
                <div class="recharge" style="margin-top:20px">
                    <h2 style="color:#666; margin:0 10px 0 10px; padding-left:20px; border-bottom:2px solid #03a9f5">快速泊车</h2>
                    <ul id="bc" style="position:relative">
                        <p style="position:absolute;right:20px; top:0;width:210px; height:96px"><span style="display:block;color:#03a9f5; font-size:14px;line-height:32px;text-align:left">温馨提示：</span><span style="display:block;color:#03a9f5;line-height:32px;text-align:left">通过手机客户端APP泊车</span><span style="display:block;color:#03a9f5;line-height:32px;text-align:left">可享受现金劵抵扣优惠！</span></p>
                        <li>
                            <font>泊位编号：</font>
                                <input type="text" id="berthCode" placeholder="请输入六位数泊位编号" onKeyUp="checkBerthNum(this)" style="margin-left:-5px">
                        </li>
                        <li style="position:relative">
                            <font>车牌编号：</font><input type="text" placeholder="请输入车牌号" id="plate" autocomplete="off">
                            <div id="plateList" style="position:absolute;z-index:10; background:#fff; left:80px; top:40px; width:120px; border:1px solid #ccc; display:none">
                                <input type="hidden" name="berthCode" />
                                <input type="hidden" name="applyactualduration" />
                                <input type="hidden" name="plate" />
                                <input type="hidden" name="money" />
                                <input type="hidden" name="prebuyLeaveTime" />
                                <input type="hidden" name="startCharge"/>
                                <input type="hidden" name="payPsw" />
                            </div>
                        </li>
                        <li><font>购买时长：</font><select id="renewTime" onchange="getMoney()" style="margin-left:0"><option>--请选择--</option></select></li>
                        <li><font>支付密码：</font><input type="password" placeholder="输入6位数支付密码" id="paypwd"></li>
                        <li>
                            <span style="display:block; width:200px; float:left;color:#666; margin-left:80px">
                                账户余额：
                                <font style="color:red"> 0 元</font>
                            </span>
                            <span style="display:block; width:200px; float:left;color:#666">
                                预买金额：
                                <font style="color:red" id="money">￥0.00元</font>
                            </span>
                        </li>
                        <li><input type="button" onclick="sub()" name="pay" value="确&nbsp;&nbsp;认" style="margin-left:80px; background:#1fabdf; color:#fff;width:120px"></li>
                    </ul>
                </div>
            </form>
        </div>
    </div>
</body>
<script>
    $(function () {
        for (var i = 1; i < 25; i++) {  //添加小时数选项
            $("#renewTime").append("<option>" + i + "小时</option>");
        }

        if ($("#berthCode").val() == "") {
            delCookie("timeToBuy");
        }

        if (getCookie("timeToBuy") != null) {  //绑定所选小时数
            $.each($("option"), function () {
                if ($(this).text() == getCookie("timeToBuy")) {
                    $(this).attr("selected", true);
                }
            })
        }

        

        $("#plate").focus(function () {
            $("#plateList").css("display", "inline");
        })

        $("#plate").blur(function () {
            $("#plateList").css("display", "none");
        })

        $("select").bind("click", function () {
            if ($("#berthCode").val().length != 6) {
                alert("请先输入正确的泊位号,为您计算费用！");
            }
        })

        //$("#plateList p").on("click", function () {
        //    $("#plate").val($(this).text());
        //})

        $("#plateList p").mouseover(function () {
            $(this).siblings("p").css("background", "none");
            $(this).css("background", "#03a9f5");
            $("#plate").val($(this).text());
        })
    })

    function autoComplete(obj) {
        $("#plate").val($(obj).text());
    }

    function IndexPage() {
        parent.top.location.href = "/HomePage/Index";
    }

    function checkBerthNum(obj) {  //检查泊位号格式
        if ($(obj).val().length > 6) {
            $(obj).val($(obj).val().substr(0, 6));
        };
        $(obj).val($(obj).val().replace(/[^\d]/g, ''));
    }

    function checkPlate(plate) {  //检查车牌号
        var re = /(^[\u4E00-\u9FA5]{1}[A-Z0-9]{6}$)|(^[A-Z]{2}[A-Z0-9]{2}[A-Z0-9\u4E00-\u9FA5]{1}[A-Z0-9]{4}$)|(^[\u4E00-\u9FA5]{1}[A-Z0-9]{5}[挂学警军港澳]{1}$)|(^[A-Z]{2}[0-9]{5}$)|(^(08|38){1}[A-Z0-9]{4}[A-Z0-9挂学警军港澳]{1}$)/;
        if (window.document.getElementById("plate").value.search(re) == -1) {
            return false;
        }
        else {
            return true;
        }
    }

    function validate() { //确认购买验证
        if ($("#berthCode").val() == "") {
            alert("请输入泊位号！");
            return false;
        } else if ($("option:selected").text() == "--请选择--") {
            alert("请选择预买时长!");
            return false;
        } else if ($("#plate").val() != "" && !checkPlate($("#plate").val())) {
            alert("请输入正确格式的车牌号!");
            return false;
        } else if ($("#paypwd").val() == "") {
            alert("请输入支付密码!");
            return false;
        } else if (isOkPreBuy != "success") {
            alert(isOkPreBuy);
            return false;
        }
        return true;
    }

    function sub() {
        if (validate()) {
            $("[name='berthCode']").val($("#berthCode").val());
            $("[name='applyactualduration']").val($("option:selected").text().substring(0, $("option:selected").text().indexOf("小")));
            $("[name='plate']").val($("#plate").val());
            $("[name='payPsw']").val($("#paypwd").val());
            $("#fastparking").submit();
        }
    }

    var isOkPreBuy = "";
    function getMoney() {
        if ($("#berthCode").val() == "") {
            alert("请输入泊位号！");
        } else if ($("option:selected").text() == "--请选择--") {
            alert("请选择预买时长!");
        } else {
            //$("[name='berthCode']").val($("#berthCode").val());
            //$("[name='applyactualduration']").val($("option:selected").text().substring(0, $("option:selected").text().indexOf("小")));
            //setCookie("timeToBuy", $("option:selected").text()); //保存所选时间
            //$("#fastparking").submit();
            var berthCode = $("#berthCode").val();
            var applyactualduration = $("option:selected").text().substring(0, $("option:selected").text().indexOf("小"));

            var url = "/ParkingService/GetPreMoney";
            var data = { berthCode, applyactualduration};

            $.post(url, data, function (result) {
                if (result.resultCode == "000000") {
                    isOkPreBuy = "success";
                    $("#money").text("￥" + result.data.money + "元");
                    $("[name='money']").val(result.data.money);
                    $("[name='prebuyLeaveTime']").val(result.data.leaveTime);
                    $("[name='startCharge']").val(result.data.startChargeTime);
                }
                else {
                    isOkPreBuy = result.resultMsg;
                    $("option:eq(0)").attr('selected', 'selected');
                    $("#money").text("0.00元");
                    alert(result.resultMsg + ",请重新选择续费时长！");
                }
            });
        }
    }
</script>
</html>



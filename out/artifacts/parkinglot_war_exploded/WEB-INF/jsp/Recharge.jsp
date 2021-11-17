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
            <h3>我的账户</h3>
            <p>手机号：${user.phone}</p>
            <p><img src="http://www.wuhanparking.com:80/Content/images/line1.png"></p>
            <div class="name">
                <p style="text-align:left;">
                            <a href="Personal"><img src="http://www.wuhanparking.com:80/Content/images/name.gif"></a>

                                <b>${user.username }</b>
                            <b>账户余额：<span>${user.balance}</span></b>
                            
                </p>
                <dl id="rightBox">

                </dl>
            </div>
            <p><img src="http://www.wuhanparking.com:80/Content/images/line1.png"></p>
            <form action="${pageContext.request.contextPath}/recharge.action" method="post" id="ReForm" role="form">
                <div class="recharge">
                   
                    <h2>请选择您要充值的金额：</h2>
                    <p>
                        <a href="javascript:;" style="margin-left:232px">￥50</a>
                        <a href="javascript:;">￥100</a>
                        <a href="javascript:;">￥200</a>
                        <a href="javascript:;">￥300</a>
                        <a href="javascript:;">￥500</a>
                    </p>
                    <ul>
                        <li><b style="color:#fff">充值</b>充值金额：<input type="text" id="amount" name="rechargeprice" placeholder="请输入您要充值的金额"></li>
                        <li>请输入验证码：<input type="text" id="verifyCode" placeholder="输入手机验证码" style="width:35%" value="1111"><input type="button" onclick="getCode()" id="GetValNum" value="获取手机验证码" class="rh"></li>
                        <p>选择支付方式：<input type="radio" name="radio" value="微信"><span>微信</span><input type="radio" name="radio" value="支付宝"><span>支付宝</span><input type="radio" name="radio" value="银联"><span>银联</span><input type="hidden" id="rechargemode" value="" name="rechargemode" /></p>
                        <li><input type="button" onclick="sub()" value="确&nbsp;&nbsp;认" style="margin-left:-215px; background:#1fabdf; color:#fff;width:120px"></li>
                    </ul>
                </div>
            </form>
        </div>
    </div>
</body>
<script>

    $("#amount").bind("input propertychange", function () {
        //check(this);//测试用
        KeysVal(this);//上线后调用这个方法
    });
</script>
<script>
    $(".recharge a").bind("click", function () {  //点击选取金额
        $("#amount").val($(this).text().substring(1, $(this).text().length));
    })

    //function check(obj) {  //金额验证，只能输入数字和小数点（两位小数）

    //    $(obj).val($(obj).val().replace(/[^\d.]/g, '').replace(/^\./g, "").replace(/\.{2,}/g, ".").replace(".", "$#$").replace(/\./g, "").replace("$#$", ".").replace(/^(\-)*(\d+)\.(\d\d).*$/, '$1$2.$3'));
    //}

    //金额验证，只能输入正整数校验
    function KeysVal(obj) {
        if (obj.value.substring(0, 1) == "0") {
            obj.value = "";
        } else if (obj.value.search(/^[0-9]*[1-9][0-9]*$/) == -1) {
            obj.value = obj.value.substring(0, obj.value.length - 1);
        }
        else if (obj.value.length > 6) {
            obj.value = obj.value.substring(0, 6);
        }
        $(obj).val(obj.value);

    }

    $("#amount").bind('blur', function () {
        //最后一位是小数点的话，移除
        $(this).val(($(this).val().replace(/\.$/g, "")));
    })

    //获取手机验证码
    var wait = 60;
    function time(o) {
        if (wait == 0) {
            o.removeAttribute("disabled");
            o.value = "获取手机验证码";
            wait = 60;
        } else {
            o.setAttribute("disabled", true);
            o.value = "重新发送(" + wait + ")";
            wait--;
            setTimeout(function () {
                time(o)
            },
            1000)
        }
    }
    document.getElementById("GetValNum").onclick = function () {
        $.ajax({
            url: "/ParkingService/RechargeVerifyCode",
            type: 'post',
            async: false,
            success: function (ResultData) {
                var resultObj = eval("(" + ResultData + ")");
                if (resultObj.resultCode == "000000") {
                    var data = resultObj.data;
                    var o = document.getElementById("GetValNum");
                    time(o);
                    alert("验证码已发送至您的手机，请注意查收！");
                }
                else {
                    alert(resultObj.resultMsg);
                }
            }
        });
    }

    function sub() {  //验证并提交表单
        //alert("该功能暂未开启！请用微信公众号或者APP充值！");
        if ($("#amount").val() == "") {
            alert("请输入要充值的金额！");
            return false;
        }
        else if ($("#verifyCode").val() == "") {
            alert("请输入验证码！");
            return false;
        }
        else if ($("input:radio:checked").length == 0) {
            alert("请选择充值方式！");
            return false;
        }

        $("#ReForm").submit();

        //$("#rechargemode").val($(":radio[name=radio]:checked").val());
        //$("#ReForm").submit();
    }
</script>

</html>

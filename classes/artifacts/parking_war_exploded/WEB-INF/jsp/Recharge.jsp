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
                <li><a href="javascript:;" onclick="IndexPage()">?????????????????????</a><a href="javascript:;">>></a><a href="javascript:;" onclick="PService()">????????????</a><a>>></a><a href="javascript:;">????????????</a></li>
            </ul>
        </div>
        <div class="my">
            <h3>????????????</h3>
            <p>????????????${user.phone}</p>
            <p><img src="http://www.wuhanparking.com:80/Content/images/line1.png"></p>
            <div class="name">
                <p style="text-align:left;">
                            <a href="Personal"><img src="http://www.wuhanparking.com:80/Content/images/name.gif"></a>

                                <b>${user.username }</b>
                            <b>???????????????<span>${user.balance}</span></b>
                            
                </p>
                <dl id="rightBox">

                </dl>
            </div>
            <p><img src="http://www.wuhanparking.com:80/Content/images/line1.png"></p>
            <form action="${pageContext.request.contextPath}/recharge.action" method="post" id="ReForm" role="form">
                <div class="recharge">
                   
                    <h2>?????????????????????????????????</h2>
                    <p>
                        <a href="javascript:;" style="margin-left:232px">???50</a>
                        <a href="javascript:;">???100</a>
                        <a href="javascript:;">???200</a>
                        <a href="javascript:;">???300</a>
                        <a href="javascript:;">???500</a>
                    </p>
                    <ul>
                        <li><b style="color:#fff">??????</b>???????????????<input type="text" id="amount" name="rechargeprice" placeholder="??????????????????????????????"></li>
                        <li>?????????????????????<input type="text" id="verifyCode" placeholder="?????????????????????" style="width:35%" value="1111"><input type="button" onclick="getCode()" id="GetValNum" value="?????????????????????" class="rh"></li>
                        <p>?????????????????????<input type="radio" name="radio" value="??????"><span>??????</span><input type="radio" name="radio" value="?????????"><span>?????????</span><input type="radio" name="radio" value="??????"><span>??????</span><input type="hidden" id="rechargemode" value="" name="rechargemode" /></p>
                        <li><input type="button" onclick="sub()" value="???&nbsp;&nbsp;???" style="margin-left:-215px; background:#1fabdf; color:#fff;width:120px"></li>
                    </ul>
                </div>
            </form>
        </div>
    </div>
</body>
<script>

    $("#amount").bind("input propertychange", function () {
        //check(this);//?????????
        KeysVal(this);//???????????????????????????
    });
</script>
<script>
    $(".recharge a").bind("click", function () {  //??????????????????
        $("#amount").val($(this).text().substring(1, $(this).text().length));
    })

    //function check(obj) {  //???????????????????????????????????????????????????????????????

    //    $(obj).val($(obj).val().replace(/[^\d.]/g, '').replace(/^\./g, "").replace(/\.{2,}/g, ".").replace(".", "$#$").replace(/\./g, "").replace("$#$", ".").replace(/^(\-)*(\d+)\.(\d\d).*$/, '$1$2.$3'));
    //}

    //??????????????????????????????????????????
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
        //???????????????????????????????????????
        $(this).val(($(this).val().replace(/\.$/g, "")));
    })

    //?????????????????????
    var wait = 60;
    function time(o) {
        if (wait == 0) {
            o.removeAttribute("disabled");
            o.value = "?????????????????????";
            wait = 60;
        } else {
            o.setAttribute("disabled", true);
            o.value = "????????????(" + wait + ")";
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
                    alert("??????????????????????????????????????????????????????");
                }
                else {
                    alert(resultObj.resultMsg);
                }
            }
        });
    }

    function sub() {  //?????????????????????
        //alert("???????????????????????????????????????????????????APP?????????");
        if ($("#amount").val() == "") {
            alert("??????????????????????????????");
            return false;
        }
        else if ($("#verifyCode").val() == "") {
            alert("?????????????????????");
            return false;
        }
        else if ($("input:radio:checked").length == 0) {
            alert("????????????????????????");
            return false;
        }

        $("#ReForm").submit();

        //$("#rechargemode").val($(":radio[name=radio]:checked").val());
        //$("#ReForm").submit();
    }
</script>

</html>

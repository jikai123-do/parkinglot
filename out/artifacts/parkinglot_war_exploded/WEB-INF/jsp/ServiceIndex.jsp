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
    <title>登录</title>
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

<!-- /Copyright � 2005. Spidersoft Ltd -->


    
 <!--head开始--> 
<jsp:include page="MyJsp.jsp"></jsp:include>
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title></title>
    <link href="../../Content/css/blue.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../../Content/js/jquery-1.11.3.js"></script>
    <script src="../../Content/js/ValidateCode.js"></script>
</head>
<body>
    
   <!--导航开始-->
<jsp:include page="guidInclude.jsp"></jsp:include>
    
    <div class="login">
        <div class="land" style="background:url(http://www.wuhanparking.com:80/Content/images/login_bg.png)">
            <div class="lg">
                <h3 id="tab2"><a href="javascript:;">密码登录</a></h3>
                <h3 id="tab1"><a href="javascript:;" class="lgh">快速登录</a></h3>
                <form action="/HomePage/Login" method="post" id="loginfrm" role="form">
                    <ul style="display:none" id="lg1">
                        <div class="tips" id="notice"></div>
                        <li><span>手机号：</span><input type="text" placeholder="请输入手机号" id="searchkey1" name="usercode" msg="手机号" /></li>
                        <li><span>验证码：</span><input type="text" placeholder="请输入验证码" style="width:140px" id="searchkey3" msg="验证码" name="txtvalNum" /><img alt="加载失败" src="../../HomePage/ImageVerifyCode.jpg" onclick="changeCode()" id="imgCode_fast" style="width:80px;height:30px;display: block;font-family: Arial;letter-spacing:2px;color: blue;float:right; text-align:center" /></li>
                        <li>
                            <span>密<b style="color:#fff">密</b>码：</span><input type="text" placeholder="请输入手机验证码" id="searchkey2" msg="密码" style="width:120px;" name="password" /><input type="button" id="GetValNum" class="GetValNum" value="获取手机验证码">
                        </li>
                        
                        
                        <li><input type="button" value="登&nbsp;&nbsp;录" class="bt" onclick="loginValidate()" /></li>
                        <p class="rember"><a href="../HomePage/Sign.html" class="zc">立即注册</a><b>还没账户?</b></p>
                    </ul>
                </form>
                <form action="/HomePage/pwdLogin" method="post" id="pwdLoginForm" role="form">
                    <ul id="lg2">
                        <div class="tips" id="notice1"></div>
                        <li><span>手机号：</span><input type="text" placeholder="请输入手机号" id="usercode1" name="usercode1" msg="手机号" /></li>
                        <li>
                            <span>密<b style="color:#fff">密</b>码：</span><input type="password" placeholder="请输入登录密码" msg="密码" name="password1" id="password1" />
                        </li>
                        <li><span>验证码：</span><input type="text" placeholder="请输入验证码" style="width:140px" id="iCode" msg="验证码" name="txtvalNum" /><img alt="加载失败" src="../../HomePage/ImageVerifyCode.jpg" onclick="changeCode()" id="imgCode_pwd" style="width:80px;height:30px;display: block;font-family: Arial;letter-spacing:2px;color: blue;float:right; text-align:center" /></li>
                        
                        <li><input type="button" value="登&nbsp;&nbsp;录" class="bt" onclick="pwdLogin()" /></li>
                        <p class="rember"><a href="../HomePage/Sign.html" class="zc">立即注册</a><b>还没账户?</b></p>
                    </ul>
                </form>
            </div>
        </div>
    </div>

</body>
<script>
    $(document).ready(function () {
        $("#tab2").click(function () {
            $("#tab2 a").css('background', '#03a9f5')
            $("#lg1").css('display', 'none')
            $("#lg2").css('display', 'block')
            $("#tab1 a").css('background', '#ccc')
        });
        $("#tab1").click(function () {
            $("#tab1 a").css('background', '#03a9f5')
            $("#lg2").css('display', 'none')
            $("#lg1").css('display', 'block')
            $("#tab2 a").css('background', '#ccc')
        });
    });

</script>
<script type="text/javascript">
    $(function () {
        //createCode();
        //createCode1();
    });

    $("body").keydown(function () {//回车提交事件
        if (event.keyCode == "13") {//keyCode=13是回车键
            $(".bt").click();
        }
    });

    function changeCode() {  //刷新验证码
        $.ajax({
            url: "/HomePage/ImageVerifyCode",
            type: 'GET',
            async: false,
            success: function (ResultData) {
                $("#imgCode_fast").after("<img alt='加载失败' src='/HomePage/ImageVerifyCode' onclick='changeCode()' id='imgCode_fast' style='width:80px;height:30px;display: block;font-family: Arial;letter-spacing:2px;color: blue;float:right; text-align:center'/>");
                $("#imgCode_fast").eq(0).remove();
                $("#imgCode_pwd").after("<img alt='加载失败' src='/HomePage/ImageVerifyCode' onclick='changeCode()' id='imgCode_pwd' style='width:80px;height:30px;display: block;font-family: Arial;letter-spacing:2px;color: blue;float:right; text-align:center'/>");
                $("#imgCode_pwd").eq(0).remove();
            }
        })
    }

    function loginValidate() {
        if (!PhoneIsNull($("#searchkey1").val())) {
            $("#notice").show();
            $("#notice").html("<img src='http://www.wuhanparking.com:80/Content/images/tips.png'>" + $("#searchkey1").attr("msg") + "不能为空！");
            return false;
        }
        if (!checkPhone($("#searchkey1").val())) {
            $("#notice").show();
            $("#notice").html("<img src='http://www.wuhanparking.com:80/Content/images/tips.png'>" + "请输入正确格式的手机号码!");
            return false;
        }
        if ($("#searchkey3").val() == "") { //图形验证码为空
            $("#notice").show();
            $("#notice").html("<img src='http://www.wuhanparking.com:80/Content/images/tips.png'>验证码不能为空！");
            return false;
        }
        if ($("#searchkey2").val() == "") { //手机验证码为空
            $("#notice").show();
            $("#notice").html("<img src='http://www.wuhanparking.com:80/Content/images/tips.png'>" + $("#searchkey2").attr("msg") + "不能为空！");
            return false;
        }


        //var inputCode = document.getElementById("searchkey3").value.toUpperCase(); //取得输入的验证码并转化为大写
        //if (!validate(inputCode)) {
        //    return false;
        //}

        //验证均通过
        $("#notice").hide();
        $(".bt").attr("disabled", "disabled");
        $(".bt").val("登录中...");
        $("#loginfrm").submit();
    }
    //校验验证码
    

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
        if (!PhoneIsNull($("#searchkey1").val())) {
            $("#notice").show();
            $("#notice").html("<img src='http://www.wuhanparking.com:80/Content/images/tips.png'>" + $("#searchkey1").attr("msg") + "不能为空！");
            return false;
        }
        else if (!checkPhone($("#searchkey1").val())) {
            $("#notice").show();
            $("#notice").html("<img src='http://www.wuhanparking.com:80/Content/images/tips.png'>" + "请输入正确格式的手机号码!");
            return false;
        }
        else if ($("#searchkey3").val() == "") {
            $("#notice").show();
            $("#notice").html("<img src='http://www.wuhanparking.com:80/Content/images/tips.png'>" + "请输入图形验证码!");
            return false;
        }
        else {
            $("#notice").hide();
            $.ajax({
                url: "/HomePage/GetVerifyNum",
                type: 'POST',
                async: false,
                data: { "phoneNum": $("#searchkey1").val(), "imageRandom": $("#searchkey3").val() },
                success: function (ResultData) {
                    var resultObj = eval("(" + ResultData + ")");
                    if (resultObj.resultCode == "000000") {
                        var o = document.getElementById("GetValNum");
                        time(o);
                        alert("验证码已发送至您的手机，请注意查收！");
                    }
                    else {
                        alert(resultObj.resultMsg);
                        $(".bt").removeAttr("disabled");
                    }
                }
            });
        }
    }

    function checkPhone(phone) {
        var ab = /^0?1[3584][0-9][0-9]{8}$/;
        if (ab.test(phone) == false) {
            return false;
        } else {
            return true;
        }
    }
    function PhoneIsNull(phone) {
        if (phone == "") { //手机号为空
            $("#notice").show();
            $("#notice").html("<img src='http://www.wuhanparking.com:80/Content/images/tips.png'>" + $("#searchkey1").attr("msg") + "不能为空！");
            return false;
        }
        else {
            return true;
        }
    }
</script>
<script>
    function pwdLogin() {
        if ($("#usercode1").val() == "") { //手机号为空
            $("#notice1").show();
            $("#notice1").html("<img src='http://www.wuhanparking.com:80/Content/images/tips.png'>" + $("#searchkey1").attr("msg") + "不能为空！");
            return false;
        }

        if (!checkPhone($("#usercode1").val())) {
            $("#notice1").show();
            $("#notice1").html("<img src='http://www.wuhanparking.com:80/Content/images/tips.png'>" + "请输入正确格式的手机号码!");
            return false;
        }
        if ($("#password1").val() == "") { //密码为空
            $("#notice1").show();
            $("#notice1").html("<img src='http://www.wuhanparking.com:80/Content/images/tips.png'>" + $("#password1").attr("msg") + "不能为空！");
            return false;
        }
        if ($("#iCode").val() == "") { //图形验证码为空
            $("#notice1").show();
            $("#notice1").html("<img src='http://www.wuhanparking.com:80/Content/images/tips.png'>验证码不能为空！");
            return false;
        }

        

        //验证均通过
        $("#notice1").hide();
        $(".bt").attr("disabled", "disabled");
        $(".bt").val("登录中...");
        $("#pwdLoginForm").submit();
    }
</script>
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
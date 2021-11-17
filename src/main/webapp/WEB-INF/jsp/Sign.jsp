<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>注册</title>
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
    <script type="text/javascript" src="../../Content/js/jquery-1.11.3.js"></script>
    <script type="text/javascript" src="../../Content/js/index.js"></script>
    
</head>

<body>
<!--导航开始-->
<jsp:include page="guidInclude.jsp"></jsp:include>
    <!--注册界面-->
    <div class="sign">
        <div class="regist">
            <h3>欢迎光临！免费注册，轻松停车！</h3>
            <form action="${pageContext.request.contextPath}/regist.action" method="post" id="signfrm" role="form">
                <div class="resgit">
                    <div class="rsgline">
                        <ul><img src="../../Content/images/sign_bg1.png"><span class="rgsd">填写账户信息</span></ul>
                        <ul class="rgd1"><img src="../../Content/images/sign_bg1.png"><span>手机验证</span></ul>
                        <ul class="rgd2"><img src="../../Content/images/sign_bg1.png"><span>完成注册</span></ul>
                    </div>
                    <div class="signup">
                        <p>带注<span>*</span>为必填项，已经有账号？<a href="Login.jsp">请登录</a></p>
                       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span style="color: red;">${erroMsg}</span>
                        <ul><li><span>用户名：</span><input type="text" placeholder="请输入昵称" id="searchkey4" name="username"  value="${inputuser.username }"/></li></ul>
                        <ul><li><span><i>*</i>手机号：</span><input type="text" placeholder="请输入手机号" id="searchkey5" msg="手机号" name="phone"  onblur="isonly()" value="${inputuser.phone}"/><b id="phoneTip"></b></li></ul>

                        

                       <ul><li><span><i>*</i>邮箱：</span><input type="text" placeholder="请输入邮箱号" id="searchkey6" msg="邮箱" name="email"  onblur="isEmail()" value="${inputuser.email}"/><b id="emailTip"></b></li></ul>
                        <ul><li><span><i>*</i>登录密码：</span><input type="password" placeholder="请设置登录密码" id="searchkey8" msg="密码" name="password" value="${inputuser.email}"/><b id="pwdTip" ></li></ul>
                        <ul><li><span><i>*</i>确认密码：</span><input type="password" placeholder="请确认登录密码" id="searchkey9" value=""/></li></ul>
                       
                        <ul><li style="height:40px"><input type="button" value="注册" class="resign_bt" id="regBtn" onclick="return FormValidation()"></li></ul>
                    </div>
                </div>
                
            </form>

        </div>
    </div>
</body>
<script type="text/javascript">
    $(function () {
        $("#phoneTip").hide();
        $("#verTip").hide();
        $("#phoneVerTip").hide();
        $("#verTip").hide();
        $("#pwdTip").hide();
        $("#checkbox1").attr("checked", true);
    });
    
   
    
    
    function isEmail(){  		
    //定义正则表达式的变量:邮箱正则  		
    var reg=/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;  		
    var  strEmail=$("#searchkey6").val();  		//验证邮箱正则成功，给出正确提示  	
    var  b=reg.test(strEmail);
   if(!b){
   
   $("#emailTip").html("<img src='http://www.wuhanparking.com:80/Content/images/sign_bg3.png'>"+ $("#searchkey6").attr("msg") + "格式不正确！"  );
   return false;
   }else{
   return true;
   }
    		}

  
    function FormValidation() {
        if ($("#searchkey5").val() == "") { //手机号
            $("#phoneTip").show();
            $("#phoneTip").html("<img src='http://www.wuhanparking.com:80/Content/images/sign_bg3.png'>" + $("#searchkey5").attr("msg") + "不能为空！");
            return false;
        }
        if (!checkPhone($("#searchkey5").val())) {
            $("#phoneTip").show();
            $("#phoneVerTip").hide();
            $("#verTip").hide();
            $("#pwdTip").hide();
            $("#phoneTip").html("<img src='http://www.wuhanparking.com:80/Content/images/sign_bg3.png'>" + "请输入正确格式的手机号码");
            return false;
        }
       
        
        if ($("#searchkey6").val() == "") {  //邮箱验证
            $("#phoneTip").hide();
            $("#phoneVerTip").hide();
            $("#verTip").hide();
            $("#pwdTip").show();
            $("#emailTip").html("<img src='http://www.wuhanparking.com:80/Content/images/sign_bg3.png'>"+ $("#searchkey6").attr("msg") + "不能为空！"  );
            return false;
            
            
            }
            
        if(!isEmail())   {
        
         return false;
        
        
        }
           
        
        
        if ($("#searchkey8").val() == "") {  //登录密码为空
            $("#phoneTip").hide();
            $("#phoneVerTip").hide();
            $("#verTip").hide();
            $("#pwdTip").show();
            $("#pwdTip").html("<img src='http://www.wuhanparking.com:80/Content/images/sign_bg3.png'>" + $("#searchkey8").attr("msg") + "不能为空！");
            return false;
        }

        if ($("#searchkey8").val().indexOf(' ') > -1) {  //登录密码不能包含空格
            $("#phoneTip").hide();
            $("#phoneVerTip").hide();
            $("#verTip").hide();
            $("#pwdTip").show();
            $("#pwdTip").html("<img src='http://www.wuhanparking.com:80/Content/images/sign_bg3.png'>" + $("#searchkey8").attr("msg") + "不能包含空格！");
            return false;
        }

        if ($("#searchkey8").val().length < 6 || $("#searchkey8").val().length > 12) {  //确认登录密码
            $("#phoneTip").hide();
            $("#phoneVerTip").hide();
            $("#verTip").hide();
            $("#pwdTip").show();
            $("#pwdTip").html("<img src='http://www.wuhanparking.com:80/Content/images/sign_bg3.png'>" + $("#searchkey8").attr("msg") + "长度在6-12位！");
            return false;
        }

        if ($("#searchkey9").val() != $("#searchkey8").val()) {
            $("#phoneTip").hide();
            $("#pwdTip").hide();
            alert("两次输入的密码不一致！");
            return false;
        }

        
      
        //验证均通过

        $("#phoneTip").hide();
        $("#phoneVerTip").hide();
        $("#verTip").hide();
        $("#pwdTip").hide();
        $("#signfrm").submit();
    }

    //校验验证码
    

    function checkPhone(phone) {
        var ab = /^0?1[3584][0-9][0-9]{8}$/;
        if (ab.test(phone) == false) {
            return false;
        } else {
            return true;
        }
    }


    document.getElementById("GetValNum").onclick = function () {
        if ($("#searchkey5").val() == "") { //手机号
            $("#phoneTip").show();
            $("#phoneTip").html("<img src='http://www.wuhanparking.com:80/Content/images/sign_bg3.png'>" + $("#searchkey5").attr("msg") + "不能为空！");
            return false;
        } 
        if (!checkPhone($("#searchkey5").val())) {
            $("#phoneTip").show();
            $("#phoneVerTip").hide();
            $("#verTip").hide();
            $("#pwdTip").hide();
            $("#phoneTip").html("<img src='http://www.wuhanparking.com:80/Content/images/sign_bg3.png'>" + "请输入正确格式的手机号码");
            return false;
        } if ($("#searchkey7").val() == "") {
            $("#verTip").show();
            $("#phoneTip").hide();
            $("#verTip").html("验证码不能为空!");
            return false;
        }
        else {
            $("#phoneTip").hide();
            $("#phoneVerTip").hide();
            $("#verTip").hide();
            $("#pwdTip").hide();

            $.ajax({
                url: "/HomePage/RegisterCode",
                type: 'POST',
                async: false,
                data: { "phoneNum": $("#searchkey5").val(), "imageRandom": $("#searchkey7").val() },
                success: function (ResultData) {
                    var resultObj = eval("(" + ResultData + ")");
                    if (resultObj.resultCode == "000000") {
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
    }
</script>
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

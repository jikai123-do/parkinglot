<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  
<!DOCTYPE html>

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
                
                
                <form action="${pageContext.request.contextPath}/login.action" method="post" id="pwdLoginForm" role="form">
					<ul id="lg2">
                        <div class="tips" id="notice1"></div>
                        <li><span>用户名：</span><input type="text"  id="username" name="username" msg="用户名" /></li>
                        <li>
                            <span>密<b style="color:#fff">密</b>码：</span><input type="password" " msg="密码" name="password" id="password" />
                        </li>
                        <li>

                      <label class="myLabel">图形码：
                        <input  type="text"       style="width:60px;height:30px "   onblur="testCode()"      id="inputCode"        />
                        <input type = "button" id="code" onclick="createCode()"  style="width:70px;height:30px;background-color: #ccc ;text-align: center"   />
                        <input type="button" value="刷新" style="width:50px;height:30px;" id="flushCode"/>
                        </label> 
                        
                        
                        </li>
                      
                        <li><input type="button" value="登&nbsp;&nbsp;录" class="bt" onclick="pwdLogin()" /></li>
                        <p class="rember"><a href="Sign.jsp" class="zc">立即注册</a><b>还没账户?</b></p>
                    </ul>
                    
                </form>
            </div>
        </div>
    </div>

</body>


<script>

      

     function  testCode(){
     
      var $inputCode=$("#inputCode").val();
     
      var $code=$("#code").val();
      
      if($inputCode==$code){
     
      return true;
      }else{
       $("#notice1").show();
      $("#notice1").html("<img src='http://www.wuhanparking.com:80/Content/images/tips.png'>" +"验证码输入有误");
      return false;
      
      }
     
     
     }
      
      // 图形验证码
        var code ; //在全局定义验证码
        //产生验证码
        window.onload = function createCode(){
            code = "";
            var codeLength = 4;//验证码的长度
            var checkCode = document.getElementById("code");
            var random = new Array(0,1,2,3,4,5,6,7,8,9,'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R',
                'S','T','U','V','W','X','Y','Z');//随机数
            for(var i = 0; i < codeLength; i++) {//循环操作
                var index = Math.floor(Math.random()*36);//取得随机数的索引（0~35）
                code += random[index];//根据索引取得随机数加到code上
            }
            checkCode.value = code;//把code值赋给验证码
        }
      
       
      $("#flushCode").click(function(){
        
             code = "";
            var codeLength = 4;//验证码的长度
             var checkCode = document.getElementById("code");
             var random = new Array(0,1,2,3,4,5,6,7,8,9,'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R',
                 'S','T','U','V','W','X','Y','Z');//随机数
             for(var i = 0; i < codeLength; i++) {//循环操作
                 var index = Math.floor(Math.random()*36);//取得随机数的索引（0~35）
                 code += random[index];//根据索引取得随机数加到code上
             }
             checkCode.value = code;//把code值赋给验证码
      
      
      });
   
    function pwdLogin() {
        if ($("#username").val() == "") { //用户名为空
            $("#notice1").show();
            $("#notice1").html("<img src='http://www.wuhanparking.com:80/Content/images/tips.png'>" + $("#username").attr("msg") + "不能为空！");
            return false;
        }

        
        if ($("#password").val() == "") { //密码为空
            $("#notice1").show();
            $("#notice1").html("<img src='http://www.wuhanparking.com:80/Content/images/tips.png'>" + $("#password").attr("msg") + "不能为空！");
            return false;
        }
       

 
          if(!testCode()){//验证码有误
         
          
            return false;
         
        
          }
        

        //验证均通过
        $("#notice1").hide();
        $(".bt").attr("disabled", "disabled");
        $(".bt").val("登录中...");
        $("#pwdLoginForm").submit();
    }
</script>

   
    <!--底部-->
    <div class="boot">
        <div class="bot">
            <ul style="margin-top:10px">
                </ul>
        </div>
    </div>
    


</html>

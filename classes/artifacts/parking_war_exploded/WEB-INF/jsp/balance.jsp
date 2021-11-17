<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>停车服务</title>
<link rel="shortcut icon"
	href="http://www.wuhanparking.com/Content/images/logo.ico" />
<link href="../../Content/css/layout.css" rel="stylesheet" />
<script type="text/javascript" src="../../Content/js/jquery-1.11.3.js"></script>
<script type="text/javascript" src="../../Content/js/layout.js"></script>
<style>
.search {
	background: url(../../Content/images/search.png)
}
</style>
</head>
<body>


	<!-- Copyright � 2005. Spidersoft Ltd -->
	<style>
A.applink:hover {
	border: 2px dotted #DCE6F4;
	padding: 2px;
	background-color: #ffff00;
	color: green;
	text-decoration: none
}

A.applink {
	border: 2px dotted #DCE6F4;
	padding: 2px;
	color: #2F5BFF;
	background: transparent;
	text-decoration: none
}

A.info {
	color: #2F5BFF;
	background: transparent;
	text-decoration: none
}

A.info:hover {
	color: green;
	background: transparent;
	text-decoration: underline
}
</style>

	<!-- /Copyright � 2005. Spidersoft Ltd -->


	<!--head开始-->
	<jsp:include page="MyJsp.jsp"></jsp:include>


	<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title></title>
<link href="../../Content/css/blue.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../Content/js/jquery-1.11.3.js"></script>
<script type="text/javascript" src="../../Content/js/layout.js"></script>
<script type="text/javascript" src="../../Content/js/menu.js"></script>
<script type="text/javascript" src="../../Content/js/index.js"></script>
<style>
.v01 {
	background: url(../Content/images/cut.png) no-repeat;
}

.v02 {
	background: url(../Content/images/spread.png) no-repeat;
}

.menu2 p a {
	background: url(../Content/images/dian1.png) no-repeat;
}

.menu2 p a.tab2 {
	background: url(../Content/images/dian.png) no-repeat;
}

.m_ip ul li {
	background: url(../../Content/images/ip_icon.png) no-repeat;
}
</style>
</head>

<body>
	<!--导航开始-->
	<jsp:include page="guidInclude.jsp"></jsp:include>
	<!--信息公开详情页-->
	<div class="service">
		<div class="serve">
			<div class="left">
				<ul>
					<li class="tab_menu"><a href="javascript:;">我的账户<span
							class="v01"></span></a></li>
					<div class="menu2">
						<p>
							<a href="Recharge.jsp" target="rightFrame" id="kscz">快速充值</a>
						</p>
						<p>
							<a href="FastParking.jsp" target="rightFrame">快速泊车</a>
						</p>
						<p>
							<a href="BatchPay.jsp" target="rightFrame" id="qfqd">欠费清单</a>
						</p>
						<p>
							<a href="BatchOthers.jsp" target="rightFrame">代理补缴</a>
						</p>
						<p>
							<a href="Renew.jsp" target="rightFrame">待续费清单</a>
						</p>
						<p>
							<a href="BillingQuery.jsp" target="rightFrame" id="zdcx">账单查询</a>
						</p>
						<p style="display: none">
							<a href="javascript:;">关联银行卡</a>
						</p>
					</div>
				</ul>
				<ul>
					<li class="tab_menu"><a href="javascript:;">信息服务<span
							class="v02"></span></a></li>
					<div class="menu2" style="display: none" id="infoService">
						<p style="display: none">
							<a href="http://www.wuhanparking.com/ParkingService/CarPark"
								target="rightFrame">停车查询</a>
						</p>
						<p>
							<a href="http://www.wuhanparking.com/ParkingService/LicensePlate"
								target="rightFrame" id="cpbd">车牌绑定</a>
						</p>
						<p style="display: none">
							<a href="http://www.wuhanparking.com/ParkingService/CloseAccount"
								target="rightFrame">销户退费</a>
						</p>
						<p>
							<a href="http://www.wuhanparking.com/ParkingService/Question"
								target="rightFrame" id="wjdc">问卷调查</a>
						</p>
					</div>
				</ul>
				<ul>
					<li class="tab_menu"><a href="javascript:;">安全设置<span
							class="v02"></span></a></li>
					<div class="menu2" style="display: none">
						<p>
							<a
								href="http://www.wuhanparking.com/ParkingService/PayWithoutPwd"
								target="rightFrame">免密支付</a>
						</p>
						<p style="display: none">
							<a href="javascript:;">设置登录密码</a>
						</p>
						<p>
							<a
								href="http://www.wuhanparking.com/ParkingService/Modifypassword"
								target="rightFrame">重置登录密码</a>
						</p>
						<p>
							<a href="http://www.wuhanparking.com/ParkingService/Setpayment"
								target="rightFrame">设置支付密码</a>
						</p>
						<p>
							<a
								href="http://www.wuhanparking.com/ParkingService/Modifypayment"
								target="rightFrame">重置支付密码</a>
						</p>
						<p style="display: none">
							<a href="javascript:;">忘记登录密码</a>
						</p>
						<p style="display: none">
							<a href="javascript:;">忘记支付密码</a>
						</p>
					</div>
				</ul>
				<ul>
					<li class="tab_menu"><a href="javascript:;">增值服务<span
							class="v02"></span></a></li>
					<div class="menu2" style="display: none" id="addInfo">
						<p>
							
								增值服务
						</p>
					</div>
				</ul>
			</div>

			<div class="right" style="width: 932px" id="rightPage">
				<iframe src="Recharge.jsp" style="zoom: normal" width=100%
						height=100% name="rightFrame" title="rightFrame" scrolling="no"
						frameborder="0" noresize="noresize" marginheight="0"
						marginwidth="0" id="iframepage" name="iframepage"
						onLoad="iFrameHeight()"></iframe>
			</div>
		</div>
	</div>
	<script type="text/javascript" language="javascript">
		function iFrameHeight() {
			var ifm = document.getElementById("iframepage");
			var subWeb = document.frames ? document.frames["iframepage"].document
					: ifm.contentDocument;
			if (ifm != null && subWeb != null) {
				//ifm.height = subWeb.body.scrollHeight;
				ifm.height = subWeb.documentElement.scrollHeight;
			}
		}

		var flagSelected;
		(function() {
			function GetRequest() {
				var url = location.search; //获取url中"?"符后的字串
				var theRequest = new Object();
				if (url.indexOf("?") != -1) {
					var str = url.substr(1);
					strs = str.split("&");
					for (var i = 0; i < strs.length; i++) {
						theRequest[strs[i].split("=")[0]] = decodeURI(strs[i]
								.split("=")[1]);
					}
				}
				return theRequest;
			}
			var Request = new Object();
			Request = GetRequest();
			flagSelected = Request['flag'];
			if (flagSelected == "kscz") {
				$("#iframepage").attr('src', 'Recharge');
				$("#kscz").addClass("tab2");
			}
			if (flagSelected == "qfqd") {
				$("#iframepage").attr('src', 'BatchPay');
				$("#qfqd").addClass("tab2");
			}
			if (flagSelected == "zdcx") {
				$("#iframepage").attr('src', 'BillingQuery');
				$("#zdcx").addClass("tab2");
			}
			if (flagSelected == "zzfw") {
				$("#iframepage").attr('src', 'Value');
				$(".menu2").hide();
				$("#addInfo").show();
				$("#zzfw").addClass("tab2");
			}
			if (flagSelected == "wjdc") {
				$("#iframepage").attr('src', 'Question');
				$(".menu2").hide();
				$("#infoService").show();
				$("#wjdc").addClass("tab2");
			}

		})()

		function infoServices() {//车牌绑定
			$(".menu2").hide();
			$("#infoService").show();
			$("#cpbd").addClass("tab2");
		}

		function BatchBills() {//欠费清单
			$("#qfqd").addClass("tab2");
		}

		function selectBills() {//账单查询
			$("#zdcx").addClass("tab2");
		}
	</script>
</body>
</html>

<!--底部-->
<div class="boot">
	<div class="bot"></div>
</div>
</body>

</html>

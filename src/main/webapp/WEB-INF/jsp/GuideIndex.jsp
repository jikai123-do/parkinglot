<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>停车指南</title>
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


	<!--head开始-->


	<jsp:include page="MyJsp.jsp"></jsp:include>

	<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title></title>
<link href="../../Content/css/blue.css" rel="stylesheet" type="text/css" />
<script>
	function menuOver(obj) {
		for (var i = 0; i < 7; i++) {
			if (i == parseInt(obj)) {
				document.getElementById("popId" + obj).style.display = 'block';
			} else {
				document.getElementById("popId" + i).style.display = 'none';
			}
		}

	};
</script>
<style>
.m_ip ul li {
	background: url(../../Content/images/ip_icon.png) no-repeat;
}
</style>
</head>

<body>
	<!--导航开始-->
	<jsp:include page="guidInclude.jsp"></jsp:include>
	<!--注册界面-->
	<!--停车指南-->
	<div class="service">
		<div class="serve">
			<div class="guide_left">
				<ul>
					<li onclick="menuOver('4')"><a href="javascript:;"
						style="margin-top: 0"><img
							src="../../Content/images/guide_ico5.png"></a></li>
					<li onclick="menuOver('5')"><a href="javascript:;"><img
							src="../../Content/images/guide_ico6.png"></a></li>
					<li onclick="menuOver('3')"><a href="javascript:;"><img
							src="../../Content/images/guide_ico4.gif"></a></li>
					<li onclick="menuOver('0')"><a href="javascript:;"><img
							src="../../Content/images/guide_ico1.gif"></a></li>
					<li onclick="menuOver('1')"><a href="javascript:;"><img
							src="../../Content/images/guide_ico2.gif" /></a></li>
					<li onclick="menuOver('2')"><a href="javascript:;"><img
							src="../../Content/images/guide_ico3.gif"></a></li>
					<li onclick="menuOver('6')"><a href="javascript:;"><img
							src="../../Content/images/guide_ico7.png"></a></li>
				</ul>
			</div>
			<div class="right" id='popId0' style="display: none">
				<div class="m_ip" style="width: 890px; margin-left: 0; float: right">
					<ul>
						<li><a href="Index.jsp">当前位置：首页</a><a href="javascript:;">>></a><a
							href="">停车指南</a><a href="javascript:;">>></a><a
							href="javascript:;">APP客户端</a></li>
					</ul>
				</div>
				<div class="guide">
					<img src="../../Content/images/3.22.gif"> <a href="javascript:;">www.wuhanparking.com</a>
				</div>
			</div>
			<div class="right" id='popId1' style="display: none">
				<div class="m_ip" style="width: 890px; margin-left: 0; float: right">
					<ul>
						<li><a href="Index.jsp">当前位置：首页>><a href="">停车指南</a><a
								href="javascript:;">>></a><a href="javascript:;">客服电话</a></li>
					</ul>
				</div>
				<div class="guide">
					<img src="../../Content/images/telephonesrevice.png">
				</div>
			</div>
			<div class="right" id='popId2' style="display: none">
				<div class="m_ip" style="width: 890px; margin-left: 0; float: right">
					<ul>
						<li><a href="Index.jsp">当前位置：首页</a><a href="javascript:;">>></a><a
							href="">停车指南</a><a href="javascript:;">>></a><a
							href="javascript:;">网站服务</a></li>
					</ul>
				</div>
				<div class="guide">
					<img src="../../Content/images/website_guide.png">
				</div>
			</div>
			<div class="right" id='popId3' style="display: none">
				<div class="m_ip" style="width: 890px; margin-left: 0; float: right">
					<ul>
						<li><a href="Index.jsp">当前位置：首页</a><a href="javascript:;">>></a><a
							href="">停车指南</a><a href="javascript:;">>></a><a
							href="javascript:;">充值方式</a></li>
					</ul>
				</div>
				<div class="guide">
					<img src="../../Content/images/phonebill.png">
				</div>
			</div>
			<div class="right" id='popId4'>
				<div class="m_ip" style="width: 890px; margin-left: 0; float: right">
					<ul>
						<li><a href="Index.jsp">当前位置：首页</a><a href="javascript:;">>></a><a
							href="">停车指南</a><a href="javascript:;">>></a><a
							href="javascript:;">发票申领</a></li>
					</ul>
				</div>
				<div class="guide">
					<ul
						style="width: 889px; height: auto; text-align: center; font-size: 36px; border: 1px solid #ccc">
						<h1
							style="height: auto; line-height: 32px; font-size: 20px; background: #03a9f5; color: #fff; border-bottom: 2px solid #03a9f5">发票申领服务网点列表</h1>
						<table cellpadding="50" border="1" cellspacing="20">
							<tr>
								<th colspan="2">温馨提示：
									<p style="padding-left: 24px">若您需要打印发票（停车缴费后次日才可办理发票打印）,可前往如下网点现场办理即可。</p>
								</th>
							</tr>
							<tr>
								<th>闸北区
									<p style="padding-left: 24px">网点地址：市北高新技术服务园区10号楼56 202</p>
									<p style="padding-left: 24px">服务电话：12345</p>
								</th>
							</tr>

						</table>
					</ul>
				</div>
			</div>
			<div class="right" id='popId5' style="display: none">
				<div class="m_ip" style="width: 890x; margin-left: 0; float: right">
					<ul>
						<li><a href="Index.jsp">当前位置：首页</a><a href="javascript:;">>></a><a
							href="">停车指南</a><a href="javascript:;">>></a><a
							href="javascript:;">收费规则</a></li>
					</ul>
				</div>
				<div class="guide">
					<ul
						style="width: 889px; height: auto; text-align: center; font-size: 36px; border: 1px solid #ccc">
						<h1
							style="height: auto; line-height: 32px; font-size: 20px; background: #03a9f5; color: #fff; border-bottom: 2px solid #03a9f5">
							停车收费公示<span
								style="display: block; font-size: 14px; font-weight: normal;">准停时段：00:00-24:00</span>
						</h1>
						<table cellpadding="50" border="1" cellspacing="20">
							<tr>
								<th style="text-align: center; padding-left: 0""><span>收费标准</span><span
									style="font-size: 14px">（二类区域）</span></th>
								<th style="text-align: center; padding-left: 0""><span>收费时段</span><span
									style="font-size: 14px">7:00-20:00</span></th>
								<th><span>每小时2元</span><span>全天8元封顶</span><span
									style="font-size: 14px">（15分钟内离开免费）</span></th>
							</tr>
							<tr>
								<th style="text-align: center; padding-left: 0""><span>收费标准</span><span
									style="font-size: 14px">（一类区域）</span></th>
								<th style="text-align: center; padding-left: 0""><span>收费时段</span><span
									style="font-size: 14px">7:00-21:00</span></th>
								<th><span>第一小时：3元/小时</span><span>第二小时起：4元/小时</span><span>全天25元封顶</span><span
									style="font-size: 14px">（15分钟内离开免费）</span></th>
							</tr>

							<tr>
								<th colspan="4"><span>收费依据：</span><span>收费单位：</span><span>监督单位：</span></th>
							</tr>
							<tr>
								<th colspan="4"><span>温馨提示：车内贵重物品请随身携带</span>
							</tr>
						</table>
					</ul>
				</div>
			</div>
			<div class="right" id='popId6' style="display: none">
				<div class="m_ip" style="width: 890px; margin-left: 0; float: right">
					<ul>
						<li><a href="Index.jsp">当前位置：首页</a><a href="javascript:;">>></a><a
							href="">停车指南</a><a href="javascript:;">>></a><a
							href="javascript:;">销户退费</a></li>
					</ul>
				</div>
				<div class="guide">
					<img src="../../Content/images/closed.jpg">
				</div>
			</div>
		</div>
	</div>
</body>
</html>


<!--底部-->
<div class="boot">
	<div class="bot">
		<ul style="margin-top: 10px">
		</ul>
	</div>
</div>
</body>

</html>

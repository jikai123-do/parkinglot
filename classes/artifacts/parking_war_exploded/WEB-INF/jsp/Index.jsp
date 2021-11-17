<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>首页</title>
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


	<!-- Copyright © 2005. Spidersoft Ltd -->
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
<meta name="renderer" content="webkit">
<meta name="keywords" content="武汉停车,www.wuhanparking.com,智慧服务">
<meta name="description" content="武汉智慧停车">
<title>大毛停车首页</title>
<link href="../../Content/css/blue.css" rel="stylesheet" type="text/css" />
<script src="../../Content/js/jquery-1.11.3.js"></script>
<script type="text/javascript" src="../../Content/js/slider.js"></script>
<script type="text/javascript"
	src="http://webapi.amap.com/maps?v=1.3&key=44baf09306cf1cb1f5cd73c1c7a49ca4"></script>
<style>
.flexslider {
	float: left;
	position: relative;
	width: 802px;
	height: 368px;
	overflow: hidden;
	zoom: 1;
}

.flexslider .slides li {
	width: 100%;
	height: 100%;
}

.flex-direction-nav a {
	width: 70px;
	height: 70px;
	line-height: 99em;
	overflow: hidden;
	margin: -35px 0 0;
	display: block;
	background: url(../../Content/images/ad_ctr.png) no-repeat;
	position: absolute;
	top: 50%;
	z-index: 10;
	cursor: pointer;
	opacity: 0;
	filter: alpha(opacity = 0);
	-webkit-transition: all .3s ease;
	border-radius: 35px;
}

.flex-direction-nav .flex-next {
	background-position: 0 -70px;
	right: 0;
}

.flex-direction-nav .flex-prev {
	left: 0;
}

.flexslider:hover .flex-next {
	opacity: 0.8;
	filter: alpha(opacity = 25);
}

.flexslider:hover .flex-prev {
	opacity: 0.8;
	filter: alpha(opacity = 25);
}

.flexslider:hover .flex-next:hover, .flexslider:hover .flex-prev:hover {
	opacity: 1;
	filter: alpha(opacity = 50);
}

.flex-control-nav {
	width: 100%;
	position: absolute;
	bottom: 10px;
	text-align: center;
}

.flex-control-nav li {
	margin: 0 2px;
	display: inline-block;
	zoom: 1;
	*display: inline;
}

.flex-control-paging li a {
	background: url(../../Content/images/dot.png) no-repeat 0 -16px;
	display: block;
	height: 16px;
	overflow: hidden;
	text-indent: -99em;
	width: 16px;
	cursor: pointer;
}

.flex-control-paging li a.flex-active, .flex-control-paging li.active a
	{
	background-position: 0 0;
}

.flexslider .slides a img {
	width: 100%;
	height: 368px;
	display: block;
}
</style>
<script>
	$(function() {
		var bannerSlider = new Slider($('#banner_tabs'), {
			time : 2000,
			delay : 400,
			event : 'hover',
			auto : true,
			mode : 'fade',
			controller : $('#bannerCtrl'),
			activeControllerCls : 'active'
		});
		$('#banner_tabs .flex-prev').click(function() {
			bannerSlider.prev()
		});
		$('#banner_tabs .flex-next').click(function() {
			bannerSlider.next()
		});
	})
</script>
</head>

<body>
	<!--导航开始-->
	<jsp:include page="guidInclude.jsp"></jsp:include>
	<!--功能栏开始-->
	<div class="function">
		<div class="ft">
			<div id="banner_tabs" class="flexslider">
				<ul class="slides">
					<li><a title="" target="_self"
						href="InfoBulletin/DetailNews¿id=1020180309100000681.html"> <img
							width="802" height="368" alt=""
							style="background: url(../../Content/images/banner.jpg) no-repeat center;">
					</a></li>
					<li><a title="" target="_self"
						href="InfoBulletin/DetailNews¿id=1020180309100000703.html"> <img
							width="802" height="368" alt=""
							style="background: url(../../Content/images/banner1.jpg) no-repeat center;">
					</a></li>
					<li><a title="" target="_self"
						href="InfoBulletin/DetailNews¿id=1020180309100000701.html"> <img
							width="802" height="368" alt=""
							style="background: url(../../Content/images/banner2.jpg) no-repeat center;">
					</a></li>
				</ul>
				<ul class="flex-direction-nav">
					<li><a class="flex-prev" href="javascript:;">Previous</a></li>
					<li><a class="flex-next" href="javascript:;">Next</a></li>
				</ul>
				<ol id="bannerCtrl" class="flex-control-nav flex-control-paging">
					<li><a>1</a></li>
					<li><a>2</a></li>
					<li><a>3</a></li>
				</ol>
			</div>
			<div class="ftion">
				<ul>
					<li class="icon1"><a href="Login.jsp"><img
							src="../../Content/images/icon2.png">快速登录</a></li>
					<li class="icon2"><a
						href="ParkingService/ServiceIndex¿flag=kscz.jsp"><img
							src="../../Content/images/icon3.png">快速充值</a></li>
					<li class="icon3"><a
						href="ParkingService/ServiceIndex¿flag=qfqd.jsp"><img
							src="../../Content/images/icon1.png">欠费清单</a></li>
				</ul>
				<ul class="ftion1">
					<li class="icon4"><a href="ServiceIndex.jsp"><img
							src="../../Content/images/icon4.png">我的钱包</a></li>
					<li class="icon5"><a
						href="ParkingService/ServiceIndex¿flag=zdcx.jsp"><img
							src="../../Content/images/icon5.png">账单查询</a></li>
					<li class="icon6"><a
						href="ParkingService/ServiceIndex¿flag=zzfw.jsp"><img
							src="../../Content/images/icon6.png">增值服务</a></li>
				</ul>
				<ul>
					<li class="icon7"><a
						href="http://jgj.wuhan.gov.cn:8087/wscg/clx/home/" target="_blank"><img
							src="../../Content/images/icon7.png">违章查询</a></li>
					<li class="icon8"><a
						href="ParkingService/ServiceIndex¿flag=wjdc.html"><img
							src="../../Content/images/icon8.png">问卷调查</a></li>
					<li class="icon9"><a href="Suggestion/SugIndex.html"><img
							src="../../Content/images/icon9.png">投诉建议</a></li>
				</ul>
			</div>
		</div>
	</div>

	<!--泊位分布图-->
	<div class="map">
		<div class="mp" style="position: relative">
			<h3>全市泊位分布图</h3>
			<div id="container"
				style="width: 100%; height: 400px; border: 1px solid #03a9f5;">
				<div class="map_li" style="z-index: 100">
					<h1>
						<img src="../../Content/images/map_bt.png">
					</h1>
					<ul id="areaList">
						<li><img src='../../Content/images/map_icon.png'><a
							href='javascript:;'
							onclick='map.setZoomAndCenter(15,[121.435633,31.292646])'>闸北<span>${emptynum}</span></a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<!--新闻开始-->
	<div class="news">
		<div class="new">
			<div class="import_news">
				<h3>停车要闻</h3>
				
                 <c:forEach var="list" items="${parkingnewList}">
					
                        <p>${list.id}&nbsp;&nbsp;${list.title}</p>
					
					</c:forEach>
				
						<a href="BulletinIndex.jsp">查看更多详情</a>
					
			</div>

			<!--通知公告-->
			<div class="importer_news">
				<div class="report" style="position: relative">
					<h3>通知公告</h3>
					<c:forEach var="list" items="${noticeList}">
					
                        <p>${list.id}&nbsp;&nbsp;${list.title}</p>
					
					</c:forEach>
					
						<a href="BulletinIndex.jsp">查看更多详情</a>
					
				</div>

				<!--行业新闻-->
				<div class="rule" style="position: relative">
					<h3>行业新闻</h3>
					<c:forEach items="${newsList}" var="list">
                       <p>${list.id}</span>&nbsp;&nbsp; <span>${list.title}</p>
                	</c:forEach>
                    
					
						<a href="BulletinIndex.jsp">查看更多详情</a>
					
				</div>
			</div>
		</div>
	</div>

	<!--友情链接-->
	<div class="link">
		<div class="lk">
			<h3>友情链接</h3>
			<ul>
			</ul>
		</div>
	</div>
	<script type="text/javascript">
		var map, geolocation, district;
		/*加载地图，调用浏览器定位服务*/
		map = new AMap.Map('container', {
			zoom : 11,
			resizeEnable : true
		});

		map.plugin('AMap.Geolocation', function() {
			geolocation = new AMap.Geolocation({
				enableHighAccuracy : true,//是否使用高精度定位，默认:true
				timeout : 10000, //超过10秒后停止定位，默认：无穷大
				maximumAge : 0, //定位结果缓存0毫秒，默认：0
				convert : true, //自动偏移坐标，偏移后的坐标为高德坐标，默认：true
				showButton : true, //显示定位按钮，默认：true
				buttonPosition : 'LB', //定位按钮停靠位置，默认：'LB'，左下角
				buttonOffset : new AMap.Pixel(10, 20),//定位按钮与设置的停靠位置的偏移量，默认：Pixel(10, 20)
				showMarker : true, //定位成功后在定位到的位置显示点标记，默认：true
				showCircle : false, //定位成功后用圆圈表示定位精度范围，默认：true
				panToLocation : true, //定位成功后将定位到的位置作为地图中心点，默认：true
			//zoomToAccuracy: true      //定位成功后调整地图视野范围使定位位置及精度范围视野内可见，默认：false
			});
			map.addControl(geolocation);
			geolocation.getCurrentPosition();
		});

		var viewModel = { //Model格式数据
			resultCode : "",
			resultMsg : "",
			data : []
		}
		var areaInfo = [];

		$(document).ready(function() {
			$.ajax({
				type : "post",//必须是post请求，才能发送
				async : false,
				url : "ParkingMap/testAjax.action",//注解方式的方法标识
				// contentType: "application/json;charset=UTF-8",//设置的传送数据格式
				// data:'{"key":"123"}',//传送的json数据，若需要转换成JavaBean，key必须与Javabean的属性对应，未申明的key值默认为null
				dataType : "json",//接收数据的格式
				success : function(msg) {
						showLot(msg);
				}
			});
		});
		function showLot(msg) {
			viewModel.data=[msg];
			$.each(viewModel.data, function() {
				areaInfo.push({
					"name" : this.cantonName,
					"location" : [ this.longitude, this.latidute ],
					"berthTotal" : this.totalBerth,
					"berthLeft" : this.emptyBerth
				})
			})
			/*添加注点*/
			var arr = [];
			for (var i = 0; i < areaInfo.length; i++) {
				var iconUrl = "";
				if (areaInfo[i].berthLeft == null) { //根据剩余率选择图标
					iconUrl = "http://www.wuhanparking.com:80/Content/images/gray.png";
				} else if (areaInfo[i].berthLeft == 0) {
					iconUrl = "http://www.wuhanparking.com:80/Content/images/red.png";
				} else if (areaInfo[i].berthLeft <= 50) {
					iconUrl = "http://www.wuhanparking.com:80/Content/images/orange.png";
				} else {
					iconUrl = "http://www.wuhanparking.com:80/Content/images/green.png";
				}
				marker = new AMap.Marker({ //注点
					icon : iconUrl,
					position : areaInfo[i].location,
					title : areaInfo[i].name,
					map : map
				});
				arr.push(marker);
			}
			var info = [];
			var infoWindow = new Array();
			for (var i = 0; i < arr.length; i++) {
				infoWindow[i] = new Array();
				for (var j = 0; j < 2; j++) {
					infoWindow[i][j] = "";
				}
			}
			for (var i = 0; i < arr.length; i++) {
				if (areaInfo[i].berthTotal != null) {
					info[i] = "<div style=\"padding:0px 0px 0px 4px;line-height:32px\"><b style=\"color:#03a9f5;\">"
							+ areaInfo[i].name
							+ "</b><br/>"
							+ "泊位：剩余<span style=\"color:#00b30d;\">"
							+ areaInfo[i].berthLeft
							+ "</span>个，总共<span style=\"color:red;\">"
							+ areaInfo[i].berthTotal
							+ "</span>个<br/>"
							+"</div>";
				} else {
					info[i] = "<div style=\"padding:0px 0px 0px 4px;line-height:32px\"><b style=\"color:#03a9f5;\">"
							+ areaInfo[i].name
							+ "</b><br/>"
							+ "此地区暂未部署停车位 敬请期待！</div>";
				}
				infoWindow[i][0] = areaInfo[i].name;
				infoWindow[i][1] = new AMap.InfoWindow({
					content : info[i],
					offset : new AMap.Pixel(10, -20)
				});
			}
			for (var i = 0; i < arr.length; i += 1) { //所有marker绑定时间
				arr[i].on("mouseover", function(e) {
					var j = 0;
					while (infoWindow[j][0] != e.target.getTitle()) {
						j++;
					}
					infoWindow[j][1].open(map, e.target.getPosition()); //添加信息窗口
				})
				arr[i].on("mouseout", function(e) {
					var j = 0;
					while (infoWindow[j][0] != e.target.getTitle()) {
						j++;
					}
					infoWindow[j][1].close(); //关闭信息窗口
				})
				arr[i]
						.on(
								"click",
								function(e) { //跳转到停车地图
									window.location.href = "Map.jsp"
											;
								})
			}
		}
	</script>
</body>
</html>

<!--底部-->
<div class="boot">
	<div class="bot">
		<ul style="margin-top: 10px">
			<li c lass="bot_menu"><a href="ParkingMap/Map.html">网站地图</a><span>|</span><a
				href="ParkingGuide/GuideIndex.html"> 操作指引</a><span>|</span><a
				href="HomePage/ContactUs.html"> 联系我们</a><span>|</span><a
				href="HomePage/Privacy.html"> 版权声明</a></li>

		</ul>
	</div>
</div>
</body>

</html>

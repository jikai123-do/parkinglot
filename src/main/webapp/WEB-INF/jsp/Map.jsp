<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>停车地图</title>
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

	<!Doctype html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>大毛停车官网停车地图界面</title>
<link href="../../Content/css/blue.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../Content/js/jquery-1.11.3.js"></script>
<script type="text/javascript" src="../../Content/js/layout.js"></script>
<script type="text/javascript" src="../../Content/js/menu.js"></script>
<script type="text/javascript"
	src="http://webapi.amap.com/maps?v=1.3&key=44baf09306cf1cb1f5cd73c1c7a49ca4"></script>
<style>
#container {
	width: 930px;
	height: 500px;
	width: 100%;
	height: 921px;
	width: 100%;
	height: 600px;
	border: 1px solid #03a9f5;
}

.ips ul li {
	background: url(../../Content/images/ip_icon.png) no-repeat;
	padding-left: 25px;
	line-height: 50px
}

.amap-logo {
	right: 0 !important;
	left: auto !important;
}

.amap-copyright {
	right: 70px !important;
	left: auto !important;
}
</style>
</head>

<body>
	<!--导航开始-->
	<jsp:include page="guidInclude.jsp"></jsp:include>
	<!--信息公开详情页-->
	<div class="details">
		<div class="detailnews">
			<div class="ips">
				<ul>
					<li><a href="Index.jsp">当前位置：首页</a><a href="javascript:;">>></a><a
						href="javascript:;">停车地图</a></li>
				</ul>
			</div>

			<div id="container" style="position: relative">
				<div class="lin_srch">
					<input type="text" id="sectionToSearch"
						placeholder="请输入路段名称，如：发展一路"> <a id="search"
						href="javascript:void(0)">搜&nbsp;&nbsp;索</a>
					<p id="searchList"></p>
				</div>
				<div class="lin">
					<h3>地图列表</h3>
					<p>
						选择片区：<select id="area" onchange="areaToRoad()">
							<option>--所有片区--</option>
							<option id="闸北">闸北</option>


						</select>
					</p>
					<div style="overflow-y: scroll; height: 500px" id="list">
						<table id="闸北"
							onclick="map.setZoomAndCenter(15,[121.435633,31.292646])">
							<tbody>
								<tr>
									<th colspan='2'>汶水路</th>
								</tr>
								<tr>
									<td>泊位：空余<span>${emptynum}</span>个
									</td>
									<td>总数<span>8</span>个
									</td>
								</tr>
							</tbody>
						</table>


					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		var data;
		var viewModel = { //Model格式数据
			resultCode : "",
			resultMsg : "",
			data : []
		}
		var locationSelected, areaInfo, blockInfo, map, geolocation;
		var arr = []; //marker数组
		var sectionInfo = []; //泊位段信息
		$(document).ready(function() {
			$.ajax({
				type : "post",//必须是post请求，才能发送
				async : false,
				url : "testAjax.action",//注解方式的方法标识
				// contentType: "application/json;charset=UTF-8",//设置的传送数据格式
				// data:'{"key":"123"}',//传送的json数据，若需要转换成JavaBean，key必须与Javabean的属性对应，未申明的key值默认为null
				dataType : "json",//接收数据的格式
				success : function(msg) {
					data = msg;
					InitMap(msg);
				}
			});
		});
		function InitMap(data) {

			viewModel.data = [ data ];

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
				locationSelected = Request['location'];

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

				//viewModel.data=[{"cantonCode":"7","parentCode":"4201","cantonName":"闸北","totalBerth":"2701","emptyBerth":"881","sysAreaDataList":[{"cantonCode":"7","areaCode":"76","areaName":"闸北","sysSectionDataList":[{"areaCode":"76","sectionCode":"76001","sectionName":"海同停车场","totalBerth":"60","emptyBerth":"60","longitude":"121.435633","latitude":"31.292646"}]}]}];
				viewModel.data =
				/*取出路段信息保存在sectionInfo*/

				$.each(viewModel.data, function() {
					$.each(this.sysAreaDataList, function() {
						$.each(this.sysSectionDataList, function() {
							sectionInfo.push({
								"code" : this.sectionCode,
								"name" : this.sectionName,
								"location" : [ parseFloat(this.longitude),
										parseFloat(this.latitude) ],
								"berthTotal" : this.totalBerth,
								"berthLeft" : this.emptyBerth
							})
						})
					})
				})

				/*添加注点*/
				for (var i = 0; i < sectionInfo.length; i++) {
					var iconUrl = "";
					if (sectionInfo[i].berthLeft == 0) { //根据剩余率选择图标
						iconUrl = "http://www.wuhanparking.com:80/Content/images/red.png";
					} else if (sectionInfo[i].berthLeft
							/ sectionInfo[i].berthTotal <= 0.2) {
						iconUrl = "http://www.wuhanparking.com:80/Content/images/orange.png";
					} else {
						iconUrl = "http://www.wuhanparking.com:80/Content/images/green.png";
					}
					marker = new AMap.Marker({ //注点
						icon : iconUrl,
						position : sectionInfo[i].location,
						title : sectionInfo[i].name,
						map : map
					});
					marker.setLabel({ //标签
						offset : new AMap.Pixel(-25, -22),
						content : sectionInfo[i].name
					});
					arr.push(marker);
				}

				$(".amap-geo").remove(); //去掉定位按钮
				$(".amap-copyright").remove(); //去掉版权声明
			})()

			/*信息窗口内容*/
			var info = [];
			var infoWindow = new Array();
			for (var i = 0; i < arr.length; i++) {
				infoWindow[i] = new Array();
				for (var j = 0; j < 2; j++) {
					infoWindow[i][j] = "";
				}
			}

			for (var i = 0; i < arr.length; i++) {
				info[i] = "<div style=\"padding:0px 0px 0px 4px;line-height:32px\"><b style=\"color:#03a9f5;\">"
						+ sectionInfo[i].name
						+ "</b><br/>"
						+ "泊位：剩余<span style=\"color:#00b30d;\">"
						+ sectionInfo[i].berthLeft
						+ "</span>个，总共<span style=\"color:red;\">"
						+ sectionInfo[i].berthTotal
						+ "</span>个<br/>"
						+ "价格：3元/小时</div>"
						+ "<br/><c:if test='${not empty user}'> <a target=\"_blank\" href =\"../test.action?code="
						+ sectionInfo[i].name
						+ "\" style=\"color:#03a9f5\">查看内部详情</a> </c:if>";
				infoWindow[i][0] = sectionInfo[i].name;
				infoWindow[i][1] = new AMap.InfoWindow({
					content : info[i],
					offset : new AMap.Pixel(10, -20)
				});
			}

			/*所有marker添加事件监听*/
			for (var i = 0; i < arr.length; i += 1) {
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
					var t = setTimeout(function() {
						infoWindow[j][1].close();//延迟1s消失让用户更好的查看停车场的具体情况
					}, 1000);
					//关闭信息窗口
				})
				arr[i].on("click", function(e) {
					naviWindow.open(map, new AMap.LngLat(e.lnglat.lng,
							e.lnglat.lat)); //点击打开导航窗
				})
			}

			/*导航窗口*/
			var naviWindow;
			map
					.plugin(
							'AMap.AdvancedInfoWindow',
							function() {
								naviWindow = new AMap.AdvancedInfoWindow(
										{
											content : '<div class="info-title">大毛停车</div><div class="info-content">'
													+ '<img src="http://www.wuhanparking.com:80/Content/images/amap.png">'
													+ '<span style="color:#333;font-size:14px">竭诚为您服务，祝您出行愉快！</span><br/></div>',
											offset : new AMap.Pixel(0, -30)
										});
							})
			AMap.event.addListener(map, 'rightclick', function(e) {
				naviWindow.open(map,
						new AMap.LngLat(e.lnglat.lng, e.lnglat.lat));
			})

			/*行政区绑定道路*/

		}
		function areaToRoad() {
			var i = 0;
			if ($("#area").find("option:selected").text() == "--所有片区--") {
				$.each($("table"), function() {
					this.hidden = false;
				})

				$.each(arr, function(i) { //地图显示所有marker
					arr[i].setMap(map);
				})
				return false;
			} else {
				$.each($("table"), function() { //列表显示对应泊位
					if (this.id != $("#area").find("option:selected")
							.attr("id")) {
						this.hidden = true;
					} else {
						this.hidden = false;
					}
				})

				var markerToCenter = 0;
				$.each(sectionInfo, function(i) { //地图显示对应marker
					var flag = false;
					$.each($("table:visible"), function() {
						if (sectionInfo[i].name == $(this).children(":first")
								.children(":first")[0].innerText) {
							flag = true;
							arr[i].setMap(map);
							return false;
						}
					})
					if (!flag) {
						arr[i].setMap(null);
					} else {
						markerToCenter = i;
					}
				})
				map.setZoomAndCenter(13, [
						sectionInfo[markerToCenter].location[0],
						sectionInfo[markerToCenter].location[1] ]);
			}
		}

		/*查询提示列表*/
		$("#sectionToSearch").bind(
				"input propertychange",
				function() { //边输入边提示
					$("#searchList").empty();
					if ($("#sectionToSearch").val() == ""
							|| $("#sectionToSearch").val() == " ") {
						$("#searchList").empty();
					} else {
						$.each(sectionInfo, function() {
							if (this.name.indexOf($("#sectionToSearch").val()
									.replace(/\s+/g, "")) >= 0) {
								$("#searchList").append(
										"<span><a  class='list' onmouseover='show(this)'>"
												+ this.name + "</a></span>");
							}
						})
					}
				})

		$("#sectionToSearch").focus(
				function() {
					if ($("#sectionToSearch").val() != ""
							&& $("#sectionToSearch").val() != " ")
						$.each(sectionInfo, function() {
							if (this.name.indexOf($("#sectionToSearch").val()
									.replace(/\s+/g, "")) >= 0) {
								$("#searchList").append(
										"<span><a   class='list' onmouseover='show(this)'>"
												+ this.name + "</a></span>");
							}
						})
				})

		function show(e) {
			$("#sectionToSearch").val($(e)[0].innerHTML);
		}

		$("#sectionToSearch").blur(function() {
			$("#searchList").empty();
		})

		/*点击搜索*/
		$("#search").click(
				function() {
					var flag = false;
					$.each(sectionInfo,
							function(i) {
								if (this.name.indexOf($("#sectionToSearch")
										.val()) >= 0) {
									map.setZoomAndCenter(15,
											[ this.location[0],
													this.location[1] ]);
									arr[i].setMap(map);
									flag = true;
									return false;
								}
							})
					if (!flag) {
						alert("该片区不存在！");
					}
				})

		/*回车搜索*/
		document.onkeydown = keyDownSearch;
		function keyDownSearch(e) {
			var theEvent = e || window.event;
			var code = theEvent.keyCode || theEvent.which || theEvent.charCode;
			if (code == 13) {
				var flag = false;
				$.each(sectionInfo, function(i) {
					if ($("#sectionToSearch").val().indexOf(this.name) >= 0) {
						map.setZoomAndCenter(15, [ this.location[0],
								this.location[1] ]);
						arr[i].setMap(map);
						flag = true;
						return false;
					}
				})
				if (!flag) {
					alert("该片区不存在！");
				}
				return false;
			}
			return true;
		}
	</script>
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

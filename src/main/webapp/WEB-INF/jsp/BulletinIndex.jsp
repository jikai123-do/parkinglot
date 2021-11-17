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
<title>信息公开</title>
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
<title>武汉停车官网信息公开界面</title>
<link href="../../Content/css/blue.css" rel="stylesheet" type="text/css">
<script src="../../Content/js/jquery-1.11.3.js"></script>
<script type="text/javascript" src="../../Content/js/index.js"></script>
<style>
.br-nav {
	font-family: "微软雅黑";
	display: block;
	width: 227px;
	height: 407px;
	position: absolute;
	left: 0;
	top: 0;
	z-index: 1000;
	background: url(../../Content/images/br-nav-bg_03.jpg) no-repeat;
	float: left;
}

.brands-in ul li {
	float: left;
	width: 95%;
	height: 50px;
	line-height: 50px;
	margin-left: 7px;
	background: url(../../Content/images/ip_icon.png) no-repeat;
	padding-left: 25px;
}

.item-down ul li {
	float: left;
	width: 95%;
	height: 50px;
	line-height: 50px;
	margin-left: 7px;
	background: url(../../Content/images/ip_icon.png) no-repeat;
	padding-left: 25px;
}
</style>

</head>

<body>
	<!--导航开始-->
	<jsp:include page="guidInclude.jsp"></jsp:include>
	<!--信息公开-->
	<div class="openreport">
		<div class="brands">
			<div class="br-nav">
				<div class="mt">
					<h2>信息公开</h2>
				</div>
				<div class="mc">
					<div class="item" onclick="showArticle('5')">
						<a class="lab" href="#">关于我们<span>》</span></a>
					</div>
					<div class="item" onclick="showArticle('4')">
						<a class="lab" href="#">通知公告<span>》</span></a>
					</div>
					<div class="item" onclick="showArticle('3')">
						<a class="lab" href="#">行业新闻<span>》</span></a>
					</div>
					<div class="item" onclick="showArticle('1')">
						<a class="lab" href="#">停车要闻<span>》</span></a>
					</div>
					<div class="item" onclick="showArticle('2')">
						<a class="lab" href="#">政策法规<span>》</span></a>
					</div>
				</div>
			</div>

			<div class="br_right">
				<div class="item-down" id="5">
					<ul>
						<li><a href="../HomePage/Index.html">当前页：首页</a><a
							href="javascript:;">>></a><a href="BulletinIndex.html">信息公开</a><a
							href="javascript:;">>></a><a href="javascript:;" id="location">关于我们</a></li>
						<ul>
							<h3 title="5" onclick="jump()">关于我们</h3>

						</ul>
					</ul>
				</div>
				<input type="hidden" id="columnCode">
				<div class="item-down" id="4">
					<ul>
						<li><a href="../HomePage/Index.html">当前页：首页</a><a
							href="javascript:;">>></a><a href="BulletinIndex.html">信息公开</a><a
							href="javascript:;">>></a><a href="javascript:;" id="location">通知公告</a></li>
						<ul>
							<h3 title="4" onclick="jump()">通知公告</h3>
							<c:forEach var="list" items="${noticeList}">

								<p>${list.id}&nbsp;&nbsp;${list.title}</p>

							</c:forEach>
						</ul>
					</ul>
				</div>
				<input type="hidden" id="columnCode">
				<div class="item-down" id="3">
					<ul>
						<li><a href="../HomePage/Index.html">当前页：首页</a><a
							href="javascript:;">>></a><a href="BulletinIndex.html">信息公开</a><a
							href="javascript:;">>></a><a href="javascript:;" id="location">行业新闻</a></li>
						<ul>
							<h3 title="3" onclick="jump()">行业新闻</h3>
					<c:forEach items="${newsList}" var="list">
                       <p>${list.id}</span>&nbsp;&nbsp; <span>${list.title}</p>
                	</c:forEach>
						</ul>
					</ul>
				</div>
				<input type="hidden" id="columnCode">
				<div class="item-down" id="1">
					<ul>
						<li><a href="../HomePage/Index.html">当前页：首页</a><a
							href="javascript:;">>></a><a href="BulletinIndex.html">信息公开</a><a
							href="javascript:;">>></a><a href="javascript:;" id="location">停车要闻</a></li>
						<ul>
							<h3 title="1" onclick="jump()">停车要闻</h3>
							 <c:forEach var="list" items="${parkingnewList}">
					
                        <p>${list.id}&nbsp;&nbsp;${list.title}</p>
					
					</c:forEach>
						</ul>
					</ul>
				</div>
				<input type="hidden" id="columnCode">
				<div class="item-down" id="2">
					<ul>
						<li><a href="../HomePage/Index.html">当前页：首页</a><a
							href="javascript:;">>></a><a href="BulletinIndex.html">信息公开</a><a
							href="javascript:;">>></a><a href="javascript:;" id="location">政策法规</a></li>
						<ul>
							<h3 title="2" onclick="jump()">政策法规</h3>

						</ul>
					</ul>
				</div>
				<input type="hidden" id="columnCode">
				<div id="ban">
					<div id="brands-in" class="brands-in">
						<ul>
							<li><a href="../HomePage/Index.html">当前位置：首页</a><a
								href="BulletinIndex.html">>></a><a href="javascript:;">信息公开</a></li>
						</ul>
					</div>
					<div id="banner" class="banner1">
						<ul>
							<li>
								<h3>
									<span>+</span>关于我们
								</h3>
								<div class="imp_news">
									<p>测试</p>
								</div>

							</li>
							<li>
								<h3>
									<span>+</span>通知公告
								</h3>
								<div class="imp_news">
									<dl>
										<p>12312312312</p>
										<dt>
											<a href="DetailNews�id=1020161219100000580.html">武汉停车第二批张贴黄单后仍未补交车辆公示</a><span>2016-12-19
												17:34:21</span>
										</dt>
										<dd>
											<a href="DetailNews�id=1020161219100000580.html">自11月14日起，城投停车场公司对欠费50元（含）以上欠费车辆张贴欠费告知单。经12月16日第一批公示后，已有部分车主自觉补交，现将第二批拖欠时间较长的100个车牌号进行公示。</a>
										</dd>
									</dl>
								</div>

							</li>
							<li>
								<h3>
									<span>+</span>行业新闻
								</h3>
								<div class="imp_news">
									<dl>
										<p>
											<img
												src="http://sv.wuhanparking.com/wh-file-server/download.do?file=ARTC01529910480252.jpg">
										</p>
										<dt>
											<a href="DetailNews�id=1020180625100000720.html">城投停车场公司第二党支部获“武汉市五星级基层党组织”荣誉</a><span>2018-06-25
												15:07:25</span>
										</dt>
										<dd>
											<a href="DetailNews�id=1020180625100000720.html">城投停车场公司第二党支部获“武汉市五星级基层党组织”荣誉</a>
										</dd>
									</dl>
								</div>

							</li>
							<li>
								<h3>
									<span>+</span>停车要闻
								</h3>
								<div class="imp_news"></div>

							</li>
							<li>
								<h3>
									<span>+</span>政策法规
								</h3>
								<div class="imp_news">
									<dl>
										<p>
											<img src="../../Content/images/mr_img.gif">
										</p>
										<dt>
											<a href="DetailNews�id=1020180625100000722.html">市城投集团公司领导邓耀光同志调研公司基层党建工作</a><span>2018-06-25
												15:15:43</span>
										</dt>
										<dd>
											<a href="DetailNews�id=1020180625100000722.html">市城投集团公司领导邓耀光同志调研公司基层党建工作</a>
										</dd>
									</dl>
								</div>

							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
    function showArticle(obj) {
        document.getElementById(obj).style.display = 'block';
        document.getElementById("ban").style.display = 'none';
        $.each($("#" + obj + "").siblings(), function () {
            this.style.display = "none";
        })

        $("#columnCode").val(parseInt(obj));
        SetPageIndex('search');
    }
    //设置分页时跳转的页码
    function SetPageIndex(obj) {
        if (obj == "search") {
            tempPageIndex = 0;
        }
        else if (obj == "first") {
            if (tempPageIndex == 0) {
                return false;
            } else {
                tempPageIndex = 0;
            }
        }
        else if (obj == "last") {
            tempPageIndex--;
            if (tempPageIndex == -1) {
                tempPageIndex = 0;
                return false;
            }
        }
        else if (obj == "next") {
            tempPageIndex++;
            if (tempPageIndex > (strPageTotal - 1)) {
                tempPageIndex = strPageTotal - 1;
                return false;
            }
        }
        else if (obj == "end") {
            tempPageIndex = strPageTotal - 1;
        } else {
            tempPageIndex = -1;
        }
        SearchLog();
    }


    var tempPageIndex = 0;//当前页  从0起，0是第1页
    var strPageTotal = 0;//总页数
    var strPageSize = 7;//每页的条数
    function SearchLog() {
        //$("#repmore").empty();
        $(".br_right").children("div[id='" + $("#columnCode").val() + "']").children().children("div").empty();
        $.ajax({
            url: "/InfoBulletin/BullInfo",
            type: 'post',
            async: false,
            data: { "columnCode": $("#columnCode").val(), "tempPageIndex": tempPageIndex, "length": strPageSize },
            success: function (ResultData) {
                var resultObj = eval("(" + ResultData + ")");
                strPageTotal = Math.ceil(resultObj.iTotalRecords / strPageSize);//总页数
                var strHtml = "<div class=\"repmore\">";
                for (var i = 0; i < resultObj.aaData.length && i < strPageSize; i++) {
                    strHtml += "<a href=\"http://www.wuhanparking.com:80/InfoBulletin/DetailNews?id=" + resultObj.aaData[i].articlecode + "\">" + resultObj.aaData[i].title + "<span>" + resultObj.aaData[i].createtime + "</span></a>";                  
                }
                strHtml += "<div class=\"page\"><p><span style=\"margin-left:80px\">总记录数：<font>" + resultObj.iTotalRecords + "</font></span><span>当前页：<font>" + (tempPageIndex + 1) + "/" + strPageTotal + "</font><input type=\"hidden\" id=\"tempPageIndex\" /></span>\<span style=\"margin-left:20px\"><a href=\"javascript:;\" onclick=\"SetPageIndex('first')\">首&nbsp;&nbsp;页</a></span>\<span><a href=\"javascript:;\" onclick=\"SetPageIndex('last')\">上一页</a></span>\<span><a href=\"javascript:;\" onclick=\"SetPageIndex('next')\">下一页</a></span><span><a href=\"javascript:;\" onclick=\"SetPageIndex('end')\">尾&nbsp;&nbsp;页</a></span>\</p>\</div></div>";
                $(".br_right").children("div[id='" + $("#columnCode").val() + "']").children().append(strHtml);
                //$("#repmore").append(strHtmls);
            }
        });
    }
</script>
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

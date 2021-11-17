<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="head">
	<div class="top">
		<a href="javascript:;"><img src="../../Content/images/logo.png"></a> <a
			href="javascript:;" class="telephone"><img
			src="../../Content/images/telephone.png"></a>
		<div class="getout">
			<li>
				<form action="" id="logoutForm" method="post">
					<c:if test="${sessionScope.user ne null }">
						<h3>欢迎您：${sessionScope.user.username }</h3>
					</c:if>

					<c:if test="${empty sessionScope.user}">
						<a href="Sign.jsp" target="_self"
						   style="text-decoration: none;">注册</a>
						<span>|</span>
						<a href="Login.jsp"
							style="text-decoration: none; color: #808080">登录</a>

					</c:if>
				</form>
			</li>
		</div>

	</div>
</div>


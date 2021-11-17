<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<thead>
			<tr>
				<td colspan="4" align="center">${name}</td>
				
			</tr>
		</thead>

		<tr>
			<c:forEach items="${test}" var="a" varStatus="status" >

				<c:if test="${a eq 49}">
					<td>${status.count}<img src="../../Content/images/busy.png"></td>
				</c:if>
				<c:if test="${a eq 48}">
					<td><a href="parkcar.action?code=${status.count}&&name=${name}">${status.count}</a><img src="../../Content/images/empty.png"></td>
				</c:if>



			</c:forEach>
		</tr>
		

	</table>
${error}
</body>
</html>
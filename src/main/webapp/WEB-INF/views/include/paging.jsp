<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
	</head>
	<body>
		<c:if test="${pageNum>10}">
			<button onclick="window.location='${pageUrl}?pageNum=${pageNum-10}'">⏪</button>
		</c:if>
		<c:forEach var="i" begin="1" end="${maxPageNum}" step="1">
    		<button onclick="window.location='${pageUrl}?pageNum=${i}'">${i}</button>
		</c:forEach>
		<c:if test="${pageNum<maxPageNum && pageNum>10}">
			<button onclick="window.location='${pageUrl}?pageNum=${pageNum+10}'">⏩</button>
		</c:if>
	</body>
</html>
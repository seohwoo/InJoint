<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
	</head>
	<body>
		<c:if test="${!isAdmin}">
	     		<script> 
			     	alert("관리자만 접근 가능합니다!!");
			      	history.go(-1);
		   		</script>
	    </c:if>
	</body>
</html>
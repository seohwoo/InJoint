<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${check == 1}">
		<script>
			alert("사원번호 : ${emp}");
			 window.location.href = "/emp/customLogin";
		</script>
	</c:if>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
	</head>
	<body>
		<c:if test="${cnt==1 && isOff==0}">
			 <script> 
		     	alert("퇴근😁😁😁");
		     	var previousPage = document.referrer;
		     	window.location.href = previousPage;
		   </script>
		</c:if>
		<c:if test="${isOff==1}">
			 <script> 
		     	alert("이미 퇴근처리 되었습니다!");
		      	history.go(-1);
		   </script>
		</c:if>
	</body>
</html>
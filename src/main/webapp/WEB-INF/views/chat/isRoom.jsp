<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
	</head>
	<body>
		<c:if test="${roomCnt==0}">
			<script> 
		     	window.location.href = "/chat/list";
		    </script>
		</c:if>
		<c:if test="${roomCnt>0}">
			 <script> 
		     	alert("이미 방이 존재합니다..!!");
		      	history.go(-1);
		   </script>
		</c:if>
	</body>
</html>
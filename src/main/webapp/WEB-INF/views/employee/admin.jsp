<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자</title>
</head>
<body>
    <h1>관리자 이용 가능</h1>
    <form action="/emp/customLogout" method="post">
    	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
    	<input type="submit" value="로그아웃" />
    </form>
</body>
</html>
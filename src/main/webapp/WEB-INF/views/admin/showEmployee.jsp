<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>사원관리</title>
	</head>
	<body>
		<h1>사원관리</h1>
		<c:if test="${cnt==0}">
			<h1>사원없음..🙄🙄</h1>
		</c:if>
		<c:if test="${cnt>0}">
			<table border="1">
				<tr>
					<td>번호</td>
					<td>부서</td>
					<td>직급</td>
					<td>성명</td>
					<td>사번</td>
					<td>입사일</td>
					<td>연락처</td>
				</tr>
				<c:forEach var="dto" items="${employeeList}" varStatus="loopStatus">
					<c:set var="cnt" value="${employeeList.size() - loopStatus.index}" />
					<tr>
						<td>${cnt}</td>
						<td>${dto.department}</td>
						<td>${dto.position}</td>
						<td>${dto.name}</td>
						<td>${dto.no}</td>
						<td>
							<fmt:formatDate value="${dto.reg}" dateStyle="long" type="date"/>
						</td>
						<td>${dto.phone}</td>
					</tr>
				</c:forEach>
			</table>
			<c:if test="${pageNum>1}">
				<button onclick="window.location='/admin/showEm?pageNum=${pageNum-1}'">⏪</button>
			</c:if>
			<c:if test="${pageNum==1}">
				<button onclick="window.location='#'">⏸</button>
			</c:if>
			<c:forEach var="i" begin="1" end="${maxPageNum}" step="1">
    			<button onclick="window.location='/admin/showEm?pageNum=${i}'">${i}</button>
			</c:forEach>
			<c:if test="${pageNum>=maxPageNum}">
				<button onclick="window.location='#'">⏸</button>
			</c:if>
			<c:if test="${pageNum<maxPageNum}">
				<button onclick="window.location='/admin/showEm?pageNum=${pageNum+1}'">⏩</button>
			</c:if>
		</c:if>
	</body>
</html>
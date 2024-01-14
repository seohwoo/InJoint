<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>사원관리</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="shortcut icon" type="image/png" href="/resources/assets/images/logos/favicon.png" />
  		<link rel="stylesheet" href="/resources/assets/css/styles.min.css" />
   		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"/>
	</head>
	<body>
		<!--  Body Wrapper -->
	  <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
	    data-sidebar-position="fixed" data-header-position="fixed">
		<!-- Sidebar Start -->
	    <aside class="left-sidebar">
	      <!-- Sidebar scroll-->
	      <div>
	        <!-- Sidebar navigation-->
	        <jsp:include page="/WEB-INF/views/employee/sidebar.jsp"/>
	        <!-- End Sidebar navigation -->
	      </div>
	      <!-- End Sidebar scroll-->
	    </aside>
	    <!--  Sidebar End -->
	    <!--  Main wrapper -->
	    <div class="body-wrapper">
	     <!--  Header Start -->
      	<jsp:include page="/WEB-INF/views/employee/header.jsp"/>
      	<!--  Header End -->
	     <div class="container-fluid">
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
						<td>${dto.departnum}</td>
						<td>${dto.position}</td>
						<td>${dto.name}</td>
						<td>${dto.employeenum}</td>
						<td>
							<fmt:formatDate value="${dto.reg}" dateStyle="long" type="date"/>
						</td>
						<td>${dto.phone}</td>
					</tr>
				</c:forEach>
			</table>
			<jsp:include page="/WEB-INF/views/include/paging.jsp" />
		</c:if>
		</div>
		</div>
		</div>
	</body>
</html>
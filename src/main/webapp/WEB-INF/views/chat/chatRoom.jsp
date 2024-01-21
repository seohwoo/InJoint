<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>채팅목록</title>
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
	     	<a href="/chat/addChat">➕채팅방만들기</a>
	     	<br />
	     	<c:if test="${cnt==0}">
	     		<h1>채팅방이 없어요..😭😭😭😭</h1>
	     	</c:if>
	     	<c:if test="${cnt>0}">
		     	<table border="1">
		     		<tr>
		     			<td>방이름</td>
		     		</tr>
		     		<c:forEach var="dto" items="${chatList}">
		     			<tr>
		     				<td>
		     					<a href="/chat/room?roomname=${dto.roomname}&chatno=${dto.no}">${dto.roomname}</a>
		     				</td>
		     			</tr>
		     		</c:forEach>
		     	</table>
	     	</c:if>
	     </div>
	    </div>
	   </div>
	</body>
	<script src="/resources/libs/jquery/dist/jquery.min.js"></script>
	<script src="/resources/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<script src="/resources/js/sidebarmenu.js"></script>
	<script src="/resources/js/app.min.js"></script>
	<script src="/resources/libs/apexcharts/dist/apexcharts.min.js"></script>
	<script src="/resources/libs/simplebar/dist/simplebar.js"></script>
	<script src="/resources/js/dashboard.js"></script>
</html>
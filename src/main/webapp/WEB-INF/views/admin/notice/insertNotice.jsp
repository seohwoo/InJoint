<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>공지게시판 작성</title>
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
	     	<jsp:include page="/WEB-INF/views/admin/isAdmin.jsp" />
	     	<form action="/admin/notice/inputPro" method="post">
	     		<input type="text" name="title" placeholder="제목을 입력하세요..." required="required"/> <br />
	     		<input type="text" name="writer" value="${my.name}" readonly="readonly"/> <br />
	     		<textarea rows="5" cols="20" name="content" required="required" placeholder="내용을 입력하세요..."></textarea> <br/>
	     		<input type="submit" value="작성"/>
	     	</form>
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
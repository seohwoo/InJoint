<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>채팅방만들기</title>
		<link rel="shortcut icon" type="image/png" href="/resources/assets/images/logos/favicon.png" />
  		<link rel="stylesheet" href="/resources/assets/css/styles.min.css" />
   		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"/>
   		<script>
	        function validateForm() {
	            var checkboxes = document.getElementsByName("invite");
	            var isChecked = false;
	            for (var i = 0; i < checkboxes.length; i++) {
	                if (checkboxes[i].checked) {
	                    isChecked = true;
	                    break;
	                }
	            }
	            if (!isChecked) {
	                alert("하나 이상의 사원을 선택하세요.");
	                return false; // 폼 제출을 막음
	            }
	            return true;	// 폼 제출을 허용
	        }
	   </script>
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
	     	<c:if test="${cnt==0}">
			<h1>사원이 없습니다...😅😅😅😅</h1>
		</c:if>
		<c:if test="${cnt>0}">
			<form id="chatForm" action="/chat/createRoom" method="post" onsubmit="return validateForm()">
				<table border="1">
					<tr>
						<td>사원번호</td>
						<td>사용자명</td>
						<td>부서명</td>
						<td>초대</td>
					</tr>
					
					<c:forEach var="dto" items="${empList}">
						<tr>
							<td>${dto.employeenum}</td>
							<td>${dto.name}</td>
							<td>${dto.departname}</td>
							<td>
								<input type="checkbox" name="invite" value="${dto.employeenum}"/>
							</td>
						</tr>
					</c:forEach>
				</table>
				<input type="text" name="roomname" placeholder="채팅방 이름을 입력하세요.." required="required"/>
				<br />
				<input type="submit" value="초대"/>
			</form>
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
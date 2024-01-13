<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Calendar</title>
  <link rel="shortcut icon" type="image/png" href="/resources/assets/images/logos/favicon.png" />
  <link rel="stylesheet" href="/resources/assets/css/styles.min.css" />
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"/>
	<script>
    function changeParentLocation(newLocation) {
        // 부모 창의 주소 변경 함수
        window.location.href = newLocation;
    }
</script>
	<style>
		.bo{
			border: none;
		}
	</style>
<body>
</head>
  <!--  Body Wrapper -->
  <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
    data-sidebar-position="fixed" data-header-position="fixed">
    <!-- Sidebar Start -->
    <aside class="left-sidebar">
      <!-- Sidebar scroll-->
      <div>
        <div class="brand-logo d-flex align-items-center justify-content-between">
          <a href="./index.html" class="text-nowrap logo-img">
            <div style="font-weight:800; font-size:30px; color:black;"><img style="margin-right:15px;"" src="/resources/images/logos/favicon.png" width="35" alt="" />InJoint</div>
          </a>
          <div class="close-btn d-xl-none d-block sidebartoggler cursor-pointer" id="sidebarCollapse">
            <i class="ti ti-x fs-8"></i>
          </div>
        </div>
        <!-- Sidebar navigation-->
        <jsp:include page="sidebar.jsp"/>
        <!-- End Sidebar navigation -->
      </div>
      <!-- End Sidebar scroll-->
    </aside>
    <!--  Sidebar End -->
    <!--  Main wrapper -->
    <div class="body-wrapper">
      <!--  Header Start -->
      <jsp:include page="header.jsp"/>
      <!--  Header End -->
      <div class="container-fluid">
        <!--  Row 1 -->
        <div class="row" style="display:flex;">
	      <div style="flex:1; box-shadow:5px 0px 5px -5px gray;">
	      	<h5>프로필</h5>
	      	<div style="text-align:center;">
	      	<img style="width:130px;" src="/resources/profile/${my.profile}">
	      	<div>
	      		${my.name}
	      	</div>
	      	<div>
	      		${my.email}
	      	</div>
	      	<hr/>
	      	<div>로그아웃</div>
	      	<div onclick="memout();">회원탈퇴</div>
	      	</div>
	      </div>
	      <div style="flex:3; padding-left:40px;">
	      	<div style="border:1px solid lightgray; border-radius:5px; padding: 12px; margin-bottom:30px;">
	        <h5>기본정보</h5>
	        <table>
	        	<tr>
	        		<td rowspan="2">
				      	<img style="border-radius:50%; width:80px;" src="/resources/profile/${my.profile}">
	        		</td>
	        		<td><input type="text" class="bo" value="${my.name}"/></td>
	        	</tr>
	        	<tr>
	        		<td><input type="email" class="bo" value="${my.email}"/></td>
	        	</tr>
	        	</table>
	        	<hr/>
	        		<div><i class="fa fa-mobile fa-lg" style="width:15px;"></i>휴대전화<input type="tel" class="bo" value="${my.phone}"/></div>
	        	<hr/>
	        		<div><i class="fa fa-birthday-cake" style="width:15px;"></i>생년월일<input type="text" class="bo" value="${my.birth}"/></div>
	        	<hr/>
	        		<div><i class="fa fa-envelope" style="width:15px;"></i>주소<input type="email" class="bo" value="${my.addr1} ${my.addr2}"/></div>
	      	</div>
	      	<div style="border:1px solid lightgray; border-radius:5px; padding: 12px;">
	        <h5>직원정보</h5>
	        		<div><i class="fa fa-mobile fa-lg" style="width:15px;"></i>부서번호<input type="tel" class="bo" value="${my.department}"/></div>
	        		<hr/>
	        		<div><i class="fa fa-envelope" style="width:15px;"></i>직급<input type="email" class="bo" value="${my.position}"/></div>
	      	</div>
          </div>	
        </div>
        <div class="py-6 px-6 text-center">
          <p class="mb-0 fs-4">Design and Developed by <a href="https://adminmart.com/" target="_blank" class="pe-1 text-primary text-decoration-underline">AdminMart.com</a> Distributed by <a href="https://themewagon.com">ThemeWagon</a></p>
        </div>
      </div>
    </div>
  </div>
  <script>
  function memout(){
  	var width = 650;
      var height = 650;

      var screenWidth = window.innerWidth;
      var screenHeight = window.innerHeight;

      var left = (screenWidth - width) / 2;
      var top = (screenHeight - height) / 2;

      var popOption = "width=" + width + "px, height=" + height + "px, top=" + top + "px, left=" + left + "px, scrollbars=yes";
      var openUrl = '/emp/memout';

      window.open(openUrl, 'pop', popOption);
  }
  </script>
  <script src="/resources/libs/jquery/dist/jquery.min.js"></script>
  <script src="/resources/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
  <script src="/resources/js/sidebarmenu.js"></script>
  <script src="/resources/js/app.min.js"></script>
  <script src="/resources/libs/apexcharts/dist/apexcharts.min.js"></script>
  <script src="/resources/libs/simplebar/dist/simplebar.js"></script>
  <script src="/resources/js/dashboard.js"></script>
</body>

</html>
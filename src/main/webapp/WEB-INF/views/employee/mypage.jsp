<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <title>mypage</title>
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
		#pro{
			position: relative;
		}
		#modify{
			position: absolute;
			bottom: 0px;
			right: 0px;
			width: 10px;
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
	      	<div id="pro">
	      	<img id="proImage" style="width:130px; cursor:pointer;" src="/resources/profile/${my.profile}" data-bs-toggle="modal" data-bs-target="#imageModal">
	      	<img id="modify" src="/resources/img/modify.png">
	      	</div>
	      	<div>
	      		${my.name}
	      	</div>
	      	<div>
	      		${my.email}
	      	</div>
	      	<hr/>
	      	<div>
	      		<form action="/emp/customLogout" method="post">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					<input type="submit" style="background-color: white; border: none;" value="로그아웃"/>
				</form>
	      	</div>
	      	<div onclick="memout();">회원탈퇴</div>
	      	</div>
	      </div>
	      <div style="flex:3; padding-left:40px;">
	        <form action="/emp/mypagePro" method="post">
	        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	    <div style="border:1px solid lightgray; border-radius:5px; padding: 12px; margin-bottom:30px;">
	        <h5>기본정보</h5>
	        <table>
	            <tr>
	                <td rowspan="2">
	                    <img style="border-radius:50%; width:80px;" src="/resources/profile/${my.profile}">
	                </td>
	                <td>
	                    <!-- 수정 불가능한 input으로 변경 -->
	                    <input type="text" name="name" class="bo" value="${my.name}" readonly/>
	                    <!-- 수정 버튼 추가 -->
	                    <button type="button" onclick="enableAllEdits();">정보 수정</button>
	                    <div id="sub"></div>
	                </td>
	            </tr>
	            <tr>
	                <td><input type="email" name="email" class="bo" value="${my.email}" readonly/></td>
	            </tr>
	        </table>
	        <hr/>
	        <div><i class="fa fa-mobile fa-lg" style="width:15px;"></i>휴대전화<input type="tel" name="phone" class="bo" value="${my.phone}" readonly/></div>
	        <hr/>
	        <div><i class="fa fa-birthday-cake" style="width:15px;"></i>생년월일<fmt:formatDate value="${my.birth}" pattern="yyyy-MM-dd"/></div>
	        <hr/>
	        <div><i class="fa fa-envelope" style="width:15px;"></i>주소<input type="text" class="bo" name="addr1" value="${my.addr1}" readonly/>
	        <input type="text" name="addr2" class="bo" value="${my.addr2}" readonly/></div>
	    </div>
	    <div style="border:1px solid lightgray; border-radius:5px; padding: 12px;">
	        <h5>직원정보</h5>
	        <div><i class="fa fa-mobile fa-lg" style="width:15px;"></i>부서번호<input type="text" class="bo" value="${my.departnum}" readonly/></div>
	        <hr/>
	        <div><i class="fa fa-mobile fa-lg" style="width:15px;"></i>부서명<input type="text" class="bo" value="${my.departname}" readonly/></div>
	        <hr/>
	        <div><i class="fa fa-mobile fa-lg" style="width:15px;"></i>사원번호<input type="text" class="bo" value="${my.employeenum}" readonly/></div>
	        <hr/>
	        <div><i class="fa fa-envelope" style="width:15px;"></i>직급<input type="text" name="position" class="bo" value="${my.position}" readonly/></div>
	    </div>
	    </form>
	</div>
        </div>
        <div class="py-6 px-6 text-center">
          <p class="mb-0 fs-4">Design and Developed by <a href="https://adminmart.com/" target="_blank" class="pe-1 text-primary text-decoration-underline">AdminMart.com</a> Distributed by <a href="https://themewagon.com">ThemeWagon</a></p>
        </div>
      </div>
    </div>
  </div>
  <div class="modal fade" id="imageModal" tabindex="-1" aria-labelledby="imageModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            	<form action="/emp/profile" method="post" enctype="multipart/form-data">
            <div class="modal-body">
                <img style="width:150px; height:150px;" id="previewImage" src="/resources/profile/${my.profile}" class="img-fluid" alt="프로필 이미지">
                <label style="flex:1;" class="fileBtn" for="input-file">
					  업로드
				</label>
				<input name="profile" type="file" id="input-file" style="display:none;"/> 
            </div>
            <div class="modal-footer">
            	<input class="btn btn-secondary" type="submit" value="저장"/>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
            </div>
                </form>
        </div>
    </div>
	</div>
	<script>
	 function enableAllEdits() {
	        // 일괄 수정 버튼을 누르면 모든 input을 활성화 (readonly 해제)하고 border 추가
	        $("input.bo").prop('readonly', false).css('border', '1px solid #007bff');
	        $("#sub").html("<input type='password' value='${my.pw}' name='pw'><button type='submit'>저장</button>");
	    }
	</script>
	<script>
    $(document).ready(function () {
        // 파일 입력란과 이미지 미리보기 엘리먼트 가져오기
        var inputFile = $("#input-file");
        var previewImage = $("#previewImage");

        // 파일 선택 시 이미지 미리보기
        inputFile.change(function () {
            var file = this.files[0];
            if (file) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    previewImage.attr("src", e.target.result);
                };
                reader.readAsDataURL(file);
            }
        });
    });
</script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
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
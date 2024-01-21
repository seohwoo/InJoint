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
		.tr{
			margin-left: 20px; 
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
        <div class="row" style="display:flex; margin-bottom:50px;">
	      <div style="flex:1; box-shadow:5px 0px 5px -5px gray;">
	      	<h5>프로필</h5>
	      	<div style="text-align:center;">
	      	<img id="proImage" style="width:130px; margin-bottom:20px; cursor:pointer;" src="/resources/profile/${my.profile}" data-bs-toggle="modal" data-bs-target="#imageModal">
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
	      	<div onclick="memout();" style="margin-top:10px;">회원탈퇴</div>
	      	</div>
	      </div>
	      <div style="flex:3; padding-left:40px;">
	    <div style="border:1px solid lightgray; border-radius:5px; padding: 12px; margin-bottom:30px;">
	        <h5>기본정보</h5>
	        <table>
	            <tr>
	                <td rowspan="2">
	                    <img style="border-radius:50%; width:80px; margin-right:30px;" src="/resources/profile/${my.profile}">
	                </td>
	                <td>
	                    <div id="sub" style="display:flex;">
	                    <input type="text" size="5" name="name" style="width:auto; box-sizing: border-box;" class="bo" value="${my.name}" readonly/>
	                    <input type="button" id="btn" class="btn btn-primary" value="정보수정">
	                    </div>
	                </td>
	            </tr>
	            <tr>
	                <td><input type="email" name="email" class="bo" value="${my.email}" readonly/></td>
	            </tr>
	        </table>
	        <hr/>
	        <div><i class="fa fa-mobile fa-lg" style="width:15px;"></i>휴대전화<input type="tel" name="phone" class="bo tr" value="${my.phone}" readonly/></div>
	        <hr/>
	        <div style="display:flex;"><i class="fa fa-birthday-cake" style="width:15px;"></i>생년월일<div style="margin-left:20px;"><fmt:formatDate value="${my.birth}" pattern="yyyy-MM-dd"/></div></div>
	        <hr/>
	        <div><i class="fa fa-map-marker" style="width:15px;"></i>주소<input type="text" style="width:70%;" class="bo tr" name="addr1" value="${my.addr1} ${my.addr2}" readonly/></div>
	    </div>
	    <div style="border:1px solid lightgray; border-radius:5px; padding: 12px;">
	        <h5>직원정보</h5>
	        <div><i class="fa fa-newspaper-o" style="width:15px;"></i>부서번호<input type="text" class="bo tr" value="${my.departnum}" readonly/></div>
	        <hr/>
	        <div><i class="fa fa-mobile fa-lg" style="width:15px;"></i>부서명<input type="text" class="bo tr" value="${my.departname}" readonly/></div>
	        <hr/>
	        <div><i class="fa fa-id-badge" style="width:15px;"></i>사원번호<input type="text" class="bo tr" value="${my.employeenum}" readonly/></div>
	        <hr/>
	        <div><i class="fa fa-sort-numeric-desc" style="width:15px;"></i>직급<input type="text" name="position" class="bo tr" value="${my.position}" readonly/></div>
	    </div>
	</div>
        </div>
        <div class="py-6 px-6 text-center">
          <p class="mb-0 fs-4">Design and Developed by <a href="https://adminmart.com/" target="_blank" class="pe-1 text-primary text-decoration-underline">AdminMart.com</a> Distributed by <a href="https://themewagon.com">ThemeWagon</a></p>
        </div>
      </div>
    </div>
  </div>
  <div class="modal fade" id="imageModal" tabindex="-1" aria-labelledby="imageModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-sm">
        <div class="modal-content">
            <form action="/emp/profile" method="post" enctype="multipart/form-data">
                <div class="modal-body" style="position: relative;">
                    <img style="width:150px; height:150px;" id="previewImage" src="/resources/profile/${my.profile}" class="img-fluid" alt="프로필 이미지">
                    <label style="flex:1; background-color:#FF9843; position:absolute; bottom:16px; padding:3px 5px; color:white;"  class="fileBtn" for="input-file">
                        업로드
                    </label>
                    <input name="profile" type="file" id="input-file" style="display:none;"/> 
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                    <button type="submit" class="btn btn-primary">저장</button>
                </div>
            </form>
        </div>
    </div>
</div>
	<div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">정보 수정</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="/emp/mypagePro" method="post">
            <div class="modal-body">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            	<div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">이름</label>
                    <input type="text" name="name" value="${my.name}" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                  </div>
            	<div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">이메일</label>
                    <input type="text" name="email" value="${my.email}" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                  </div>
            	<div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">휴대전화</label>
                    <input type="text" name="phone" value="${my.phone}" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                  </div>
            	<div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">생년월일</label>
                    <input type="date" name="birth" class="form-control" value="<fmt:formatDate pattern='yyyy-MM-dd' value='${my.birth}'/>" id="exampleInputEmail1" aria-describedby="emailHelp">
                  </div>
            	<div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">주소</label>
                    <div style="display:flex;">
                    <input type="text" id="sample5_address" placeholder="주소" type="text" value="${my.addr1}" name="addr1" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
					<input type="button" onclick="sample5_execDaumPostcode()" class="btn btn-primary" value="주소 검색"><br>
                    </div>
                    <input placeholder="상세주소" type="text" name="addr2" value="${my.addr2}" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                  </div>
               </div> 
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                <button type="submit" class="btn btn-primary">저장</button>
            </div>
                </form>
        </div>
    </div>
</div>
   <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9f913e82f349391b4ad71c6606ffa693&libraries=services"></script>
	<script>
	    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
	        mapOption = {
	            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
	            level: 5 // 지도의 확대 레벨
	        };
	
	    var map = new daum.maps.Map(mapContainer, mapOption);
	    var geocoder = new daum.maps.services.Geocoder();
	    var marker = new daum.maps.Marker({
	        position: new daum.maps.LatLng(37.537187, 127.005476),
	        map: map
	    });
	
	
	    function sample5_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                var addr = data.address; // 최종 주소 변수
	
	                document.getElementById("sample5_address").value = addr;
	                geocoder.addressSearch(data.address, function(results, status) {
	                    if (status === daum.maps.services.Status.OK) {
	                        var result = results[0]; //첫번째 결과의 값을 활용
	                        var coords = new daum.maps.LatLng(result.y, result.x);
	                        mapContainer.style.display = "block";
	                        map.relayout();
	                        map.setCenter(coords);
	                        marker.setPosition(coords)
	                    }
	                });
	            }
	        }).open();
	    }
	</script>
	<script>
	$("#btn").click(function () {
		 $('#myModal').modal('show');
	    });
	</script>
	<script>
    $(document).ready(function () {
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

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
	<script src="/resources/libs/jquery/dist/jquery.min.js"></script>
	<script src="/resources/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
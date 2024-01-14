<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>register</title>
  <link rel="shortcut icon" type="image/png" href="/resources/img/favicon.png" />
  <link rel="stylesheet" href="/resources/css/styles.min.css" />
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script src="/resources/js/jquery-3.7.1.min.js"></script> 
  <script>
  	function comfirmid(){
  		$.ajax({
			url: "/emp/idCheck",
			data: {id: $("#idc").val()},
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			success: function(e){
					$("#id_chk").text(e);
				}
		});		
		}
  </script>
</head>

<body>
  <!--  Body Wrapper -->
  <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
    data-sidebar-position="fixed" data-header-position="fixed">
    <div
      class="position-relative overflow-hidden radial-gradient min-vh-100 d-flex align-items-center justify-content-center">
      <div class="d-flex align-items-center justify-content-center w-100">
        <div class="row justify-content-center w-100">
          <div class="col-md-8 col-lg-6 col-xxl-3">
            <div class="card mb-0">
              <div class="card-body">
                <a href="./index.html" class="text-nowrap logo-img text-center d-block py-3 w-100">
                  <img src="/resources/img/favicon.png"><h2 style="font-weight:800;">InJoint</h2>
                </a>
                <p class="text-center">Your Social Campaigns</p>
                <form action="/emp/registerPro" method="post">
				  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                  <div class="mb-3">
                    <label for="exampleInputtext1" class="form-label">아이디</label>
                    <div style="display:flex;">
                    <input type="text" name="id" id="idc" class="form-control" id="exampleInputtext1" aria-describedby="textHelp">
                  	<input type="button" onclick="comfirmid();" class="btn btn-primary" value="중복확인">
                  	</div>
                  	<div id="id_chk" style="color:red;"></div>
                  </div>
                  <div class="mb-4">
                    <label for="exampleInputPassword1" class="form-label">비밀번호</label>
                    <input type="password" name="pw" class="form-control" id="exampleInputPassword1">
                  </div>
                  <div class="mb-4">
                    <label for="exampleInputtext1" class="form-label">이름</label>
                    <input type="text" name="name" class="form-control" id="exampleInputPassword1">
                  </div>
                  <div class="mb-4">
                    <label for="exampleInputtext1" class="form-label">부서번호</label>
                    <input type="text" name="departnum" class="form-control" id="exampleInputPassword1">
                  </div>
                  <div class="mb-4">
                    <label for="exampleInputtext1" class="form-label">직급</label>
                    <select name="position" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                    	<option value="인턴">인턴</option>
                    	<option value="사원">사원</option>
                    	<option value="주임">주임</option>
                    	<option value="대리">대리</option>
                    	<option value="과장">과장</option>
                    	<option value="차장">차장</option>
                    	<option value="부장">부장</option>
                    </select>
                  </div>
                  <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">생년월일</label>
                    <input type="date" name="birth" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                  </div>
                  <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">이메일</label>
                    <input type="email" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                  </div>
                  <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">휴대폰번호</label>
                    <input type="tel" name="phone" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                  </div>
					<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>
                  <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">주소</label>
                    <div style="display:flex;">
                    <input type="text" id="sample5_address" placeholder="주소" type="text" name="addr1" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
					<input type="button" onclick="sample5_execDaumPostcode()" class="btn btn-primary" value="주소 검색"><br>
                    </div>
                    <input placeholder="상세주소" type="text" name="addr2" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                  </div>
                  <button type="submit" class="btn btn-primary w-100 py-8 fs-4 mb-4 rounded-2">Sign Up</button>
                  <div class="d-flex align-items-center justify-content-center">
                    <p class="fs-4 mb-0 fw-bold">Already have an Account?</p>
                    <a class="text-primary fw-bold ms-2" href="/emp/customLogin">Sign In</a>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
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
  <script src="/resources/assets/libs/jquery/dist/jquery.min.js"></script>
  <script src="/resources/assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
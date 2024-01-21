<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>register</title>
  <link rel="shortcut icon" type="image/png" href="/resources/img/favicon.png" />
  <link rel="stylesheet" href="/resources/css/styles.min.css" />
  <script src="/resources/js/jquery-3.7.1.min.js"></script> 
<!--  
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
-->
 <script>
 function submitForm() {
	    // 부서번호 확인 여부를 체크
	    var departmentCheck = $("#de_chk").text().trim();

	    // 부서번호 확인이 성공했을 때 submit 실행
	    if (departmentCheck === '부서번호 확인 완료') {
	      return true;
	    } else {
	      // 부서번호 확인이 실패했거나 부서번호를 확인하지 않은 경우 알림
	      alert('부서번호를 확인하세요.');
	      return false;
	    }
	  }
 
  	function department(){
  		$.ajax({
			url: "/emp/departnum",
			data: {departnum: $("#departnum").val()},
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			success: function(e){
					$("#de_chk").text(e);
				}
		});		
		}
  </script>
  <script>
  var frm = document.forms.form;
  var emailPat = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;

  $('#email1').on('input', function() {
      const email = $(this).val().trim();
      const emailError = $('#e1');

      if (email !== '') {
          if (!emailPat.test(email)) {
              emailError.text('※ 이메일 형식이 맞지 않습니다.');
          } else {
              emailError.text('');
          }
      } else {
          emailError.text('※ 필수 정보입니다.');
      }
  }); 
    var idPat = /^[A-Za-z0-9]{8,}$/;
    var pwPat = /^[A-Za-z0-9]{9,}$/;
    var emailPat = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
    var phonePat = /\d{2,3}-\d{3,4}-\d{4}/;
    var namePat = /^[ㄱ-ㅎ|가-힣]+$/;

    function submit() {
        const frm = document.forms.form;
        const id = frm.id.value.trim();
        const password = frm.password.value.trim();
        const name = frm.name.value.trim();
        const email = frm.email.value.trim();
        const phone = frm.phone.value.trim();
        document.getElementById('id').innerHTML = '';
        document.getElementById('pw').innerHTML = '';
        document.getElementById('name').innerHTML = '';
        document.getElementById('email').innerHTML = '';
        document.getElementById('phone').innerHTML = '';

        if (frm.id.value.trim() != '') {
            if (!idPat.test(id)) {
                document.getElementById('id').innerHTML = '※ 아이디 형식이 맞지 않습니다.';
                frm.id.focus();
                return false;
            }
        } else {
            document.getElementById('id').innerHTML = '※ 필수 정보입니다.';
            frm.id.focus();
            return false;
        }

        if (frm.password.value.trim() != '') {
            if (!pwPat.test(password)) {
                document.getElementById('pw').innerHTML = '※ 비밀번호 형식이 맞지 않습니다.';
                frm.password.focus();
                return false;
            }
        } else {
            document.getElementById('pw').innerHTML = '※ 필수 정보입니다.';
            frm.password.focus();
            return false;
        }

        if (frm.name.value.trim() != '') {
            if (!namePat.test(name)) {
                document.getElementById('name').innerHTML = '※ 한글만 입력해주세요.';
                frm.name.focus();
                return false;
            }
        } else {
            document.getElementById('name').innerHTML = '※ 필수 정보입니다.';
            frm.name.focus();
            return false;
        }

        if (frm.email.value.trim() != '') {
            if (!emailPat.test(email)) {
                document.getElementById('email').innerHTML = '※ 이메일 형식이 맞지 않습니다.';
                frm.email.focus();
                return false;
            }
        } else {
            document.getElementById('email').innerHTML = '※ 필수 정보입니다.';
            frm.email.focus();
            return false;
        }

        if (frm.phone.value.trim() != '') {
            if (!phonePat.test(phone)) {
                document.getElementById('phone').innerHTML = '※ 전화번호 형식이 맞지 않습니다.';
                frm.phone.focus();
                return false;
            }
        } else {
            document.getElementById('phone').innerHTML = '※ 필수 정보입니다.';
            frm.phone.focus();
            return false;
        }

        return confirm('🎉회원가입되었습니다🎉');
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
                  <!-- 
                  <div class="mb-3">
                    <label for="exampleInputtext1" class="form-label">아이디</label>
                    <div style="display:flex;">
                    <input type="text" name="id" id="idc" class="form-control" id="exampleInputtext1" aria-describedby="textHelp">
                  	<input type="button" onclick="comfirmid();" class="btn btn-primary" value="중복확인">
                  	</div>
                  	<div id="id_chk" style="color:red;"></div>
                  </div>
                  -->
                  
                  <div class="mb-4">
                    <label for="exampleInputPassword1" class="form-label">비밀번호</label>
                    <input type="password" name="pw" class="form-control" id="exampleInputPassword1" required="required">
                  </div>
                  <div class="mb-4">
                    <label for="exampleInputtext1" class="form-label">이름</label>
                    <input type="text" name="name" class="form-control" id="exampleInputPassword1" required="required">
                  </div>
                  <div class="mb-4">
                    <label for="exampleInputtext1" class="form-label">부서번호</label>
                    <div style="display:flex;">
                    <input type="text" name="departnum" class="form-control" id="departnum">
                    <input type="button" onclick="department();" class="btn btn-primary" value="부서번호 확인">
                  	</div>
                  	<div id="de_chk" style="color:red;"></div>
                  </div>
                  <div class="mb-4">
                    <label for="exampleInputtext1" class="form-label">직급</label>
                    <select name="position" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required">
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
                    <input type="date" name="birth" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required">
                  </div>
                  <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">이메일</label>
                    <input type="email" name="email" class="form-control" id="email1" aria-describedby="emailHelp" required="required">
                    <div id="e1" style="color:red;"></div>
                  </div>
                  <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">휴대폰번호</label>
                    <input type="tel" name="phone" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required">
                  </div>
					<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>
                  <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">주소</label>
                    <div style="display:flex;">
                    <input type="text" id="sample5_address" placeholder="주소" type="text" name="addr1" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required">
					<input type="button" onclick="sample5_execDaumPostcode()" class="btn btn-primary" value="주소 검색"><br>
                    </div>
                    <input placeholder="상세주소" type="text" name="addr2" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required">
                  </div>
                  <button type="submit" onclick="return submitForm();" class="btn btn-primary w-100 py-8 fs-4 mb-4 rounded-2">Sign Up</button>
                  <div class="d-flex align-items-center justify-content-center">
                    <p class="fs-4 mb-0 fw-bold">Already have an Account?</p>
                    <a class="text-primary fw-bold ms-2" href="/emp/registerPro">Sign In</a>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
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
  <script src="/resources/assets/libs/jquery/dist/jquery.min.js"></script>
  <script src="/resources/assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
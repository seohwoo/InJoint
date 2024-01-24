<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Calendar</title>
  <link rel="shortcut icon" type="image/png" href="/resources/assets/images/logos/favicon.png" />
  <link rel="stylesheet" href="/resources/assets/css/styles.min.css" />
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"/>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.7.0/main.min.css">
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/fullcalendar@5.7.0/main.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.min.css" integrity="sha512-mgFjjtvJwdUkAHtZgyzwnf9ekrjlOzA7AXD2CjogJ33sp8YYMMdjC7l2kzDGpL49PauflF1TcOUtcUBP0br4uQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/4.6.0/css/bootstrap.min.css" integrity="sha512-Zn1Brx/Pq1L8UbO//xGF8FABqPpsVLhfXk4fmNqBqCFbLzFO2K2bW8xIW8Zim4P1sNYZJzFfCeAcLO4uBo4+4PA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha512-u8PdT0L4HiME95CbGzKveU5O8R+J00gD9RqjN1HbCf3L4s9q4Qy4iO6tHcX6F5BuupNnqy4aMlXp2c6MIHIi5LQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.11.6/umd/popper.min.js" integrity="sha512-h7aFfojCI+0dkt0pBWj3hy5YQ0WbDsSd3E8F+LGL9A9CdEeS/v3a8ZMSoEU7TrIl5nZ8ol/gOr8b8W+IkGgg2g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/4.6.0/js/bootstrap.min.js" integrity="sha512-CkBlNTcD/zn1MRfA1z5s2BjTzI8XD+7gAmFlVlssZl2pih7qLZ/c8fL4JR2Nl/MC1eJZTU7Z2fuJDLc3ruHcQ == " crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js" integrity="sha512-MXqR5B5yeY5d1WV2e0U5PzD5FaAAdkPFOtbsfiRzQ8XCoJF8x0j4cOvYi7l1KMVdSSTNckjs/dsm4iUKDKXr0Q==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.min.js" integrity="sha512-dlyeNoiL7bgoCkuuQDfMF1UpUuE1uu3y1qB2ZVcN/3Eco0e2+AMJb3Fb2ZZU9KZQqXdgslIubFYmEoPY/LtuUw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<style>
    body {
    	overflow-x: hidden;
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
        <nav class="sidebar-nav scroll-sidebar" data-simplebar="">
          <ul id="sidebarnav">
            <li class="nav-small-cap">
              <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
              <span class="hide-menu">Home</span>
            </li>
            <li class="sidebar-item">
              <a class="sidebar-link" href="./index.html" aria-expanded="false">
                <span>
                  <i class="fa fa-bell-o"></i>
                </span>
                <span class="hide-menu">Dashboard</span>
              </a>
            </li>
            <li class="nav-small-cap">
              <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
              <span class="hide-menu">UI COMPONENTS</span>
            </li>
            <li class="sidebar-item">
              <a class="sidebar-link" href="./ui-buttons.html" aria-expanded="false">
                <span>
                  <i class="ti ti-article"></i>
                </span>
                <span class="hide-menu">Buttons</span>
              </a>
            </li>
            <li class="sidebar-item">
              <a class="sidebar-link" href="./ui-alerts.html" aria-expanded="false">
                <span>
                  <i class="ti ti-alert-circle"></i>
                </span>
                <span class="hide-menu">Alerts</span>
              </a>
            </li>
            <li class="sidebar-item">
              <a class="sidebar-link" href="./ui-card.html" aria-expanded="false">
                <span>
                  <i class="ti ti-cards"></i>
                </span>
                <span class="hide-menu">Card</span>
              </a>
            </li>
            <li class="sidebar-item">
              <a class="sidebar-link" href="./ui-forms.html" aria-expanded="false">
                <span>
                  <i class="ti ti-file-description"></i>
                </span>
                <span class="hide-menu">Forms</span>
              </a>
            </li>
            <li class="sidebar-item">
              <a class="sidebar-link" href="./ui-typography.html" aria-expanded="false">
                <span>
                  <i class="ti ti-typography"></i>
                </span>
                <span class="hide-menu">Typography</span>
              </a>
            </li>
            <li class="nav-small-cap">
              <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
              <span class="hide-menu">AUTH</span>
            </li>
            <li class="sidebar-item">
              <a class="sidebar-link" href="./authentication-login.html" aria-expanded="false">
                <span>
                  <i class="ti ti-login"></i>
                </span>
                <span class="hide-menu">Login</span>
              </a>
            </li>
            <li class="sidebar-item">
              <a class="sidebar-link" href="./authentication-register.html" aria-expanded="false">
                <span>
                  <i class="ti ti-user-plus"></i>
                </span>
                <span class="hide-menu">Register</span>
              </a>
            </li>
            <li class="nav-small-cap">
              <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
              <span class="hide-menu">EXTRA</span>
            </li>
            <li class="sidebar-item">
              <a class="sidebar-link" href="/emp/calendar" aria-expanded="false">
                <span>
                  <i class="fa fa-calendar"></i> 
                </span>
                <span class="hide-menu">일정</span>
              </a>
            </li>
            <li class="sidebar-item">
              <a class="sidebar-link" href="./sample-page.html" aria-expanded="false">
                <span>
                  <i class="ti ti-aperture"></i>
                </span>
                <span class="hide-menu">Sample Page</span>
              </a>
            </li>
          </ul>
        </nav>
        <!-- End Sidebar navigation -->
      </div>
      <!-- End Sidebar scroll-->
    </aside>
    <!--  Sidebar End -->
    <!--  Main wrapper -->
    <div class="body-wrapper">
      <!--  Header Start -->
      <header class="app-header">
        <nav class="navbar navbar-expand-lg navbar-light">
          <ul class="navbar-nav">
            <li class="nav-item d-block d-xl-none">
              <a class="nav-link sidebartoggler nav-icon-hover" id="headerCollapse" href="javascript:void(0)">
                <i class="ti ti-menu-2"></i>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link nav-icon-hover" href="javascript:void(0)">
                <i class="fa fa-bell-o"></i>
                <div class="notification bg-primary rounded-circle"></div>
              </a>
            </li>
          </ul>
          <div class="navbar-collapse justify-content-end px-0" id="navbarNav">
            <ul class="navbar-nav flex-row ms-auto align-items-center justify-content-end">
              <li class="nav-item dropdown">
                <a class="nav-link nav-icon-hover" href="javascript:void(0)" id="drop2" data-bs-toggle="dropdown"
                  aria-expanded="false">
                  <img src="/resources/images/profile/user-1.jpg" alt="" width="35" height="35" class="rounded-circle">
                </a>
                <div class="dropdown-menu dropdown-menu-end dropdown-menu-animate-up" aria-labelledby="drop2">
                  <div class="message-body">
                    <a href="/emp/mypage" class="d-flex align-items-center gap-2 dropdown-item">
                      <i class="ti ti-user fs-6"></i>
                      <p class="mb-0 fs-3">My Profile</p>
                    </a>
                    <a href="javascript:void(0)" class="d-flex align-items-center gap-2 dropdown-item">
                      <i class="ti ti-mail fs-6"></i>
                      <p class="mb-0 fs-3">My Account</p>
                    </a>
                    <a href="javascript:void(0)" class="d-flex align-items-center gap-2 dropdown-item">
                      <i class="ti ti-list-check fs-6"></i>
                      <p class="mb-0 fs-3">My Task</p>
                    </a>
                    <a href="./authentication-login.html" class="btn btn-outline-primary mx-3 mt-2 d-block">Logout</a>
                  </div>
                </div>
              </li>
            </ul>
          </div>
        </nav>
      </header>
      <!--  Header End -->
      <div class="container-fluid">
        <!--  Row 1 -->
        <div class="row">
          <div id="calendar"></div>
		<div class="modal fade" id="calendarModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">일정을 입력하세요.</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="taskId" class="col-form-label">일정 내용</label>
                        <input type="text" class="form-control" id="calendar_content" name="calendar_content">
                        <label for="taskId" class="col-form-label">시작 날짜</label>
                        <input type="date" class="form-control" id="calendar_start_date" name="calendar_start_date">
                        <label for="taskId" class="col-form-label">종료 날짜</label>
                        <input type="date" class="form-control" id="calendar_end_date" name="calendar_end_date">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-warning" id="addCalendar">추가</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal"
                        id="sprintSettingModalClose">취소</button>
                </div>
    
            </div>
        </div>
    </div>
    <div class="modal fade" id="eventModal" tabindex="-1" role="dialog" aria-labelledby="eventModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="eventModalLabel">이벤트 정보</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" id="eventModalBody">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
<div style="display:none;" id="mo">
	
</div>
		
<script>
document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
      initialView: 'dayGridMonth',
      locale: 'ko',
      headerToolbar: {
        center: 'title',
        end: 'prev, next'
      },
      navLinks: true,
      businessHours: true,
      dayMaxEvents: true,
      selectable: true,
      droppable: true,
      editable: false,
      events: [
        {
          title: 'Sample Event',
          start: '2024-01-01',
          end: '2024-01-03',
          color: '#ffff00'
        },
        {
          title: 'Sample Event',
          start: '2024-01-08',
          end: '2024-01-08',
          color: '#ffff00'
        },
        {
          title: 'Sample Event',
          start: '2024-01-06',
          end: '2024-01-06',
          color: '#fffff0'
        }
      ], 
      headerToolbar: {
          left: 'addEventButton' // headerToolbar에 버튼을 추가
      }, 
      customButtons: {
          addEventButton: { // 추가한 버튼 설정
              text : "일정 추가",  // 버튼 내용
              click : function(){ // 버튼 클릭 시 이벤트 추가
                  $("#calendarModal").modal("show"); // modal 나타내기

                  $("#addCalendar").on("click",function(){  // modal의 추가 버튼 클릭 시
                      var content = $("#calendar_content").val();
                      var start_date = $("#calendar_start_date").val();
                      var end_date = $("#calendar_end_date").val();
                      
                      //내용 입력 여부 확인
                      if(content == null || content == ""){
                          alert("내용을 입력하세요.");
                      }else if(start_date == "" || end_date ==""){
                          alert("날짜를 입력하세요.");
                      }else if(new Date(end_date)- new Date(start_date) < 0){ // date 타입으로 변경 후 확인
                          alert("종료일이 시작일보다 먼저입니다.");
                      }else{ 
                          var obj = {
                              "title" : content,
                              "start" : start_date,
                              "end" : end_date
                          }
                      }
                  });
              }
          }
      },
      eventClick: function(info) {
    	  var boundingBox = info.el.getBoundingClientRect();
    	    
    	    var xPosition = boundingBox.left;
    	    var yPosition = boundingBox.top;

    	  $('#mo').html('<p>일정 제목: ' + info.event.title + '</p>');
    	    $('#mo').css({
    	        'display': 'block',
    	        'position': 'absolute',
    	        'top':(yPosition + 30) + 'px',
    	        'left':xPosition + 'px',
    	        'border':'1px solid black',
    	        'background-color':'green',
    	        'z-index':'100',
    	        'max-width':'150px'
    	    });
      }
    });

    calendar.render();
});
</script>
        </div>
        <div class="py-6 px-6 text-center">
          <p class="mb-0 fs-4">Design and Developed by <a href="https://adminmart.com/" target="_blank" class="pe-1 text-primary text-decoration-underline">AdminMart.com</a> Distributed by <a href="https://themewagon.com">ThemeWagon</a></p>
        </div>
      </div>
    </div>
  </div>
  <script src="/resources/libs/jquery/dist/jquery.min.js"></script>
  <script src="/resources/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
  <script src="/resources/js/sidebarmenu.js"></script>
  <script src="/resources/js/app.min.js"></script>
  <script src="/resources/libs/apexcharts/dist/apexcharts.min.js"></script>
  <script src="/resources/libs/simplebar/dist/simplebar.js"></script>
  <script src="/resources/js/dashboard.js"></script>
</body>

</html>
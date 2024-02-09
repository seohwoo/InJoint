<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/resources/css/styles.min.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha512-u8PdT0L4HiME95CbGzKveU5O8R+J00gD9RqjN1HbCf3L4s9q4Qy4iO6tHcX6F5BuupNnqy4aMlXp2c6MIHIi5LQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
   
<aside class="left-sidebar">
      <!-- Sidebar scroll-->
      <div>
         <div class="brand-logo d-flex align-items-center justify-content-between">
          <a href="/emp/main" class="text-nowrap logo-img">
            <div style="font-weight:800; font-size:30px; color:black;"><img style="margin-right:15px;"" src="/resources/images/logos/favicon.png" width="35" alt="" />InJoint</div>
          </a>
          <div class="close-btn d-xl-none d-block sidebartoggler cursor-pointer" id="sidebarCollapse">
            <i class="ti ti-x fs-8"></i>
          </div>
        </div>
        <!-- Sidebar navigation-->
        <nav class="sidebar-nav scroll-sidebar" data-simplebar="">
          <div style="display:flex;">
          <button type="button" style="flex:1; border:none; background-color:#BF3131; color:white; padding: 5px 0;" onclick="window.location.href='/admin/onWork'">출근</button>
          <button type="button" style="flex:1; border:none; background-color:#365486; color:white; padding: 5px 0;" onclick="window.location.href='/admin/offWork'">퇴근</button>
          </div> 
          <ul id="sidebarnav">
            <li class="nav-small-cap">
              <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
              <span class="hide-menu">Home</span>
            </li>
            <li class="sidebar-item">
              <a class="sidebar-link" href="/emp/mainn" aria-expanded="false">
                <span>
                  <i class="ti ti-login"></i>
                </span>
                <span class="hide-menu">내출결</span>
              </a>
            </li>
            <li class="sidebar-item">
              <a class="sidebar-link" href="/emp/customLogout" aria-expanded="false">
                <span>
                  <i class="ti ti-login"></i>
                </span>
                <span class="hide-menu">로그아웃</span>
              </a>
            </li>
            <li class="sidebar-item">
              <a class="sidebar-link" href="/emp/member/mypage" aria-expanded="false">
                <span>
                  <i class="ti ti-login"></i>
                </span>
                <span class="hide-menu">내정보</span>
              </a>
            </li>
            <li class="nav-small-cap">
              <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
              <span class="hide-menu">AUTH</span>
            </li>
            <li class="sidebar-item">
              <a class="sidebar-link" href="/emp/member/calendar" aria-expanded="false">
                <span>
                  <i class="fa fa-calendar"></i> 
                </span>
                <span class="hide-menu">일정</span>
              </a>
            </li>
            <li class="sidebar-item">
              <a class="sidebar-link" href="/emp/member/vote" aria-expanded="false">
                <span>
                  <i class="fa fa-pie-chart"></i>
                </span>
                <span class="hide-menu">투표</span>
              </a>
            </li>
            <li class="sidebar-item">
              <a class="sidebar-link" href="/chat/list" aria-expanded="false">
                <span>
                  <i class="fa fa-comments"></i> 
                </span>
                <span class="hide-menu">채팅</span>
              </a>
            </li>
            <li class="nav-small-cap">
              <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
              <span class="hide-menu">ADMIN</span>
            </li>
            <li class="sidebar-item">
              <a class="sidebar-link" href="/admin/showEmp" aria-expanded="false">
                <span>
                  <i class="fa fa-id-card-o"></i> 
                </span>
                <span class="hide-menu">사원관리</span>
              </a>
            </li>
            <li class="sidebar-item">
              <a class="sidebar-link" href="/admin/attendance" aria-expanded="false">
                <span>
                  <i class="fa fa-address-card-o"></i>
                </span>
                <span class="hide-menu">근태관리</span>
              </a>
            </li>
            <li class="sidebar-item">
              <a class="sidebar-link" href="/admin/notice/list" aria-expanded="false">
                <span>
                  <i class="fa fa-pencil-square-o"></i>
                </span>
                <span class="hide-menu">공지게시판</span>
              </a>
            </li>
          </ul>
        </nav>
        <!-- End Sidebar navigation -->
      <!-- End Sidebar scroll-->
    </aside>
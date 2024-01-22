<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>${roomname}</title>
		<link rel="shortcut icon" type="image/png" href="/resources/assets/images/logos/favicon.png" />
  		<link rel="stylesheet" href="/resources/assets/css/styles.min.css" />
   		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"/>
   		<link href="/resources/css/chat.css" rel="stylesheet" type="text/css">
   		<script type="text/javascript" src="/resources/js/jquery-1.10.2.min.js"></script>
		<script type="text/javascript" src="/resources/js/socket.io.js"></script>
   		<script type="text/javascript">

			$(function () {
				function get(selector, root = document) {
					  return root.querySelector(selector);
				}
				const msgerChat = get(".msger-chat");
				// 문서 전체의 스크롤바를 가장 아래로 이동
				var socket = io.connect("http://${ip}:9999");
				var joincnt = '${dto.isjoin}';
				console.log('시작 : '+joincnt);
				msgerChat.scrollTop = msgerChat.scrollHeight;
				socket.emit("joinRoom", { chatno : '${dto.no}', roomname: '${dto.roomname}' });
				socket.on("join", function (join) {
					if(joincnt <= '${maxJoinCnt}') {
						$.ajax({
		                    type: 'POST',
		                    url: '/chat/updateJoin',
		                    data: {
		                    		joincnt: joincnt,
		                    		chatno: '${dto.no}',
		                    		updown: 1
		                    	},
			                success: function(response) {
			                	joincnt = parseInt(response);
								console.log('들어옴 : '+joincnt);
			                } 	
		                });
					}
				});
				$(window).on('beforeunload', function() {
					socket.emit("outRoom", { chatno : '${dto.no}', roomname: '${dto.roomname}' });
				});
				socket.on("out", function (out) {
					$.ajax({
	                    type: 'POST',
	                    url: '/chat/updateJoin',
	                    data: {
	                    		joincnt: joincnt,
	                    		chatno: '${dto.no}',
	                    		updown: 0
	                    	},
		                success: function(response) {
		                	joincnt = parseInt(response);
							console.log('나감 : '+joincnt);
		                } 	
	                });	
				});
				socket.on("response", function (message) {
					var arr = message.msg.split(',');
					var side = "left";
					var img = '';
					// 마지막 빈 문자열 제거
					if (arr[arr.length - 1] === '') {
					  arr.pop();
					}
					if(arr[0] === `${dto.name}`) {
						side = "right";
						img = '';
					}
					var msgHTML =
						  '<div class=\'msg ' + side + '-msg\'>' +
						  '  <div class=\'msg-img\' style=\'background-image: url(/resources/file/profile/'+img+')\'></div>' +
						  '' +
						  '  <div class=\'msg-bubble\'>' +
						  '    <div class=\'msg-info\'>' +
						  '      <div class=\'msg-info-name\'>' + arr[0] + '</div>' +
						  '      <div class=\'msg-info-time\'>' + arr[2] + '</div>' +
						  '    </div>' +
						  '    <div class=\'msg-text\'>' + arr[1] + '</div>' +
						  '  </div>' + 
						  '</div>';
					$("#msgs").append(msgHTML);
					msgerChat.scrollTop = msgerChat.scrollHeight;
					
				});
				$("#sendBtn").on("click", function () {
					var m = $("#chat").val();
					if (m !== "") {
						var currentDate = new Date();
						var options = {
						  hour: '2-digit',
						  minute: '2-digit',
						  hour12: true, // 12시간 형식
						};
						var formattedTime = new Intl.DateTimeFormat('ko-KR', options).format(currentDate);
						msgerChat.scrollTop = msgerChat.scrollHeight;
						socket.emit("chatMsg", { msg: '${dto.name}' + "," + m + "," + formattedTime +"," , chatno : '${dto.no}', roomname: '${dto.roomname}' });
					}
				});
				$(document).ready(function () {
					$('#sendBtn').click(function () {
						$('#chat').val('');
					});
				});
				$(window).on('beforeunload', function (e) {
			        var isReloading = performance.navigation.type === 1;
			        if (isReloading) {
			        	socket.on("out", function (out) {
							$.ajax({
			                    type: 'POST',
			                    url: '/chat/updateJoin',
			                    data: {
			                    		joincnt: joincnt,
			                    		chatno: '${dto.no}',
			                    		updown: 0
			                    	},
				                success: function(response) {
				                	joincnt = parseInt(response);
									console.log('나감 : '+joincnt);
				                } 	
			                });	
						});
			        }
			    });
			});
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
	     <div class="container-fluid" style="height: 100vh;">
	     	<section class="msger">
		  <header class="msger-header">
		    <div class="msger-header-title">
		      <i class="fas fa-comment-alt"></i> ${roomname}
		    </div>
		    <div class="msger-header-options">
		       <a href="/chat/list">❌</a>
		    </div>
		  </header>
			<main class="msger-chat" id="msgs">
				${chat}
			</main>
			<div class="msger-inputarea">
			    <input type="text" class="msger-input" name="chat" id="chat" placeholder="메세지를 입력하세요...">
			    <button type="submit" id="sendBtn" class="msger-send-btn">전송</button>
			</div>    
		</section>
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
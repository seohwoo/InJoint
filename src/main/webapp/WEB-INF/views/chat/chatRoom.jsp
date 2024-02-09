<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>채팅목록</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="shortcut icon" type="image/png" href="/resources/assets/images/logos/favicon.png" />
  		<link rel="stylesheet" href="/resources/assets/css/styles.min.css" />
   		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"/>

   <link href="/resources/table/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/resources/table/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="/resources/table/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
 <style>
		body {font-family: Arial, Helvetica, sans-serif;}
		* {box-sizing: border-box;}
		
		.open-button {
		  background-color: #365486;
        color: white;
        padding: 16px 20px;
        border: none;
        cursor: pointer;
        opacity: 0.8;
        position: fixed;
        bottom: 23px;
        right: 28px;
        width: 90px;
        border-radius: 10px;
		}
		
		.chat-popup {
		padding: 8px;
        display: none;
        position: fixed;
        bottom: 0;
        right: 15px;
        bottom: 15px;
        border: 3px solid #f1f1f1;
        z-index: 100;
        overflow-y: auto;
        max-height: 500px;
        min-height: 500px;
        max-width: 300px;
        min-width: 300px;
        background-color: white;
    }
		
		.form-container {
		  max-width: 300px;
		  padding: 10px;
		  background-color: white;
		}
		
		.form-container textarea {
		  width: 100%;
		  padding: 15px;
		  margin: 5px 0 22px 0;
		  border: none;
		  background: #f1f1f1;
		  resize: none;
		  min-height: 200px;
		}
		
		.form-container textarea:focus {
		  background-color: #ddd;
		  outline: none;
		}
		
		form .btn {
		  background-color: #04AA6D;
		  color: white;
		  padding: 16px 20px;
		  border: none;
		  cursor: pointer;
		  width: 100%;
		  margin-bottom:10px;
		  opacity: 0.8;
		}
		
		.form-container .cancel {
		  background-color: red;
		}
		
		.form-container .btn:hover, .open-button:hover {
		  opacity: 1;
		}
		#tb tr:not(:last-child) {
			border-bottom:1px solid gray; 
		}
		.table td{
			border-bottom: 1px solid lightgray !important;
		}
		
    </style>
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

<body  style="background-color: rgb(193 206 220 / 15%);" id="page-top">
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
	
    <!-- Page Wrapper -->
        
    <div id="wrapper">

        <!-- Sidebar -->
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">
                <!-- Topbar -->
          
                <!-- End of Topbar -->
                
                <!-- Begin Page Content -->
                <div class="container-fluid">
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4"style="margin-top:50px;">
                        <div class="card-body" style="position: relative;">
                            <div class="table-responsive">
								<h1 style="margin-bottom: 30px;">채팅방</h1>
								<c:if test="${cnt==0}">
						     		<h1>채팅방이 없어요..😭😭😭😭</h1>
						     	</c:if>
								<c:if test="${cnt>0}">
                                <table border="1" class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>방이름</th>
                                            <th>알림</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="dto" items="${chatList}">
							     			<tr>
							     				<td style="border-right: none;">
							     					<a href="/chat/room?roomname=${dto.roomname}&chatno=${dto.no}">${dto.roomname}</a>
							     				</td>
							     				<td style="border-left: none;"><div style="background-color: #5D87FF; color:white; border-radius: 50%; width: 25px; height: 25px; text-align: center; line-height: 25px;">${dto.noread}</div></td>
							     			</tr>
							     		</c:forEach>
                                    </tbody>
                                </table>
                                </c:if>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->


        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>
	</div>
	</div>
	</div>
	<button style="background-color: #749BC2; border-radius: 50%;" class="open-button" onclick="openForm()">
		<img style="width:50px; height: 50px;" src="/resources/img/add.png"/>
	</button>

	<div class="chat-popup" id="myForm">
	    <h1>일반 채팅</h1>
	
	    <label for="msg"><b>사원 목록</b></label>
	    <c:if test="${cnt==0}">
			<h1>사원이 없습니다...😅😅😅😅</h1>
		</c:if>
		<c:if test="${cnt>0}">
			<form id="chatForm" action="/chat/createRoom" method="post" onsubmit="return validateForm()">
				<input type="text" style="width:100%; margin-bottom: 10px;" name="roomname" placeholder="채팅방 이름을 입력하세요.." required="required"/>
				<table id="tb" border="1" width="100%;">
					<tr style="text-align: center;">
						<td>부서명</td>
						<td colspan="2" style="border-left: 1px solid gray;">사용자 초대</td>
					</tr>
					
					<c:forEach var="dto" items="${empList}">
						<tr>
							<td>${dto.departname}</td>
							<td style="border-left: 1px solid gray;">${dto.name}</td>
							<td>
								<input type="checkbox" name="invite" value="${dto.employeenum}"/>
							</td>
						</tr>
					</c:forEach>
				</table>
				<br />
	      <button type="submit" style="width:100%; background-color: #91C8E4" class="btn">채팅방 만들기</button>
          <button onclick="closeForm()" type="button" style="width:100%; color:darkgray; background-color: #F6F4EB" class="btn cancel" id="close">닫기</button>
			</form>
	</c:if>
	</div>
    <script src="/resources/libs/jquery/dist/jquery.min.js"></script>
	<script src="/resources/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Bootstrap core JavaScript-->
    <script src="/resources/table/vendor/jquery/jquery.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="/resources/table/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/resources/table/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="/resources/table/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="/resources/table/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="/resources/table/js/demo/datatables-demo.js"></script>
	<script>
	function openForm() {
	  document.getElementById("myForm").style.display = "block";
	}
	
	function closeForm() {
	  document.getElementById("myForm").style.display = "none";
	}
	</script>
    <!-- Bootstrap core JavaScript-->
</html>
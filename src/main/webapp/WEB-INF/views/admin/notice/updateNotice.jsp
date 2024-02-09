<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>공지게시판 수정</title>
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
        #dataTable tbody tr {
            border-bottom: 1px solid #dee2e6 !important;
        }
		.div.dataTables_length select{
			width: 50px !important;
		}        
		table td{
			border: 1px solid lightgray;
			padding: 8px 0;
		}
    </style>
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
	     	<jsp:include page="/WEB-INF/views/admin/isAdmin.jsp" />
	
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
								<h1 style="margin-bottom: 30px;">게시글 수정</h1>
								<jsp:include page="/WEB-INF/views/admin/isAdmin.jsp" />
						     	<form action="/admin/notice/updatePro" method="post">
						     		<input type="hidden" name="no" value="${dto.no}"/>
								<table width="100%;">
									<tr>
										<td style="text-align: center; background-color: #5D87FF; color:white;">제목</td>
										<td style="padding-left: 10px;">
						     				<input style="border:none; width:100%;" type="text" name="title" value="${dto.title}"/>
										</td>
									</tr>
									<tr>
										<td style="text-align: center; background-color: #5D87FF; color:white;">작성자</td>
										<td style="padding-left: 10px;">
						     				<input style="border:none;" type="text" name="writer" value="${my.name}" readonly="readonly"/> 
										</td>
									</tr>
									<tr>
										<td style="text-align: center; background-color: #5D87FF; color:white;">내용</td>
										<td style="padding-left: 10px;">
						     				<textarea style="border:none; width:100%; height: 250px;" rows="5" cols="20" name="content">${dto.content}</textarea>
										</td>
									</tr>
                            	</table>
						     	<input style="border:none; margin-top:10px; border-radius:5px; background-color: #F6F4EB; padding: 8px 10px; float: right;" type="submit" value="수정"/>
						     	</form>
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
    <!-- Bootstrap core JavaScript-->
    <script src="/resources/table/vendor/jquery/jquery.min.js"></script>
    <script src="/resources/table/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="/resources/table/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/resources/table/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="/resources/table/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="/resources/table/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="/resources/table/js/demo/datatables-demo.js"></script>
	
	<script src="/resources/libs/jquery/dist/jquery.min.js"></script>
  <script src="/resources/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
  <script src="/resources/js/sidebarmenu.js"></script>
  <script src="/resources/js/app.min.js"></script>
  <script src="/resources/libs/apexcharts/dist/apexcharts.min.js"></script>
  <script src="/resources/libs/simplebar/dist/simplebar.js"></script>
  <script src="/resources/js/dashboard.js"></script>
</body>
</html>
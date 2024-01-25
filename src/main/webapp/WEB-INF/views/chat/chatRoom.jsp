<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>채팅목록</title>
		<link rel="shortcut icon" type="image/png" href="/resources/assets/images/logos/favicon.png" />
  		<link rel="stylesheet" href="/resources/assets/css/styles.min.css" />
   		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"/>
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
								<a href="/chat/addChat">➕채팅방만들기</a>
						     	<br />
						     	<c:if test="${cnt==0}">
						     		<h1>채팅방이 없어요..😭😭😭😭</h1>
						     	</c:if>
						     	<c:if test="${cnt>0}">
							     	<table border="1" width="100%;">
							     		<tr>
							     			<td colspan="2">방이름</td>
							     		</tr>
							     		<c:forEach var="dto" items="${chatList}">
							     			<tr>
							     				<td style="border-right: none;">
							     					<a href="/chat/room?roomname=${dto.roomname}&chatno=${dto.no}">${dto.roomname}</a>
							     				</td>
							     				<td style="border-left: none;"><div style="background-color: #5D87FF; color:white; border-radius: 50%; width: 25px; height: 25px; text-align: center; line-height: 25px;">${dto.noread}</div></td>
							     			</tr>
							     		</c:forEach>
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
</html>
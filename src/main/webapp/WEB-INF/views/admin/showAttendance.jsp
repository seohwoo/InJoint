<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>근태관리</title>
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
		#tab td{
			border: 1px solid lightgray;
			text-align: center;
		}
		#tr1 td{
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
				<div class="container-fluid">
					<div class="card shadow mb-4"style="margin-top:50px;">
                        <div class="card-body" style="position: relative;">
                        <c:if test="${isAdmin}">
                        <h1>오늘의 출/퇴근</h1>
							<table style="margin: 30px 0;" id="tab" width="100%;">
						     		<thead>
						     		<tr id="tr1">
						     			<td>전체사원수</td>
						     			<td>오늘날짜</td>
						     			<td>출근사원수</td>
						     			<td>퇴근사원수</td>
						     		</tr>
						     		<tr id="tr1">
						     			<td>${empCnt}</td>
						     			<td>
						     				<fmt:formatDate value="${day}" dateStyle="long" type="date"/>
						     			</td>
						     			<td>${onWorkCnt}</td>
						     			<td>${cnt-onWorkCnt}</td>
						     		</tr>
						     	</table>
				     		</c:if>
						</div>
					</div>
				</div>
                <!-- Begin Page Content -->
                <div class="container-fluid" style="z-index:100;">
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4"style="z-index:100; margin-top:50px;">
                        <div class="card-body" style="z-index:100; position: relative;">
                            <div class="table-responsive">
                            <c:if test="${isAdmin}">
						     	<h1 style="margin-bottom: 30px;">근태관리</h1>
								<c:if test="${cnt==0}">
									<h1>아직 아무도 출근을 안했어요..😝😝😝😝</h1>
								</c:if>
								<c:if test="${cnt>0}">
									<table border="1" class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
										<thead>
										<tr>
											<td>번호</td>
											<td>사원번호</td>
											<td>사원명</td>
											<td>출근</td>
											<td>퇴근</td>
										</tr>
										</thead>
										<c:forEach var="dto" items="${empAttendaceList}" varStatus="loopStatus">
											<c:set var="cnt" value="${empAttendaceList.size() - loopStatus.index}" />
											<tr>
												<td>${cnt}</td>
												<td>${dto.employeenum}</td>
												<td>${dto.name}</td>
												<td><fmt:formatDate value="${dto.onwork}" dateStyle="long" type="both"/></td>
												<td><fmt:formatDate value="${dto.offwork}" dateStyle="long" type="both"/></td>
											</tr>
										</c:forEach>
									</table>
								</c:if>
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
    </body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>사원관리</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="shortcut icon" type="image/png" href="/resources/assets/images/logos/favicon.png" />
  		<link rel="stylesheet" href="/resources/assets/css/styles.min.css" />
   		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"/>
    <!-- Custom fonts for this template -->
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
                <div class="container-fluid" style="z-index:100;">
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4"style="z-index:100; margin-top:50px;">
                        <div class="card-body" style="z-index:100; position: relative;">
                            <div class="table-responsive">
                            <c:if test="${isAdmin}">
								<h1 style="margin-bottom: 30px;">사원관리</h1>
								<c:if test="${cnt==0}">
									<h1>사원없음..🙄🙄</h1>
								</c:if>
								<c:if test="${cnt>0}">
                                <table border="1" class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>번호</th>
                                            <th>부서</th>
                                            <th>직급</th>
                                            <th>성명</th>
                                            <th>사번</th>
                                            <th>입사일</th>
                                            <th>연락처</th>
                                            <th>비고</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="dto" items="${employeeList}" varStatus="loopStatus">
										<c:set var="cnt" value="${employeeList.size() - loopStatus.index}" />
                                        <tr>
                                            <td>${cnt}</td>
											<td>${dto.departname}</td>
											<td>${dto.position}</td>
											<td>${dto.name}</td>
											<td>${dto.employeenum}</td>
											<td>
												<fmt:formatDate value="${dto.reg}" dateStyle="long" type="date"/>
											</td>
											<td>${dto.phone}</td>
											<td></td>
                                        </tr>
                                        </c:forEach>
                                    </tbody>
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
</body>

</html>
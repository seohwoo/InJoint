<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>투표</title>
<link rel="shortcut icon" type="image/png" href="/resources/assets/images/logos/favicon.png" />
<link rel="stylesheet" href="/resources/assets/css/styles.min.css" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" />
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

<style>
    .bo {
        border: none;
    }

    body {
        font-family: Arial, Helvetica, sans-serif;
    }

    * {
        box-sizing: border-box;
    }

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

    .form-container .btn {
        background-color: #04AA6D;
        color: white;
        padding: 16px 20px;
        border: none;
        cursor: pointer;
        width: 100%;
        margin-bottom: 10px;
        opacity: 0.8;
    }

    .form-container .cancel {
        background-color: red;
    }

    .form-container .btn:hover, .open-button:hover {
        opacity: 1;
    }
    
    .answer{
    	width: 100%;
    }
    
    #votingTitle{
    	width: 100%;
    	margin-bottom: 20px;
    }
    
    .fileBtn{
	  background-color:#FF6600;
	  border-radius: 4px;
	  color: white;
	  cursor: pointer;
    }
    ol, ul{
    	padding-left:0 !important;
    }
    
    #btn2{
    	width: 100%;
    }


</style>
    <script>
    $(document).ready(function(){
        $('#vote_per').click(function() {
            $('#myModal').modal('show');
        });
    });
    </script>
 <script>
  	function vote(num, no){
  		$.ajax({
			url: "/emp/votePro",
			data: {num: num,
				   employeenum :$("#employeenum").val(),
				   no : no},
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			success: function(e){
					window.location.href='/emp/member/voting?no='+no;
					$("#de_chk").text(e);
					
				}
		});		
		}
  </script>
</head>
<body style="background-color: rgb(193 206 220 / 15%);">
<!-- Body Wrapper -->
<div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
    data-sidebar-position="fixed" data-header-position="fixed">
    <!-- Sidebar Start -->
    <aside class="left-sidebar">
        <!-- Sidebar scroll-->
        <div>
            <div class="brand-logo d-flex align-items-center justify-content-between">
                <a href="./index.html" class="text-nowrap logo-img">
                    <div style="font-weight:800; font-size:30px; color:black;"><img style="margin-right:15px;" src="/resources/images/logos/favicon.png" width="35" alt="" />InJoint</div>
                </a>
                <div class="close-btn d-xl-none d-block sidebartoggler cursor-pointer" id="sidebarCollapse">
                    <i class="ti ti-x fs-8"></i>
                </div>
            </div>
            <!-- Sidebar navigation-->
            <jsp:include page="../sidebar.jsp"/>
            <!-- End Sidebar navigation -->
        </div>
        <!-- End Sidebar scroll-->
    </aside>
    <!-- Sidebar End -->
    <!-- Main wrapper -->
    <div class="body-wrapper">
        <!-- Header Start -->
        <jsp:include page="../header.jsp"/>
        <!-- Header End -->
        <div class="container-fluid">
            <!-- Row 1 -->
            <c:set var="now" value="<%=new java.util.Date()%>" />
            <fmt:formatDate value="${now}" pattern="yyyy/MM/dd" var="today" />
            <div class="row">
        	<div class="container">
	        <ul style="margin-top:50px;"class="list-unstyled row">
	            <c:forEach var="vote" items="${vote}">
	            <sec:authentication var="auth" property="principal"/>
				    <li style="background-color:white; position:relative; padding: 0 !important; border-radius:5px; box-shadow:5px 4px 8px -5px gray; border:1px solid lightgray; margin-bottom: 20px; min-height: 300px; width: 80%; margin: 0 auto;">
				        <input type="hidden" id="no" value="${vote.no}" name="no">
					    <c:set var="formattedDate" value="${vote.enddate}" />
	           			<fmt:formatDate pattern="yyyy/MM/dd" value="${formattedDate}" var="enddate" />
				        <input type="hidden" id="employeenum" value="<sec:authentication property="principal.dto.employeenum"/>">
	                	<c:if test="${vote.employeenum == auth.dto.employeenum}">
		            	<button style="position: absolute; background-color:#F96666; color:white; border:none; padding: 3px 0; border-radius: 5px; right: 5px; top: 5px; width: 70px;" onclick="window.location.href='/emp/delvote?no='+${vote.no}">삭제</button>
					    </c:if>
	                	<div style="height: 50px; border-bottom: 1px solid lightgray; padding: 10px 5px; display:flex;">
	                		<div style="border:2px solid #5D87FF; border-radius: 5px; color:#5D87FF; margin: 1.5px 5px 1.5px 1.5px;">
	                	<c:if test="${enddate >= today}">
	                		진행중
	                	</c:if>
	                	<c:if test="${enddate < today}">
	                		투표마감
	                	</c:if>
	                	</div><div style="font-size: 20px; margin-left:10px; font-weight: 500;">Q. ${vote.title}</div></div>
	                	<c:if test="${vote.anonymous == 1}">
	                		<div style="margin: 10px;">익명 투표</div>
	                	</c:if>
				        <c:if test="${not empty vote.img}">
				            <c:forEach var="vi" items="${vote.img}">
				                <table style="width:90%; margin: 20px auto;">
				                	<tr>
				                	<c:if test="${enddate >= today}">
					                	<td rowspan="2"><input type="radio" name="group_${vote.no}" <c:if test='${vi.num eq check}'>checked</c:if> onclick="vote('${vi.num}', '${vote.no}')" id="typevalue" value="${vi.typevalue}"></td>
					                </c:if>	
					                	<td style="width:100px;" rowspan="2"><img src="/resources/img/${vi.img}" style="border-radius:5px; width:100px; height:100px;"/></td> 
					                	<td style="font-size:20px; padding-left: 40px;"><input type="text" style="border: none;" value="${vi.typevalue}"/></td> 
					                	<td style="width:50px;">${vi.count} 명</td> 
				                	</tr>
				                	<tr>
				                		<td style="padding-left: 40px;" colspan="2">
										    <div class="progress">
										        <div class="progress-bar" role="progressbar" style="width: ${(vi.count/vote.allcount)*100}%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
										    </div>
				                		</td>
				                	</tr>
				                	</table>
				            </c:forEach>
				        </c:if>
				        <div style="text-align: right; padding: 5px;">
				        <c:if test="${vote.anonymous == 1}">
				        총 ${vote.allcount} 명 참여
				        </c:if>
				        <c:if test="${vote.anonymous != 1}">
				        <dl id="vote_per">총 ${vote.allcount} 명 참여 ></dl>
				        </c:if>
				        </div>
				    </li>
				</c:forEach>
	        </ul>
    	</div>
            </div>
            <div class="py-6 px-6 text-center">
                <p class="mb-0 fs-4">Design and Developed by <a href="https://adminmart.com/" target="_blank" class="pe-1 text-primary text-decoration-underline">AdminMart.com</a> Distributed by <a href="https://themewagon.com">ThemeWagon</a></p>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">투표 참여 인원</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
            	<c:forEach var="name" items="${name}">
	                	<div>${name.name}</div>
	        </c:forEach>
	        <c:forEach var="vote" items="${vote}">
		    <c:if test="${vote.anonymous != 1}">
		        <table style="width:90%; margin: 20px auto;">
		            <tr>
		                <c:forEach var="vi" items="${vote.img}">
		                    <td>
		                        <${vi.typevalue}> 투표한 사람
		                        <c:choose>
		                            <c:when test="${not empty vi.img}">
		                                <c:forEach var="nameItem" items="${vi.name}">
		                                    <div>
		                                        <img src="/resources/profile/${nameItem.profile}" style="width:30px;"/>
		                                        ${nameItem.name}
		                                    </div>
		                                </c:forEach>
		                            </c:when>
		                            <c:otherwise>
		                                <div style="height: 50px;">없음</div>
		                            </c:otherwise>
		                        </c:choose>
		                    </td>
		                </c:forEach>
		            </tr>
		        </table>
		    </c:if>
		</c:forEach>

            
            </div> 
            <div class="modal-footer">
            </div>
        </div>
    </div>
</div>

<script src="/resources/libs/jquery/dist/jquery.min.js"></script>
<script src="/resources/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
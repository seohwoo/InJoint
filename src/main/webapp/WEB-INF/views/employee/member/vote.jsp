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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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
	  background-color:#4682A9;
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
  	function vote(num, no){
  		$.ajax({
			url: "/emp/votePro",
			data: {num: num,
				   employeenum :$("#employeenum").val(),
				   no : no},
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			success: function(e){
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
	        <ul class="list-unstyled row" style="display: grid; grid-template-columns: repeat(3, 1fr); gap:20px;">
	            <c:forEach var="vote" items="${vote}">
				    <li style="position:relative; box-shadow: 1px 1px 4px -2px; background-color:white; border-radius:7px; padding: 0 !important; border:1px solid lightgray; min-height: 150px; margin-bottom: 20px;">
				        <input type="hidden" id="no" value="${vote.no}" name="no">
					    <c:set var="formattedDate" value="${vote.enddate}" />
	           			<fmt:formatDate pattern="yyyy/MM/dd" value="${formattedDate}" var="enddate" />
				        <input type="hidden" id="employeenum" value="<sec:authentication property="principal.dto.employeenum"/>">
	                	<div style="border-bottom: 1px solid lightgray; padding: 5px 5px; display:flex;">
	                		<div style="border:2px solid #5D87FF; border-radius: 5px; color:#5D87FF; margin: 1.5px 5px 1.5px 1.5px;">
	                	<c:if test="${enddate >= today}">
	                		진행중
	                	</c:if>
	                	<c:if test="${enddate < today}">
	                		투표마감
	                	</c:if>
	                	</div><div style="font-weight: 500;">Q. ${vote.title}</div></div>
	                	<c:if test="${vote.anonymous == 1}">
	                		<div style="position: absolute; right: 8px; color: gray;">익명 투표</div>
	                	</c:if>
				        <c:if test="${not empty vote.img}">
				            	<div style="margin-bottom: 50px;">
				            <c:forEach var="vi" items="${vote.img}">
				                <table style="width:90%; margin: 10px auto;">
				                	<tr>
					                	<td rowspan="2"><img src="/resources/img/${vi.img}" style="width:50px; height:50px;"/></td> 
					                	<td><input type="text" style="border: none;" value="${vi.typevalue}" readonly="readonly"/></td> 
				                	</tr>
				                	</table>
				            </c:forEach>
				                	</div>
				        </c:if>
				        <div onclick="window.location.href='/emp/member/voting?no='+${vote.no}" style=" display:flex; justify-content: space-between;
				        padding: 7px 5px; border-bottom-left-radius: 7px; border-bottom-right-radius: 7px; position: absolute; bottom:0; cursor:pointer; width:100%; background-color:#5D87FF; color:white;">
				        <c:if test="${enddate >= today}">
				        투표하러 가기
				    	</c:if>
				        <c:if test="${enddate < today}">
				        투표 결과 보러가기
				    	</c:if>
				    	<div style="float: right;">></div>
				    	</div>
				    </li>
				</c:forEach>
	        </ul>
    	</div>
            </div>
        </div>
    </div>
    <button style="background-color: #749BC2; border-radius: 50%;" class="open-button" onclick="openForm()">
        <img src="/resources/img/write.png" style="width:50px; height:50px;">
    </button>

    <div class="chat-popup" id="myForm">
        <form action="/emp/member/votePro" method="post" class="form-container" enctype="multipart/form-data">
            <h1>투표 용지</h1>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <label for="msg"><b>제목</b></label>
            <input type="text" name="title" id="votingTitle" required/>
            <ol id="votingItems" style="list-decoration:none;">
                <li style="display:flex; ">
               		<input style="flex:2;" name="typevalue" type="text" class="answer" placeholder="항목 입력" required/>
					<img id="uploadedImage-1" style="width: 20px;" />
               		<label style="flex:1; margin:0 !important;" class="fileBtn" for="input-file-1">
					  업로드
					</label>
					<input name="votefile" type="file" id="input-file-1" style="display:none;"/> 
           		</li>
            </ol>
            <input style="margin-bottom: 10px;" type="button" id="btn2" value="+ 항목 추가">
            <div>종료날짜<input style="width:100%; margin-bottom: 10px;" type="date" name="enddate"/></div>
            <input type="hidden" name="employeenum" value="<sec:authentication property="principal.dto.employeenum"/>">
            <div>
            	익명 아님<input style="margin:0 5px;" type="radio" name="anonymous" value="0" checked="checked">
            	익명<input style="margin:0 5px;" type="radio" name="anonymous" value="1">
            </div>
            <div style="margin-top: 20px;">
            <button type="submit" style="background-color: #91C8E4" class="btn">Send</button>
            <button type="button" style="color:darkgray; background-color: #F6F4EB" class="btn cancel" id="close">Close</button>
            </div>
        </form>
    </div>
</div>
<script>
    function openForm() {
        document.getElementById("myForm").style.display = "block";
    }
</script>
<script>
$(document).ready(function () {
    var votingTitle = $("#votingTitle");
    var votingItems = $("#votingItems");
    var inputFile = "input-file-";
    var uploadedImage = "uploadedImage-";
    
    var inputCounter = 1;
    
    function previewImage(inputId, imageId) {
        var file = $("#" + inputId)[0].files[0];

        if (file) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $("#" + imageId).attr("src", e.target.result);
            };
            reader.readAsDataURL(file);
        }
    }

    // 파일 선택 시 이미지 미리보기 이벤트 리스너 등록
    function registerPreviewEvent(inputId, imageId) {
        $("#" + inputId).change(function () {
            previewImage(inputId, imageId);
        });
    }

    // 초기 이미지 입력란에 대한 미리보기 이벤트 리스너 등록
    registerPreviewEvent("input-file-1", "uploadedImage-1");

    $("#btn2").click(function () {
        inputCounter++;
        var newInputId = inputFile + inputCounter;
        var newImageId = uploadedImage + inputCounter;
        votingItems.append("<li style='display:flex;'>" +
            "<input style='flex:2;' name='typevalue' type='text' class='answer' placeholder='항목 입력' required/>" +
            "<img id='" + newImageId + "' style='width: 20px;' />" +
            "<label style='flex:1; margin:0 !important;' class='fileBtn' for='" + newInputId + "'>업로드</label>" +
            "<input name='votefile' type='file' id='" + newInputId + "' style='display:none;'/> " +
            "</li>");

        // 파일 선택 시 이미지 미리보기
        $("#" + newInputId).change(function () {
            var file = this.files[0];
            var imageId = newImageId;

            if (file) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $("#" + imageId).attr("src", e.target.result);
                };
                reader.readAsDataURL(file);
            }
        });
    });


    $("#close").click(function () {
        document.getElementById("myForm").style.display = "none";
        votingTitle.val("");
        votingItems.empty();
        votingItems.append("<li style='display:flex;'>" +
   		"<input style='flex:2;' name='typevalue' type='text' class='answer' placeholder='항목 입력' required/>" +
		"<img id='uploadedImage-1' style='width: 20px;'' />" +
   		"<label style='flex:1; margin:0 !important;' class='fileBtn' for='input-file-1'>업로드</label>"+
		"<input name='votefile' type='file' id='input-file-1' style='display:none;''/>"+ 
		"</li>");
        // 업로드된 이미지 초기화
        uploadedImage.attr("src", "");
        var inputCounter = 1;
        // input 파일 선택 초기화
        inputFile.val("");
    });

    $(".open-button").click(openForm);
    $(".cancel").click(closeForm);
});
</script>
<script src="/resources/libs/jquery/dist/jquery.min.js"></script>
<script src="/resources/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    	margin-bottom: 30px;
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
</head>
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
            <div class="row" style="display:flex;">
            	   <div class="container">
        <ul class="list-unstyled row">
            <c:set var="prevNo" value="" />
            <c:forEach var="vote" items="${vote}">
                <li class="col-md-3">
                    <div>${vote.vq.title}</div>
                    <c:if test="${vote.no eq prevNo}">
                        <div>${prevTypeValue}</div> <!-- 같은 div에 묶을 부분 -->
                        <div>${vote.typevalue}</div> <!-- 같은 div에 묶을 부분 -->
                    </c:if>
                    <c:if test="${vote.no ne prevNo}">
                        <div>${vote.typevalue}</div>
                        <c:if test="${vote.img != null}">
                            <img src="/resources/img/${vote.img}" style="width:50px;"/>
                        </c:if>
                        <div><fmt:formatDate value="${vote.vq.enddate}" pattern="yyyy-MM-dd"/></div>
                    </c:if>
                    <c:set var="prevNo" value="${vote.no}" />
                    <c:set var="prevTypeValue" value="${vote.typevalue}" />
                    <c:forEach begin="1" end="${vote.vq.typenum}" step="1">
                        <!-- 추가적인 로직 -->
                    </c:forEach>
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
    <button class="open-button" onclick="openForm()">
        <img src="/resources/img/write.png" style="width:50px; height:50px;">
    </button>

    <div class="chat-popup" id="myForm">
        <form action="/emp/member/votePro" method="post"class="form-container" enctype="multipart/form-data">
            <h1>투표 용지</h1>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <label for="msg"><b>제목</b></label>
            <input type="text" name="title" id="votingTitle" required/>
            <ol id="votingItems" style="list-decoration:none;">
                <li style="display:flex;">
               		<input style="flex:2;" name="typevalue" type="text" class="answer" placeholder="항목 입력" required/>
               		<label style="flex:1;" class="fileBtn" for="input-file">
					  업로드
					</label>
					<input name="votefile" type="file" id="input-file" style="display:none;"/> 
           		</li>
				<img id="uploadedImage" style="width: 20px; height: 20px;" />
            </ol>
            <input type="button" id="btn2" value="+ 항목 추가">
            종료날짜<input type="date" name="enddate"/>
            <input type="text" name="employeenum" value="<sec:authentication property="principal.dto.employeenum"/>">
            익명 아님<input type="radio" name="anonymous" value="0" checked="checked">
            익명<input type="radio" name="anonymous" value="1">
            <button type="submit" class="btn">Send</button>
            <button type="button" class="btn cancel" onclick="closeForm()">Close</button>
        </form>
    </div>
</div>

<script>
$(document).ready(function () {
    var votingTitle = $("#votingTitle");
    var votingItems = $("#votingItems");
    var inputFile = $("#input-file");
    var uploadedImage = $("#uploadedImage");

    function openForm() {
        document.getElementById("myForm").style.display = "block";
    }
    $("#btn2").click(function () {
        votingItems.append(" <li style='display:flex;'><input style='flex:2;' name='typevalue' type='text' class='answer' placeholder='항목 입력'/><label style='flex:1;' class='fileBtn' for='input-file'>업로드</label><input  name='votefile' type='file' id='input-file' style='display:none;'/> </li>"); 
    });


    function closeForm() {
        document.getElementById("myForm").style.display = "none";
        votingTitle.val("");
        votingItems.empty();
        votingItems.append("<li><input type='text' class='answer' name='typevalue' placeholder='항목 입력' required/></li>");
        // 업로드된 이미지 초기화
        uploadedImage.attr("src", "");
        // input 파일 선택 초기화
        inputFile.val("");
    }

    // 파일 선택 시 이미지 미리보기
    inputFile.change(function () {
        var file = this.files[0];
        if (file) {
            var reader = new FileReader();
            reader.onload = function (e) {
                uploadedImage.attr("src", e.target.result);
            };
            reader.readAsDataURL(file);
        }
    });

    $(".open-button").click(openForm);
    $(".cancel").click(closeForm);
});
</script>
<script src="/resources/libs/jquery/dist/jquery.min.js"></script>
<script src="/resources/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원탈퇴</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: #f8f9fa; 
        }

        .container {
            text-align: left;
            max-width: 600px;
            margin: auto;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); 
            border-radius: 8px;
        }

        #agree-checkbox {
            margin-bottom: 10px;
        }

        #withdraw-button {
            cursor: pointer;
            padding: 10px;
            background-color: #dc3545; 
            color: #fff;
            border: none;
            border-radius: 5px;
            width: 100%; 
        }

        #agreement-text {
            margin-bottom: 20px;
        }

        h2 {
            color: #dc3545;
        }

        p {
            margin-bottom: 10px;
        }

        label {
            display: block;
        }

        @media (max-width: 768px) {
            .container {
                max-width: 100%;
            }
        }
    </style>
</head>

<body>
    <div class="container">
        <div id="agreement-text">
            <h2>회원탈퇴 동의서</h2>
            <p>본인은 injoint 서비스를 더 이상 이용하지 않고자 회원탈퇴를 신청합니다. 회원탈퇴 시에는 아래의 내용을 숙지하였음을 확인합니다.</p>
            <p><strong>1. 개인 정보 처리 동의</strong></p>
            <p>1.1 회원탈퇴 시, 모든 개인 정보 및 관련 데이터가 삭제됩니다.</p>
            <p>1.2 회원탈퇴 후에는 복구가 불가능하며, 탈퇴된 계정은 영구적으로 소멸됩니다.</p>
            <p><strong>2. 법적 책임</strong></p>
            <p>2.1 회원탈퇴 후 발생하는 모든 법적 책임은 본인에게 있습니다.</p>
            <p>2.2 회원탈퇴 시에도 이용약관 및 관련 법령을 준수해야 합니다.</p>
            <p><strong>3. 기타 조항</strong></p>
            <p>3.1 추가적인 동의 사항이 있을 경우 별도로 안내됩니다.</p>
        </div>
		<div style="display: flex;">
        	<input type="checkbox" id="agree-checkbox">
        	<label for="agree-checkbox">위 내용에 동의합니다.</label>
		</div>
        <button id="withdraw-button" onclick="withdraw()">회원탈퇴</button>
    </div>

    <script>
        function withdraw() {
            var agreeCheckbox = document.getElementById("agree-checkbox");

            if (!agreeCheckbox.checked) {
                alert("회원탈퇴를 위해 동의 체크가 필요합니다.");
                agreeCheckbox.focus();
            } else {
                window.opener.changeParentLocation("/emp/memoutPro");
                window.close();
            }
        }
    </script>
</body>

</html>

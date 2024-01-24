<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>accessError</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

    <script>
        $(document).ready(function(){
            $('#myModal').modal('show');
        });

    </script>
</head>
<body>

<div id="myModal" class="modal fade" role="dialog" data-backdrop="static" data-keyboard="false">
  <div class="modal-dialog">

    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">접근 불가</h4>
      </div>
      <div class="modal-body">
        <p>접근 권한이 없습니다.</p>
      </div>
      <div class="modal-footer">
        <button type="button" id="confirmButton" class="btn btn-default">확인</button>
      </div>
    </div>

  </div>
</div>
	<script type="text/javascript">
	 $('#confirmButton').click(function() {
         window.location.href = "/emp/all";
     });
	</script>
</body>
</html>
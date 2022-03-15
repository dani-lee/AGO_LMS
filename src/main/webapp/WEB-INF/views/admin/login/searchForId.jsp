<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<head></head>
<title>관리자 아이디 찾기</title>

<body>



	<div class="col-md-6" style="max-width:450px;min-width:450px;">
		<div class="card">
			<div class="card-header" style="background-color:#6c757d;">
				<div class="card-title" style="color:white">관리자 아이디찾기</div>
			</div>
			<div class="card-body">
				
				<div class="form-group">
					<label for="squareInput">이메일</label> 
					<input type="text" class="form-control input-square" name="admin_email">
				</div>
				

			</div>
			<hr>
			<div class="row" style = "margin-left:20px; margin-right:20px;margin-bottom:20px;">
				<div>
				<button class="btn btn-primary" onclick = "searchForId();">아이디 찾기</button>
				</div>
				<div class="ml-auto">
				<button class="btn btn-default" onclick="WindowClose();">취소</button>
				</div>
			</div>
		</div>
	</div>
	
	
	
	
	
	
	
	
	
	
	
	
<script>
 function searchForId(){
	 var input_email = $('input[name="admin_email"]');
	 alert("관리자 아이디 : admin");
 }
</script>





















</body>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<head></head>
<title>운영자 아이디 찾기</title>

<body>

	<!-- 메인 헤더 -->
	<!-- Content Header (Page header) -->
	<div class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h4 class="m-0">운영자 아이디찾기</h4>
				</div>
				<!-- /.col -->
				<div class="col-sm-6"></div>
				<!-- /.col -->
			</div>
			<div>
			<hr>
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container-fluid -->
	</div>
	
	<!-- /.content-header -->

	<!-- 메인 바디 -->
	<!-- Main content -->
	<section class="content">
		<div class="container-fluid">

			<div class="col-md-6">
					<div class="form-group">
						<label for="squareInput">이메일</label>
						<input type="text" class="form-control input-square" name="manager_email">
					</div>


				</div>
				<hr>
				<div class="row" style="margin-left: 20px; margin-right: 20px; margin-bottom: 20px;">
					<div>
						<button type="button" class="btn btn-primary" onclick="searchForId();">아이디 찾기</button>
					</div>
					<div class="ml-auto">
						<button class="btn btn-default" onclick="WindowClose();">취소</button>
					</div>
				</div>
			</div>



		</div>
	</section>






	<script src="<%=request.getContextPath() %>/resources/js/login.js"></script>
<script>
 window.onload = function(){
	 var email = $('input[name="manager_email"]');
	 check_email_regx(email);
 }
 
 function searchForId(){
	 var input_email = $('input[name="manager_email"]');
	 if(!input_email.val()){
		 alert('이메일을 입력해주세요.');
		 return;
	 }else{
		 var email_regx = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		 if(!email_regx.test(input_email.val())){
			 alert("이메일 형식에 맞게 입력해주세요.");
			 return;
		 }
	 }
	 
	 $.ajax({
		 url : 'searchMnId?email='+input_email.val().trim(),
		 type : 'get',
		 success : function(result){
			 if(result == "MANAGER"){
				 alert("아이디는 'manager'입니다.");
			 }else{
				 alert("권한이 없습니다.");
			 }
		 },
		 error : function(error){
			 alert('시스템 문제로 인해 실행이 불가합니다.');
			 AjaxErrorSecurityRedirectHandler(error.status);
			 console.log(error)
		 }
	 })
 }
</script>





















</body>

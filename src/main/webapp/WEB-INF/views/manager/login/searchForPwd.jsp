<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head></head>
<title>운영자 비밀번호 찾기</title>
<body>
<script>
	if(${from eq 'reject'}){
		alert("아이디와 이메일이 틀렸습니다.");
		location.reload();
	}
</script>
	<!-- 메인 헤더 -->
	<!-- Content Header (Page header) -->
	<div class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h4 class="m-0">운영자 비밀번호 찾기</h4>
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
				<div class="card-body">
					<form role="searchForm" action="searchMnPwd" method="post">
						<div class="form-group">
							<label for="squareInput">운영자 아이디</label>
							<input type="text" class="form-control input-square" name="id" style="width: 340px;">
						</div>
						<div class="form-group">
							<label for="squareInput">이메일</label>
							<input type="text" class="form-control input-square" name="email" style="width: 340px;">
						</div>
					</form>
				</div>
				<hr>
				<div class="row" style="margin-left: 20px; margin-right: 20px; margin-bottom: 20px;">
					<button class="btn btn-primary" onclick="javascript:send_email();">비밀번호 찾기</button>
					<div class="ml-auto">
						<button class="btn btn-default" onclick="WindowClose();">취소</button>
					</div>
				</div>
			</div>
		</div>
	</section>



	<script>
 function send_email(){
	 var input_id = $('input[name="id"]');
	 var input_email = $('input[name="email"]');
	 
	 if(!input_id.val()){
		 alert("아이디를 입력해주세요.");
		 return;
	 }
	 if(!input_email.val()){
		 alert("이메일을 입력해주세요.");
		 return;
	 }

	 var form = $('form[role="searchForm"]');
	 form.submit();
	 
	 /* $.ajax({
		 url : 'searchMnPwd',
		 data : {'memId' : input_id,
			 	 'memEmail' : input_email},
		 type : 'get',
		 success : function(result){
			 if(result == "Pass"){
				 alert("해당 이메일로 정보를 발송했습니다.");
				 window.close();
				 
			 }else{
				 alert("아이디 혹은 이메일이 틀렸습니다.");
			 }
		 },
		 error : function(error){
			 alert("시스템 장애로 가입이 불가합니다. ");
			 AjaxErrorSecurityRedirectHandler(error.status);
			 console.log(error)
		 }
	 }) */

 }		
	
</script>
</body>

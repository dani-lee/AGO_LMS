<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<head>
</head>

<title>비밀번호 변경</title>

<body>
	<!-- 메인 헤더 -->
	<!-- Content Header (Page header) -->
	<div class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h4 class="m-0">비밀번호 변경</h4>
				</div>
				<!-- /.col -->
				<div class="col-sm-6"></div>
				<!-- /.col -->
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
				<form id="modifyPwdForm" role="form" action="modifyPwd.do" method="post">
					<div class="form-group" style="position: relative">
						<label for="squareInput">현재 비밀번호</label>
						<input type="password" id="now_pass" class="form-control input-square" name="pwd">
						<i class="far fa-eye float-right" id="seethrough3" onclick="javascript:see_through_pwd('now_pass','seethrough3');" 
						style="position: absolute; right:20px;top:45px;"></i>
					</div>
					<div class="form-group" style="position: relative">
						<label for="squareInput">새로운 비밀번호</label>
						<input type="password" id="new_pass" class="form-control input-square" name="newPwd">
						<i class="far fa-eye float-right" id="seethrough1" onclick="javascript:see_through_pwd('new_pass','seethrough1');" 
						style="position: absolute; right:20px;top:45px;"></i>
					</div>
					<div class="form-group">
						<label for="squareInput">새로운 비밀번호 확인</label>
						<input type="password" id="new_pass_check" class="form-control input-square"  name="newPwdCheck">
						<i class="far fa-eye float-right" id="seethrough2" onclick="javascript:see_through_pwd('new_pass_check','seethrough2');" 
						style="position: absolute; right:48px;top:235px;"></i>
					</div>
					<input type="hidden" name="key" id="keyvalue" value="">
				</form>
			</div>

				<hr>
				<div class="row" style="margin-left: 20px; margin-right: 20px; margin-bottom: 20px;">
					<div class="ml-auto">
						<button class="btn btn-primary" type="button" onclick="fn_modifyPwd();">변경하기</button>
						<!-- 				<button class="btn btn-default" onclick="window.close();">취소</button> -->
					</div>
				</div>


			</div>

		</div>
	</section>


<script src="<%=request.getContextPath() %>/resources/js/password.js"></script>
<script>
window.onload = function(){
	input_new_pwd = $('#new_pass');
	input_check_pwd = $('#new_pass_check');
	check_regx(input_new_pwd);
	pwd_check(input_new_pwd, input_check_pwd);
}

 function fn_modifyPwd(){
	 var pwdForm = $('#modifyPwdForm');
	 
	 var pass = pwdForm.find('input[name="pwd"]').val();
	 var newpass = pwdForm.find('input[name="newPwd"]').val();
	 var newpasscheck = pwdForm.find('input[name="newPwdCheck"]').val();
	 
	 if(!pass){
		 alert("현재 비밀번호를 입력해주세요.");
		 return;
	 }
	 if(!newpass){
		 alert("변경할 비밀번호를 입력해주세요.");
		 return;
	 }
	 if(!newpasscheck){
		 alert("확인을 위해 변경할 비밀번호를 한번 더 입력해주세요.");
		 return;
	 }
	 
	 var pwd_regx = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&*+=]).*$/;
	 if(!pwd_regx.test(newpass)){
		 alert("보안을 위해 비밀번호 형식에 맞게 입력해주세요.");
		 return;
	 }
	 if(newpass != newpasscheck){
		 alert("변경할 비밀본호가 일치하지않습니다.");
		 return;
	 }
	 var check = confirm("비밀번호를 변경하시겠습니까?");
	 
	 if(check){
		 $.ajax({
			 url : 'modifyPassword',
			 type : 'post',
			 data : {'memPwd' : pass,
				 	 'newPwd' : newpass },
			 success : function(result){
				 if(result == "fail"){
						alert("비밀번호가 일치하지 않습니다.");
				}else if(result == "pass"){
						alert("비밀번호가 변경 되었습니다.");
						window.close();
						window.opener.location.href="<%=request.getContextPath() %>/user/logout.do";
				}
			 },
			 error: function(error){
				 AjaxErrorSecurityRedirectHandler(error.status);
				 console.log(error);
			 }
		 })
	 }
	 
 }

</script>
</body>

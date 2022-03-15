<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<head>
<script src="<%=request.getContextPath() %>/resources/js/password.js"></script>
</head>

<title>비밀번호 찾기</title>

<body>
	<!-- 메인 헤더 -->
	<!-- Content Header (Page header) -->
	<div class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h4 class="m-0"></h4>
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
		<div class="mx-auto p-5 col-4 wrapper">
			<div class="card-header">
				<div class="card-title">비밀번호 찾기</div>
			</div>
			<div class="card-body">
				<form role="form" action="modifyPwd.do" method="post">
					<div class="form-group" style="position: relative">
						<label for="squareInput">새로운 비밀번호</label>
						<input type="password" id="newPwd" class="form-control input-square" name="newPwd">
						<i class="far fa-eye float-right" id="seethrough1" onclick="javascript:see_through_pwd('newPwd','seethrough1');" 
						style="position: absolute; right:20px;top:45px;"></i>
					</div>
					<div class="form-group">
						<label for="squareInput">새로운 비밀번호 확인</label>
						<input type="password" id="memPwd" class="form-control input-square"  name="memPwd">
						<i class="far fa-eye float-right" id="seethrough2" onclick="javascript:see_through_pwd('memPwd','seethrough2');" 
						style="position: absolute; right:88px;top:250px;"></i>
					</div>
					<input type="hidden" name="key" id="keyvalue" value="">
				</form>
			</div>
			<hr>
			<div class="row" style = "margin-left:20px; margin-right:20px;margin-bottom:20px;">
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
let param = location.search.substr(location.search.indexOf("?") + 1);
let key = param.substring(4);
	function fn_modifyPwd() {
		let newPwd = document.querySelector('#newPwd');
		let pwd = document.querySelector('#memPwd');
		
		

		if (!newPwd.value) {
			alert("비밀번호를 입력해주세요.");
		}
		if (!pwd.value) {
			alert("확인을 위해 새 비밀번호를 다시 입력해주세요.");
		} 
		
		if (newPwd.value != pwd.value) {
			alert("비밀번호가 일치하지 않습니다.");
			return;
		}else{
// 		 	if (document.cookie.split(';').some((item) => item.trim().startsWith('key='))) {
		 	if (document.cookie.indexOf(key) == 0) {
		 		document.querySelector('form[role="form"]').submit();
			}else {
				alert("설정 기간이 만료 되었습니다. 비밀번호 찾기를 재진행 해주세요.");
				return;
			}
		}
		

	}

	window.onload = function() {
		var input_newpwd = $('input[name="newPwd"]');
		var input_newpwd_check = $('input[name="memPwd"]');
		check_regx(input_newpwd);
		pwd_check(input_newpwd, input_newpwd_check);
		
		
		console.log(key)
		document.querySelector('#keyvalue').value = key;
		
		console.log(document.querySelector('#keyvalue').value);
		console.log(document.cookie.split(';').some((item) => item.trim().startsWith('key=')));
		console.log(document.cookie.indexOf(key));
		console.log(document.cookie);
	}
	
</script>
</body>

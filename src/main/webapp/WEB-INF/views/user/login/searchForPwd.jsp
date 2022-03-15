<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<head></head>
<title>비밀번호 찾기</title>
<body>
	<!-- 메인 헤더 -->
	<!-- Content Header (Page header) -->
	<div class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h4 class="m-0">비밀번호찾기</h4>
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
			<div class="card-body">
				<form role="form" action="searchPwd.do" method="post">
					<div class="form-group">
						<label for="squareInput">아이디</label>
						<input type="text" class="form-control input-square memId" name="memId">
					</div>
					<div class="form-group">
						<label for="squareInput">이름</label>
						<input type="text" class="form-control input-square memName" name="memName">
					</div>
					<div class="form-group">
						<label for="squareInput">생년월일</label>
						<div class="row" style="margin-left: 3px;">
							<select id="select_year" class="form-control form-control-sm input-square memBir" onchange="javascript:lastday();" name="memBir" style="width: 100px"></select>
							<span>&nbsp;년&nbsp;</span>
							<select id="select_month" class="form-control form-control-sm input-square memBir" onchange="javascript:lastday();" name="memBir" style="width: 100px"></select>
							<span>&nbsp;월&nbsp;</span>
							<select id="select_day" class="form-control form-control-sm input-square memBir" name="memBir" style="width: 100px"></select>
							<span>&nbsp;일&nbsp;</span>
						</div>
					</div>
				</form>
			</div>
			<hr>
			<div class="row" style="margin-left: 20px; margin-right: 20px; margin-bottom: 20px;">
				<button class="btn btn-primary" type="button" onclick="send_email();">비밀번호 찾기</button>
				<div class="ml-auto">
					<button class="btn btn-default" type="button" onclick="window.close();">취소</button>
				</div>
			</div>
		</div>
	</section>
	<script>
	var start_year = "1900";// 시작할 년도 
	var today = new Date();
	var today_year = today.getFullYear();
	var index = 0;
	for (var y = start_year; y <= today_year; y++) { //start_year ~ 현재 년도 
		document.getElementById('select_year').options[index] = new Option(y, y);
		index++;
	}

	index = 0;
	for (var m = 1; m <= 12; m++) {
		document.getElementById('select_month').options[index] = new Option(m, m);
		index++;
	}
	lastday();
	function lastday() { //년과 월에 따라 마지막 일 구하기 
		var Year = document.getElementById('select_year').value;
		var Month = document.getElementById('select_month').value;
		var day = new Date(new Date(Year, Month, 1) - 86400000).getDate();
		/* = new Date(new Date(Year,Month,0)).getDate(); */
		var dayindex_len = document.getElementById('select_day').length;
		if (day > dayindex_len) {
			for (var i = (dayindex_len + 1); i <= day; i++) {
				document.getElementById('select_day').options[i - 1] = new Option(i, i);
			}
		} else if (day < dayindex_len) {
			for (var i = dayindex_len; i >= day; i--) {
				document.getElementById('select_day').options[i] = null;
			}
		}
	}

	function send_email() {
		let inputId = document.querySelector('.memId');
		let inputName = document.querySelector('.memName');
		let inputBir = document.querySelectorAll('.memBir');
		
		if(!inputId.value){
			alert("아이디를 입력해주세요");
		}
		if(!inputName.value){
			alert("이름을 입력해주세요");
		}
		
		//alert("해당 이메일로 아이디 정보를 발송하였습니다.");
		document.querySelector('form[role="form"]').submit();
		
	}
</script>
<script>
if(${chk eq 'true'}){
	alert('${message}');
	window.close();
}
if(${chk eq 'false'}){
	alert('${message}');
}
</script>
</body>

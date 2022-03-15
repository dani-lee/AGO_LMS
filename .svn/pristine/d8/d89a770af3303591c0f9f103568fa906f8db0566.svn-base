<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<head></head>

<title>아이디 찾기</title>

<body>
	<!-- 메인 헤더 -->
	<!-- Content Header (Page header) -->
	<div class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h4 class="m-0">아이디찾기</h4>
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
					<form role="form" action="searchId.do" method="post">
						<div class="form-group">
							<label for="squareInput">이름</label>
							<input type="text" class="form-control form-control-sm input-square memName" name="memName">
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
						<div class="form-group">
							<label for="squareInput">이메일</label>
							<div class="d-block d-flex">
								<input type="text" class="form-control form-control-sm col-6 memEmail" id="memEmail" name="memEmail">
								<p class="h6 mt-1">&nbsp;@ &nbsp;</p>
								<select class="form-control form-control-sm col-5 memEmail" name="memEmail">
									<option value="x">직접입력</option>
									<option value="naver.com">naver.com</option>
									<option value="gmail.com">gmail.com</option>
									<option value="hanmail.net">hanmail.net</option>
									<option value="nate.com">nate.com</option>
								</select>
							</div>
						</div>
					</form>
				</div>

				<hr>
				<div class="row" style="margin-left: 20px; margin-right: 20px; margin-bottom: 20px;">
					<div>
						<button class="btn btn-primary" onclick="searchForId();">아이디 찾기</button>
					</div>
					<div class="ml-auto">
						<button class="btn btn-default" onclick="window.close();">취소</button>
					</div>
				</div>
			</div>

		</div>
	</section>


	<script src="<%=request.getContextPath()%>/resources/js/login.js"></script>
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

	function searchForId() {
		let inputName = document.querySelector('.memName');
		let inputBir = document.querySelectorAll('.memBir');
		let inputMail = document.querySelectorAll('.memEmail');
		
		if(!inputName.value){
			alert("이름을 입력해주세요");
		}
		
		if(!inputMail[0].value){
			alert("이메일을 입력해주세요.")
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

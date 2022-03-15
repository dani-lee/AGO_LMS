<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<head>
<link rel="icon" href="<%=request.getContextPath()%>/resources/img/pavicon.png">
</head>

<title>관리자 로그인</title>

<body>

	<div class="container-fluid col-12 mx-auto d-flex align-items-center">
		<div class="float-left col-7 d-flex justify-content-center align-items-center" style="background-color: #f4f7fd; height: 840px;">
			<div class="inner mx-auto">
				<p class="font-weight-bold text-center">
					Constant learning not only <br>makes you knowledgeable, <br>but also a better person
				</p>
				<img src="<%=request.getContextPath()%>/resources/img/login3.png" style="width: 400px;" class="mx-auto">
			</div>
		</div>
		<div class="float-right col-5">
			<div class="inner col-10 mx-auto">
				<img src="<%=request.getContextPath()%>/resources/img/logo.png" style="width: 180px;" class="mx-auto">
				<form action="<%=request.getContextPath()%>/manager/emailCheck" method="post">
					<div class="form-group">
				<p class="ml-2 h6 font-weight-bold">관리자 로그인</p>
						<!-- 						<label for="squareInput">아이디</label> -->
						<input type="text" class="form-control input-square" name="manager_email" placeholder="이메일">
					</div>

					<div class="form-group">
						<!-- 						<label for="squareInput">비밀번호</label> -->
						<input type="password" id="manager_pass" class="form-control input-square" name="manager_pwd" placeholder="비밀번호">
						<i class="far fa-eye float-right" id="seethrough" onclick="javascript:see_through_pwd('manager_pass','seethrough');" style="position: absolute; right: 45px; bottom:175px;"></i>
					</div>
					<div class="card-action">
						<div class="form-group ml-2">
							<div class="form-check">
								<input class="form-check-input" type="checkbox">
								<label class="form-check-label">아이디 기억하기</label>
							</div>
						</div>
						<button class="btn btn-lg btn-secondary btn-block col-12 ml-1">로그인</button>
						<div class="row" style="margin-top: 10px; margin-left: 0px;">
							<div class="col-5 mr-1">&nbsp;</div>
							<a href="./searchForId.pop" onclick="OpenWindow(this.href, '아이디 찾기', '800', '600'); return false;">아이디 찾기</a>
							&nbsp;&nbsp;/&nbsp;&nbsp;
							<a href="./searchForPwd.pop" onclick="OpenWindow(this.href, '비밀번호 찾기', '800', '600'); return false;">비밀번호 찾기</a>
						</div>
						<div class="ml-3">
							사용자로 로그인 하시겠습니까?<a href="<%=request.getContextPath() %>/user/loginPage.pop">&nbsp;사용자로 로그인하기</a>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>


<script src="<%=request.getContextPath() %>/resources/js/password.js"></script>
</body>

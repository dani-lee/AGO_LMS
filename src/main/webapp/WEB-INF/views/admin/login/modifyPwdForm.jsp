<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/plugins/fontawesome-free/css/all.min.css">
  <!-- icheck bootstrap -->
  <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/dist/css/adminlte.min.css">
</head>
<title>관리자 비밀번호 찾기</title>
<body class="hold-transition login-page">
<div class="login-box">
  <div class="card card-outline card-primary">
    <div class="card-header text-center">
      <a href="../resources/index2.html" class="h1"><b>AGO</b><span class="h3">Admin</span></a>
    </div>
    <div class="card-body">
      <p class="login-box-msg">새 비밀번호와 비밀번호 확인을 입력해주세요.</p>
      <form action="modifyPwd.do" method="post">
        <div class="input-group mb-3">
          <input type="password" class="form-control" name="pwd" placeholder="새로운 비밀번호">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <input type="password" class="form-control" name="new_pwd" placeholder="새로운 비밀번호 확인">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-12">
            <button type="button" onclick="updatePwd()" class="btn btn-primary btn-block">비밀번호 변경</button>
          </div>
          <!-- /.col -->
        </div>
          <input type="hidden" name="key" id="keyvalue" value="">
      </form>

      <p class="mt-3 mb-1">
        <a href="login.html">로그인</a>
      </p>
    </div>
    <!-- /.login-card-body -->
  </div>

</div>
	<!-- jQuery -->
<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="<%=request.getContextPath()%>/resources/bootstrap/dist/js/adminlte.min.js"></script>

<script src="<%=request.getContextPath() %>/resources/js/password.js"></script>
<script>

let param = location.search.substr(location.search.indexOf("?") + 1);
let key = param.substring(4);
	window.onload = function() {
		var input_pwd = $('input[name="pwd"]');
		var input_newpwd = $('input[name="new_pwd"]');
		check_regx(input_pwd);
		pwd_check(input_pwd, input_newpwd);

		document.querySelector('#keyvalue').value = key;

	}

	function updatePwd() {
		var pwd = $('input[name=pwd]').val();
		var new_pwd = $('input[name=new_pwd]').val();
		console.log(pwd)
		if (!pwd) {
			alert("비밀번호를 입력해주세요.");
		}
		else if (!new_pwd) {
			alert("비밀번호 확인에 비밀번호를 입력해주세요.");
		}else{
			if($('input[name=pwd]').css("border") == "1px solid rgb(0, 128, 0)"){
				form = $('form');
				if(pwd == new_pwd){
					form.submit();
				}else{
					alert("비밀번호가 일치하지 않습니다.")
				}
			}else{
				alert("비밀번호 정규식(특수문자, 문자, 숫자 포함 8~15글자)에 맞지 않습니다 다시 확인해 주세요.")
			}
			
		} 

	}
	
</script>
</body>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
</head>

<title>사용자 회원가입</title>

<body>


<div class="mx-auto p-5 col-md-6 wrapper">
		<div class="card" style="max-width:500px;min-width:500px;">
			<div class="card-header">
				<div class="card-title">회원가입</div>
			</div>
			<div class="card-body">
			<form role="joinForm" action="joinMember" method="post">
				<input type="hidden" name="authorityId" value="${member.authorityId }">
				<div class="form-group">
					<label for="squareInput">아이디</label> 
					<div class="row" style="margin-left:0px;">
					<input type="text" class="form-control input-square" name="memId"
						placeholder="4~20자의 영소문자/숫자"  style="width:368px;">
					<button type="button" class="btn btn-primary btn-sm" onclick = "confirm_id();">중복 확인</button>
					</div>
				</div>
				<div class="form-group">
					<label for="squareInput">이름</label> <input type="text"
						class="form-control input-square" name="memName"
						readonly="readonly" value="${member.memName }">
				</div>
				<div class="form-group">
					<label for="squareInput">생년월일</label> <input type="text"
						class="form-control input-square" name="memBir"
						readonly="readonly" value='<fmt:formatDate value="${member.memBir }" pattern="yyyy/MM/dd" />'>
				</div>
				<div class="form-group">
					<label for="squareInput">비밀번호<span style="font-size:9pt;color:red;">(8~15자 영문,숫자,특수기호(!,@,#,$,%,^,&,*,=,+가능) 1개 이상 포함 )</span></label> <input type="password"
						class="form-control input-square" id="user_pwd" name="memPwd">
						<i class="far fa-eye float-right" id="seethrough1" onclick="javascript:see_through_pwd('user_pwd','seethrough1');" 
						style="position:absolute;left:440px;top:373px;"></i>
				</div>
				<div class="form-group">
					<label for="squareInput">비밀번호 확인</label> <input type="password"
						class="form-control input-square" id="user_pwd_check" name="user_pwd_check">
						<i class="far fa-eye float-right" id="seethrough2" onclick="javascript:see_through_pwd('user_pwd_check','seethrough2');" 
						style="position:absolute;left:440px;top:457px;"></i>
				</div>
				<div class="form-group">
					<label for="squareInput">부서</label>
					 
					<c:if test="${member.dpId eq 'DP101'}">
					<input type="text"class="form-control input-square" 
					name="user_dept" readonly="readonly" value="총무부">
					</c:if>
					<c:if test="${member.dpId eq 'DP102'}">
					<input type="text"class="form-control input-square" 
					name="user_dept" readonly="readonly" value="경리부">
					</c:if>
					<c:if test="${member.dpId eq 'DP103'}">
					<input type="text"class="form-control input-square" 
					name="user_dept" readonly="readonly" value="구매자재부">
					</c:if>
					<c:if test="${member.dpId eq 'DP104'}">
					<input type="text"class="form-control input-square" 
					name="user_dept" readonly="readonly" value="품질관리부">
					</c:if>
					<c:if test="${member.dpId eq 'DP105'}">
					<input type="text"class="form-control input-square" 
					name="user_dept" readonly="readonly" value="생산1팀">
					</c:if>
					<c:if test="${member.dpId eq 'DP106'}">
					<input type="text"class="form-control input-square" 
					name="user_dept" readonly="readonly" value="생산2팀">
					</c:if>
					<c:if test="${member.dpId eq 'DP107'}">
					<input type="text"class="form-control input-square" 
					name="user_dept" readonly="readonly" value="상품관리부">
					</c:if>
					<c:if test="${member.dpId eq 'DP108'}">
					<input type="text"class="form-control input-square" 
					name="user_dept" readonly="readonly" value="기술부">
					</c:if>
					<c:if test="${member.dpId eq 'DP109'}">
					<input type="text"class="form-control input-square" 
					name="user_dept" readonly="readonly" value="해외영업부">
					</c:if>
					<c:if test="${member.dpId eq 'DP110'}">
					<input type="text"class="form-control input-square" 
					name="user_dept" readonly="readonly" value="국내영업부">
					</c:if>
					<c:if test="${member.dpId eq 'DP111'}">
					<input type="text"class="form-control input-square" 
					name="user_dept" readonly="readonly" value="고객관리부">
					</c:if>
					<c:if test="${member.dpId eq 'DP112'}">
					<input type="text"class="form-control input-square" 
					name="user_dept" readonly="readonly" value="개발부">
					</c:if>
					<c:if test="${member.dpId eq 'DP113'}">
					<input type="text"class="form-control input-square" 
					name="user_dept" readonly="readonly" value="부설연구소">
					</c:if>
					
					
				</div>
				<div class="form-group">
					<label for="squareInput">직위</label> 
					<c:if test = "${member.positionId eq 'PS101' }">
					<input type="text" class="form-control input-square" 
					name="user_post" readonly="readonly" value="사원">
					</c:if>
					<c:if test = "${member.positionId eq 'PS102' }">
					<input type="text" class="form-control input-square" 
					name="user_post" readonly="readonly" value="주임">
					</c:if>
					<c:if test = "${member.positionId eq 'PS103' }">
					<input type="text" class="form-control input-square" 
					name="user_post" readonly="readonly" value="대리">
					</c:if>
					<c:if test = "${member.positionId eq 'PS104' }">
					<input type="text" class="form-control input-square" 
					name="user_post" readonly="readonly" value="과장">
					</c:if>
					<c:if test = "${member.positionId eq 'PS105' }">
					<input type="text" class="form-control input-square" 
					name="user_post" readonly="readonly" value="차장">
					</c:if>
					<c:if test = "${member.positionId eq 'PS106' }">
					<input type="text" class="form-control input-square" 
					name="user_post" readonly="readonly" value="부장">
					</c:if>
					<c:if test = "${member.positionId eq 'PS107' }">
					<input type="text" class="form-control input-square" 
					name="user_post" readonly="readonly" value="이사">
					</c:if>
					<c:if test = "${member.positionId eq 'PS108' }">
					<input type="text" class="form-control input-square" 
					name="user_post" readonly="readonly" value="상무">
					</c:if>
					<c:if test = "${member.positionId eq 'PS109' }">
					<input type="text" class="form-control input-square" 
					name="user_post" readonly="readonly" value="대표">
					</c:if>
					
				</div>
				<div class="form-group">
					<label for="squareInput">이메일</label> <input type="text"
						class="form-control input-square" name="memEmail"
						readonly="readonly" value="${member.memEmail }">
				</div>
				<div class="form-group">
					<label for="squareInput">전화번호</label> <input type="text"
						class="form-control input-square" name="memPhone"
						readonly="readonly" value="${member.memPhone }">
				</div>
				</form>
			</div>
			<hr>
			<div class="row" style = "margin-left:20px; margin-right:20px;margin-bottom:20px;">
				<div >
				<button type="button" class="btn btn-primary" onclick="user_join();">가입하기</button>
				</div>
				<div class="ml-auto">
				<button class="btn btn-default">취소</button>
				</div>
			</div>
		</div>
	</div>		


<script src="<%=request.getContextPath() %>/resources/js/password.js"></script>
<script>
window.onload = function(){
	var input_pwd = $('input[name="memPwd"]');
	var input_pwd_check = $('input[name="user_pwd_check"]');
	var input_id = $('input[name="memId"]');
	id_regx_check(input_id);
	check_regx(input_pwd);
	pwd_check(input_pwd, input_pwd_check);
	
	
}
var confirmedId = "";
function confirm_id(){
	var input_Id = $('input[name="memId"]');
	
	if(!input_Id.val()){
		alert('아이디를 입력해주세요.');
		input_Id.focus();
		return;
	}else{
		var id_regx = /^[a-z0-9_-]{4,20}$/;
		if(!id_regx.test(input_Id.val())){
			alert("아이디는 4~20자 영소문자/숫자만 가능합니다. ");
			return;
		}
	}
	
	$.ajax({
		url:'confirmId?confirmId='+input_Id.val().trim(),
		type: 'get',
		success: function(result){
			if(result == "duplicated"){
				alert("이미 사용 중인 아이디입니다.");
			}else{
				alert("사용 가능한 아이디입니다.");
				confirmedId = input_Id.val().trim();
				input_Id.val(confirmedId);
			}
		},
		error: function(error){
			alert("시스템 문제로 가입이 불가능합니다.");
		}
	})
}

function id_regx_check(input_id){
	var id_regx = /^[a-z0-9_-]{4,20}$/;
		/* /^[a-z]+[a-z0-9]{5,19}$/g; */
	input_id.on('keyup',function(){
		if(!id_regx.test(input_id.val())){
			input_id.css("border", "1px solid red");
		}else{
			input_id.css("border","1px solid green");
		}
	})
}



 function user_join(){
	 if(!$('input[name="memId"]').val()){
		 alert('아이디를 입력해주세요.');
		 return;
	 }
	 if($('input[name="memId"]').val() != confirmedId){
		 alert('아이디 중복을 확인해주세요.');
		 return;
	 }
	 if(!$('input[name="memPwd"]').val()){
		 alert('비밀번호를 입력해주세요.');
		 return;
	 }
	 var pwd_regx = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&*+=]).*$/;
	 var input_pw = $('input[name="memPwd"]');
	 if(!pwd_regx.test(input_pw.val())){
		 alert('비밀번호는 8~15자 영문,숫자,특수기호(!,@,#,$,%,^,&,*,=,+가능) 1개 이상 포함하여 주세요.');
		 return;
	 }
	 
	 if(!$('input[name="user_pwd_check"]').val()){
		 alert('비밀번호 확인을 위해 입력해주세요.');
		 return;
	 }
	 
	 if($('input[name="user_pwd_check"]').val() != $('input[name="memPwd"]').val()){
		 alert('비밀번호가 일치하지않습니다. 확인 후 입력해주세요.');
		 return;
	 }
	 var form = $('form[role="joinForm"]');
	 form.submit(); 
 }
</script>	

				
</body>
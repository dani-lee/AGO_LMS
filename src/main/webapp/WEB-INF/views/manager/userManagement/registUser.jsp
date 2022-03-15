<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head></head>

<title>회원등록</title>
<body>
	<!-- 메인 헤더 -->
	<!-- Content Header (Page header) -->
	<div class="content-header">
		<div class="container-fluid">
		<form role="form" action="regist.do" method="post">
		<table class="form-group col-11 table mx-auto mt-5">
					<tr  style="background-color: #F5F4F4;">
						<th class="align-middle text-center">
							회원 등록
						</th>
						<th colspan="3">
							<button type="button" class="btn btn-default btn-sm float-right ml-2" onclick="window.close()">취소</button>
							<button type="button" class="btn btn-secondary btn-sm float-right" onclick="fn_check()">등록</button>				
						</th>
					</tr>
					<tr>
						<td class="text-center col-3" style="background-color: #F5F4F4;">이름</td>
						<td class="p-1"><input type="text" class="form-control  border-0 " id="memName" name="memName" placeholder="예시) 홍길동"></td>
						<td class="text-center col-3" style="background-color: #F5F4F4;">상태</td>
						<td class="py-1">
							<select class="form-control form-control-sm border-0 mt-1" id="memStatus" name="memStatus">
								<option value="A401">정상</option>
								<option value="A402">정지</option>
								<option value="A403">퇴사</option>
							</select>
						</td>
					</tr>
					<tr>
						<td class="text-center col-3" style="background-color: #F5F4F4;">생년월일</td>
						<td class="p-1 align-middle col-3"><input type="date" class="form-control border-0" id="memBir" name="memBir"></td>
						<td class="text-center col-3" style="background-color: #F5F4F4;">권한</td>
						<td class="p-1 align-middle">
							<select class="form-control form-control-sm border-0" id="authorityId" name="authorityId">
								<option value="A101">사용자</option>
								<option value="A102">부서장</option>
							</select>
						</td>
					</tr>
					<tr>
						<td class="text-center col-3" style="background-color: #F5F4F4;">이메일</td>
						<td colspan="3" class="p-1 align-middle"><input type="text" class="form-control form-control-sm border-0" id="memEmail" name="memEmail" placeholder="예시)&nbsp;ago20210705@gamil.com..."></td>
					</tr>
					<tr>
						<td class="text-center col-3" style="background-color: #F5F4F4;">전화번호</td>
						<td class="p-1 align-middle" colspan="3">
							<div class="row ml-2">
								<select class="form-control form-control-sm col-3 memPhone" id="memPhone" name="memPhone">
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="019">019</option>
								</select>
								<p class="h6 mt-1">&nbsp; - &nbsp;</p>
								<input type="number" class="form-control form-control-sm col-3 memPhone" id="memPhone1" name="memPhone">
								<p class="h6 mt-1">&nbsp; - &nbsp;</p>
								<input type="number" class="form-control form-control-sm col-3 memPhone" id="memPhone2" name="memPhone">
							</div>
							
						</td>
						
					</tr>
					<tr>
						<td class="text-center col-3" style="background-color: #F5F4F4;">부서</td>
						<td class="p-1 align-middle">
							<select class="form-control form-control-sm border-0" id="dpId" name="dpId">
								<c:forEach items="${ dpList }" var="dp">
									<option value="${dp.commonCode }">${dp.codeName1 }</option>
								</c:forEach>
							</select>
						</td>
						<td class="text-center col-3" style="background-color: #F5F4F4;">직위</td>
						<td class="p-1 align-middle">
							<select class="form-control form-control-sm border-0" id="positionId" name="positionId">
								<c:forEach items="${psList }" var="ps">
									<option value="${ps.commonCode }">${ps.codeName1 }</option>
								</c:forEach>
							</select>
						</td>
					</tr>

				</table>
			<!-- /.row -->
			</form>
		</div>
		<!-- /.container-fluid -->
	</div>
	<!-- /.content-header -->

	<!-- 메인 바디 -->
	<!-- Main content -->
	
	
<script>
function fn_check(){
	let inputName = document.querySelector('#memName');
	let inputBir = document.querySelector('#memBir');
	let inputEmail = document.querySelector('#memEmail');
	let inputPhone = document.querySelectorAll('.memPhone');
	let inputDp = document.querySelector('#dpId');
	let inputPs = document.querySelector('#positionId');
	let inputAuth = document.querySelector('#authorityId');
	let inputStatus = document.querySelector('#memStatus');
	
	
	if(!inputName.value){
		alert("이름을 입력해주세요");
		return;
	}
	
	if(!inputBir.value){
		alert("생년월일을 입력해주세요")
		return;
	}
	
	if(!inputEmail.value){
		alert("이메일을 입력해주세요")
		return;
	}
	
	if(!inputPhone[1].value || !inputPhone[2].value){
		alert("휴대폰번호를 입력해주세요")
		return;
	}
	
	if(inputPhone[1].length < 3 && inputPhone[1].length > 4){
		alert("휴대폰번호를 확인해주세요")
		return;
	}
	
	if(inputPhone[2].length < 3 && inputPhone[2].length > 4){
		alert("휴대폰번호를 확인해주세요")
		return;
	}
	
	if(confirm("등록하시겠습니까?")){
		document.querySelector("form[role=form]").submit();
	}
	
}
</script>
</body>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<c:set var="member" value="${dataMap.member}" />
<c:set var="departmentList" value="${dataMap.departmentList}" />
<c:set var="positionList" value="${dataMap.positionList}" />
<c:set var="authorityList" value="${dataMap.authorityList}" />


<head></head>

<title>회원등록</title>
<body>
	<!-- 메인 헤더 -->
	<!-- Content Header (Page header) -->


	<!-- 메인 바디 -->
	<!-- Main content -->
	<section class="content">
		<div class="container-fluid">
				<table class="form-group col-7 table mx-auto mt-5">
					<tr  style="background-color: #F5F4F4;">
						<th class="align-middle text-center">
							퇴사자 수정
						</th>
						<th colspan="3">
							<button type="button" class="btn btn-default btn-sm float-right ml-2" onclick="window.close()">취소</button>
							<button type="button" class="btn btn-secondary btn-sm float-right" onclick="fn_modify();">변경</button>					
						</th>
					</tr>
					<tr>
						<td class="text-center col-3" style="background-color: #F5F4F4;">이름</td>
						<td>${member.memName }</td>
						<td class="text-center col-3 text-danger" style="background-color: #F5F4F4;">상태</td>
						<td class="py-1">
							<select class="form-control form-control-sm border-0 mt-1" name="memStatus" >
								<option value="A401" ${member.memStatus eq 'A401' ? 'selected':'' }>정상</option>
								<option value="A402" ${member.memStatus eq 'A402' ? 'selected':'' }>정지</option>
								<option value="A403" ${member.memStatus eq 'A403' ? 'selected':'' }>퇴사</option>
							
							</select>
						</td>
					</tr>
					<tr>
						<td class="text-center col-3" style="background-color: #F5F4F4;">생년월일</td>
						<td colspan="3"><fmt:formatDate value="${member.memBir }" pattern="yyyy-MM-dd" /></td>
					</tr>
					<tr>
						<td class="text-center col-3" style="background-color: #F5F4F4;">이메일</td>
						<td colspan="3"><span id="memEmail">${member.memEmail}</span></td>
					</tr>
					<tr>
						<td class="text-center col-3" style="background-color: #F5F4F4;">전화번호</td>
						<td class="col-3">${member.memPhone}</td>
						<td class="text-center col-3" style="background-color: #F5F4F4;">권한</td>
						<td>
							<c:forEach items="${authorityList }" var="authority">
								<c:if test="${authority.commonCode eq member.authorityId }">
									${authority.codeName1 }
								</c:if>
							</c:forEach>
						</td>
					</tr>
					<tr>
						<td class="text-center col-3" style="background-color: #F5F4F4;">부서</td>
						<td>
							<c:forEach items="${departmentList }" var="department">
								<c:if test="${department.commonCode eq member.dpId}">
									${ department.codeName1}
								</c:if>
							</c:forEach>
						</td>
						<td class="text-center col-3" style="background-color: #F5F4F4;">직위</td>
						<td>
							<c:forEach items="${positionList }" var="position">
								<c:if test="${position.commonCode eq member.positionId}">
									${position.codeName1}
								</c:if>
							</c:forEach>
						</td>
					</tr>

				</table>
		</div>
	</section>
	
<script>
 function fn_modify(){
	 var check = confirm("상태를 변경하시겠습니까?");
	 if(check){
		 var memStatus = $('select[name="memStatus"]').val();
		 var memEmail = $('#memEmail').text();
		 console.log(memEmail);
		 $.ajax({
			 url : 'modifyStatus',
			 data : {'memStatus':memStatus,
				 	'memEmail' : memEmail},
			 type : 'post',
			 success : function(result){
				 if(result){
					 alert("변경되었습니다.");
					 window.opener.location.reload();
					 window.close();
					 
				 }
			 },
			 error : function(error){
				 AjaxErrorSecurityRedirectHandler(error.status);
	             console.log(error.status);
			 }
		 })
	 }
 }
</script>
</body>


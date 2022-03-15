<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${pageMaker.cri }" />
<c:set var="popupList" value="${dataMap.popupList }" />
<head></head>

<title></title>

<body>
	<!-- 메인 헤더 -->
	<!-- Content Header (Page header) -->
	<div class="content-header pb-0">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h4 class="m-0">팝업관리</h4>
				</div>
				<!-- /.col -->
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item">
							<i class="fas fa-home"></i>
						</li>
						<li class="breadcrumb-item">
							<a href="<%=request.getContextPath() %>/manager/managementSite/logo.do">사이트관리</a>
						</li>
						<li class="breadcrumb-item active">팝업관리</li>
					</ol>
				</div>
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

			<div class="insert-button">
				<div class="col-1 insert-button float-right pb-2 pr-0">
					<button class="btn btn-secondary btn-sm" onclick="location.href='registForm.do'">팝업등록</button>
				</div>
			</div>
			<div style="min-height:600px;">
			<table class="table table-hover table-sm">
				<thead>
					<tr class="text-center" style="background-color: #F5F4F4;">
						<th scope="col">번호</th>
						<th scope="col">제목</th>
						<th scope="col">게시기간</th>
<!-- 						<th scope="col">등록날짜</th> -->
						<th scope="col">기능</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty popupList }">
						<tr>
							<td colspan="5" class="text-center"><strong>해당 내용이 없습니다.</strong></td>
						</tr>
					</c:if>
					<c:forEach items="${popupList }" var="popup">
						<tr>
							<td class="text-center">${popup.popNo }</td>
							<td style="cursor: pointer;">${popup.popTitle }</td>
							<td class="text-center"><fmt:formatDate value="${popup.popSdate }" pattern="yyyy-MM-dd" /> ~ <fmt:formatDate value="${popup.popEdate }" pattern="yyyy-MM-dd" /> </td>
<!-- 							<td class="text-center"> </td> -->
							<td class="text-center">
								<div class="mx-auto d-block">
									<button type="button" class="btn btn-primary btn-sm" onclick="location.href='modifyForm.do?popNo=${popup.popNo}'">수정</button>
									<button type="button" class="btn btn-default btn-sm" onclick="fn_remove();">삭제</button>
								</div>
							</td>
						</tr>
						<form role="form">
							<input type="hidden" name="popNo" value="${popup.popNo }" />
						</form>
					</c:forEach>
				</tbody>
			</table>
			</div>
			<div class="card-body text-right">
				<%@include file="/WEB-INF/views/common/pagination.jsp"%>
			</div>
		</div>
	</section>
	
<script>

if(${from eq "modify"}){
	alert("수정되었습니다.");
	window.location.reload();
}

if(${from eq "remove"}){
	alert("삭제되었습니다.");
	window.location.reload();
}

function fn_remove(){
	let form = document.querySelector('form[role="form"]');
	let check = confirm("정말 삭제하시겠습니까?");
	if(check){

		form.setAttribute("action", "remove.do");
		form.setAttribute("method", "post");

		form.submit();
	}
}
</script>
</body>

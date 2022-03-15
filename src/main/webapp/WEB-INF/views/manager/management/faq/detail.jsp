<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head></head>

<title></title>
<body>

		<!-- 메인 헤더 -->
		<!-- Content Header (Page header) -->
		<div class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h1 class="m-0">자주 묻는 질문</h1>
					</div>
					<!-- /.col -->
					<div class="col-sm-6">
						<ol class="nav float-sm-right">
							<li class="nav-item">
								<button class="btn btn-primary float-right" onclick="location.href='modifyForm.do?faqNo=${ faq.faqNo }';">수정</button>
							</li>&nbsp;
							<li class="nav-item">
								<button class="btn btn-default float-right" onclick="fn_remove(${ faq.faqNo }); " >삭제</button>
							</li>
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
				<div class="card">
					<div class="card-header p-0">
						<table id="maincontent" class="table border-bottom mb-0">
							<tr>
								<td scope="col" class="w-30 font-weight-bold text-center" style="background-color: #F5F4F4;">글 번호</td>
								<td scope="col" class="w-25 pl-4">${ faq.faqNo }</td>
								<td scope="col" class="w-25 font-weight-bold text-center" style="background-color: #F5F4F4;">문의 분류</td>
								<td scope="col" class="w-25 pl-4"><c:if test="${ faq.askSort eq 'c' }">
										수료 문의
									</c:if> <c:if test="${ faq.askSort eq 'l' }">
										학습 문의
									</c:if> <c:if test="${ faq.askSort eq 'e' }">
										기타
									</c:if></td>
							</tr>
							<tr>
								<td scope="col" class="w-25 font-weight-bold text-center" style="background-color: #F5F4F4;">제목</td>
								<td colspan="3" scope="col" class="pl-4">${ faq.faqQuestion }</td>
							</tr>
						</table>
					</div>
					<div class="card-body" style ="min-height:500px;">${ faq.faqAnswer }</div>
					<div class="card-footer">
						<button class="btn btn-primary float-right" onclick="location.href='list.do'">
							<i class="la la-angle-double-left"></i>
							목록
						</button>
					</div>
				</div>
			</div>
		</section>

<script>
function fn_remove(faqNo){
	if(confirm("삭제하시겠습니까?")){
		location.href='remove.do?faqNo='+faqNo;
	}
}
</script>
</body>

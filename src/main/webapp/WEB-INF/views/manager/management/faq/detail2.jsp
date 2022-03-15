<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<head></head>

<title></title>

<body>
	<!-- 메인 바디 -->
	<!-- Main content -->
	<section class="content">
		<div class="container-fluid">
			<div class="col-md-12">
				<!-- Box Comment -->
				<div class="card-widget">
					<div class="card-header row">
						<div class="user-block col-12">
							<div class="row mb-2">
								<div class="col-sm-6">
									<p class="text-secondary">자주묻는질문</p>
								</div>
								<div class="col-sm-6">
									<ol class="breadcrumb float-sm-right m-0 p-0" style="background-color : white;">
										<li class="breadcrumb-item">
											<i class="fas fa-home"></i>
										</li>
										<li class="breadcrumb-item">
											<a href="<%=request.getContextPath()%>/manager/management/faq/list.do">운영관리</a>
										</li>
										<li class="breadcrumb-item active">자주묻는질문</li>
									</ol>
								</div>
													
							</div>
							<p class="h5">
								<span class="text-secondary font-weight-bold" style="font-size:2em;"><i class="far fa-question-circle"></i></span>
								<c:choose>
									<c:when test="${fn:length(faq.faqQuestion) gt 110 }">
										${fn:substring(faq.faqQuestion,0,110 )}<br>
										${fn:substring(faq.faqQuestion,111,500)}
									</c:when>
								<c:otherwise>
								<span>${ faq.faqQuestion}</span>
								</c:otherwise>
								</c:choose>
							</p>
							<p class="text-secondary m-0">
								<b>${ask.memId}</b>
							</p>
							
							<div class="d-block">
								<p class="text-secondary float-left mb-1">
									<c:if test="${faq.askSort eq 'c'}">
										<span class="badge badge-warning">수료문의</span>
									</c:if>
									<c:if test="${faq.askSort eq 'l'}">
										<span class="badge badge-success">학습문의</span>
									</c:if>
									<c:if test="${faq.askSort eq 'e'}">
										<span class="badge badge-info">기타문의</span>
									</c:if>
								</p>
							</div>
							<div class="justify-content-end float-right" id="tools">
								<a href="#replies-wrapper">
									<button type="button" class="btn btn-tool" onclick="location.href='modifyForm.do?faqNo=${ faq.faqNo }';">
										<i class="far fa-edit text-success"></i><span class="text-success font-weight-bold">&nbsp;수정&nbsp;</span>
									</button>
		<!-- 							<span class="float-right text-secondary btn">|</span> -->
									<button type="button" class="btn btn-tool" onclick="fn_remove(${ faq.faqNo });">
										<i class="fas fa-eraser" style="color:#ff7f00"></i><span class="font-weight-bold" style="color:#ff7f00">&nbsp;삭제&nbsp;</span>
									</button>
									<button type="button" class="btn btn-tool" onclick="location.href='list.do'">
										<i class="fas fa-solid fa-list-ul"></i><span class="pl-1 font-weight-bold text-black">목록</span>
									</button>
								</a>
							</div>							
						</div>
					</div>
					<!-- /.card-header -->
					<div class="card-body">
						<div class="content" style="min-height: 500px;">${faq.faqAnswer}</div>
					</div>
					<!-- /.card-body -->

				</div>
				<!-- /.card -->
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
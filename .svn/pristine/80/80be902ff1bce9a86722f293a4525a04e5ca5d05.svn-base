<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<head></head>

<title></title>
<body>

	<!-- 메인 헤더 -->
	<!-- /.content-header -->
	<section class="content" style="width: 1250px; margin: 0 auto;">
		<div class="container-fluid">
			
			<div class="col-md-12">
				<!-- Box Comment -->
				<div class="card-widget">
					<div class="card-header">
						
						<div class="user-block col-12">
							<div class="row mb-2">
								<div class="col-sm-6">
									<p class="m-0 text-secondary">자주묻는질문</p>
								</div>
								<!-- /.col -->
								<div class="col-sm-6">
									<ol class="breadcrumb float-sm-right m-0 p-0" style="background-color : white;">
										<li class="breadcrumb-item">
											<i class="fas fa-home"></i>
										</li>
										<li class="breadcrumb-item">
											<a href="<%=request.getContextPath()%>/user/management/notice/list.do">학습지원실</a>
										</li>
										<li class="breadcrumb-item active">자주묻는질문</li>
									</ol>
				
								</div>
							</div>
							<p class="h5">${ faq.faqQuestion }</p>
							<p class="text-secondary m-0">
								<b>운영자</b>
							</p>
							
							<div class="d-block">
								<p class="text-secondary float-left m-0">
									${faq.faqNo}
									&nbsp;| &nbsp;
								</p>
								<p class="text-secondary float-left m-0">
									<small class="badge badge-warning">
										<c:if test="${ faq.askSort eq 'c' }">
											수료 문의
										</c:if> <c:if test="${ faq.askSort eq 'l' }">
											학습 문의
										</c:if> <c:if test="${ faq.askSort eq 'e' }">
											기타
										</c:if>
									</small>
								</p>
								<div class="justify-content-end float-right row" id="tools">
									<button class="btn btn-tool float-right pt-3" onclick="location.href='list.do'">
										<i class="fas fa-solid fa-list-ul"></i><span class="pl-1 font-weight-bold text-black">목록</span> 
									</button>
								</div>
							</div>
						</div>
					</div>
					<!-- /.card-header -->
					<div class="card-body">
						<div class="content" style="min-height: 250px;">${ faq.faqAnswer }</div>
					</div>
					<!-- /.card-body -->

				<!-- /.card -->
			</div>
		</div>
	</section>
	<!-- 메인 바디 -->
	<!-- Main content -->
	</section>
	<!-- /.content-wrapper -->
</body>

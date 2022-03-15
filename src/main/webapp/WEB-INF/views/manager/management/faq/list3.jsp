<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }" />
<c:set var="faqList" value="${dataMap.faqList }" />
<head></head>

<title></title>

<body>
	<div class="content-wrapper m-0" style="min-width: 1280px; background-color:#ffffff">
		<!-- 메인 헤더 -->
		<!-- Content Header (Page header) -->
		<div class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h4 class="m-0">자주 묻는 질문</h4>
					</div>
					<!-- /.col -->
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item">
								<i class="fas fa-home"></i>
							</li>
							<li class="breadcrumb-item">
								<a href="<%=request.getContextPath()%>/manager/management/faq/list.do">운영관리</a>
							</li>
							<li class="breadcrumb-item active">자주 묻는 질문</li>
						</ol>
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.container-fluid -->
		</div>
		<!-- /.content-header -->

		<section class="content">
			<div class="container-fluid">

				<div class="card">
					<div class="card-header">
						<div class="input-group justify-content-end col-12 p-0 mb-1">
							<div class="p-0 m-0 text-left col-5 float-left">
								<button type="button" class="btn btn-block btn-primary col-2 float-left" onclick="location.href='registForm.do'">등록</button>
							</div>
							<div class="row col-7 justify-content-end p-0 mr-1">
								<select class="col-md-2 form-control" name="searchType">
									<option value="tc" ${cri.searchType eq 'tc' ? 'selected':'' } selected="selected">전체</option>
									<option value="t" ${cri.searchType eq 't' ? 'selected':'' }>제목</option>
									<option value="c" ${cri.searchType eq 'c' ? 'selected':'' }>내용</option>
								</select>
								<input type="text" placeholder="검색할 단어를 입력하세요" class="form-control col-md-7" name="keyword" value="${ cri.keyword }" />
								<button class="col-md-1 btn btn-primary float-right" onclick="list_go(1);">검색</button>
							</div>
						</div>
					</div>


					<div class="col-6 flot-left">
						<span class="text-muted" style="color: gray; cursor: pointer;">전체</span>
						<span class="text-muted" style="color: gray;">&nbsp;|&nbsp;</span>
						<span class="text-muted" style="color: gray; cursor: pointer;">중요공지</span>
					</div>

					<div class="card-body">
						<table id="maincontent" class="table table-sm table-hover">
							<thead>
								<tr class="text-center">
									<th scope="col" style="width: 20%;">문의번호</th>
									<th scope="col" style="width: 60%;">문의제목</th>
									<th scope="col" style="width: 20%;">문의분류</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${empty faqList }">
									<tr>
										<td colspan="3"><strong>해당 내용이 없습니다.</strong></td>
									</tr>
								</c:if>
								<c:forEach items="${ faqList }" var="faq">
									<tr>
										<td class="text-center">${ faq.faqNo }</td>
										<td id="title" style="cursor: pointer;" onclick="location.href='detail.do?faqNo=${ faq.faqNo }';">${ faq.faqQuestion }</td>
										<c:if test="${ faq.askSort eq 'c' }">
											<td class="text-center">수료 문의</td>
										</c:if>
										<c:if test="${ faq.askSort eq 'l' }">
											<td class="text-center">학습 문의</td>
										</c:if>
										<c:if test="${ faq.askSort eq 'e' }">
											<td class="text-center">기타</td>
										</c:if>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="card-footer">
						<%@include file="/WEB-INF/views/common/pagination.jsp"%>
					</div>
				</div>
			</div>
		</section>
	</div>
	<!-- /.content-wrapper -->
</body>
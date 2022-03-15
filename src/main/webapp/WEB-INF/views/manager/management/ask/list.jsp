<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }" />
<c:set var="askList" value="${dataMap.askList }" />

<head></head>

<title></title>

<body>

	<!-- 메인 헤더 -->
	<!-- Content Header (Page header) -->
	<div class="content-header pb-0" >
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h4 class="m-0">문의게시판</h4>
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
						<li class="breadcrumb-item">문의게시판</li>
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
	<section class="content" >
		<div class="container-fluid">

			<input type='text' id='sort' name='sortType' value="${ cri.sortType }" hidden="hidden" />

			<div class="input-group justify-content-end col-12 p-0 mb-1">
				<div class="p-0 m-0 text-left col-4 float-left">
					<select class="col-md-3 form-control form-control-sm" name="sortSelect" onchange="sort()">
						<option value="" ${cri.sortType eq '' ? 'selected':'' }>분류</option>
						<option value="c" ${cri.sortType eq 'c' ? 'selected':'' }>수료문의</option>
						<option value="s" ${cri.sortType eq 's' ? 'selected':'' }>학습문의</option>
						<option value="etc" ${cri.sortType eq 'etc' ? 'selected':'' }>기타</option>
					</select>
				</div>
				<div class="row col-8 justify-content-end p-0 mr-1">
					<select class="col-md-2 form-control" name="searchType">
						<option value="tc" ${cri.searchType eq 'tw' ? 'selected':'' }>전체</option>
						<option value="t" ${cri.searchType eq 't' ? 'selected':'' }>제목</option>
						<option value="c" ${cri.searchType eq 'w' ? 'selected':'' }>작성자</option>
					</select>
					<input type="text" placeholder="검색할 단어를 입력하세요" name="keyword" class="form-control col-md-7" value="${ cri.keyword }">
					<button class="col-md-1 btn btn-secondary float-right" onclick="list_go(1);">검색</button>
				</div>
			</div>
			<div style="height:530px;" class=" mt-2">
			<table id="maincontent" class="table table-sm table-hover text-center">
				<thead>
					<tr class="text-center" style="background-color: #F5F4F4;">
						<th style="width: 7%;">문의번호</th>
						<th class="col-1">문의분류</th>
						<th class="col-5">문의제목</th>
						<th class="col-1">답변유무</th>
						<th class="col-2">작성자</th>
						<th class="col-1">날짜</th>
					</tr>
				</thead>
				<tbody style="">
					<c:if test="${empty askList }">
						<tr class="text-center">
							<td colspan="6">등록된 문의가 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${not empty askList }">
						<c:forEach items="${askList }" var="ask">
							<tr>
								<td class="text-center">${ask.qnNo}</td>
								<td class="text-center">
									<c:if test="${ask.askSort eq 'A301'}">수료문의</c:if> 
									<c:if test="${ask.askSort eq 'A302'}">학습문의</c:if> 
									<c:if test="${ask.askSort eq 'A303'}">기타</c:if>
								</td>
								<td class="text-left" style="cursor: pointer; max-width: 583px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;" onclick="location.href='detail.do?askNo=${ask.qnNo}'">${ask.qnTitle}</td>
								<td class="text-center"><c:if test="${empty ask.qnAnswer}">
										<span class="badge bg-danger">미답변</span>
									</c:if> <c:if test="${not empty ask.qnAnswer}">
										<span class="badge bg-primary">답변완료</span>
									</c:if></td>
								<td class="text-center">${ask.memId}</td>
								<td class="text-center"><fmt:formatDate value="${ask.qnRegdate }" pattern="yyyy-MM-dd" /></td>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
			</div>
			<%@include file="/WEB-INF/views/common/pagination.jsp"%>
		</div>
	</section>

	<script type="text/javascript">
function sort() {
	$('#sort').val($("select[name=sortSelect]").val());
	list_go(1);
}

</script>


</body>
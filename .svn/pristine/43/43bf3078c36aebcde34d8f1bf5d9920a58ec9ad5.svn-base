<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="askList" value="${dataMap.askList }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }" />

<head></head>

<body>

<script>
if(${from eq "regist"}){
	alert("문의가 등록되었습니다.");
	window.location.reload();
}
</script>
	<!-- 메인 헤더 -->
	<!-- Content Header (Page header) -->
	<div class="content-header pb-0"  >
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
							<a href="<%=request.getContextPath()%>/user/management/notice/list.do">학습지원실</a>
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
	<section class="content"  >
		<div class="container-fluid">

			<div class="input-group justify-content-end col-12 p-0 mb-2">
				<div class="p-0 m-0 text-left col-4 align-self-end">
					<button type="button" class="btn btn-block btn-primary btn-sm col-2 float-left" onclick="location.href='registForm.do'">글쓰기</button>
				</div>
				<div class="row col-8 justify-content-end p-0 mr-1">
					<select class="col-md-2 form-control" name="searchType">
						<option value="tc" ${cri.searchType eq 'tw' ? 'selected':'' }>전체</option>
						<option value="t" ${cri.searchType eq 't' ? 'selected':'' }>제목</option>
						<option value="c" ${cri.searchType eq 'w' ? 'selected':'' }>작성자</option>
					</select>
					<input type="text" placeholder="검색할 단어를 입력하세요" name="keyword" class="form-control col-md-7">
					<button class="col-md-1 btn btn-primary float-right" onclick="list_go(1)">검색</button>
				</div>
			</div>
			<div style="height:530px;">
			<table id="maincontent" class="table table-hover table-sm">
				<thead>
					<tr class="text-center" style="background-color:#E6EFFC;">
						<th class="col-1">문의번호</th>
						<th class="col-1">문의분류</th>
						<th class="col-5">문의제목</th>
						<th class="col-2">답변유무</th>
						<th class="col-1 text-left">작성자</th>
						<th class="col-1">날짜</th>
					</tr>
				</thead>
				<tbody style="">
					<c:if test="${empty askList }">
						<tr>
							<td colspan="6" class="text-center"><strong>해당 내용이 없습니다.</strong></td>
						</tr>
					</c:if>
					<c:forEach items="${askList }" var="ask">
						<tr>
							<td class="text-center">${ask.qnNo }</td>
							<td class="text-center">
								<c:if test="${ask.askSort eq 'A301'}" >수료문의</c:if>
								<c:if test="${ask.askSort eq 'A302'}">학습문의</c:if> 
								<c:if test="${ask.askSort eq 'A303'}">기타</c:if>
							</td>
							<td id="title" onclick="fn_detail(${ask.qnNo},'${ask.memId }',${ask.privacy });" style="cursor: pointer; max-width: 534px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
								<c:if test="${ask.privacy eq '1'}" ><span class="text-muted"><i class="fas fa-lock"></i></span>&nbsp;비밀글입니다.</c:if>
								<c:if test="${ask.privacy eq '0'}" >${ask.qnTitle }</c:if>
							</td>
							<td class="text-center">
								<c:if test="${empty ask.qnAnswer}" >
									<span class="badge bg-danger">미답변</span>
								</c:if>
								<c:if test="${not empty ask.qnAnswer}" >
									<span class="badge bg-primary">답변완료</span>
								</c:if>
							</td>
							<td style="max-width: 106px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">${ask.memId }</td>
							<td class="text-center"><fmt:formatDate value="${ask.qnRegdate }" pattern="yyyy-MM-dd" /> </td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			</div>
				<%@include file="/WEB-INF/views/common/pagination.jsp"%>

		</div>
	</section>
	
<script>
function fn_detail(qnNo,memId,privacy){
	if(${loginUser.memId ne memId}){
		if(privacy == '1'){
			alert("비밀글입니다.");
		}else{
			location.href='detail.do?qnNo=' + qnNo;
		}
	}
}
</script>
</body>
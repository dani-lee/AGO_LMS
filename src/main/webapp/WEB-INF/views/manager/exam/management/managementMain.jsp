<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="examList" value="${dataMap.manageExamList }" />

<!-- ------------------------------강의 목록만 있는 거-------------------------------------- -->
<title>시험 관리</title>
<head></head>
<body>
	<!-- 메인 헤더 -->
	<!-- Content Header (Page header) -->
	<div class="content-header pb-0">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h4 class="m-0">시험 관리</h4>
				</div>
				<!-- /.col -->
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item">
							<i class="fas fa-home"></i>
						</li>
						<li class="breadcrumb-item">
							<a href="#">시험 대시보드</a>
						</li>
						<li class="breadcrumb-item active">시험 관리</li>
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

		<div class="container-fluid col-md-12">
			<div>
				<span class="text-gray">최신순</span> <span class="text-gray ml-1 mr-1">|</span> <span class="text-gray">오래된순</span>
			</div>
			<table class="table mt-2 mb-1">
				<thead>
					<tr class="text-center">
						<th>강의코드</th>
						<th>강의분류</th>
						<th>강의명</th>
						<th>시험 평균 점수</th>
					</tr>
				</thead>
				<tbody>
				<c:if test = "${empty examList }">
					<tr>
						<td colspan="6">등록된 시험 정보가 없습니다.</td>
					</tr>
				</c:if>
				<c:forEach items="${examList }" var="exam">
					<tr>
						<td class="text-center align-middle">${exam.clCode }</td>
						<c:if test="${exam.clCate eq 'A201' }">
							<td class="text-center align-middle">신입교육</td>
						</c:if>
						<c:if test="${exam.clCate eq 'A202' }">
							<td class="text-center align-middle">일반교육</td>
						</c:if>
						<td class="align-middle" style="cursor: pointer" onclick="OpenWindow('mgDetail.pop?clCode=${exam.clCode}','시험관리', 900, 800);">
						${exam.clName }
						</td>
						<td class="col-4">
							<table>
								<tbody>
								
										<c:if test="${empty exam.ftestFile and empty exam.mtestFile }">
										<tr class="text-center align-middle">
											<span class=" badge badge-danger" style="margin-left: 30px;">시험 미등록</span>
											</tr>
										</c:if>
										<c:if test="${!empty exam.mtestFile and empty exam.ftestFile }">
										<tr class="text-center align-middle">
											<span class=" badge badge-warning" style="margin-left: 30px;">최종평가 미등록</span>
										</tr>
										</c:if>
										
								<c:if test = "${!empty exam.ftestFile and empty exam.mtestFile }">
									<tr>
										<td style="border: none; height: 40px;" class="p-0">
											<div class="progress-group">
												최종평가 평균 점수<span class="float-right"><b>${exam.ftestAvgSco }</b>/100</span>
												<div class="progress progress-sm active" style="width: 385px;">
													<div class="progress-bar bg-primary progress-bar-striped" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: ${exam.ftestAvgSco }%"></div>
												</div>
											</div>
										</td>
									</tr>
								</c:if>
								<c:if test = "${!empty exam.ftestFile and !empty exam.mtestFile }">
									<tr>
										<td style="border: none; height: 40px;" class="p-0">
											<div class="progress-group">
												중간평가 평균 점수 <span class="float-right"><b>${exam.mtestAvgSco }</b>/100</span>
												<div class="progress progress-sm active" style="width: 385px;">
													<div class="progress-bar bg-primary progress-bar-striped" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: ${exam.mtestAvgSco }%"></div>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<td style="border: none; height: 40px;" class="p-0">
											<div class="progress-group">
												최종평가 평균 점수<span class="float-right"><b>${exam.ftestAvgSco }</b>/100</span>
												<div class="progress progress-sm active" style="width: 385px;">
													<div class="progress-bar bg-primary progress-bar-striped" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: ${exam.ftestAvgSco }%"></div>
												</div>
											</div>
										</td>
									</tr>
								</c:if>
								</tbody>
							</table>
						</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			<div class="card-body text-center pt-0">
				<%@include file="/WEB-INF/views/common/pagination.jsp"%>
			</div>
			<!-- 		<div class="card-body col-md-12 column ui-sortable p-0"></div> -->
		</div>
	</section>

</body>
</html>
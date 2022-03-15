<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<head>
</head>

<title>Ready Bootstrap Dashboard</title>

<body>
	<div class="content-wrapper m-0" style="min-width: 1280px;">
		<!-- 메인 헤더 -->
		<!-- Content Header (Page header) -->
		<div class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h4 class="m-0">부서원 관리 보드</h4>
					</div>
					<!-- /.col -->
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item">
								<i class="fas fa-home"></i>
							</li>
							<li class="breadcrumb-item">
								<a href="<%=request.getContextPath()%>/user/departmentHead/main.do">메인보드</a>
							</li>
							<li class="breadcrumb-item">부서장</li>
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
				<div class="row">
					<div class="col-6">
						<div class="card card-primary">
							<div class="card-header pt-2 pb-2">
								<div class="d-flex align-items-center justify-content-between">
									<p class="h5 text-bold" style="margin-bottom: 0px;">강의 목록</p>
									<a href="classList.do">더보기+</a>
								</div>
							</div>
							<!-- /.card-header -->
							<div class="card-body p-3" style="height:240px;">
								<table class="table table-sm table-hover">
									<thead>
										<tr style="background-color:#E6EFFC;">
											<th class="text-center">강의명</th>
											<th>수강기간</th>
											<th class="text-center">강의구분</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${dpClassList}" var="dpClass">
											<tr>
												<td style="font-size: 14px;">
													<c:choose>
														<c:when test="${fn:length(dpClass.clName) gt 30 }">
																<c:out value="${fn:substring(dpClass.clName,0,30)}..."></c:out>
														</c:when>
														<c:otherwise>
																${dpClass.clName}
														</c:otherwise>
													</c:choose>
												</td>
												<td>
													<fmt:formatDate value="${dpClass.postSdate}" pattern="yyyy-MM-dd"/>
													~
													<fmt:formatDate value="${dpClass.postEdate}" pattern="yyyy-MM-dd"/>
												</td>
												<td class="text-center">
													<c:if test="${dpClass.clDivision eq '선택'}">
														<small class="badge badge-warning">${dpClass.clDivision}</small>
													</c:if>
													<c:if test="${dpClass.clDivision eq '필수'}">
														<small class="badge badge-danger">${dpClass.clDivision}</small>
													</c:if>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<!-- /.card-body -->
						</div>
					</div>
					<div class="col-6">
						<div class="card card-primary">
							<div class="card-header pt-2 pb-2">
								<div class="d-flex align-items-center justify-content-between">
									<p class="h5 text-bold" style="margin-bottom: 0px;">보고서 결재</p>
									<a href="reportApproval.do">더보기+</a>
								</div>
							</div>
							<!-- /.card-header -->
							<div class="card-body p-3" style="height:240px;">
								<table class="table table-sm table-hover">
									<thead>
										<tr style="background-color:#E6EFFC;">
											<th class="text-center">강의명</th>
											<th>제출일자</th>
											<th>제출인</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${reportList}" var="report">
											<tr>
												<td style="width: 380px; font-size: 14px;">
													<c:choose>
														<c:when test="${fn:length(report.clName) gt 33 }">
																<c:out value="${fn:substring(report.clName,0,33)}..."></c:out>
														</c:when>
														<c:otherwise>
																${report.clName}
														</c:otherwise>
													</c:choose>
												</td>
												<td>
													<fmt:formatDate value="${report.regdate}" pattern="yyyy-MM-dd"/>
												</td>
												<td>${report.memName}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<!-- /.card-body -->
						</div>
					</div>
				</div>
				<div class="col-12 p-0">
					<div class="card card-primary">
						<div class="card-header pt-2 pb-2">
							<div class="d-flex align-items-center justify-content-between">
								<p class="h5 text-bold" style="margin-bottom: 0px;">수강 내역</p>
								<a href="reportList.do">더보기+</a>
							</div>
						</div>
						<!-- /.card-header -->
						<div class="card-body P-3" style="height:385px;">
							<table class="table table-sm table-hover">
								<thead>
									<tr class="text-center" style="background-color:#E6EFFC;">
										<th>강의번호</th>
										<th>강의명</th>
										<th>부서원이름</th>
										<th class="text-left">직급</th>
										<th>학습진도</th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${empty memberClassList}">
										<tr>
											<td class="text-center text-bold" colspan="4">수강내역이 없습니다.</td>
										</tr>
									</c:if>
									<c:if test="${not empty memberClassList}">
										<c:forEach items="${memberClassList}" var="memberClass">
											<tr>
												<td class="text-center pt-3">${memberClass.opcl }</td>
												<td style="width:550px; height: 50px;">
													<c:choose>
														<c:when test="${fn:length(memberClass.clName) gt 45 }">
																<c:out value="${fn:substring(memberClass.clName,0,45)}..."></c:out>
														</c:when>
														<c:otherwise>
																${memberClass.clName}
														</c:otherwise>
													</c:choose>
													<div class="row">
<!-- 														<div class="pl-2"> -->
<%-- 															<small class="badge badge-info">${memberClass.clCateName }</small> --%>
<!-- 														</div> -->
														<div class="pl-2">
															<c:choose>
																<c:when test="${memberClass.clFormat eq 'A601' }">
																	<small class="badge badge-info">${memberClass.clFormatName }</small>
																</c:when>
																<c:when test="${memberClass.clFormat eq 'A602' }">
																	<small class="badge badge-primary">${memberClass.clFormatName }</small>
																</c:when>
																<c:otherwise>
																	<small class="badge badge-success">${memberClass.clFormatName }</small>
																</c:otherwise>
															</c:choose>
														</div>
														<div class="pl-2">
															<c:choose>
																<c:when test="${memberClass.clDivisionName eq '필수' }">
																	<small class="badge badge-danger">${memberClass.clDivisionName }</small>
																</c:when>
																<c:otherwise>
																	<small class="badge badge-warning">${memberClass.clDivisionName }</small>
																</c:otherwise>
															</c:choose>
														</div>
													</div>
												</td>
												<td class="text-center pt-3">${memberClass.memName }</td>
												<td class="text-left pt-3">${memberClass.positionName }</td>
												<td class="pt-3" style="width:320px;">
													<div class="progress">
														<div class="progress-bar bg-warning" role="progressbar" aria-valuenow="${memberClass.progRate }" aria-valuemin="0" aria-valuemax="100" style="width: ${memberClass.progRate }%">
															<span class="sr-only">${memberClass.progRate }% Complete (warning)</span>
														</div>
													</div>
													<span class="">${memberClass.progRate }%</span>
												</td>
											</tr>
										</c:forEach>
									</c:if>
								</tbody>
							</table>
						</div>
						<!-- /.card-body -->
					</div>
				</div>
			</div>
		</section>
	</div>
</body>
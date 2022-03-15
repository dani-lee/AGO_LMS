<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }" />
<c:set var="intClassList" value="${dataMap.intClassList }" />
<c:set var="extClassList" value="${dataMap.extClassList }" />

<head></head>

<title></title>


<body>
	<!-- 메인 헤더 -->
	<!-- Content Header (Page header) -->
	<div class="content-header pb-0">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h4 class="m-0">종료된 강의</h4>
				</div>
				<!-- /.col -->
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item">
							<i class="fas fa-home"></i>
						</li>
						<li class="breadcrumb-item">
							<a href="<%=request.getContextPath()%>/user/myClass/main.do">내 강의실</a>
						</li>
						<li class="breadcrumb-item">종료된 강의</li>
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
	<section class="content mt-2">
		<div class="container-fluid">

			<div class="input-group justify-content-end col-12 p-0 mb-1 row">
				<div class="col-4 align-self-end">
					<span class="text-muted ${cri.sortType eq 'int' ? 'text-bold': '' } ${cri.sortType eq '' ? 'text-bold': '' }" style="color: gray; cursor: pointer; font-size: 20px;" onclick="fn_sort(1,'int');">사내강의</span>
					<span class="text-muted" style="color: gray;">&nbsp;|&nbsp;</span>
					<span class="text-muted ${cri.sortType eq 'ext' ? 'text-bold': '' }" style="color: gray; cursor: pointer; font-size: 20px;" onclick="fn_sort(1,'ext');">HRD</span>
				</div>
				<div class="row col-8 justify-content-end p-0 mr-1">
					<select class="form-control pl-1" name="searchType" id="searchType" style="width: 130px; height: 39px; font-size:13px;">
						<option value="cn" ${cri.searchType eq 'cn' ? 'selected': '' }>강의명</option>
						<c:if test="${not empty intClassList }">
							<option value="rs" ${cri.searchType eq 'rs' ? 'selected': '' }>보고서제출상태</option>
						</c:if>
					</select>
					<input type="text" placeholder="검색할 단어를 입력하세요" name="keyword" class="form-control col-md-5" value="${cri.keyword}">
					<button class="col-md-1 btn btn-primary float-right" onclick="fn_list(1);">검색</button>
				</div>
			</div>
			
			<div class="row mt-2">
				<div class="col-12">
					<div class="card-body table-responsive p-0" style="height:550px;">
						<table class="table text-nowrap">
							<thead>
								<tr style="background-color: #E6EFFC;">
									<c:if test="${cri.sortType ne 'ext'}">
										<th class="text-center">강의번호</th>
									</c:if>
									<c:if test="${cri.sortType eq 'ext'}">
										<th class="text-center">강의코드</th>
									</c:if>
									<th>강의명</th>
									<c:if test="${cri.sortType ne 'ext'}">
										<th>강의완료상태</th>
									</c:if>
									<c:if test="${cri.sortType eq 'ext'}">
										<th>보고서 마감일</th>
									</c:if>
									<th>보고서제출</th>
									<c:if test="${cri.sortType ne 'ext'}">
										<th>수강후기</th>
									</c:if>
								</tr>
							</thead>
							<tbody>
								<c:if test="${empty intClassList }">
									<c:if test="${empty extClassList }">
										<tr>
											<td colspan="5" class="text-center text-bold">해당되는 강의가 없습니다.</td>
										</tr>
									</c:if>
								</c:if>
								<c:if test="${not empty intClassList }">
									<c:forEach var="intClass" items="${intClassList}">
										<c:set var="intReport" value="${intClass.intReport }" />
										<c:set var="classReview" value="${intClass.classReview }" />
										<c:set var="date" value="<%= new Date() %>" />
										<tr>
											<td class="text-center align-middle">${intClass.opcl}</td>
											<td>
												<div class="text-bold">
													<c:choose>
														<c:when test="${fn:length(intClass.clName) gt 21 }">
															<c:out value="${fn:substring(intClass.clName,0,21) }..." ></c:out>
														</c:when>
														<c:otherwise>
															${intClass.clName }
														</c:otherwise>
													</c:choose>
												</div>
												<c:choose>
													<c:when test="${intClass.testStatus eq 0}">
														<c:choose>
															<c:when test="${intClass.progRate < 80}">
														    	<span class="badge badge-secondary text-center">미수료</span>
														    </c:when>
															<c:when test="${empty intReport}">
													        	<span class="badge badge-warning text-center">미제출</span>
													        </c:when>
													        <c:when test="${intReport.intState eq 'B101'}">
														        <span class="badge badge-warning text-center">미제출</span>
														    </c:when>
															<c:when test="${intReport.intState eq 'B102'}">
														    	<span class="badge badge-info text-center">승인대기</span>
														    </c:when>
														    <c:when test="${intReport.intState eq 'B103'}">
														   		<span class="badge badge-danger text-center">반려</span>
														    </c:when>
														    <c:when test="${intReport.intState eq 'B104'}">
														   		<span class="badge badge-success text-center">승인완료</span>
														    </c:when>
														    <c:when test="${intReport.intState eq 'B105'}">
														    	<span class="badge text-center" style="background-color:#605ca8;">제출기한마감</span>
														    </c:when>
														    <c:when test="${intClass.reportDeadLine < date}">
														    	<span class="badge text-center" style="background-color:#605ca8;">제출기한마감</span>
														    </c:when>
														</c:choose>
													</c:when>
												    
												    <c:when test="${intClass.testCpl eq 0}">
												    	<span class="badge badge-secondary text-center">미수료</span>
												    </c:when>
												    <c:when test="${intClass.progRate < 80}">
												    	<span class="badge badge-secondary text-center">미수료</span>
												    </c:when>
													<c:when test="${empty intReport}">
											        	<span class="badge badge-warning text-center">미제출</span>
											        </c:when>
											        <c:when test="${intReport.intState eq 'B101'}">
												        <span class="badge badge-warning text-center">미제출</span>
												    </c:when>
													<c:when test="${intReport.intState eq 'B102'}">
												    	<span class="badge badge-info text-center">승인대기</span>
												    </c:when>
												    <c:when test="${intReport.intState eq 'B103'}">
												   		<span class="badge badge-danger text-center">반려</span>
												    </c:when>
												    <c:when test="${intReport.intState eq 'B104'}">
												   		<span class="badge badge-success text-center">승인완료</span>
												    </c:when>
												    <c:when test="${intReport.intState eq 'B105'}">
												    	<span class="badge text-center" style="background-color:#605ca8;">제출기한마감</span>
												    </c:when>
												    <c:when test="${intClass.reportDeadLine < date}">
												    	<span class="badge text-center" style="background-color:#605ca8;">제출기한마감</span>
												    </c:when>
												</c:choose>
											</td>
											<td>
												<div class="row">
													<span class="ml-3">시험</span> 
													<c:if test="${intClass.testCpl eq 0}">
														<span class="ml-2 text-danger">불만족</span>
													</c:if>
													<c:if test="${intClass.testCpl eq 1}">
														<span class="ml-2 mr-3 text-primary">만족</span>
													</c:if>
													<c:if test="${intClass.testStatus eq 0}">
														<div class="ml-2">시험 없음</div>
													</c:if>
													<c:if test="${intClass.testStatus eq 1}">
														<div class="ml-2">중간 : 
															<c:if test="${not empty intClass.mtestFile }">
																<c:if test="${intClass.midtestScore < 70}">
																	<span class="text-danger">${intClass.midtestScore}</span>
																</c:if>
																<c:if test="${intClass.midtestScore >= 70}">
																	<span class="text-success">${intClass.midtestScore}</span>
																</c:if>
															</c:if>
															<c:if test="${empty intClass.mtestFile }">
																<span class="text-success">시험없음</span>
															</c:if>
														</div>
														<div class="ml-2" style="border-left:gray;">기말 : 
															<c:if test="${intClass.fintestScore < 70}">
																<span class="text-danger">${intClass.fintestScore}</span>
															</c:if>
															<c:if test="${intClass.fintestScore >= 70}">
																<span class="text-success">${intClass.fintestScore}</span>
															</c:if>
														</div>
													</c:if>
												</div>
												<div class="row">
													<span >진도율</span>
													<c:if test="${intClass.progRate < 80}">
														<span class="ml-2 text-danger">불만족</span>
													</c:if>
													<c:if test="${intClass.progRate >= 80}">
														<span class="ml-2 mr-3 text-primary">만족</span>
													</c:if>
													<div class="progress mt-1 ml-2" style="width: 250px;">
														<div class="progress-bar bg-success" role="progressbar" style="width: ${intClass.progRate}%" aria-valuenow="${intClass.progRate}" aria-valuemin="0" aria-valuemax="100">
															${intClass.progRate}%
														</div>
													</div>
												</div>
											</td>
											<td>
												<c:if test="${intReport.intState ne 'B104'}">
													<button type="button" class="btn btn-block btn-primary btn-flat" style="width: 130px;" onclick="intReport_go(${intClass.memClNo});"
														<c:choose>
															<c:when test="${intReport.intState eq 'B102'}">
														    	disabled
														    </c:when>
														    <c:when test="${intReport.intState eq 'B105'}">
														    	disabled
														    </c:when>
														    <c:when test="${intClass.testCpl eq 0}">
														    	disabled
														    </c:when>
														    <c:when test="${intClass.progRate < 80}">
														    	disabled
														    </c:when>
														</c:choose>
													>
														<c:choose>
															<c:when test="${intClass.testCpl eq 0}">
														    	미수료
														    </c:when>
														    <c:when test="${intClass.progRate < 80}">
														    	미수료
														    </c:when>
															<c:when test="${empty intReport}">
													        	제출하기
													        </c:when>
													        <c:when test="${intReport.intState eq 'B101'}">
													        	제출하기
													        </c:when>
															<c:when test="${intReport.intState eq 'B102'}">
														    	승인대기
														    </c:when>
														    <c:when test="${intReport.intState eq 'B103'}">
														   		제출하기
														    </c:when>
														    <c:when test="${intReport.intState eq 'B105'}">
														    	마감
														    </c:when>
														     <c:when test="${intClass.reportDeadLine < date}">
														     	마감
														    </c:when>
														</c:choose>
													</button>
												</c:if>
												<c:if test="${intReport.intState eq 'B104'}">
													<button type="button" class="btn btn-block btn-primary btn-flat" style="width: 130px;" onclick="print_intReport(${intClass.memClNo});">확인하기</button>
												</c:if>
												
											</td>
											<td>
												<c:if test="${intClass.reviewDeadLine < date}">
													<button type="button" class="btn btn-block btn-flat p-1" style="background-color: #7B68EE; color: #FFFFFF;" disabled>등록 마감</button>
												</c:if>
												<c:if test="${empty intClass.ctfDate || intClass.testCpl eq 0}">
													<button type="button" class="btn btn-block btn-flat p-1" style="background-color: #7B68EE; color: #FFFFFF;" disabled>등록 불가</button>
												</c:if>
												<c:if test="${intClass.testCpl eq 1 && intClass.reviewDeadLine >= date}">
													<c:if test="${not empty classReview}">
														<button type="button" class="btn btn-block btn-flat p-1" style="background-color: #7B68EE; color: #FFFFFF;" disabled>등록 완료</button>
													</c:if>
													<c:if test="${empty classReview}">
														<button type="button" class="btn btn-block btn-flat p-1" style="background-color: #7B68EE; color: #FFFFFF;" onclick="review_go(${intClass.memClNo});">등록하기</button>
													</c:if>
												</c:if>
											</td>
										</tr>
									</c:forEach>
								</c:if>
								<c:if test="${not empty extClassList }">
									<c:forEach var="extClass" items="${extClassList}">
										<c:set var="extReport" value="${extClass.extReport }" />
										<c:set var="date" value="<%= new Date() %>" />
										<tr>
											<td class="text-center align-middle">${extClass.extCode}</td>
											<td>
												<div class="text-bold">
													<c:choose>
														<c:when test="${fn:length(extClass.extClName) gt 43 }">
															<c:out value="${fn:substring(extClass.extClName,0,43) }..." ></c:out>
														</c:when>
														<c:otherwise>
															${extClass.extClName}
														</c:otherwise>
													</c:choose>

												</div>
												<c:choose>
													<c:when test="${extClass.testStatus eq 0}">
														<c:choose>
															<c:when test="${extClass.commonCode eq 'C303'}">
														    	<span class="badge badge-secondary text-center">미수료</span>
														    </c:when>
															<c:when test="${empty extReport && extClass.reportDeadLine >= date}">
													        	<span class="badge badge-warning text-center">미제출</span>
													        </c:when>
													        <c:when test="${extReport.extState eq 'B101' && extClass.reportDeadLine >= date}">
														        <span class="badge badge-warning text-center">미제출</span>
														    </c:when>
															<c:when test="${extReport.extState eq 'B102' && extClass.reportDeadLine >= date}">
														    	<span class="badge badge-info text-center">승인대기</span>
														    </c:when>
														    <c:when test="${extReport.extState eq 'B103' && extClass.reportDeadLine >= date}">
														   		<span class="badge badge-danger text-center">반려</span>
														    </c:when>
														    <c:when test="${extReport.extState eq 'B104'}">
														   		<span class="badge badge-success text-center">승인완료</span>
														    </c:when>
														    <c:when test="${extReport.extState eq 'B105'}">
														    	<span class="badge text-center" style="background-color:#605ca8; color:#ffffff;">제출기한마감</span>
														    </c:when>
														    <c:when test="${extClass.reportDeadLine < date}">
														    	<span class="badge text-center" style="background-color:#605ca8; color:#ffffff;">제출기한마감</span>
														    </c:when>
														</c:choose>
													</c:when>
												    
												    <c:when test="${extClass.commonCode eq 'C303'}">
												    	<span class="badge badge-secondary text-center">미수료</span>
												    </c:when>
													<c:when test="${empty extReport && extClass.reportDeadLine >= date}">
											        	<span class="badge badge-warning text-center">미제출</span>
											        </c:when>
											        <c:when test="${extReport.extState eq 'B101' && extClass.reportDeadLine >= date}">
												        <span class="badge badge-warning text-center">미제출</span>
												    </c:when>
													<c:when test="${extReport.extState eq 'B102' && extClass.reportDeadLine >= date}">
												    	<span class="badge badge-info text-center">승인대기</span>
												    </c:when>
												    <c:when test="${extReport.extState eq 'B103' && extClass.reportDeadLine >= date}">
												   		<span class="badge badge-danger text-center">반려</span>
												    </c:when>
												    <c:when test="${extReport.extState eq 'B104'}">
												   		<span class="badge badge-success text-center">승인완료</span>
												    </c:when>
												    <c:when test="${extReport.extState eq 'B105'}">
												    	<span class="badge text-center" style="background-color:#605ca8; color:#ffffff;">제출기한마감</span>
												    </c:when>
												    <c:when test="${extClass.reportDeadLine < date}">
												    	<span class="badge text-center" style="background-color:#605ca8; color:#ffffff;">제출기한마감</span>
												    </c:when>
												</c:choose>
											</td>
											<td class="align-middle">
												<span class="text-danger text-bold pl-1"><fmt:formatDate value="${extClass.reportDeadLine}" pattern="yyyy-MM-dd"/> </span>
											</td>
											<td colspan="1">
												<c:if test="${extReport.extState ne 'B104'}">
													<button type="button" class="btn btn-block btn-primary btn-flat" style="width: 130px;" onclick="extReport_go('${extClass.extCode}');"
														<c:choose>
															<c:when test="${extClass.commonCode eq 'C303'}">
														    	disabled
														    </c:when>
															<c:when test="${extReport.extState eq 'B102'}">
																disabled
														    </c:when>
														    <c:when test="${extReport.extState eq 'B105'}">
																disabled
														    </c:when>
														    <c:when test="${extClass.reportDeadLine < date}">
																disabled
														    </c:when>
														</c:choose>
													>
														<c:choose>
														     <c:when test="${extClass.commonCode eq 'C303'}">
														    	미수료
														    </c:when>
															<c:when test="${empty extReport && extClass.reportDeadLine >= date}">
													        	제출하기
													        </c:when>
													        <c:when test="${extReport.extState eq 'B101' && extClass.reportDeadLine >= date}">
																제출하기
														    </c:when>
															<c:when test="${extReport.extState eq 'B102' && extClass.reportDeadLine >= date}">
														    	승인대기
														    </c:when>
														    <c:when test="${extReport.extState eq 'B103' && extClass.reportDeadLine >= date}">
														   		제출하기
														    </c:when>
														    <c:when test="${extReport.extState eq 'B105'}">
														    	마감
														    </c:when>
														    <c:when test="${extClass.reportDeadLine < date}">
														    	마감
														    </c:when>
														</c:choose>
													</button>
												</c:if>
												<c:if test="${extReport.extState eq 'B104'}">
													<button type="button" class="btn btn-block btn-primary btn-flat" style="width: 130px;" onclick="print_extReport('${extClass.extCode}');">확인하기</button>
												</c:if>
											</td>
										</tr>
									</c:forEach>
								</c:if>
							</tbody>
						</table>
					</div>
					<!-- /.card-body -->
					<c:if test="${not empty intClassList }">
						<div class="card-footer text-center">
							<%@include file="/WEB-INF/views/common/pagination.jsp"%>
						</div>
						<!-- /.pagination -->
					</c:if>
					<c:if test="${not empty extClassList }">
						<div class="card-footer text-center">
							<%@include file="/WEB-INF/views/common/pagination.jsp"%>
						</div>
						<!-- /.pagination -->
					</c:if>
				</div>
			</div>
		</div>
	</section>
	<form id="sortForm">
		<input type="hidden" name="page" value="" />
		<input type="hidden" name="sortType" value="${cri.sortType}" />
	</form>
	<form id="searchForm">
		<input type="hidden" name="page" value="" />
		<input type="hidden" name="searchType" value="" />
		<input type="hidden" name="keyword" value="" />
		<input type="hidden" name="sortType" value="${cri.sortType}" />
	</form>
	<script>
		$(document).ready(function() {
			$('.check-all').click(function() {
				$('.individual_check_boxes').prop('checked', this.checked);
			});
		});

		function fn_sort(page, sortOption) {
			var	url = "list.do";

			let sortForm = $('#sortForm');
			sortForm.find("[name='page']").val(page);
			sortForm.find("[name='sortType']").val(sortOption).val();

			sortForm.attr({
				action : url,
				method : 'get'
			}).submit();
		}

		function fn_list(page, url) {
			if (!url)
				url = "list.do";

			var searchForm = $('#searchForm');

			searchForm.find("[name='page']").val(page);
			searchForm.find("[name='searchType']").val($('select[name="searchType"]').val());
			searchForm.find("[name='keyword']").val($('input[name="keyword"]').val());
			
			searchForm.attr({
				action : url,
				method : 'get'
			}).submit();
		}
	</script>
	<script type="text/javascript">
		function intReport_go(memClNo){
			OpenWindow("<%=request.getContextPath()%>/user/myClass/clsFinished/intReportForm.pop?memClNo="+memClNo, '', 780, 850);
		}
		function extReport_go(extCode){
			OpenWindow("<%=request.getContextPath()%>/user/myClass/clsFinished/extReportForm.pop?extCode="+extCode, '', 780, 850);
		}
		
		function review_go(memClNo){
			OpenWindow("<%=request.getContextPath()%>/user/myClass/clsFinished/registClsReviewForm.pop?memClNo="+memClNo, '', 700, 500);
		}
		
		function print_intReport(memClNo){
			OpenWindow("<%=request.getContextPath()%>/user/myClass/clsFinished/printReport.pop?memClNo="+memClNo, '', 780, 850);
		}
		function print_extReport(extCode){
			OpenWindow("<%=request.getContextPath()%>/user/myClass/clsFinished/printReport.pop?extCode="+extCode, '', 780, 850);
		}
	</script>

</body>










































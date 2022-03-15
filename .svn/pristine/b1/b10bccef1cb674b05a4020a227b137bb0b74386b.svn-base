<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }" />

<c:set var="faqList" value="${dataMap.faqList }" />
<c:set var="faqEList" value="${dataMap.faqEList }" />
<c:set var="faqCList" value="${dataMap.faqCList }" />
<c:set var="faqLList" value="${dataMap.faqLList }" />

<head></head>
<title>자주묻는질문</title>

<body>
	<!-- 메인 헤더 -->
	<!-- Content Header (Page header) -->
	<div class="content-header pb-0">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h4 class="m-0">자주묻는질문</h4>
				</div>
				<!-- /.col -->
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item">
							<i class="fas fa-home"></i>
						</li>
						<li class="breadcrumb-item">
							<a href="#">운영관리</a>
						</li>
						<li class="breadcrumb-item">자주묻는질문</li>
					</ol>
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container-fluid -->
	</div>
	<!-- /.content-header -->
	
	<div class="container-fluid ">

			<div class="row m-0 mt-3">
				<div class="col-7">
					<div class="row mb-3">
						<select class=" form-control form-control-sm" name="sortSelect" onchange="chageLangSelect()" style="width: 100px; height: 38px;">
							<option value="" ${cri.sortType eq '' ? 'selected':'' }>분류</option>
							<option value="c" ${cri.sortType eq 'c' ? 'selected':'' }>수료문의</option>
							<option value="l" ${cri.sortType eq 'l' ? 'selected':'' }>학습문의</option>
							<option value="e" ${cri.sortType eq 'e' ? 'selected':'' }>기타</option>
						</select>
						<input type="text" placeholder="검색할 단어를 입력하세요" name="keyword" class="form-control" value="${ param.keyword }" style="width: 575px;">
						<button class="col-md-1 btn btn-secondary float-right" onclick="list_go(1);">검색</button>
					</div>	
					<div class="card row">
						<div class="card-header">
							<h3 class="card-title font-weight-bold">목록</h3>
							<button onclick="location.href='registForm.do'" type="button" class="btn btn-block btn-secondary btn-sm float-right" style="width : 50px;">등록</button>
						</div>
						<!-- /.card-header -->
						<div class="card-body p-0"  style="height: 590px;">
							<div style="height: 530px;">
								<table class="table table-sm">
									<thead>
										<tr class="text-center" style="background-color: #F5F4F4;">
											<th class="col-2 p-0 py-1">번호</th>
											<th class="col-8" style="width: 491px;">제목</th>
											<th class="col-2 p-0 py-1">분류</th>

										</tr>
									</thead>
									<tbody id="list">
										<c:if test="${not empty faqList }">
											<c:forEach items="${ faqList }" var="faq">
												<tr>
													<td class="text-center">
														${ faq.faqNo}
													</td>
													<td style="cursor: pointer; max-width: 491px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;" 
														onclick="location.href='detail.do?faqNo=${ faq.faqNo }';">
														${ faq.faqQuestion}
													</td>
													<td class="text-center p-2" >
														<c:if test="${faq.askSort eq 'c'}">
															<span class="badge badge-warning">수료문의</span>
														</c:if>
														<c:if test="${faq.askSort eq 'l'}">
															<span class="badge badge-success">학습문의</span>
														</c:if>
														<c:if test="${faq.askSort eq 'e'}">
															<span class="badge badge-info">기타문의</span>
														</c:if>
													</td>
												</tr>
											</c:forEach>
										</c:if>
										<c:if test="${empty faqList }">
											<tr class="text-cemter">
												<td colspan="3">
													등록된 문의가 없습니다.
												</td>
											</tr>
										</c:if>
										
									</tbody>
								</table>
								
							</div>
							<%@include file="/WEB-INF/views/common/pagination.jsp" %>
						</div>
						<!-- /.card-body -->
					</div>
				</div>
				<div class="col-5 pr-1">
					<div class="card bg-warning" style="height: 222px;">
						<div class="card-header row ml-1" style="width: 510px;">
							<div style="width: 455px;">
								<h4 class="card-title font-weight-bold">수료문의</h4>
							</div>
							
							<i id="time" class="fas fa-caret-up" style="font-size: 20px; cursor: pointer;" onclick="recent('c')"></i>
						</div>
						<!-- /.card-header -->
						<div class="card-body p-0 bg-light"  style="height: 219px;">
							<table class="table table-sm" id="test">
								<thead>
									<tr  class="text-center" style="background-color: #F5F4F4;">
										<th >번호</th>
										<th style="width: 430px;">제목</th>
		
									</tr>
								</thead>
								<tbody class="bg-light" id="recentC">
									<c:if test="${not empty faqCList }">
										<c:forEach items="${ faqCList }" var="faqC">
											<tr>
						 						<td class="text-center">
													${faqC.faqNo }
												</td>
												<td onclick="location.href='detail.do?faqNo=${ faqC.faqNo }';" 
													style="cursor: pointer; max-width: 430px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
													${ faqC.faqQuestion}
												</td>
											</tr>
										</c:forEach>
									</c:if>
									<c:if test="${empty faqCList }">
										<tr class="text-cemter">
											<td colspan="2">
												등록된 문의가 없습니다.
											</td>
										</tr>
									</c:if>
				 					
								</tbody>
							</table>
						</div>
						<!-- /.card-body -->
					</div>
					
					<div class="card bg-success" style="height: 222px;">
						<div class="card-header row ml-1" style="width: 510px; color: black;">
							<div style="width: 455px;">
								<h4 class="card-title font-weight-bold">학습문의</h4>
							</div>
							<i id="time" class="fas fa-caret-up" style="font-size: 20px; cursor: pointer;" onclick="recent('l')"></i>
						</div>
						<!-- /.card-header -->
						<div class="card-body p-0 bg-light"  style="height: 219px;">
							<table class="table table-sm" id="test">
								<thead>
									<tr class="text-center" style="background-color: #F5F4F4; color: black;">
										<th >번호</th>
										<th style="width: 450px;">제목</th>
		
									</tr>
								</thead>
								<tbody class="bg-light" id="recentL">
									<c:if test="${not empty faqLList }">
										<c:forEach items="${ faqLList }" var="faqL">
											<tr>
						 						<td class="text-center">
													${faqL.faqNo }
												</td>
												<td onclick="location.href='detail.do?faqNo=${ faqL.faqNo }';"
													style="cursor: pointer; max-width: 430px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
													${ faqL.faqQuestion}
												</td>
											</tr>
										</c:forEach>
									</c:if>
									<c:if test="${empty faqLList }">
										<tr class="text-cemter">
											<td colspan="2">
												등록된 문의가 없습니다.
											</td>
										</tr>
									</c:if>
								</tbody>
							</table>
						</div>
						<!-- /.card-body -->
					</div>
					
					<div class="card bg-info" style="height: 222px;">
						<div class="card-header row ml-1" style="width: 510px; color: black;">
							<div style="width: 455px;">
								<h4 class="card-title font-weight-bold">기타문의</h4>
							</div>
							
							<i id="time" class="fas fa-caret-up" style="font-size: 20px; cursor: pointer;" onclick="recent('e')"></i>
						</div>
						<!-- /.card-header -->
						<div class="card-body p-0 bg-light"  style="height: 219px;">
							<table class="table table-sm" id="test">
								<thead>
									<tr class="text-center" style="background-color: #F5F4F4; color: black;">
										<th >번호</th>
										<th style="width: 400px;">제목</th>
		
									</tr>
								</thead>
								<tbody class="bg-light" id="recentE">
				 					<c:if test="${not empty faqEList }">
										<c:forEach items="${ faqEList }" var="faqE">
											<tr>
						 						<td class="text-center">
													${faqE.faqNo }
												</td>
												<td onclick="location.href='detail.do?faqNo=${ faqE.faqNo }';"
													style="cursor: pointer; max-width: 430px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
													${ faqE.faqQuestion}
												</td>
											</tr>
										</c:forEach>
									</c:if>
									<c:if test="${empty faqEList }">
										<tr class="text-cemter">
											<td colspan="2">
												등록된 문의가 없습니다.
											</td>
										</tr>
									</c:if>
								</tbody>
							</table>
						</div>
						<!-- /.card-body -->
					</div>
					
				</div>
			</div>

		</div>
		<%@ include file="./list_js.jsp"%>
		<script> 
			function chageLangSelect(){ 
				$('input[name="sortType"]').val($("select option:selected").val());
				// alert($("select option:selected").val())
			} 
			
			function recent(sort) {
				var searchType = "up"
				var icon = $('#time').attr('class')
				if(icon == 'fas fa-caret-up'){
					$('#time').attr('class','fas fa-caret-down')
					searchType = "down"
				}
				if(icon == 'fas fa-caret-down'){
					$('#time').attr('class','fas fa-caret-up')
					searchType = "up"
				}
				getPage(sort, searchType)
				
			}
		</script>


</body>
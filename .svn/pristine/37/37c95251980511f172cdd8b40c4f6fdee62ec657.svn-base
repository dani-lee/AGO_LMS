<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="orderClassList" value="${dataMap.orderClassList }" />
<c:set var="memberClassList" value="${dataMap.memberClassList }" />
<c:set var="cri" value="${dataMap.cri }" />


<head>

</head>
<title>수강내역</title>

<body>
		<!-- 메인 헤더 -->
		<!-- Content Header (Page header) -->
		<div class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h4 class="m-0">수강 내역</h4>
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
							<li class="breadcrumb-item">수강 내역</li>
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
			<div class="row m-0">
				<div class="col-4">
					<div class="card row">
						<div class="card-header">
							<h3 class="card-title font-weight-bold">강의목록</h3>
						</div>
						<!-- /.card-header -->
						<div class="p-0"  style="height: 630px;">
								<div class="text-cneter px-3 py-1 font-weight-bold" style="border-bottom:1.5px soild gray; height: 35px; width: 100%; background-color:#E6EFFC;">
									강의명
								</div>
							<div id="reviewDetail" style="height: 610px; overflow-y: auto; -ms-overflow-style: none;">
								<ul class="products-list product-list-in-card" style="border: none;">
									<c:if test="${not empty orderClassList}">
										<c:forEach items="${orderClassList}" var="orderClass">
											<li id="${orderClass.opcl}" class="item px-3 py-1" style="cursor: pointer; height: 33px; border-bottom:1.5px soild gray;" onclick="getPage(${orderClass.opcl})">
												<span >[${orderClass.opcl}]&nbsp;${orderClass.clName }</span>
											</li>
										</c:forEach>
									</c:if>
									<c:if test="${empty orderClassList}">
										<li class="item px-3 py-1" style="height: 33px; border-bottom:1.5px soild gray;">
											<span >지시한 과목이 존재하지 않습니다.</span>
										</li>
									</c:if>
								</ul>

							</div>
						</div>
						<!-- /.card-body -->
					</div>
				</div>
				<div class="col-8 align-items-center">
					<div class="card-body px-2 py-0">
						<div class="row mb-2 px-2">
							<select class="form-control" name="searchType" style="width: 120px;">
								<option value="c" ${cri.searchType eq 'c' ? 'selected':'' }>강의명</option>
								<option value="n" ${cri.searchType eq 'n' ? 'selected':'' }>부서원명</option>
							</select>
							<input type="text" placeholder="제목을 입력해주세요..." name="keyword" class="form-control" value="${ param.keyword }" style="width: 622px;">
							<button class="col-md-1 btn btn-primary float-right" onclick="list_go();">검색</button>
						</div>

						<div class="card"  style="height: 630px;">
							<div class="card-header">
								<h3 class="card-title font-weight-bold" style="width: 705px;">수강내역</h3>
								<button type="button" class="col-1 btn btn-block btn-outline-primary btn-xs" onclick="allView()">전체보기</button>
							</div>
							<div class="text-center row px-3 py-1 m-0 font-weight-bold" style="border-bottom:1.5px soild gray; height: 35px; width: 100%; background-color:#E6EFFC;">
								<div style="width: 380px;">강의명</div>
								<div style="width: 200px;">진도율</div>
								<div style="width: 200px;">이름</div>
							</div>

							<div  id="detailReviewList"  style="height: 535px; overflow-x: hidden; overflow-y: auto; -ms-overflow-style: none;">
								<ul id="memberClass" class="products-list product-list-in-card">
									<c:if test="${not empty memberClassList}">
										<c:forEach items="${memberClassList}" var="memberClass">
											<li class="item px-3 py-1 row mr-0 ml-1" style="width: 805px; height: 33px; border-bottom:1.5px soild gray;">
												<div style="width: 380px;">${memberClass.clName }</div>
												<div class="text-center px-2" style="width: 195px;">
													<div class="progress">
			                                            <div class="progress-bar bg-success" role="progressbar" style="width: ${memberClass.progRate }%" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">${memberClass.progRate }%</div>
			                                        </div>
		                                        </div>
												<div class="text-center" style="width: 195px;">${memberClass.memName }</div>
											</li>
										</c:forEach>
									</c:if>
									<c:if test="${empty memberClassList}">
										<li class="item px-3 py-1 row m-0" style="width: 787px; height: 33px; border-bottom:1.5px soild gray;">
											<span >부서원의 강의내역이 존재하지 않습니다.</span>
										</li>
									</c:if>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<form id="jobForm">
			<input type="hidden" name="searchType" value="" />
			<input type="hidden" name="keyword" value="" />
		</form>
		<%@ include file="./classList_js.jsp"%>
		<script>
			var allHtml
			window.onload = function() {
				allHtml = $('#memberClass').html()

			}

			function chageLangSelect(){
				$('input[name="sortType"]').val($("select option:selected").val());
				// alert($("select option:selected").val())
			}


			$.fn.extend({
				mouse_wheel : function() {
					$(this).on('mousewheel', function(e) {
						if (e.originalEvent.wheelDelta >= 120) {
							this.scrollTop -= 50;
						} else if (e.originalEvent.wheelDelta <= -120) {
							this.scrollTop += 50;
						}
						return false;
					});
				}
			});

			$('#reviewDetail').mouse_wheel();

			function list_go() {
				var jobForm = $('#jobForm');

				jobForm.find("[name='searchType']").val($('select[name="searchType"]').val());
				jobForm.find("[name='keyword']").val($('input[name="keyword"]').val());

				jobForm.attr({
					action : 'reportList.do',
					method : 'get'
				}).submit();
			}

			function allView() {
				var jobForm = $('#jobForm');

				jobForm.find("[name='searchType']").val(' ');
				jobForm.find("[name='keyword']").val(' ');

				jobForm.attr({
					action : 'reportList.do',
					method : 'get'
				}).submit();
/* 				$('li').removeClass('bg-primary');
				$('#memberClass').empty();
				$('#memberClass').append(allHtml); */
			}
		</script>


</body>
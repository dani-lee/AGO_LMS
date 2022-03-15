<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="classVO" value="${dataMap.classVO }" />
<c:set var="chapterList" value="${dataMap.chapterList}" />
<c:set var="reviewList" value="${dataMap.reviewList}" />
<c:set var="dpId" value="${dataMap.dpId }" />
<c:set var="departmentClassList" value="${dataMap.departmentClassList }" />
<c:set var="memberClassList" value="${dataMap.memberClassList}" />
<c:set var="intrList" value="${dataMap.intrList }" />
<c:set var="sysdate" value="${dataMap.sysdate }" />

<head></head>

<title></title>

<body>
<!-- 메인 헤더 -->
	<!-- Content Header (Page header) -->
	<div class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h4 class="m-0">
						<c:if test="${classVO.clCate  eq 'A201'}">
							신입사원교육
						</c:if>
						<c:if test="${classVO.clCate  eq 'A202'}">
							일반교육
						</c:if>
						<c:if test="${classVO.clCate  eq 'A203'}">
							자기개발/취미
						</c:if>
					</h4>
				</div>
				<!-- /.col -->
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item">
							<i class="fas fa-home"></i>
						</li>
						<li class="breadcrumb-item">
							<a href="#">수강신청</a>
						</li>
						<li class="breadcrumb-item active">
							<c:if test="${classVO.clCate  eq 'A201'}">신입사원교육</c:if>
							<c:if test="${classVO.clCate  eq 'A202'}">일반교육</c:if>
							<c:if test="${classVO.clCate  eq 'A203'}">자기개발/취미</c:if>
						</li>
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
		
		<div class="row pl-2 pb-2">
			<img src="/ago/user/rcls/common/getImg.do?fileNM=${classVO.clImg }" style="width: 250px; height: 200px;">
			<div class=" class-detail row" style="width: 905px; margin-left: 10px;">

				<div class="p-3">
					<h4 class="font-weight-bold" style="width: 870px;">
						${classVO.clName } &nbsp;
						<c:if test="${not empty intrList }">
							<c:set var="intrClassExist" value="false" />
							<c:forEach var="intr" items="${intrList}" varStatus="intrCount">
								<c:if test="${classVO.opcl eq intr}">
									<c:set var="intrClassExist" value="true" />
								</c:if>
							</c:forEach>
							<c:if test="${intrClassExist }">
								<i style="font-size: 25px;" id='bookmark${classVO.opcl}' class="fas fa-bookmark text-danger" onclick="bookmark(${classVO.opcl});"></i>
							</c:if>
							<c:if test="${not intrClassExist }">
								<i style="font-size: 25px;" id='bookmark${classVO.opcl}' class="far fa-bookmark" onclick="bookmark(${classVO.opcl});"></i>
							</c:if>
						</c:if>
						<c:if test="${empty intrList }">
							<i style="font-size: 25px;" id='bookmark${classVO.opcl}' class="far fa-bookmark" onclick="bookmark(${classVO.opcl});"></i>
						</c:if>

					</h4>
					<h6>
						<c:if test="${classVO.clFormat eq 'A601'}">
							<span class="badge bg-info">오프라인</span>
						</c:if>
						<c:if test="${classVO.clFormat eq 'A602'}">
							<span class="badge bg-primary">온라인</span>
						</c:if>
						<c:if test="${classVO.clFormat eq 'A603'}">
							<span class="badge badge-success">실시간</span>
						</c:if>
						<c:if test="${classVO.clDivision eq 'A501'}">
							<span class="badge badge-danger">필수</span>
						</c:if>
						<c:if test="${classVO.clDivision eq 'A502'}">
							<span class="badge badge-warning">선택</span>
						</c:if>
						<c:if test="${not empty departmentClassList }">
							<c:forEach var="departmentClass" items="${departmentClassList}" varStatus="i">
								<c:if test="${departmentClass.dpId eq dpId}">
									<c:if test="${departmentClass.opcl eq classVO.opcl}">
										<span class='text-danger'>(부서 필수 강의입니다.)</span>
									</c:if>
								</c:if>
							</c:forEach>
						</c:if>

					</h6>
					<br>
					<br>
					<h6 class="font-weight-bold mb-1">이수점수 : ${classVO.clPoint }점</h6>
					<span class="row h5 m-0 py-1 text-warning">
						<c:forEach var="i" begin="1" end="${classVO.frontScope}">
							<i class="fas fa-star"></i>
						</c:forEach>
						<c:if test="${classVO.backScope >= 5}">
							<i class="fas fa-star-half-alt"></i>
						</c:if>
						<c:forEach var="i" begin="1" end="${classVO.restScope}">
							<i class="far fa-star"></i>
						</c:forEach>
						<span>(${classVO.scope})</span>

					</span>

				</div>

			</div>
			<div class="col-1">
				<div style="height: 140px;">
					<c:set var="learningCheck" value="false" />
					<!-- 학습중인 강의인지 확인 -->
					<c:if test="${not empty memberClassList }">
						<c:forEach var="memberClass" items="${memberClassList}">
							<c:if test="${memberClass.opcl eq classVO.opcl}">
								<c:set var="learningCheck" value="true" />
							</c:if>
						</c:forEach>
					</c:if>
					<!-- 학습중인 강의인 경우 -->
					<c:if test="${learningCheck}">
						<input id="${classVO.opcl}" style="height: 40px;" type="button" class="p-1 btn btn-block btn-primary" value="학습중" />
					</c:if>
					<!-- 학습중인 강의가 아닌 경우 -->
					<c:if test="${not learningCheck}">
						<c:if test="${not empty departmentClassList }">
							<c:if test="${classVO.postSdate <= sysdate}">
								<c:forEach var="departmentClass" items="${departmentClassList}" varStatus="i">
									<c:if test="${departmentClass.dpId ne dpId}">
										<!-- 타부서 과목일 경우 -->
										<c:if test="${departmentClass.opcl eq classVO.opcl}">
											<input id="${classVO.opcl}" style="height: 40px;" type="button" class="p-1 btn btn-block btn-primary" onclick="noregist()" value="수강신청" />
										</c:if>
										<!-- 타부서 과목이 아닌 경우 -->
										<c:if test="${departmentClass.opcl ne classVO.opcl}">
											<input id="${classVO.opcl}" style="height: 40px;" type="button" class="p-1 btn btn-block btn-primary" onclick="regist(${classVO.opcl},'${classVO.studyTime }', '${classVO.lDate }')" value="수강신청" />
										</c:if>
									</c:if>
									<c:if test="${departmentClass.dpId eq dpId}">
										<input id="${classVO.opcl}" style="height: 40px;" type="button" class="p-1 btn btn-block btn-primary" onclick="regist(${classVO.opcl},'${classVO.studyTime }', '${classVO.lDate }')" value="수강신청" />
									</c:if>
								</c:forEach>
							</c:if>
							<c:if test="${classVO.postSdate > sysdate}">
								<input disabled="disabled" id="${classVO.opcl}" style="height: 40px; cursor: default;" type="button" class="p-1 btn btn-block btn-primary" value="수강신청" />
							</c:if>
						</c:if>
						<c:if test="${empty departmentClassList }">
							<input id="${classVO.opcl}" style="height: 40px;" type="button" class="p-1 btn btn-block btn-primary" onclick="regist(${classVO.opcl},'${classVO.studyTime }', '${classVO.lDate }')" value="수강신청" />
						</c:if>
					</c:if>
					
				</div>
				<button class="btn btn-primary float-right" onclick="location.href='list.do'">목록</button>
			</div>
		</div>


		<div class="row navList">
			<div class="col-12">
				<div class="list-group d-flex flex-row" id="list-tab" role="tablist">
					<a class="list-group-item list-group-item-action active" id="list-review-list" data-toggle="list" href="#list-review1" role="tab" aria-controls="info" onclick="iframeResize(this);">상세 정보</a>
					<a class="list-group-item list-group-item-action" id="list-review-list" data-toggle="list" href="#list-review2" role="tab" aria-controls="content" onclick="iframeResize(this);">강의 내용</a>
					<a class="list-group-item list-group-item-action" id="list-review-list" data-toggle="list" href="#list-review3" role="tab" aria-controls="messages" onclick="iframeResize(this);">강의 목차</a>
					<a class="list-group-item list-group-item-action" id="list-review-list" data-toggle="list" href="#list-review4" role="tab" aria-controls="messages" onclick="iframeResize(this);">수강 후기</a>
				</div>
			</div>
		</div>
		<div class="tab-content" id="nav-tabContent">

			<div class="tab-pane fade show active" id="list-review1" role="tabpanel" aria-labelledby="list-content-list">
				<table class="table">
					<tr>
						<td class="font-weight-bold text-center" style="background-color: #F5F4F4; width: 250px;">학점현황</td>
						<td class="">13/40</td>
						<td class="font-weight-bold text-center" style="background-color: #F5F4F4; width: 250px;">이수 점수</td>
						<td>${classVO.clPoint }</td>
					</tr>
					<tr>
						<td class="font-weight-bold text-center align-middle" style="background-color: #F5F4F4; width: 250px;">수료기준안내</td>
						<td colspan="3" class="pl-2" style=" width: 1020px;">
							<span style="white-space:  pre-wrap; width: 1020px;">${classVO.clIntro }</span>
						</td>
					</tr>

				</table>
			</div>
			<div class="tab-pane fade" id="list-review2" role="tabpanel" aria-labelledby="list-content-list" style="">
				<table class="table">
					<tr>
						<td class="font-weight-bold text-center" style="background-color: #F5F4F4; width: 250px;">수강인원</td>
						<td class="pl-2">${classVO.enrPers }</td>
						<td class="font-weight-bold text-center" style="background-color:#F5F4F4; width: 250px;">총 이수시간</td>
						<td class="pl-2">${classVO.clCreditTime }시간</td>
					</tr>
					<tr>
						<td class="font-weight-bold text-center" style="background-color: #F5F4F4; width: 250px;">신청기간</td>
						<td class="pl-2">${classVO.posts} &nbsp;~&nbsp; ${classVO.poste}</td>
						<td class="font-weight-bold text-center" style="background-color: #F5F4F4; width: 250px;">교육기간</td>
						<td class="pl-2">
							<c:if test="${classVO.studyDate ne 'D103'}">
							 		신청일로부터 ${classVO.studyTime }일간
							 	</c:if>
							<c:if test="${classVO.studyDate eq 'D103'}">
							 		 ${classVO.studyTime }
							 	</c:if>

						</td>
					</tr>
					<tr>
						<td class="font-weight-bold text-center align-middle" style="background-color: #F5F4F4; width: 250px;">과정소개</td>
						<td colspan="3" class="pl-2">
							<span style="white-space: pre-wrap;">${classVO.cutLine }</span>
						</td>
					</tr>
				</table>

			</div>
			<!-- 여기까지 -->


			<!-- 강의목차 -->
			<div class="tab-pane fade" id="list-review3" role="tabpanel" aria-labelledby="list-messages-list">
				<div style="overflow-y: auto; height: 600px;">
					<table class="table">
						<thead>
							<tr class="text-center" style="background-color:#F5F4F4;">
								<th class="col-1">회차</th>
								<th class="">회차명</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${not empty chapterList }">
								<c:forEach var="chapter" items="${chapterList}" varStatus="vs">
									<tr class="text-center">
										<td>${chapter.clChapNum}</td>
										<td>${chapter.clChapName}</td>
									</tr>
								</c:forEach>
							</c:if>
							<c:if test="${ empty chapterList }">
								<tr>
									<td class="text-center" colspan="2">등록된 목차가 없습니다.</td>
								</tr>
							</c:if>

						</tbody>
					</table>
				</div>
			</div>
			<!--/강의목차-->



			<!-- 수강후기 -->
			<div class="tab-pane fade" id="list-review4" role="tabpanel" aria-labelledby="list-messages-list">

				<div class="reviews-list" style="overflow-y: auto; height: 600px;">
					<div class="card">
						<c:if test="${not empty reviewList }">
							<c:forEach var="review" items="${reviewList}" varStatus="vs">
								<div class="card-header ui-sortable-handle" style="cursor: move;">
									<div class="row">
										<h6 class="font-weight-bold m-0 row col-9">
											${review.memId }
											<span class="row pl-3 text-warning" name="review_rate" style="color: #F2A516;">
												<c:forEach var="i" begin="1" end="${review.frontScope}">
												<i class="fas fa-star"></i>
												</c:forEach>
												<c:if test="${review.backScope >= 5}">
													<i class="fas fa-star-half-alt"></i>
												</c:if>
												<c:forEach var="i" begin="1" end="${review.restScope}">
													<i class="far fa-star"></i>
												</c:forEach>
												&nbsp; (${review.scope })
											</span>
										</h6>
										<h6 class="font-weight-bold text-right col-3">${review.date}</h6>
									</div>
								</div>
								<div class="p-3">
									<span style="white-space: pre-wrap;"> ${review.reviewContent}</span>
								</div>
							</c:forEach>
						</c:if>
						<c:if test="${ empty reviewList }">
							<div class="text-center p-3">등록된 후기가 없습니다.</div>
						</c:if>

					</div>


				</div>
			</div>
			<!-- 수강후기 끝 -->
		</div>
		
	</div>
	</section>



	<script type="text/javascript">

	function iframeResize(click) {
		parent.resize(window.parent.document.getElementById("ifr"));
	}

	function bookmark(opcl) {
		var markState = true;
		var result = "관심강의로 추가했습니다.";
		if($('#bookmark'+opcl+'').attr('class') == 'far fa-bookmark'){
			$('#bookmark'+opcl+'').attr('class', 'fas fa-bookmark text-danger');
			markState = true;
			result = "관심강의로 등록했습니다.";
		}else{
			$('#bookmark'+opcl+'').attr('class', 'far fa-bookmark');
			markState = false;
			result = "관심강의를 해제했습니다.";
		}

		 $.ajax({
	         url         : 'bookmark',
	         data        : {	'opcl' : opcl
	        	 			   ,'markState' : markState
	         			   },
	         type        : 'post',
	         success     : function(data){
				// alert(result);

	         },
	         error         : function(error){
	             //alert("현재 사진 업로드가 불가합니다. \n 관리자에게 연락바랍니다.");
	             AjaxErrorSecurityRedirectHandler(error.status);
	             console.log(error.status);
	         }
	     })

	}
	function regist(opcl, endDay, lDate) {
		if($("input[name='sortType']").val() == 's'){
			if($('input[name=positionId]').val() != 'PS101'){
				alert("신입사원만 수강 가능합니다.");
			}else{
				registFunction(opcl, endDay, lDate);
			}		
		}else{
			registFunction(opcl, endDay, lDate);
		}
		
		
		
	}
	
	function registFunction(opcl, endDay, lDate) {
		// alert($('#'+opcl+'').attr('value'));
		 if($('#'+opcl+'').attr('value') == '수강신청'){

			 $.ajax({
		         url         : 'regist',
		         data        : {	'opcl' : opcl,
		        					'endDay' : endDay,
		        					'lecDate' : lecDate
		         			   },   
		         type        : 'post',
		         success     : function(data){
		        	 if($('#bookmark'+opcl+'').attr('class') != 'far fa-bookmark'){
		        		 markState = false;
		        		 $.ajax({
		        	         url         : 'bookmark',
		        	         data        : {	'opcl' : opcl
		        	        	 			   ,'markState' : markState
		        	         			   },
		        	         type        : 'post',
		        	         success     : function(data){
		        	        	 $('#bookmark'+opcl+'').attr('class', 'far fa-bookmark');
		        	         },
		        	         error         : function(error){
		        	             AjaxErrorSecurityRedirectHandler(error.status);
		        	             console.log(error.status);
		        	         }
		        	     })
		        		 
		        	 }
		        	 $('#bookmark'+opcl+'').attr('onclick', '');
		        	$('#'+opcl+'').attr('value','학습중');

		         },
		         error         : function(error){
		             AjaxErrorSecurityRedirectHandler(error.status);
		             console.log(error.status);
		         }
		     })

		 } 
	}
/* 	function regist(opcl, endDay) {

		// alert($('input[type="button"]').attr('value'));
  		 if($('input[type="button"]').attr('value') == '수강신청'){

			 $.ajax({
		         url         : 'regist',
		         data        : {	'opcl' : opcl,
		        	 				'endDay' : endDay
		         			   },
		         type        : 'post',
		         success     : function(data){
		        	 bookmark(opcl);
		        	 $('#bookmark'+opcl+'').attr('onclick', '');
					//alert(result);
					// 수강취소는...? -> 수강내역에서 하기

		        	$('input[type="button"]').attr('value','학습중');

		         },
		         error         : function(error){
		             //alert("현재 사진 업로드가 불가합니다. \n 관리자에게 연락바랍니다.");
		             AjaxErrorSecurityRedirectHandler(error.status);
		             console.log(error.status);
		         }
		     })

		 }else{
			 console.log("신청취소")
		 }
	} */

	function noregist() {
		alert("타부서 강의는 수강할 수 없습니다.")
	}

</script>

</body>
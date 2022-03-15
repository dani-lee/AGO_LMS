<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="claz" value="${ dataMap.claz }" />
<c:set var="avg" value="${ dataMap.avg }" />


<head></head>

<title>학습중인 강의</title>

<body>
<script>
if(${test eq "done"}){
	window.opener.location.reload(true);
	window.close();
}
</script>
	<!-- 메인 헤더 -->
	<!-- Content Header (Page header) -->
	<div class="content-header pb-0">
		<div class="container-fluid">
			<div class="row mb-2">

				<div class="col-sm-6">
					<c:choose>
						<c:when test="${from eq 'completed'}">
							<h4 class="m-0">종료된 강의</h4>
						</c:when>
						<c:otherwise>
							<h4 class="m-0">학습중인 강의</h4>
						</c:otherwise>
					</c:choose>
					
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
						<li class="breadcrumb-item">강의 상세</li>
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

			<div class="row pl-3 pb-2">
				<img src="/ago/user/rcls/common/getImg.do?fileNM=${claz.clImg }" style="width: 250px; height: 200px;">
				<div class=" class-detail row" style="margin-left: 10px;">
				
					<div class="pl-3 pb-3 pt-3 pr-0" style=" height: 200px;">
	
	
						<h4 class="font-weight-bold" style="width: 870px;">${ claz.clName } &nbsp;</h4>
						<h6>
							<c:if test="${claz.clFormat eq '오프라인'}">
								<span class="badge bg-info">오프라인</span>
							</c:if>
							<c:if test="${claz.clFormat eq '온라인'}">
								<span class="badge bg-primary">온라인</span>
							</c:if>
							<c:if test="${claz.clFormat eq '실시간'}">
								<span class="badge badge-success">실시간</span>
							</c:if>
							<c:if test="${claz.clDivision eq '필수'}">
								<span class="badge badge-danger">필수</span>
							</c:if>
							<c:if test="${claz.clDivision eq '선택'}">
								<span class="badge badge-warning">선택</span>
							</c:if>
						</h6>
						<br>	<br>
						<h6 class="font-weight-bold mb-1">이수점수 : ${claz.clPoint }점</h6>
						<span class="row h5 m-0 py-1 text-warning"> 
							<c:forEach var="i" begin="1" end="${claz.frontScope}">
								<i class="fas fa-star"></i>
							</c:forEach> <c:if test="${claz.backScope >= 5}">
								<i class="fas fa-star-half-alt"></i>
							</c:if> <c:forEach var="i" begin="1" end="${claz.restScope}">
								<i class="far fa-star"></i>
							</c:forEach>
							<c:if test="${claz.scope ne 0}">
								<span>(<fmt:formatNumber value="${claz.scope}" pattern=".00"/>)</span>
							</c:if>
							 <c:if test="${claz.scope eq 0}">
								<span>(0)</span>
							</c:if>
						</span>
						<br>
						
					</div>
				</div>
				<div class="col-1 pl-0 pt-3">
					<div style="height:140px;">
						<c:if test="${progRate eq 0 }">
							<button type="button" class="btn btn-block btn-secondary" style="width:100px; height: 40px;" onclick="dropCl('${claz.opcl}');">수강취소</button>
						</c:if>
					</div>
					<div>
						<!-- <button class="btn btn-primary float-right" onclick="fn_regist()"> &nbsp;등록&nbsp;</button> -->
						<c:if test="${empty from }">
						<button class="btn btn-default btn-sm float-right" onclick="location.href='list.do?mCode=M000201'">
							<i class="la la-angle-double-left"></i>
							&nbsp;목록
						</button>
						</c:if>
						<c:if test="${from eq 'mainHome' }">
						<button class="btn btn-default btn-sm float-right" onclick="location.href='<%=request.getContextPath()%>/user/main.do'">
							<i class="la la-angle-double-left"></i>
							&nbsp;목록
						</button>
						</c:if>
					</div>
				</div>
				
			</div>
			<div class="col-12">
				<div class="card card-primary card-outline card-outline-tabs">
					<div class="card-header p-0 border-bottom-0">
						<ul class="nav nav-tabs" id="custom-tabs-four-tab" role="tablist">
							<li class="nav-item">
								<a class="nav-link" id="custom-tabs-four-info-tab" data-toggle="pill" href="#custom-tabs-four-info" role="tab" aria-controls="custom-tabs-four-info" aria-selected="false" onclick="restInfo();">강의정보</a>
							</li>
							<li class="nav-item">
								<a class="nav-link active" id="custom-tabs-four-list-tab" data-toggle="pill" href="#custom-tabs-four-list" role="tab" aria-controls="custom-tabs-four-list" aria-selected="true" onclick="restInfo();">강의목차</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" id="custom-tabs-four-attach-tab" data-toggle="pill" href="#custom-tabs-four-attach" role="tab" aria-controls="custom-tabs-four-attach" aria-selected="false" onclick="restDoc();">자료실</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" id="custom-tabs-four-review-tab" data-toggle="pill" href="#custom-tabs-four-review" role="tab" aria-controls="custom-tabs-four-review" aria-selected="false" onclick="restReview();">수강후기</a>
							</li>
						</ul>
					</div>
					<div class="card-body" style="min-height: 530px;">
						<div class="tab-content" id="custom-tabs-four-tabContent">
							<div class="tab-pane fade" id="custom-tabs-four-info" role="tabpanel" aria-labelledby="custom-tabs-four-info-tab"></div>
							<div class="tab-pane fade active show" id="custom-tabs-four-list" role="tabpanel" aria-labelledby="custom-tabs-four-list-tab"></div>
							<div class="tab-pane fade" id="custom-tabs-four-attach" role="tabpanel" aria-labelledby="custom-tabs-four-attach-tab"></div>
							<div class="tab-pane fade" id="custom-tabs-four-review" role="tabpanel" aria-labelledby="custom-tabs-four-review-tab"></div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</section>

	<%@ include file="./detail_js.jsp"%>

<script>
 function dropCl(opcl){

	 var check = confirm("해당 강의를 취소하시겠습니까?");
	 if(check){
		 location.href="dropClass.do?opcl="+opcl;
	 }
	 console.log(opcl);
 }

</script>

</body>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }" />
<c:set var="askList" value="${dataMap.askList }" />

<head></head>

<title></title>

<body>
	<!-- 메인 헤더 -->
	<!-- Content Header (Page header) -->
	<div class="content-header pb-0"  >
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h4 class="m-0">내 문의 내역</h4>
				</div>
				<!-- /.col -->
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item">
							<i class="fas fa-home"></i>
						</li>
						<li class="breadcrumb-item">
							<a href="<%=request.getContextPath()%>/user/myPage/myInfo/main.do">마이페이지</a>
						</li>
						<li class="breadcrumb-item">내 문의 내역</li>
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
			<div class="p-0 m-0 text-left col-4 float-left align-self-end">
				<select class="col-md-3 form-control form-control-sm" name="sortSelect" onchange="sort()">
					<option value="" ${cri.sortType eq '' ? 'selected':'' }>분류</option>
					<option value="c" ${cri.sortType eq 'c' ? 'selected':'' }>수료문의</option>
					<option value="s" ${cri.sortType eq 's' ? 'selected':'' }>학습문의</option>
					<option value="etc" ${cri.sortType eq 'etc' ? 'selected':'' }>기타</option>
				</select>
			</div>
			<div class="row col-8 justify-content-end p-0 mr-1">
				<input type="text" placeholder="제목을 입력해 주세요..." name="keyword" class="form-control col-md-7" value="${ param.keyword }">
				<button class="col-md-1 btn btn-primary float-right" onclick="list_go(1);">검색</button>
			</div>
		</div>
		<span class="text-muted mt-3 pl-1" onclick="remove()">삭제</span>
		<div style="height:530px;" class="mt-2">
		<table id="maincontent" class="table table-hover table-sm text-center">
			<thead>
				<tr style="background-color:#E6EFFC;">
					<th scope="col" style="width: 100px;"><input type="checkbox" class="check-all"></th>
					<th scope="col" style="width: 100px;">문의분류</th>
					<th scope="col" style="width: 450px;">문의제목</th>
					<th scope="col" style="width: 100px;">답변유무</th>
					<th scope="col" style="width: 100px;">작성자</th>
					<th scope="col" style="width: 150px;">날짜</th>
					
				</tr>
			</thead>
			<tbody style="">
				<c:if test="${empty askList }" >
					<tr class="text-center">
						<td colspan="6" >등록된 문의가 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${not empty askList }" >
					<c:forEach items="${askList }" var="ask">
						<tr>
							<td>
								<input type="checkbox" name="impt" class="individual_check_boxes" value="${ask.qnNo}"></td>
							<td>
								<c:if test="${ask.askSort eq 'A301'}" >
									수료문의
								</c:if>
								<c:if test="${ask.askSort eq 'A302'}" >
									학습문의
								</c:if>
								<c:if test="${ask.askSort eq 'A303'}" >
									기타
								</c:if>
								
							</td>
							<td class="text-left" style="cursor: pointer; max-width: 569px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;"  onclick="location.href='detail.do?askNo=${ask.qnNo}'">
								${ask.qnTitle}
							</td>
							<td>
								<c:if test="${empty ask.qnAnswer}" >
									<span class="badge bg-danger">미답변</span>
								</c:if>
								<c:if test="${not empty ask.qnAnswer}" >
									<span class="badge bg-primary">답변완료</span>
								</c:if>
							</td>
							<td>${ask.memId}</td>
							<td><fmt:formatDate value="${ask.qnRegdate }" pattern="yyyy-MM-dd" /></td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
		</div>
		<%@include file="/WEB-INF/views/common/pagination.jsp" %>
	</div>
	</section>
<script type="text/javascript">
	$( document ).ready( function() {
	  $( '.check-all' ).click( function() {
	    $( '.individual_check_boxes' ).prop( 'checked', this.checked );
	  });
	});
	
	function sort() {
		$('#sort').val($("select[name=sortSelect]").val());
		list_go(1);
	}
	
	function remove() {
		//alert($("input[name='impt']:checked").val());
		let chkVal = [];
		$("input:checkbox[name=impt]:checked").each(function() {
			chkVal.push($(this).val());
		});
		// console.log(chk_Val);
		
		 location.href="remove.do?qnNo=" + chkVal;
	}

</script>


</body>
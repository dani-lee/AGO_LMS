<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<head>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/js/summernote/summernote-bs4.min.css" />
<script src="<%=request.getContextPath()%>/resources/js/summernote/summernote-bs4.min.js"></script>
</head>

<title></title>

<body>

	<!-- 메인 헤더 -->
	<!-- Content Header (Page header) -->
	<div class="content-header">
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
						<li class="breadcrumb-item active">문의게시판</li>
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
			<form role="registForm" action="regist.do" method="post">
				<input type="hidden" name="memId" value="${loginUser.memId }">
				<table id="maincontent" class="table mt-3 table-sm">
					<thead>
						<tr>
							<td class="font-weight-bold text-center col-2" style="background-color: #E6EFFC;">제목</td>
							<td colspan="4"><input type="text" class="form-control form-control-sm" name="qnTitle" id="qnTitle"></td>
						</tr>

						<tr>
							<td class="font-weight-bold text-center" style="background-color: #E6EFFC;">문의분류</td>
							<td><select class="form-control form-control-sm col-2" id="askSort" name="askSort">
									<option value="A301">수료문의</option>
									<option value="A302">학습문의</option>
									<option value="A303">기타</option>
								</select></td>
						</tr>
						<tr>
							<td class="font-weight-bold text-center" style="background-color: #E6EFFC;">공개여부</td>
							<td>
								<div class="d-block d-flex">
									<div class="form-check col-2">
			                          <input class="form-check-input" value="0" name="privacy" type="checkbox">
			                          <label class="form-check-label">공개</label>
	                        		</div>
	                        		<div class="form-check">
	                        			<input class="form-check-input" value="1" name="privacy" type="checkbox">
			                          <label class="form-check-label">비밀글</label>
	                        		</div>
								</div>
                        	</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td colspan="4"><textarea class="textarea" name="qnContent" id="content" rows="20" placeholder="" style="display: none;"></textarea></td>
						<tr>
					</tbody>
				</table>
			</form>
		</div>
	</section>
	<%@ include file="/WEB-INF/views/common/summernote.jsp"%>

	<div style="float: right; margin-right: 20px;">
		<button class="btn btn-primary" type="button" onclick="fn_regist();">등록</button>
		<button class="btn btn-defalut" type="button" onclick="location.href='list.do'">취소</button>
	</div>

	<script>
		window.onload = function() {
			summernote_go($('textarea#content'));
		}

		function fn_regist() {
			let form = document.querySelector('form[role="registForm"]');
			let inputTitle = document.querySelector('#qnTitle');
			let inputContent = document.querySelector('#content');
			if (!inputTitle.value) {
				alert("제목을 입력해주세요.");
				return;
			}
			if(!inputContent){
				alert("내용을 입력해주세요");
				return;
			}
			if(confirm("문의를 등록하시겠습니까?")){
				form.submit();
			}

		}
	</script>

</body>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/js/summernote/summernote-bs4.min.css">
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
					<h4 class="m-0">자주묻는질문</h4>
				</div>
				<!-- /.col -->
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item">
							<i class="fas fa-home"></i>
						</li>
						<li class="breadcrumb-item">
							<a href="<%=request.getContextPath()%>/manager/management/faq/list.do">운영관리</a>
						</li>
						<li class="breadcrumb-item active">자주묻는질문</li>
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
				<div class="">
					<form action="regist.do" method="post">
						<div class="p-0">
							<table id="maincontent" class="table mb-0 table-sm">
								<tr>
									<td scope="col" class="font-weight-bold text-center col-3" style="width: 10%; background-color: #F5F4F4;">문의 분류</td>
									<td scope="col" class="pl-4 col-2">
									<select name="askSort" class="form-control form-control-sm col-10">
											<option>분류</option>
											<option value="c">수료 문의</option>
											<option value="l">학습 문의</option>
											<option value="e">기타</option>
									</select>
									</td>
									<td scope="col" class="font-weight-bold text-center" style="width: 10%; background-color: #F5F4F4;">제목</td>
									<td scope="col" class="pl-4"><input type="text"class="form-control form-control-sm" name="faqQuestion" /></td>
								</tr>
								<tr>
									<td colspan="4">
									<textarea class="textarea form-control" name="faqAnswer" id="content" rows="20" placeholder="1000자 내외로  작성하세요." style="display: none;"></textarea>
									<%@ include file="/WEB-INF/views/common/summernote.jsp"%></div>
									</td>
								</tr>
							</table>
							
							<div class="mr-2">
							<ol class="nav float-right">
								<li class="nav-item">
									<button type="submit" class="btn btn-primary float-right">등록</button>
								</li>&nbsp;
								<li class="nav-item">
									<button class="btn btn-default float-right" type="button" onclick="location.href='list.do'">취소</button>
								</li>
							</ol>
							</div>
						</div>
					
					</form>
				</div>
			</div>
		</section>
	<!-- /.content-wrapper -->

	<script type="text/javascript">
		window.onload = function() {
			summernote_go($('#content'), "ture");
		}
	</script>
</body>

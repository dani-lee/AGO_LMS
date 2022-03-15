<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<head></head>
<title></title>

<body>
	<div class="content-wrapper m-0" style="min-width: 1280px;">
		<!-- 메인 헤더 -->
		<!-- Content Header (Page header) -->
		<div class="content-header">
			<div class="container-fluid">
				<div class="row">
					<div class="col-sm-6">
						<h4 class="m-0">수료 결재</h4>
					</div>
					<!-- /.col -->
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item">
								<a href="#">부서장</a>
							</li>
							<li class="breadcrumb-item active">수료 결재</li>
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
				<div class="card">
					<div class="card-header">
						<div class="input-group justify-content-end col-12 p-0 mb-1">
							<div class="row col-7 justify-content-end p-0 mr-1">
								<select class="col-md-2 form-control" name="searchType">
									<option value="tn">전체</option>
									<option value="t">강의명</option>
									<option value="n">보고자</option>
								</select>
								<input type="text" placeholder="검색할 단어를 입력하세요" class="form-control col-md-7" name="keyword" value="" />
								<button class="col-md-1 btn btn-primary float-right" onclick="list_go(1);">검색</button>
							</div>
						</div>
						<span class="text-muted" style="color: gray; cursor: pointer;" onclick="fn_list(1);">전체</span>
						<span class="text-muted" style="color: gray;">&nbsp;|&nbsp;</span>
						<span class="text-muted" style="color: gray; cursor: pointer;" id="sortOption" data-sort="r" onclick="fn_sort(1);"> 결재 </span>
						<span class="text-muted" style="color: gray;">&nbsp;|&nbsp;</span>
						<span class="text-muted" style="color: gray; cursor: pointer;" id="sortOption" data-sort="r" onclick="fn_sort(1);"> 반려 </span>
					</div>
					<div class="card-body p-0">
						<table class="table table-sm table-hover">
							<thead>
								<tr class="text-center">
									<th scope="col" colspan="2">번호</th>
									<th scope="col" colspan="3">강의명</th>
									<th scope="col" colspan="2">보고자</th>
									<th scope="col" colspan="2">보고일자</th>
									<th scope="col" colspan="2">결재상태</th>
								</tr>
							</thead>
							<tbody>
								<tr class="text-center">
									<td colspan="2">20210150</td>
									<td class="text-left" colspan="3">JSP ＆ Servlet Programming</td>
									<td colspan="2">조명석</td>
									<td colspan="2">2021.12.27</td>
									<td colspan="2">
										<button class="btn btn-sm btn-primary">결재</button>
									</td>
								</tr>

								<tr class="text-center">
									<td colspan="2">20210150</td>
									<td class="text-left" colspan="3">디자인 시스템 구축</td>
									<td colspan="2">김수진</td>
									<td colspan="2">2021.12.22</td>
									<td colspan="2">결재 완료</td>
								</tr>


								<tr class="text-center">
									<td colspan="2">20210150</td>
									<td class="text-left" colspan="3">구조와 설계</td>
									<td colspan="2">조명석</td>
									<td colspan="2">2021.12.18</td>
									<td colspan="2">결재 완료</td>
								</tr>
								<tr class="text-center">
									<td colspan="2">20210150</td>
									<td class="text-left" colspan="3">디자인 시스템 구축</td>
									<td colspan="2">박소현</td>
									<td colspan="2">2021.12.17</td>
									<td colspan="2">결재 완료</td>
								</tr>
								<tr class="text-center">
									<td colspan="2">20210150</td>
									<td class="text-left" colspan="3">디자인 시스템 구축</td>
									<td colspan="2">이단비</td>
									<td colspan="2">2021.12.17</td>
									<td colspan="2">결재 완료</td>
								</tr>
								<tr class="text-center">
									<td colspan="2">20210150</td>
									<td class="text-left" colspan="3">디자인 시스템 구축</td>
									<td colspan="2">조명석</td>
									<td colspan="2">2021.12.17</td>
									<td colspan="2">반려</td>
								</tr>
								<tr class="text-center">
									<td colspan="2">20210150</td>
									<td class="text-left" colspan="3">JSP ＆ Servlet Programming</td>
									<td colspan="2">정현욱</td>
									<td colspan="2">2021.12.15</td>
									<td colspan="2">결재 완료</td>
								</tr>
								<tr class="text-center">
									<td colspan="2">20210150</td>
									<td class="text-left" colspan="3">JSP ＆ Servlet Programming</td>
									<td colspan="2">김노을</td>
									<td colspan="2">2021.12.15</td>
									<td colspan="2">결재 완료</td>
								</tr>
								<tr class="text-center">
									<td colspan="2">20210150</td>
									<td class="text-left" colspan="3">구조와 설계</td>
									<td colspan="2">김수진</td>
									<td colspan="2">2021.12.14</td>
									<td colspan="2">결재 완료</td>
								</tr>
								<tr class="text-center">
									<td colspan="2">20210150</td>
									<td class="text-left" colspan="3">JSP ＆ Servlet Programming</td>
									<td colspan="2">박소현</td>
									<td colspan="2">2021.12.13</td>
									<td colspan="2">결재 완료</td>
								</tr>
								<tr class="text-center">
									<td colspan="2">20210150</td>
									<td class="text-left" colspan="3">구조와 설계</td>
									<td colspan="2">이단비</td>
									<td colspan="2">2021.12.12</td>
									<td colspan="2">결재 완료</td>
								</tr>
								<tr class="text-center">
									<td colspan="2">20210150</td>
									<td class="text-left" colspan="3">업무용 네트워크 기술</td>
									<td colspan="2">김수진</td>
									<td colspan="2">2021.12.11</td>
									<td colspan="2">결재 완료</td>
								</tr>
								<tr class="text-center">
									<td colspan="2">20210150</td>
									<td class="text-left" colspan="3">구조와 설계</td>
									<td colspan="2">김노을</td>
									<td colspan="2">2021.12.11</td>
									<td colspan="2">결재 완료</td>
								</tr>
								<tr class="text-center">
									<td colspan="2">20210150</td>
									<td class="text-left" colspan="3">업무용 네트워크 기술</td>
									<td colspan="2">정현욱</td>
									<td colspan="2">2021.12.10</td>
									<td colspan="2">결재 완료</td>
								</tr>
								<tr class="text-center">
									<td colspan="2">20210150</td>
									<td class="text-left" colspan="3">디자인 시스템 구축</td>
									<td colspan="2">김노을</td>
									<td colspan="2">2021.12.10</td>
									<td colspan="2">결재 완료</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="card-footer text-center">
						<nav aria-label="Navigation">
							<ul class="pagination justify-content-center m-0">
								<li class="page-item">
									<a class="page-link" href="#">
										<i class="fas fa-angle-double-left"></i>
									</a>
								</li>
								<li class="page-item">
									<a class="page-link" href="#">
										<i class="fas fa-angle-left"></i>
									</a>
								</li>

								<li class="page-item active">
									<a class="page-link" href="#"> 1 </a>
								</li>
								<li class="page-item">
									<a class="page-link" href="#"> 2 </a>
								</li>
								<li class="page-item">
									<a class="page-link" href="#"> 3 </a>
								</li>

								<li class="page-item">
									<a class="page-link" href="#">
										<i class="fas fa-angle-right"></i>
									</a>
								</li>
								<li class="page-item">
									<a class="page-link" href="#">
										<i class="fas fa-angle-double-right"></i>
									</a>
								</li>
							</ul>
							<!-- /.pagination -->
						</nav>
					</div>
				</div>

			</div>
		</section>
	</div>
</body>
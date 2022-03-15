<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<head></head>

<title>학습중인 강의</title>

<body>
	<div class="container-fluid col-9"><br>
		
							<div class="class-detail row " style="margin-left: 10px;">
						<img src="https://cdn.pixabay.com/photo/2016/01/19/17/57/car-1149997_960_720.jpg" style="width: 200px; height: 150px;">
						<div class="col-8 column ui-sortable">
							<span class="h5">개인 정보 보호 교육 </span> <img src="https://img.icons8.com/material-outlined/24/000000/bookmark-ribbon--v2.png" onclick="" />
							<br><br>
							<span class="">일반 과정</span>
							<br><br>
									<span class="row pl-3" name='review_rate' style="color: #F2A516;">
										<i class="fas fa-star"></i>	
										<i class="fas fa-star "></i>	
										<i class="fas fa-star"></i>	
										<i class="fas fa-star"></i>	
										<i class="fas fa-star-half-alt"></i>	
										(4.5)					
									</span>
							<div class="col-3 ml-auto" style="float: right;"></div>
						</div>

					</div><br>
		<div class="col-12">
		
		
			<div class="list-group d-flex flex-row" id="list-tab" role="tablist">
				<a class="list-group-item list-group-item-action active" id="list-review-list" data-toggle="list" href="#list-review" role="tab" aria-controls="info">상세 정보</a>
				<a class="list-group-item list-group-item-action" id="list-review-list" data-toggle="list" href="#list-review1" role="tab" aria-controls="content">강의 내용</a>
				<a class="list-group-item list-group-item-action" id="list-review-list" data-toggle="list" href="#list-review2" role="tab" aria-controls="step">강의 목차</a>

			</div>
		</div>

		<div class="col-12">
			<div class="tab-content" id="nav-tabContent">
				<hr color="#1D64F2" style="height: 3px; border-radius: 40px; margin-top: 5px;" />

				<div class="tab-pane fade show active" id="list-review" role="tabpanel" aria-labelledby="list-info-list">
					<!-- 이 강의를 들었을 때 이득되는 내용 기재 -->

				</div>



				<div class="tab-pane fade" id="list-review1" role="tabpanel" aria-labelledby="list-content-list">




					<table class="table mt-3">
						<tr>
							<td class="font-weight-bold">훈련 기관</td>
							<td>
								<p>대덕 인재개발원</p>
							</td>

							<td class="font-weight-bold">기관 정보</td>
							<td>042-123-1234</td>
						</tr>
						<tr>
							<td class="font-weight-bold">훈련 구분</td>
							<td>일반 과정</td>
							<td class="font-weight-bold">수강 인원</td>
							<td>제한없음</td>
						</tr>
						<tr>
							<td class="font-weight-bold">훈련 기간</td>
							<td>2021.01.01 ~ 2021.12.31</td>
							<td class="font-weight-bold">이수 점수</td>
							<td>15</td>
						</tr>

						<tr>
							<td class="font-weight-bold">과정 소개</td>
							<td colspan="3">
								<p>- 개인정보 보호법 주요내용</p>
								<p>- 개인정보 안전성 확보조치</p>
								<p>- 개인정보 유노출 예방방안</p>
								<p>- 처리방침 및 개인정보 수집이용 동의 서식 작성(실습)</p>
							</td>
						</tr>
					</table>


				</div>

				<div class="tab-pane fade" id="list-review2" role="tabpanel" aria-labelledby="list-step-list">

					<div class="col-12">
						<div class="tab-content" id="nav-tabContent">

							<table class="table table-hover">
								<thead>
									<tr class="text-center">
										<th scope="col">회차</th>
										<th scope="col">회차명</th>
									</tr>
								</thead>
								<tbody>
									<tr class="text-center">
										<td>1</td>
										<td>개인정보안정성 확보조치 기준 소개</td>
									</tr>
									<tr class="text-center">
										<td>2</td>
										<td>접근권한의 관리</td>
									</tr>
									<tr class="text-center">
										<td>3</td>
										<td>접근통제</td>
									</tr>
									<tr class="text-center">
										<td>4</td>
										<td>개인정보의 암호화</td>
									</tr>
									<tr class="text-center">
										<td>5</td>
										<td>접속기록의 보관 및 점검</td>
									</tr>
									<tr class="text-center">
										<td>6</td>
										<td>악성프로그램 방치</td>
									</tr>
									<tr class="text-center">
										<td>7</td>
										<td>개인정보의 파기</td>
									</tr>

									<tr class="text-center">
										<td>8</td>
										<td>평가</td>
									</tr>
								</tbody>
							</table>
						</div>
						<!--/강의목차-->
					</div>
				</div>
			</div>
		</div>
		<button class="btn btn-primary" style="float: right;">
			<i class="la la-angle-double-left">목록</i>
		</button>
	</div>
</body>
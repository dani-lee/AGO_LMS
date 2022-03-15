<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<head></head>

<title>수강내역</title>

<body>
	<br><br>
	    <div class="container-fluid col-9">
			<div class="column ui-sortable" style="width : 100%;">
				<h4 class="m-0">수강내역</h4>
				<hr color="#1D64F2" style="height: 3px; border-radius: 40px; margin-top: 5px;">
				<table class="col-md-12 column">
					<tr>
						<td style="text-align: left;">
							<select class="form-control form-control-sm col-3">
								<option>전체</option>
								<option>2022</option>
							</select>
						</td>
						<td  style="text-align: right;">
							<button class="btn-primary btn-border" style="cursor: pointer;" onclick="OpenWindow('/ago/user/myClass/clsFinished/reportForm.pop','외부수료증 등록', 780, 860)">외부수료증 등록</button>
						</td>
					</tr>
				</table>
				<div class="col-md-12 column ui-sortable"></div>
				<table class="table mt-3">
					<thead>
						<tr>
							<th class="col-md-1 column ui-sortable">강의코드</th>
							<th class="col-md-6 column ui-sortable text-center">강의명</th>

							<th class="col-md-1 column ui-sortable text-center">이수점수</th>
							<th class="col-md-1 column ui-sortable text-center">진도율</th>
							<th class="col-md-2 column ui-sortable text-center">보고서제출여부</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>20220101</td>
							<td class="row">
						<img src="https://cdn.pixabay.com/photo/2016/01/19/17/57/car-1149997_960_720.jpg" style="width: 150px; height: 100px;">
								<div class="col-md-8 column ui-sortable">
									<span class="h6">멀티미디어의 이해 </span>

									<br>
									<span class="text-primary">2021.01.01~2022.01.01</span><br><br>
									<i class="text-warning la la-star" style="font-size: 15px;"></i>
									<i class="text-warning la la-star" style="font-size: 15px;"></i>
									<i class="text-warning la la-star" style="font-size: 15px;"></i>
									<i class="text-warning la la-star" style="font-size: 15px;"></i>
									<i class="text-warning la la-star-half-empty" style="font-size: 15px;"></i>
									<span class="h6 text-warning">(4.5)</span>
									
									<span class=" badge badge-primary" style="margin-left : 30px;">오프라인</span>
									 <span class=" badge badge-danger">필수</span>		
								</div>
							</td>
							<td class="text-center">30</td>
							<td  class="text-center">
								<div class="progress">
									<div class="progress-bar bg-success" role="progressbar" style="width: 60%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
								</div>
							</td>
							<td  class="text-center"><button class="btn btn-primary">제출완료</button></td>
						</tr>
						<tr>
							<td>20220101</td>
							<td class="row">
						<img src="https://cdn.pixabay.com/photo/2016/01/19/17/57/car-1149997_960_720.jpg" style="width: 150px; height: 100px;">
								<div class="col-md-8 column ui-sortable">
									<span class="h6">업무용 네트워크 기술 </span>

									<br>
									<span class="text-primary">2021.01.01~2022.01.01</span><br><br>
									<i class="text-warning la la-star" style="font-size: 15px;"></i>
									<i class="text-warning la la-star" style="font-size: 15px;"></i>
									<i class="text-warning la la-star" style="font-size: 15px;"></i>
									<i class="text-warning la la-star" style="font-size: 15px;"></i>
									<i class="text-warning la la-star-half-empty" style="font-size: 15px;"></i>
									<span class="h6 text-warning">(4.5)</span>
									 <span class="badge badge-primary" style="margin-left : 30px;">오프라인</span>
									 <span class="badge badge-danger">필수</span>									
								</div>

							</td>
							<td class="text-center">30</td>
							<td  class="text-center">
								<div class="progress">
									<div class="progress-bar bg-success" role="progressbar" style="width: 100%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
								</div>
							</td>
							<td  class="text-center"><button class="btn btn-primary">제출완료</button></td>
						</tr>
						<tr>
							<td>20220101</td>
							<td class="row">
						<img src="https://cdn.pixabay.com/photo/2016/01/19/17/57/car-1149997_960_720.jpg" style="width: 150px; height: 100px;">
								<div class="col-md-8 column ui-sortable">
									<span class="h6">JSP ＆ Servlet Programming</span>

									<br>
									<span class="text-primary">2021.01.01~2022.01.01</span><br><br>
									<i class="text-warning la la-star" style="font-size: 15px;"></i>
									<i class="text-warning la la-star" style="font-size: 15px;"></i>
									<i class="text-warning la la-star" style="font-size: 15px;"></i>
									<i class="text-warning la la-star" style="font-size: 15px;"></i>
									<i class="text-warning la la-star-half-empty" style="font-size: 15px;"></i>
									<span class="h6 text-warning">(4.5)</span>
									 <span class="badge badge-primary" style="margin-left : 30px;">오프라인</span>
									 <span class="badge badge-danger">필수</span>									
								</div>

							</td>
							<td class="text-center">30</td>
							<td  class="text-center">
								<div class="progress">
									<div class="progress-bar bg-success" role="progressbar" style="width: 100%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
								</div>
							</td>
							<td  class="text-center"><button class="btn btn-primary">제출완료</button></td>
						</tr>
						<tr>
							<td>20220101</td>
							<td class="row">
						<img src="https://cdn.pixabay.com/photo/2016/01/19/17/57/car-1149997_960_720.jpg" style="width: 150px; height: 100px;">
								<div class="col-md-8 column ui-sortable">
									<span class="h6">디자인 시스템 구축 </span>

									<br>
									<span class="text-primary">2021.01.01~2022.01.01</span><br><br>
									<i class="text-warning la la-star" style="font-size: 15px;"></i>
									<i class="text-warning la la-star" style="font-size: 15px;"></i>
									<i class="text-warning la la-star" style="font-size: 15px;"></i>
									<i class="text-warning la la-star" style="font-size: 15px;"></i>
									<i class="text-warning la la-star-half-empty" style="font-size: 15px;"></i>
									<span class="h6 text-warning">(4.5)</span>
									 <span class="badge badge-primary" style="margin-left : 30px;">오프라인</span>
									 <span class="badge badge-danger">필수</span>									
								</div>
							</td>
							<td class="text-center">30</td>
							<td  class="text-center">
								<div class="progress">
									<div class="progress-bar bg-success" role="progressbar" style="width: 100%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
								</div>
							</td>
							<td  class="text-center"><button class="btn btn-primary">제출완료</button></td>
						</tr>
						<tr>
							<td>20220101</td>
							<td class="row">
						<img src="https://cdn.pixabay.com/photo/2016/01/19/17/57/car-1149997_960_720.jpg" style="width: 150px; height: 100px;">
								<div class="col-md-8 column ui-sortable">
									<span class="h6">딥러닝 프로젝트</span>

									<br>
									<span class="text-primary">2021.01.01~2022.01.01</span><br><br>
									<i class="text-warning la la-star" style="font-size: 15px;"></i>
									<i class="text-warning la la-star" style="font-size: 15px;"></i>
									<i class="text-warning la la-star" style="font-size: 15px;"></i>
									<i class="text-warning la la-star" style="font-size: 15px;"></i>
									<i class="text-warning la la-star-half-empty" style="font-size: 15px;"></i>
									<span class="h6 text-warning">(4.5)</span>
										<span class="badge badge-primary" style="margin-left : 30px;">오프라인</span>
									 <span class="badge badge-danger">필수</span>									
								</div>

							</td>
							<td class="text-center">30</td>
							<td  class="text-center">
								<div class="progress">
									<div class="progress-bar bg-success" role="progressbar" style="width: 100%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
								</div>
							</td>
							<td  class="text-center"><button class="btn btn-primary">제출완료</button></td>
						</tr>																								
					</tbody>
				</table>
				<div class="card-body col-md-12 column ui-sortable ">
					<ul class="pagination pg-primary justify-content-center">
						<li class="page-item">
							<a class="page-link" href="#" aria-label="Previous">
								<span aria-hidden="true">«</span>
								<span class="sr-only">Previous</span>
							</a>
						</li>
						<li class="page-item active"><a class="page-link" href="#">1</a></li>
						<li class="page-item"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item">
							<a class="page-link" href="#" aria-label="Next">
								<span aria-hidden="true">»</span>
								<span class="sr-only">Next</span>
							</a>
						</li>
					</ul>
				</div>			
			</div>
		</div>


</body>

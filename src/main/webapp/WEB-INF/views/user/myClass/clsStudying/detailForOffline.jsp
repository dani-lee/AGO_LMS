<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<head></head>

<title>학습중인 강의</title>

<body>
    <div class="container-fluid col-9">
        <div class="row navList">
            <h5 class="col-9" style="margin: 0px;">학습중인 강의</h5>
            <div class="col-3 ml-auto">
                <span><i class="la la-home"></i></span>
                <span> &nbsp;>&nbsp; </span>
                <span>내강의실</span>
                <span> &nbsp;>&nbsp; </span>
                <span>학습중인 강의</span>
            </div>
        </div>
        <hr color="#1D64F2" style="height:3px; border-radius:40px; margin-top:5px;" />

        <div class="class-detail row col-9">
            <img src="https://cdn.pixabay.com/photo/2016/01/19/17/57/car-1149997_960_720.jpg" style="width: 200px; height: 150px;">
            <div class="col-8 column ui-sortable">
                <span class="h6">직장 내 성희롱 예방 교육</span>
                <span class="badge badge-primary">오프라인</span>
                <span class="badge badge-danger">필수</span>
                <br>
                <span class="">사내 교육</span><br>
                <i class="text-warning la la-star"></i>
                <i class="text-warning la la-star"></i>
                <i class="text-warning la la-star"></i>
                <i class="text-warning la la-star"></i>
                <i class="text-warning la la-star-half-empty"></i>
                <span class="text-warning">(4.5)</span>
            </div>
        </div>
        <table class="table mt-3">
            <tr>
                <td class="font-weight-bold">수료기준안내</td>
                <td colspan="3">
                    <p>-수료율 100%</p>
                    <!-- <p>-시험 80점이상</p> -->
                </td>
            </tr>
            <tr>
                <td class="font-weight-bold">정원</td>
                <td>30</td>
                <td class="font-weight-bold">강의이수시간</td>
                <td>2</td>
            </tr>
            <tr>
                <td class="font-weight-bold">신청기간</td>
                <td>2022.01.01 ~ 2022.12.31</td>
                <td class="font-weight-bold">교육기간</td>
                <td>2022.01.07</td>
            </tr>
            <tr>
                <td class="font-weight-bold">과정소개</td>
                <td colspan="3">
                        <p>- 직장내 성희롱 관련 법령</p>
                        <p>- 해당 사업장의 직장내 성희롱 발생시 처리 절차와 조치기준</p>
                        <p>- 해당 사업장의 직장내 성희롱 피해근로자의 고충상담 및 구제철차</p>
                        <p>- 그 밖에 직장내 성희롱 예방에 필요한 사항</p>
                </td>
            </tr>
        </table>
            
        
            <div class="col-12">
                <div class="list-group d-flex flex-row" id="list-tab" role="tablist">
                    <a class="list-group-item list-group-item-action active" id="list-index-list" data-toggle="list" href="#list-index" role="tab" aria-controls="home">강의목차</a>
                    <a class="list-group-item list-group-item-action" id="list-reference-list" data-toggle="list" href="#list-reference" role="tab" aria-controls="profile">자료실</a>
                    <a class="list-group-item list-group-item-action" id="list-review-list" data-toggle="list" href="#list-review" role="tab" aria-controls="messages">수강후기</a>
                </div>
            </div>

            <br>

            <div class="col-12">
                <div class="tab-content" id="nav-tabContent">

                    <!-- 강의목차 -->
                    <div class="tab-pane fade show active" id="list-index" role="tabpanel" aria-labelledby="list-home-list">

                        <div class="row list-title">
                            <h6 class="col-9" style="margin: 0px;">강의 목차</h6>
                        </div>
                        <hr color="#1D64F2" style="height:3px; border-radius:40px; margin-top:5px;" />

                        <table class="table table-hover">
                            <thead>
                                <tr class="text-center">
                                    <th scope="col">회차</th>
                                    <th scope="col">회차명</th>
                                    <th scope="col">학습상태</th>
                                    <th scope="col">강의보기</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr class="text-center">
                                    <td>1</td>
                                    <td>직장 내 성희롱 예방 교육</td>
                                    <td>
                                        <div class="progress">
                                            <div class="progress-bar bg-success" role="progressbar" style="width: 0%" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
                                        </div>
                                    </td>
                                    <td>
                                        <button class="btn btn-primary btn-xs" onclick="OpenWindow('QRCheck.pop','title',375, 812);">출석하기</button>
                                    </td>
                                </tr>
                                
                            </tbody>
                        </table>
                    </div>
                    <!--/강의목차-->


                    <!-- 자료실-->
                    <div class="tab-pane fade" id="list-reference" role="tabpanel" aria-labelledby="list-profile-list">
                        <div class="row list-title">
                            <h6 class="col-9" style="margin: 0px;">자료실</h6>
                        </div>
                        <hr color="#1D64F2" style="height:3px; border-radius:40px; margin-top:5px;" />

                        <table class="table table-hover">
                            <thead>
                                <tr class="text-center">
                                    <th scope="col">번호</th>
                                    <th scope="col">제목</th>
                                    <th scope="col">비고</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr class="text-center">
                                    <td>1</td>
                                    <td>개인정보교육 자료</td>
                                    <td>
                                        <span class="h5" style="cursor: pointer;"><i class="la la-save"></i></span>
                                    </td>
                                </tr>

                                <tr class="text-center">
                                    <td colspan="4">등록된 자료가 없습니다.</td>
                                </tr>

                            </tbody>
                        </table>
                    </div>
                    <!--/자료실-->


                    <!--수강후기-->
                    <div class="tab-pane fade" id="list-review" role="tabpanel" aria-labelledby="list-messages-list">
                        <div class="row list-title">
                            <h6 class="col-9" style="margin: 0px;">수강후기</h6>
                        </div>
                        <hr color="#1D64F2" style="height:3px; border-radius:40px; margin-top:5px;" />
                        
                        <div class="reviews-list">
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item"> 
                                    <div class="reviews">
                                        <p>
                                            <div class="row">
                                                <div class="col-8">
                                                    <span>dani</span>
                                                    <span class="col">2021.01.03</span>
                                                    
                                                </div>
                                                <div class="ml-auto h6">
                                                    <i class="text-warning la la-star"></i>
                                                    <i class="text-warning la la-star"></i>
                                                    <i class="text-warning la la-star"></i>
                                                    <i class="text-warning la la-star"></i>
                                                    <i class="text-warning la la-star-half-empty"></i>
                                                    <span class="text-warning">(4.5)</span>
                                                </div>
                                            </div>
                                        </p>
                                        <p class="inline-block">
                                            <span class="font-weight-bold">강의 정말 잘들었습니다.</span>
                                        </p>
                                    </div>
                                </li>

                                <li class="list-group-item"> 
                                    <div class="reviews">
                                        <p>
                                            <div class="row">
                                                <div class="col-8">
                                                    <span>baldkingpenguin</span>
                                                    <span class="col">2021.01.03</span>
                                                    
                                                </div>
                                                <div class="ml-auto h6">
                                                    <i class="text-warning la la-star"></i>
                                                    <i class="text-warning la la-star"></i>
                                                    <i class="text-warning la la-star"></i>
                                                    <!-- <i class="text-warning la la-star"></i> -->
                                                    <i class="text-warning la la-star-half-empty"></i>
                                                    <span class="text-warning">(3.5)</span>
                                                </div>
                                            </div>
                                        </p>
                                        <p class="inline-block">
                                            <span class="font-weight-bold">대황펭이다</span>
                                        </p>
                                    </div>
                                </li>

                                <li class="list-group-item"> 
                                    <div class="reviews">
                                        <p class="text-center">등록된 수강 후기가 없습니다.</p>
                                    </div>
                                </li>
                            </ul>
                        
                    </div>
                    <!--/수강후기-->
                    
                </div>

                
                <div class="buttons">
                    <div class="col-1 ml-auto d-flex justify-content-between">
                        <!-- <button class="btn btn-primary float-right" onclick="fn_regist()"> &nbsp;등록&nbsp;</button> -->
                        <button class="btn btn-default float-right" onclick="location.href='list.do?mCode=M000201'"><i class="la la-angle-double-left"></i>&nbsp;목록</button>
                    </div>
                </div>
                
            </div>
    </div>

    
    
</body>
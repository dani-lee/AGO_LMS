<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="intern" value="${dataMap.intern }"/>
<c:set var="normal" value="${dataMap.normal }"/>
<c:set var="hobby" value="${dataMap.hobby }"/>
<c:set var="avg" value="${avgMap.comAvg }"/>
<c:set var="EdateList" value="${dataMap.EdateList }"/>
<c:set var="today" value="<%=new java.util.Date()%>" />

<head></head>

<title>강의관리</title>
<body>
	<section class="content">
		<div class="container-fluid">
			<div class="row mt-3">
				<div class="col-md-6">

					<div class="card" style="margin-left : 15px;box-shadow: none; border: none;">
                        <!-- /.card-header -->
                        <div class="card-body">
     						<table class="table mt-5">
     							<tr>
     								<td rowspan="5" class="text-center" style="width : 200px; border-top-color: white; font-size: x-large;">
     									총 강의수<br><br>
     									<h3 class="font-weight-bold">${count}</h3>
     								</td>
     								<td class="col-4 text-center font-weight-bold" style="background-color: #F5F4F4;">일반 교육</td>
     								<td class="text-center">${normal}</td>
     							</tr>
     							
     							<tr class="text-center">

     								<td class="font-weight-bold" style="background-color: #F5F4F4;">신입의무교육</td>
     								<td>${intern }</td>
     							</tr>
     							
     							<tr class="text-center">

     								<td class="font-weight-bold" style="background-color: #F5F4F4;">자기개발 및 취미</td>
     								<td>${hobby }</td>
     							</tr>
     							<tr><td></td><td></td></tr>
     							     							
     						</table>
                        </div>
                        <!-- /.card-body -->
                    </div>
				</div>
				
				<div class="col-md-6" style="">
					<div class="card card-danger " style="box-shadow: none; border: 1px solid #cccccc;min-height: 350px; min-width: 600px;">
						<div class="card-header">
							<h3 class="card-title font-weight-bold">기간 만료 임박 강의</h3>

							<div class="card-tools">
								<button type="button" class="btn btn-tool" data-card-widget="collapse">
									<i class="fas fa-minus"></i>
								</button>
								<button type="button" class="btn btn-tool" data-card-widget="remove">
									<i class="fas fa-times"></i>
								</button>
							</div>
						</div>
						<div class="card-body p-0">
							<table class="table table-condensed table-sm">
								<thead>
									<tr style="background-color: #F5F4F4;">
										<th style="width: 10px">#</th>
										<th class="text-center" >강의명</th>
										<th class="text-center" style="width: 180px;">게시기간</th>
										<th class="text-center"style="width: 110px">잔여일</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${EdateList}" var="list" varStatus="status">
									<tr>
										<td>${status.index+1}</td>
										<td style=" overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
											<c:choose>
												<c:when test="${fn:length(list.clName) gt 20}">
													<c:out value="${fn:substring( list.clName,0,20) }..." ></c:out>
												</c:when>
												<c:otherwise>
													${list.clName}
												</c:otherwise>
											</c:choose>												
										</td>
										<td><fmt:formatDate value="${list.postSdate }" pattern="yyyy-MM-dd" /> ~ <fmt:formatDate value="${list.postEdate }" pattern="yyyy-MM-dd" /></td>
										<td class="text-center">											
											<small class="badge badge-danger"><i class="far fa-clock"></i>&nbsp;&nbsp;
											<c:choose>
												<c:when test="${list.leftDays eq 0}">
													D-
												</c:when>
												<c:otherwise>
													${list.leftDays}&nbsp;&nbsp;
												</c:otherwise>
											</c:choose>days</small>
										</td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<!-- /.card-body -->
					</div>
				</div>
				

				<!-- /.col (RIGHT) -->
			</div>
			<!-- row -->

			<div class="row">
				<div class="col-md-6">
					<div class="card" style="box-shadow: none; border: 1px solid #cccccc;">
						<div class="card-header" style="background-color: #F5F4F4;">
							<h3 class="card-title font-weight-bold">수료율</h3>
						</div>
						<!-- /.card-header -->
						<div class="card-body p-0">
							<table class="table table-condensed table-sm">
								<thead>
									<tr>
										<th class="text-center" style="width: 80px">회차</th>
										<th class="text-center" >강의명</th>
										<th class="text-center"  style="width: 180px;">수강완료/수강인원</th>
										<th class="text-center"  style="width: 110px;">수료율</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach items="${avg }" var="list">
									<tr>
										<td class="text-center">${list.openRound }</td>
										<td style=" overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">${list.clName }</td>
										<td class="text-center">
											${list.complete}/${list.person}
										</td>
										<td>
											<div class="progress progress" data-toggle="tooltip" data-placement="top" data-original-title="${list.ctfAvg }/100">
												<div class="progress-bar progress-bar-danger" style="width: ${list.ctfAvg }%">${list.ctfAvg }</div>
											</div>
										</td>

									</tr>
								</c:forEach>
								</tbody>
							</table>
						</div>
						<!-- /.card-body -->
					</div>
					<!-- /.card -->
				</div>
				<!-- /.col -->

				<div class="col-md-6">
					<div class="card" style="box-shadow: none; border: 1px solid #cccccc;min-height: 430px; min-width: 600px;">
						<div class="card-header"  style="background-color: #F5F4F4;">
							<h3 class="card-title font-weight-bold">사용자 활동 내역</h3>
						</div>
						<!-- /.card-header -->
						<div class="card-body p-0">
							<table class="table table-condensed table-sm">
								<thead>
									<tr>
										<th class="text-center" style="width: 10px">#</th>
										<th class="text-center" style="width: 230px;">시간</th>
										<th class="text-center">내용</th>
										<th class="text-center">사용자</th>

									</tr>
								</thead>
								<tbody>
								<c:forEach items="${dataCSV}" var="i" varStatus="istatus" begin="0" end="9">
									<tr>
										<td>${istatus.index+1}</td>
										<td>${i.date}</td>
										<td>
										<c:if test="${i.action eq 'regist'}">수강신청</c:if>
										<c:if test="${i.action eq 'finish'}">이수완료</c:if>
										</td>
										<td>${i.memName}</td>

									</tr>									
								</c:forEach>
								</tbody>
							</table>
						</div>
						<!-- /.card-body -->
					</div>
					<!-- /.card -->
				</div>
				<!-- /.col -->
			</div>
			<!-- row -->
		</div>
		<!-- /.container-fluid -->
	</section>
</body>
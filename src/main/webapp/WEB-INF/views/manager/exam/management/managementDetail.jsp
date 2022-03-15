<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="examInfo" value="${examInfoDetail }" />
<c:set var="mtestFile" value="${mtestFile.examList }" />
<c:set var="ftestFile" value="${ftestFile.examList }" />


<title>mDetail</title>
<head></head>
<body>
	<div class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1 class="m-0">[${examInfo.clCate}]${examInfo.clName }</h1>
				</div>
				<!-- /.col -->
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item active">Class Detail</li>
					</ol>
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
		</div>
	</div>
	<section class="content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-6">
					<div class="card h-100">
						<div class="card-body">
							<span class="fw-bold mb-2" style="font-size: 20px;">중간/최종 평가 점수</span>
							<div style="height: 18px;"></div>
							<!--  평균 점수 그래프 출력 -->
							<!-- 시험 파일 둘다 없을 떄 -->
							<c:if test="${ !empty examInfo.mtestFile }">
								<div class="progress-card">
									<div class="d-flex justify-content-between mb-1">
										<span class="text-muted">중간 평가 점수</span> <span class="text-muted fw-bold"> ${examInfo.mtestAvgSco } / 100</span>
									</div>
									<div class="progress mb-3" style="height: 11px;">
										<div class="progress-bar bg-info" role="progressbar" style="width: ${examInfo.mtestAvgSco }%" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" data-toggle="tooltip" data-placement="top" title="" data-original-title="70%"></div>
									</div>
								</div>
							</c:if>
							<c:if test="${ !empty examInfo.ftestFile }">
								<div class="progress-card">
									<div class="d-flex justify-content-between mb-1">
										<span class="text-muted">최종 평가 점수</span> <span class="text-muted fw-bold"> ${examInfo.ftestAvgSco } / 100</span>
									</div>
									<div class="progress mb-2" style="height: 11px;">
										<div class="progress-bar bg-primary" role="progressbar" style="width: ${examInfo.ftestAvgSco }%" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" data-toggle="tooltip" data-placement="top" title="" data-original-title="70%"></div>
									</div>
								</div>
							</c:if>
							<!-- 평가 평균 점수 그래프/end -->

							<!-- 평균 점수 그래프 출력 -->
							<hr>
							<div class="row">
								<c:if test="${ !empty examInfo.mtestFile }">
									<div class="col-6 mt-2" style="cursor: pointer" onclick="getTest('getTest.do','${examInfo.mtestFile}');">
										<div class="text-center">
											<ion-icon name="document-text" class="text-info" style="width:50px; height:50px;"></ion-icon>
											<p class="mt-2">
												<b>중간 평가 문제 보기</b>
											</p>
										</div>
									</div>
								</c:if>
								<c:if test="${ !empty examInfo.ftestFile }">
									<div class="col-12 mt-2  text-center" style="cursor: pointer;" onclick="getTest('getTest.do','${examInfo.ftestFile}');">
										<div class="text-center">
											<ion-icon name="documents" class="text-blue" style="width:50px; height:50px;"></ion-icon>
											<p class="mt-2">
												<b>최종 평가 문제 보기</b>
											</p>
										</div>
									</div>
								</c:if>
							</div>
							<!-- row -->

						</div>
						<!-- /.card-body -->
					</div>
					<!-- /.card -->
				</div>
				<!-- col-md-6 -->

				<div class="col-md-6">
					<div class="card  h-100">
						<div class="card-body">

							<span class="fw-bold mb-2" style="font-size: 20px;">시험문제 관리</span>&nbsp;&nbsp; 
							<a onclick="location.href='<%=request.getContextPath()%>/manager/exam/getRegistExamFormFile.do'" style="cursor: pointer;"> <i class="fas fa-arrow-alt-circle-down"></i>&nbsp;양식다운
							</a>
							<div style="height: 18px;"></div>
							<div class="row">
								<div class="col-12 d-flex align-items-center">
									<div class="col-9">
									
										<a onclick="getExamFile('${examInfo.mtestFile}');" style="cursor: pointer;">중간 평가 시험 다운로드</a>
										<div style="height: 12px;"></div>
										<div class="input-group mb-2">
										<form id="mtermExam" action="<%=request.getContextPath() %>/manager/exam/uploadExamFile.do" enctype="multipart/form-data" method="post">
											<!-- /btn-group -->
											<label for="inputFile" class="input-group-prepend"> <span type="button" class="btn btn-info">파일 선택</span></label>
											<input name="term" value="midterm" type="hidden">
											<input name="clCode" value="${examInfo.clCode }" type="hidden">
											<input type="file" id="inputFile" name="examFile" style="display: none" onchange="file_go();">
											<input id="inputFileName" class="form-control" type="text" name="fileName" disabled value="-"> 
											<!-- <input id="uploadFileName" class="form-control" type="hidden" name="oldFile">  -->
											<label for="upload" class="input-group-prepend" onclick="fn_upload('inputFile','mtermExam');"><span type="button" class="btn btn-info">등록</span> </label>
										</form>
										</div>
									</div>
								</div>
							</div>
							<div style="height: 20px;"></div>
							<hr>
							<div style="height: 20px;"></div>
							<div class="row">
								<div class="col-12 d-flex align-items-center">
									<div class="col-9">
										<a onclick="getExamFile('${examInfo.ftestFile}');" style="cursor: pointer;" >최종 평가 엑셀 다운로드</a> 
										<input type="file" id="inputFile"  name="examFile" style="display: none">
										<div style="height: 12px;"></div>
										<div class="input-group">
											<!-- /btn-group -->
											<input id="uploadFileName" class="form-control" type="hidden" name="uploadFileName"> <input id="inputFileName" class="form-control" type="text" name="tempPicture" disabled="" value="-"> <label for="inputFile" class="input-group-prepend"> <span type="button" class="btn btn-info">시험 등록</span>
											</label>
										</div>
									</div>
								</div>
							</div>
							<!-- row -->
						</div>
					</div>
				</div>

				<!--  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~여기서 시험 문제 출력~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
				<div class="row">
					<section class="col-6">
						<table id="exam-left" class="table table-bordered  mt-3" style="padding: 10px;">

						</table>
					</section>
					<section class="col-6">
						<table id="exam-right" class="table table-bordered mt-3" style="padding: 10px;">


						</table>
					</section>
				</div>
			</div>
		</div>
	</section>
	<%@ include file="managementDetail_js.jsp"%>
	<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
	<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
	
<script>
 function getExamFile(fileName){
	if(fileName){
		location.href="<%=request.getContextPath() %>/manager/exam/getRegistedExamFile.do?fileName="+fileName;
	}else{
		alert('등록된 시험이 없습니다.');
	}
	 
 }
 
 function file_go(){
	 var file_input = document.getElementById('inputFile');
	 var file_name = file_input.files[0].name;
	 var file_format = file_name.substr(file_name.lastIndexOf('.')+1).toUpperCase();
	 
	 if(!(file_format == "XLX" || file_format == "XLSX")){
			alert("엑셀파일만 업로드 가능합니다.");
			return;
		}
	 document.getElementById('inputFileName').value = file_name;
 }
 
 function fn_upload(fileId, formId){
	 var picked_file = document.getElementById(fileId);
	 if(picked_file == "" || picked_file == null){
		 alert("파일을 선택해주세요.");
	 }
	 
	 if(confirm("해당 파일로 시험을 등록하시겠습니까?")){
		var form = new FormData(document.getElementById(formId));
		
		$.ajax({
			url : "uploadExamFile.do",
			data : form,
			processData : false,
			contetntType : false,
			type : "post",
			success : function(data){
				alert("등록되었습니다.");
				
			},
			error : function(error){
				AjaxErrorSecurityRedirectHandler(error.status);
				console.log(error.status);
			}
		})
	 }
 }
</script>

</body>

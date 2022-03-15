<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="classDetail" value="${dataMap.detail}" />
<c:set var="chapterList" value="${dataMap.chapterList }" />
<c:set var="documentList" value="${dataMap.documentList }" />
<c:set var="reviewList" value="${dataMap.reviewList }" />
<c:set var="clCate" value="${dataMap2.cateList}" />
<c:set var="testFile" value="${dataMap.testFile }" />
<c:set var="opcl" value="${dataMap.opcl }" />
<c:set var="room" value="${dataMap3.roomList }" />
<c:set var="classVO" value="${dataMap.classVO }" />
<head></head>

<title></title>

<body>
	<!-- 메인 헤더 -->
	<!-- Content Header (Page header) -->
	<div class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<%-- 					<h4 class="m-0">[${opcl.openRound}회]${classDetail.clName}</h4> --%>
				</div>
				<!-- /.col -->
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item">
							<i class="fas fa-home"></i>
						</li>
						<li class="breadcrumb-item">
							<a href="#">강의관리</a>
						</li>
						<li class="breadcrumb-item active">강의 상세</li>
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
		<form role="modifyForm" action="modify.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="opcl" value="${opcl.opcl }">
		<input type="hidden" name="clFormat" value="${classDetail.clFormat }">
		<input type="hidden" name="openRound" value="${opcl.openRound }">
		<input type="hidden" name="clCode" value="${clCode }">
			<section class="col-12">
				<div class="row">
					<div class="class-detail d-flex col-11 ">
						<div style="width: 200px; height: 150px;" id="pictureView"></div>
						<div class="column ui-sortable">
							<span class="h4 ml-2">[${opcl.openRound}회]</span> 
							<span class="h4 font-bold ml-2">${classDetail.clName}</span> 
							<span class="badge badge-primary ml-3"> ${classDetail.clFormat} </span> 
							<span class="badge badge-danger"> ${classDetail.clDivision} </span> <br> 
							<span class="ml-2"> 
								<c:if test="${classDetail.clCate  == 'A201'}">[신입사원교육]</c:if> 
								<c:if test="${classDetail.clCate  == 'A202'}">[일반교육]</c:if> 
								<c:if test="${classDetail.clCate  == 'A203'}">[자기개발/취미]</c:if>
							</span> <br> 
					<span class="row h5 m-0 py-1 text-warning">
						<c:forEach var="i" begin="1" end="${classVO.frontScope}">
							<i class="fas fa-star"></i>
						</c:forEach>
						<c:if test="${classVO.backScope >= 5}">
							<i class="fas fa-star-half-alt"></i>
						</c:if>
						<c:forEach var="i" begin="1" end="${classVO.restScope}">
							<i class="far fa-star"></i>
						</c:forEach>
						<span>(${classVO.scope})</span>

					</span> <br> <br>
						</div>
					</div>
					<div class="d-block justify-content-end">
						<div style="height:100px;">
<!-- 							<button class="btn btn-default btn-sm float-right" onclick="location.href='list.do'">목록</button> -->
						</div>
						<div>
<!-- 							<button class="btn btn-primary btn-sm float-left mr-1" type="button" onclick="modify();">수정</button> -->
							<input type="submit" class="btn btn-primary btn-sm" value="수정">
							<button class="btn btn-default btn-sm float-right ml-1" type="button" onclick="history.go(-1);">취소</button>
						</div>
					</div>
				</div>
			</section>

			<br>
			<div class="col-12">
				<div class="card card-primary card-outline card-outline-tabs">
					<div class="card-header p-0 border-bottom-0">
						<ul class="nav nav-tabs" id="custom-tabs-four-tab" role="tablist">
							<li class="nav-item">
								<a class="nav-link active" id="custom-tabs-four-home-tab" data-toggle="pill" href="#custom-tabs-four-home" role="tab" aria-controls="custom-tabs-four-home" aria-selected="true">기본정보</a>
							</li>
							<c:if test="${classDetail.clFormat eq '온라인'}">
							<input type="hidden" name="testNo" value="${testFile.testNo}">
							<li class="nav-item">
								<a class="nav-link" id="custom-tabs-four-profile-tab" data-toggle="pill" href="#custom-tabs-four-profile" role="tab" aria-controls="custom-tabs-four-profile" aria-selected="false">시험정보</a>
							</li>
							</c:if>
						</ul>
					</div>
					<div class="card-body" style="min-height: 600px;">
						<div class="tab-content" id="custom-tabs-four-tabContent">
							<div class="tab-pane fade active show" id="custom-tabs-four-home" role="tabpanel" aria-labelledby="custom-tabs-four-home-tab">


								<section id="calssInfo">
									<table class="table mt-3 table-sm col-12">
										<tr>
											<td class="font-weight-bold text-center" style="background-color: #E6EFFC;">과정소개</td>
											<td colspan="3">
												<p>${classDetail.clIntro }</p>
											</td>
										</tr>
										<tr>
											<td class="font-weight-bold text-center" style="background-color: #E6EFFC;">수강인원</td>
											<td class="col-6"><input type="text" name="enrPers" class="form-control col-3" placeholder="제한없음" value="${opcl.enrPers }"></td>
											<td class="font-weight-bold text-center col-2" style="background-color: #E6EFFC;">강의이수시간</td>
											<td>${classDetail.clCreditTime }</td>
										</tr>
										<tr>
											<td class="font-weight-bold text-center" style="background-color: #E6EFFC;">신청기간</td>
											<td class="d-flex" colspan="3">
												<input class="form-control col-4" type="date" name="postSdate" value="<fmt:formatDate value="${opcl.postSdate}" pattern="yyyy-MM-dd"/>" />
												<span class="font-weight-bold">&nbsp;&nbsp;&nbsp;~&nbsp;&nbsp;&nbsp;</span>
												<input class="form-control col-4" type="date" name="postEdate" value="<fmt:formatDate value="${opcl.postEdate}" pattern="yyyy-MM-dd"/>" />
											</td>
										<c:if test="${classDetail.clFormat eq '오프라인' || classDetail.clFormat eq '실시간' }">											
												<td class="font-weight-bold text-center" style="background-color: #E6EFFC;">강의장소</td>
												<td>
													<select id="offlineRoom" class="form-control input-fixed" name="clRoomNo">
														<c:forEach items="${room}" var="list">
															<option value="${list.clRoomNo }">${list.clRoomName}</option>
														</c:forEach>
													</select>
												</td>											
										</c:if>
											<c:if test="${classDetail.clFormat eq '온라인'}">
											<td class="font-weight-bold text-center" style="background-color: #E6EFFC;">학습기간</td>
												<td>
													<select class="form-control input-fixed col-7" name="studyDate">
														<option value="D103">제한없음</option>
														<option value="D101">신청일로부터 7일</option>
														<option value="D102">신청일로부터 30일</option>
													</select>
												</td>
											</c:if>										
										</tr>
										<tr>

											<c:if test="${classDetail.clFormat eq '오프라인' || classDetail.clFormat eq '실시간' }">
												<td class="font-weight-bold text-center" style="background-color: #E6EFFC;">학습날짜</td>
												<td>
													<div class="row">
													<input id="NonlineSelect" class="form-control NonlineSelect ml-2" style="width : 198px;" type="date" name="lecDate" value="<fmt:formatDate value="${lecDate }" pattern="yyyy-MM-dd"/>" />
													&nbsp;&nbsp;&nbsp;~&nbsp;&nbsp;&nbsp;
													<input class="form-control" type="time" name="lecTime" style="width : 198px;" value="<fmt:formatDate value="${lecTime }" pattern="HH:mm"/>">
													</div>												
												</td>
											</c:if>
										</tr>
										<tr>
											<td class="font-weight-bold text-center align-middle" style="background-color: #E6EFFC;">수료기준안내</td>
											<td colspan="3">
												<textarea class="form-control" id="comment" rows="3" name="cutline">
													${opcl.cutline}
                								</textarea> 
                								<%@ include file="/WEB-INF/views/common/summernote.jsp"%>
											</td>
										</tr>
									</table>
								</section>
							</div>
								<div class="tab-pane fade" id="custom-tabs-four-profile" role="tabpanel" aria-labelledby="custom-tabs-four-profile-tab">
									<section>
										
										<table class="table mt-4 table-sm">
											<thead>
												<tr>
													<th colspan="2" class="p-1 ml-4"><span class="text-danger">※반드시 양식을 다운받아 양식에 맞춰 파일을 업로드해주세요.</span></th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td><label>중간 평가</label></td>

													<td class="row">
														<label for="mtest" class="btn btn-info btn-sm btn-flat input-group-addon" style="height:38px;">파일선택</label>
														<c:choose>
															<c:when test="${testFile.mtestFile eq null}">
																<input id="inputFileNameMtest" class="form-control col-7 " type="text" disabled placeholder="Excel(xlsx)" value="현재 중간평가가 등록되어 있지 않습니다." />
															</c:when>

															<c:otherwise>
																<input id="inputFileNameMtest" class="form-control col-7 " type="text" disabled placeholder="Excel(xlsx)" value="${testFile.mtestFile }" />
															</c:otherwise>
															
														</c:choose> 
														
														<input type="file" name="mtestFile" class="form-control-file col-10 checkExcel" id="mtest" accept=".xlsx" onchange="checkExcel('mtestFile','inputFileNameMtest');" style="display: none;"><br>
														<button type="button" class="btn btn-outline-secondary btn-block btn-flat col-3 ml-2" style="height: 38px;" onclick="location.href='<%=request.getContextPath()%>/manager/classManagement/getClassExcelFileForm.do'">
															<i class="fas fa-arrow-alt-circle-down"></i> &nbsp;시험 양식
														</button></td>
												</tr>
												<tr>
													<td><label>최종 평가</label></td>
													<td class="row">
													<label for="ftest" class=" btn btn-info btn-sm btn-flat input-group-addon" style="height:38px;">파일선택</label>
														<c:choose>
															<c:when test="${testFile.ftestFile eq null}">
																<input id="inputFileNameFtest" class="form-control col-7 " type="text" disabled placeholder="Excel(xlsx)" value="현재 최종평가가 등록되어 있지 않습니다." />
															</c:when>

															<c:otherwise>
																<input id="inputFileNameFtest" class="form-control col-7 " type="text" disabled placeholder="Excel(xlsx)" value="${testFile.ftestFile}" />
															</c:otherwise>
														</c:choose> <input type="file" name="ftestFile" class="form-control-file col-10 checkExcel" id="ftest" accept=".xlsx" onchange="checkExcel('ftestFile','inputFileNameFtest');" style="display: none;"></td>
												</tr>
											</tbody>
										</table>
									</section>
								</div>

							</div>
					</div>
					<!-- /.card -->
				</div>
			</div>
			</form>
		</div>

	</section>


<script>

	function checkcheck(){
		alert($('#time').val());
	}
	function modify(){
		form = $('form[role=modifyForm]')[0];
		formData = new FormData(form);
			
		
		$.ajax({
			url 		: 'modify.do',
			data 		: formData,
			type 		: 'post',
			processData : false,
			contentType : false,
			success 	: function(data){
				console.log(data);
				alert(data);
				location.reload();
			},
			error 		: function(error){
				
				console.log(error.status);
				AjaxErrorSecurityRedirectHandler(error.status);
			}
		})		
	}
	
	window.onload=function(){
		
		summernote_go($('textarea#comment'), true);
			
		ClassRegistPictureThumb($('#pictureView')[0], '${classDetail.clImg}', '<%= request.getContextPath()%>');
		var pictureName = '${classDetail.clImg}';
		
		var realName = pictureName.substr(pictureName.lastIndexOf('$')+1);
			$('#inputFileName').val(realName);
	}

		function changePicture_go(){
			let picture = $('input#inputFile')[0];
			let fileFormat = picture.value.substr(picture.value.lastIndexOf('.')+1).toUpperCase();
			
			//이미지 확장자 jpg확인
			if(!(fileFormat == "JPG" || fileFormat == "JPEG")){
				alert("이미지는 jpg형식만 가능합니다.");
				return;
			}
			
			//이미지 파일 용량 체크
			if(picture.files[0].size > 1024*1024*1){
				alert("사진 용량은 1MB 이하만 가능합니다.");
				picture.value = "";
				return;
			}
			
			document.getElementById('inputFileName').value = picture.files[0].name;
			
			if(picture.files && picture.files[0]){
				let reader = new FileReader();
				reader.onload = function(e){
					$('div#pictureView')
						.css({'background-image' 	: 'url('+e.target.result+')',
							  'background-position' : 'center',
							  'background-size' 	: 'cover',
							  'background-repeat' 	: 'no-repeat'});
				}
				reader.readAsDataURL(picture.files[0]);
			}
			
			//이미지 변경 확인
			$('input[name="uploadPicture"]').val(picture.files[0].name);
		}
	
		function addClick() {
			
// 			var insertFile = $('<input type="file" name="clDocName" class="form-control-file" style="display : none;" value="'+$('#preference').val()+'">');
			var $insertFile = $('#preference').clone();
			$insertFile.attr("style", "display:none;");
			$insertFile.attr("name", "clDocName");
			$insertFile.removeAttr("id");
			
			$('#insertFile').append($insertFile);
			
			var fileName = $('#preference').val();
			
			var onlyName = fileName.substr(fileName.lastIndexOf('\\')+1,fileName.length);
			
			
			$('#add_table').append("<tr class='text-center'>"
										+"<td>"
										+onlyName
										+"</td>"									
										+"<td>"
										+"<button type='button' class='btn btn-danger btn-xs' onclick='rowDelete()'>제거</button>"
										+"</td>");
	
		}	

		
		//파일 고른게 엑셀인지 아닌지 
		function checkExcel(name, id){
			
			
			let form = $('form[role="modifyForm"]');
			var FileName = form.find('[name='+name+']')[0];

//			var checkInput = $('.checkExcel').val();
			
			document.getElementById(id).value = FileName.files[0].name;
			
// 			let mtest = mtestName.value.substr(mtestName.value.lastIndexOf('.')+1).toUpperCase();
			
			let excel = FileName.value.substr(FileName.value.lastIndexOf('.')+1).toUpperCase();
			
 			if(!(excel == "XLSX" || excel == "XLX")){
 				alert("파일은 엑셀 형식의 xlsx만 가능합니다.");
 				checkInput.value="";
 				return;
 			}
			
		}		
</script>

</body>
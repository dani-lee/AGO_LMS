<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ page import="java.io.FileInputStream" %>   
<%@ page import="java.io.BufferedOutputStream" %> 
<%@ page import="java.io.File" %> 
<%@ page import="java.io.IOException" %> 

<c:set var="dpName" value="${dataMap.dpName}" />
<c:set var="memName" value="${dataMap.memName }" />
<c:set var="report" value="${dataMap.report }" />
<c:set var="classInfo" value="${dataMap.classInfo}" />
<c:set var="convert" value="${convert }"/>
<c:set var="extState" value="${extState }"/>
<c:set var="member" value="${member }"/>
<head>
<meta charset="UTF-8">
<title>교육이수보고서</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/report.css">

</head>
<body>

	<div>
		<div id="onlyShow" class="paper">
			<div class="content">
				<div class="row mb-3">
					<div class="mr-5 p-5" style="width: 357px;">
						<span class="text-center text-bold" style="font-size: 35px;">교육이수보고서</span>
					</div>
					<div class="ml-4 mt-3" style="width: 225px;">
						<table border="1">
							<tr>
								<td class="text-center">교육담당</td>
								<td class="text-center">부서장</td>
							</tr>
							<tr>
								<td style="width: 110px; height: 90px;">
									<div id="agoStamp" data-id="agoStamp" style="width: 90px; height: 90px;" class="ml-2"></div>
								</td>
								<td style="width: 110px; height: 90px;"></td>
							</tr>
						</table>
					</div>
				</div>
				<form action="modifyExtReport.do" enctype="multipart/form-data" role="reportForm" method="post">
					<input type="hidden" name="extNo" value="${ext.extNo }">
					<table border="1" style="width: 642.53px;">
						<tbody>
							<tr class="trHeight">
								<td class="font-weight-bold text-center" style="background-color: lightgrey; width: 100px;" rowspan="3" colspan="1">교육수료자</td>
								<td class="font-weight-bold text-center" style="background-color: lightgrey; width: 100px;" colspan="1">부서명</td>
								<td class="p-2" style="width: 180px;" colspan="3">
									${convert.dpId}
									<input type="hidden" name="dpId" value="${member.dpId }">
								</td>
							</tr>
							<tr class="trHeight">
								<td class="font-weight-bold text-center" style="background-color: lightgrey;" colspan="1">직위</td>
								<td class="p-2" style="width: 120px;" colspan="3">				
									${convert.positionId}
									<input type="hidden" name="positionId" value="${member.positionId }">
								</td>
							</tr>
							<tr class="trHeight">
								<td class="font-weight-bold text-center" style="background-color: lightgrey;" colspan="1">성명</td>
								<td class="p-2" style="width: 150px;" colspan="3">
									${ext.memName}
									<input type="hidden" name="memName" value="${member.memName }">
								</td>
							</tr>
							<tr class="trHeight">
								<td class="font-weight-bold text-center" style="background-color: lightgrey;" colspan="1">교육명</td>
								<td class="p-2" style="width: 513px;" colspan="2">
								<c:choose>
									<c:when test="${extState eq 'B103'}">
										<input type="text" style="border : none; width : 100%;" name="clName" value="${ext.clName}">
									</c:when>
									<c:otherwise>
										${ext.clName}
									</c:otherwise>
								</c:choose>
									
								</td>
							</tr>
							<tr class="trHeight">
								<td class="font-weight-bold text-center" style="background-color: lightgrey; width: 130px;" colspan="1">수료날짜</td>
								<td class="p-2" style="width: 120px;" colspan="4">
								<c:choose>
									
									<c:when test="${extState eq 'B103'}">
										<input class="form-control" type="date" style="border : none; width : 40%;" name="insertCtfDate" value="${fn:substring(ext.insertCtfDate,0,10) }">
									</c:when>
									<c:otherwise>
										${fn:substring(ext.insertCtfDate,0,10)}
									</c:otherwise>
								</c:choose>								
									
								</td>
							</tr>
							<tr>
								<td class="font-weight-bold text-center" style="background-color: lightgrey;" colspan="1">교육내용</td>
								<td style="height: 380px;" colspan="4">
								<c:choose>
									<c:when test="${extState eq 'B103'}">
										<textarea class="form-control" name="eduContent" style="width: 100%; height: 95%; font-size:12px; border: none; resize: none;" rows="10" cols="">${ext.eduContent }</textarea>
									</c:when>
									<c:otherwise>
										${ext.eduContent }
									</c:otherwise>
								</c:choose>	
								</td>
							</tr>
							<tr>
								<td class="font-weight-bold text-center" style="background-color: lightgrey;" colspan="1">소감</td>
								<td style="width:511px; height: 380px;" colspan="4">
									
								<c:choose>
									<c:when test="${extState eq 'B103'}">
										<textarea class="form-control" name="eduReview" style="width: 100%; height: 95%; font-size:12px; border: none; resize: none;" rows="10" cols="">${ext.eduReview }</textarea>
									</c:when>
									<c:otherwise>
										${ext.eduReview }
									</c:otherwise>
								</c:choose>
								</td>
							</tr>
							<c:if test="${extState eq 'B103'}">
							<tr class="trHeight">
								<td class="font-weight-bold text-center" style="background-color: lightgrey;" colspan="1">수료증</td>
								<td colspan="4" class="form-group">
									<div class="custom-file">
										<div class="row m-0">
											<input type="file" name="attachDoc" class="custom-file-input" id="attachDocFileName" onchange="fileName()" style="border: none; border-right: 0px; border-top: 0px; boder-left: 0px; boder-bottom: 0px;">									
											<label class="custom-file-label" for="attachDoc" id="attachDocFileName">파일선택</label>	
										</div>
									</div>
								</td>
							</tr>
							</c:if>							
						</tbody>
					</table>
				</form>
				<c:if test="${extState eq 'B103'}">
				<button class="btn btn-primary mt-2" style="width: 140px; float: right;" type="submit" onclick="report_save();">제 출</button>
				</c:if>
			</div>
		</div>
		<c:if test="${extState eq 'B104' }">
		<div style="width: 210mm;
						min-height: 367mm;

						margin: 10mm auto;
						border-radius: 5px;
						background: #fff;
						box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
						width:  793.69px; height:  1387.08px;
					">
		
		
			<iframe src="/ago/user/myPage/completedClass/getImg.do?fileNM=/${ext.attachDoc }" style="width: 100%; height: 100%;">

			
			</iframe>
		</div>
		</c:if>
	</div>
	<script type="text/javascript">
	window.onload=function(){
		ReportPictureThumb(document.querySelector('#agoStamp'), 'agoStamp.jpg', '<%=request.getContextPath()%>');
	}
	function fileName(){
		let form = document.querySelector('form[role="reportForm"]');
		var fileName = form.attachDoc.value;
		var newfileName = fileName.substr(fileName.lastIndexOf("\\")+1);
		
		$('label[for="attachDoc"]').text(newfileName);
	}
	function report_save() {
		let form = document.querySelector('form[role="reportForm"]');
		var insertCtfDate = form.insertCtfDate.value;
		var eduContent = form.eduContent.value;
		var eduReview = form.eduReview.value;
		
		var files=$('input[name="attachDoc"]');
		console.log(files);
 		for(var file of files){
			console.log(file.name+" : "+file.value);
			if(file.value==""){
				alert("수료증을 첨부하지 않으면 제출할 수 없습니다.");
				file.focus();
				file.click();
				return;
			}
		}	
 		if(!insertCtfDate){
 			alert("수료날짜를 선택해주세요.");
 			insertCtfDate.focus();
			return;
		}
 		if(!eduContent){
			alert("교육내용을 작성해주세요.");
			eduContent.focus();
			return;
		}
		if(!eduReview){
			alert("교육소감을 작성해주세요.");
			eduReview.focus();
			return;
		}
		
		if(confirm("이대로 제출하시겠습니까?")){
			form.submit();
		}
		
	}
	</script>

</body>


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
				<form action="extReportRegist.do" enctype="multipart/form-data" role="reportForm" method="post">
					<table border="1" style="width: 642.53px;">
						<tbody>
							<tr class="trHeight">
								<td class="font-weight-bold text-center" style="background-color: lightgrey; width: 100px;" rowspan="3" colspan="1">교육수료자</td>
								<td class="font-weight-bold text-center" style="background-color: lightgrey; width: 100px;" colspan="1">부서명</td>
								<td class="p-2" style="width: 180px;" colspan="3">
								<input type="hidden" name="extNo" value="${report.extNo}">
								<input type="hidden" name="extCode" value="${report.extCode}">
								<input type="hidden" name="dpId" value="${dpName}">
									${dpName}
								</td>
							</tr>
							<tr class="trHeight">
								<td class="font-weight-bold text-center" style="background-color: lightgrey;" colspan="1">직위</td>
								<td class="p-2" style="width: 120px;" colspan="3">
								<input type="hidden" name="positionId" value="${extReport.positionId}">
									${report.positionName}
								</td>
							</tr>
							<tr class="trHeight">
								<td class="font-weight-bold text-center" style="background-color: lightgrey;" colspan="1">성명</td>
								<td class="p-2" style="width: 150px;" colspan="3">
								<input type="hidden" name="memName" value="${extReport.memName}">
									${memName}
								</td>
							</tr>
							<tr class="trHeight">
								<td class="font-weight-bold text-center" style="background-color: lightgrey;" colspan="1">교육명</td>
								<td class="p-2" style="width: 513px;" colspan="2">
								<input type="hidden" name="clName" value="${extReport.clName}">
									${report.clName}
								</td>
							</tr>
							<tr class="trHeight">
								<td class="font-weight-bold text-center" style="background-color: lightgrey; width: 130px;" colspan="1">수료날짜</td>
								<td class="p-2" style="width: 120px;" colspan="4">
									${fn:substring(report.insertCtfDate,0,10) }
								</td>
							</tr>
							<tr>
								<td class="font-weight-bold text-center" style="background-color: lightgrey;" colspan="1">교육내용</td>
								<td style="height: 380px; vertical-align : top; padding: 10px;" colspan="4">
									${report.eduContent }
								</td>
							</tr>
							<tr>
								<td class="font-weight-bold text-center" style="background-color: lightgrey;" colspan="1">소감</td>
								<td style="width:511px; height: 380px; vertical-align : top; padding: 10px;" colspan="4">
									${report.eduReview }
								</td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
			<div class="row p-0 pl-5">
				<div class="ml-2 col-7 p-0"></div>
				<button type="button" class="col-2 ml-4 btn btn-block btn-primary" onclick="buttonClick(${report.extNo}, true, '${report.memEmail }')">승인</button>
				<button type="button" class="col-2 m-0 ml-2 btn btn-block btn-danger" onclick="buttonClick(${report.extNo}, false, '${report.memEmail }')">반려</button>
			</div>
		</div>
		<div style="width: 210mm;
						min-height: 367mm;

						margin: 10mm auto;
						border-radius: 5px;
						background: #fff;
						box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
						width:  793.69px; height:  1387.08px;
					">
		
		
			<iframe src="/ago/user/departmentHead/getExtImg.do?fileNM=/${report.attachDoc }" style="width: 100%; height: 100%;">

			
			</iframe>
		</div>
		
	</div>
	<script type="text/javascript">
	window.onload=function(){
		ReportPictureThumb(document.querySelector('#agoStamp'), 'agoStamp.jpg', '<%=request.getContextPath()%>');
	}

	
		function buttonClick(no, check, memEmail) {
			$.ajax({
				url : "buttonClick?reType=E&no="+no+"&check="+check+"&memEmail="+memEmail+"&opcl=0&memClNo='0'",
				type : "get",
				dataType : "text",
				success : function(data){
					 opener.location.reload();
					 if(data == "0"){
						 alert("보고서가 반려되었습니다.")
					 }else{
						 alert("보고서가 승인되었습니다.")
					 }
					 window.close();
				},
				error:function(error){
					AjaxErrorSecurityRedirectHandler(error.status);
				}
			});
		}
		
	</script>

</body>


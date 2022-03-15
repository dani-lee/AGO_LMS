<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="certificate" value="${dataMap.certificate}" />
<c:set var="memCertificate" value="${dataMap.memCertificate}" />
<c:set var="today" value="<%=new java.util.Date()%>" />

<head>
<meta charset="UTF-8">
<title>AGO교육수료증</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@700&display=swap" rel="stylesheet">

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/report.css">
</head>
<body>
	<div>
		<div>
			<button class="col-2 ml-3 mt-3 btn btn-default" id="printReport" onclick="print_report();">출력하기</button>
		</div>
<!-- 		style="padding-left: 50px; padding: 20mm;" -->
		<div id="onlyPrint" class="paper p-0">
			<div class="mx-auto row p-5" id="UserCtfDesign" data-id="${certificate.ctfDesign}" style="margin-top:8mm; border: 3px solid red; height: 100%; width: 100%; display: inline-block; margin-left: auto; margin-right: auto; background-size: 90%;">
				<div class="content" style="border: 3px solid blue; padding: 20mm;">
					<div class="container-fluid capture_area" id="pdf_wrap" style="padding: 0px;">
						<div class="col-12 float-left mt-5" style="font-size: 18px; font-family: 'Nanum Myeongjo', serif;">
							제
							<fmt:formatDate value="${memCertificate.ctfDate}" pattern="yyMMdd" />
							-
							<fmt:formatNumber value="${memCertificate.countPrint}" pattern="000000" />
							호
						</div>
						<br>
						<br>
						<div class="col-12 text-center mt-5" style="font-size: 45px; font-family: 'Nanum Myeongjo', serif;">
							<span class="mt-5 font-weight-bold">${certificate.ctfTitle}</span>
						</div>
						<br>
						<table>
							<tbody>
								<tr style="width: 1000px; height: 50px;">
									<td></td>
								</tr>
								<tr style="height: 65px;">
									<td style="width: 150px;">
										<span class="font-weight-bold" style="width: 140px; font-size: 18px; font-family: 'Nanum Myeongjo', serif;"> 성명(생년월일) : </span>
									</td>
									<td>
										<span style="font-size: 18px; font-family: 'Nanum Myeongjo', serif;"> ${memCertificate.memName}(<fmt:formatDate value="${memCertificate.memBir}" pattern="yyMMdd" />)
										</span>
									</td>
								</tr>
								<tr style="height: 65px;">
									<td style="width: 120px;">
										<div style="font-size: 18px; font-family: 'Nanum Myeongjo', serif;">
											<span class="pl-4 font-weight-bold">교육과정명 :</span>
										</div>
									</td>
									<td>
										<span style="font-size: 18px; font-family: 'Nanum Myeongjo', serif;"> ${memCertificate.clName} </span>
									</td>
								</tr>
								<tr style="height: 65px;">
									<td>
										<span class="font-weight-bold" style="width: 140px; font-size: 18px; font-family: 'Nanum Myeongjo', serif;"> 교육기간(시간) : </span>
									</td>
									<td>
										<span style="font-size: 18px; font-family: 'Nanum Myeongjo', serif;"> ${memCertificate.clCreditTime}시간 </span>
									</td>
								</tr>
								<tr style="height: 300px;">
									<td colspan="5">
										<span style="font-size: 23px; font-family: 'Nanum Myeongjo', serif;">${certificate.ctfContent}</span>
									</td>
								</tr>
								<tr>
									<td colspan="5">
										<div style="height: 120px;"></div>
									</td>
								</tr>
								<tr>
									<td colspan="5">
										<div class="float-right mt-3" style="font-size: 28px; font-family: 'Nanum Myeongjo', serif;">
											<fmt:formatDate value="${today}" pattern="yyyy년 MM월 dd일" />
										</div>
									</td>
								</tr>
								<tr style="height: 100px;">
									<td></td>
								</tr>
								<tr>
									<td colspan="5" class="text-center mt-4 pt-5">
										<span class="mt-5 mr-1" style="font-size: 35px; font-family: 'Nanum Myeongjo', serif;">${certificate.retName}</span>
										<div id="UserCtfSeal" data-id="${certificate.ctfSeal}" style="width: 120px; height: 120px; position: relative; right: -450px; top: -80px;"></div>
									</td>
								</tr>

							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>

		<div id="onlyShow" class="paper p-0 pt-5">
			<div class="mx-auto row" id="UserCtfDesignShow" data-id="${certificate.ctfDesign}" style="border: 3px solid red; height: 100%; width: 100%; display: inline-block; margin-left: auto; margin-right: auto;">
				<div class="content" style="border: 3px solid blue; padding:20mm;">
					<div class="container-fluid capture_area" id="pdf_wrap" style="padding: 0px;">
						<div class="col-12 float-left mt-5" style="font-size: 18px; font-family: 'Nanum Myeongjo', serif;">
							제
							<fmt:formatDate value="${memCertificate.ctfDate}" pattern="yyMMdd" />
							-
							<fmt:formatNumber value="${memCertificate.countPrint}" pattern="000000" />
							호
						</div>
						<br>
						<br>
						<div class="col-12 text-center mt-5" style="font-size: 45px; font-family: 'Nanum Myeongjo', serif;">
							<span class="mt-5 font-weight-bold">${certificate.ctfTitle}</span>
						</div>
						<br>
						<table>
							<tbody>
								<tr style="width: 1000px; height: 50px;">
									<td></td>
								</tr>
								<tr style="height: 65px;">
									<td style="width: 150px;">
										<span class="font-weight-bold" style="width: 140px; font-size: 18px; font-family: 'Nanum Myeongjo', serif;"> 성명(생년월일) : </span>
									</td>
									<td>
										<span style="font-size: 18px; font-family: 'Nanum Myeongjo', serif;"> ${memCertificate.memName}(<fmt:formatDate value="${memCertificate.memBir}" pattern="yyMMdd" />)
										</span>
									</td>
								</tr>
								<tr style="height: 65px;">
									<td style="width: 120px;">
										<div style="font-size: 18px; font-family: 'Nanum Myeongjo', serif;">
											<span class="pl-4 font-weight-bold">교육과정명 :</span>
										</div>
									</td>
									<td>
										<span style="font-size: 18px; font-family: 'Nanum Myeongjo', serif;"> ${memCertificate.clName} </span>
									</td>
								</tr>
								<tr style="height: 65px;">
									<td>
										<span class="font-weight-bold" style="width: 140px; font-size: 18px; font-family: 'Nanum Myeongjo', serif;"> 교육기간(시간) : </span>
									</td>
									<td>
										<span style="font-size: 18px; font-family: 'Nanum Myeongjo', serif;"> ${memCertificate.clCreditTime}시간 </span>
									</td>
								</tr>
								<tr style="height: 300px;">
									<td colspan="5">
										<span style="font-size: 23px; font-family: 'Nanum Myeongjo', serif;">${certificate.ctfContent}</span>
									</td>
								</tr>
								<tr>
									<td colspan="5">
										<div style="height: 120px;"></div>
									</td>
								</tr>
								<tr>
									<td colspan="5">
										<div class="float-right mt-3" style="font-size: 28px; font-family: 'Nanum Myeongjo', serif;">
											<fmt:formatDate value="${today}" pattern="yyyy년 MM월 dd일" />
										</div>
									</td>
								</tr>
								<tr>
									<td colspan="5" class="text-center mt-4 pt-5">
										<span class="mt-5 mr-1" style="font-size: 35px; font-family: 'Nanum Myeongjo', serif;">${certificate.retName}</span>
										<div id="UserCtfSealShow" data-id="${certificate.ctfSeal}" style="width: 120px; height: 120px; position: relative; right: -430px; top: -80px;"></div>
									</td>
								</tr>

							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 이미지 불러오기 -->
	<script type="text/javascript">
		window.onload=function(){
			UserCertificatePictureThumb(document.querySelector('#UserCtfDesign'), '${certificate.ctfDesign}', '<%=request.getContextPath()%>');
			UserCertificatePictureThumb(document.querySelector('#UserCtfSeal'), '${certificate.ctfSeal}', '<%=request.getContextPath()%>');
			UserCertificatePictureThumb(document.querySelector('#UserCtfDesignShow'), '${certificate.ctfDesign}', '<%=request.getContextPath()%>');
			UserCertificatePictureThumb(document.querySelector('#UserCtfSealShow'), '${certificate.ctfSeal}', '<%=request.getContextPath()%>');
		}
	</script>
	<script type="text/javascript">
		function print_report() {
			window.print();
		}
	</script>

</body>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="certificate" value="${dataMap.certificate}" />
<c:set var="memCertificate" value="${dataMap.memCertificate}" />
<c:set var="today" value="<%=new java.util.Date()%>" />

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>certificate</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@700&display=swap" rel="stylesheet">
</head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<body>
	<div class="container-fluid p-0">
		<div class="row" style="height: 50px; width: 100%; display: inline-block; margin-left: auto; margin-right: auto; background: #646E78;">
			<button id="create_pdf" class="col-1" style="background: none; border: none; color: white;">
				<i class="fas fa-file-download" style="font-size: 30px; margin-top: 10px; color: white;"></i>
			</button>
		</div>
	</div>

	<div class="container-fluid capture_area" id="pdf_wrap">
		<div class="mx-auto p-5 pl-0 row" data-id="${certificate.ctfDesign}" style="height: 1120px; width: 780px; display: inline-block; margin-left: auto; margin-right: auto; background-image: url('http://127.0.0.1:80/D:/A_TeachingMaterial/7.LastProject/workspace/AGO2/src/main/webapp/resources/certificate/${certificate.ctfDesign}'); background-repeat: no-repeat; background-size: 100%;">
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
				<span class="mt-5 font-weight-bold" >${certificate.ctfTitle}</span>
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
							<div data-id="${certificate.ctfSeal}" style="width: 120px; height: 120px; position: relative; right: -500px; top: -80px;"></div>
						</td>
					</tr>

				</tbody>
			</table>
		</div>
	</div>

	<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.min.js"></script>
	<script type="text/javascript" src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
	
	<!-- 이미지 불러오기 -->
	<script type="text/javascript">
	window.onload=function(){
		UserCertificatePictureThumb(document.querySelector('[data-id="${certificate.ctfDesign}"]'), '${certificate.ctfDesign}', '<%=request.getContextPath()%>');
		UserCertificatePictureThumb(document.querySelector('[data-id="${certificate.ctfSeal}"]'), '${certificate.ctfSeal}', '<%=request.getContextPath()%>');
	}
	</script>

	<script type="text/javascript">
		$('#create_pdf').click(function() {
			html2canvas($('#pdf_wrap')[0]).then(function(canvas) {
				var doc = new jsPDF('p', 'mm', 'a4'); //jspdf객체 생성
				var imgData = canvas.toDataURL('image/png'); //캔버스를 이미지로 변환
				doc.addImage(imgData, 'PNG', 0, 0); //이미지를 기반으로 pdf생성
				doc.save('sample-file.pdf'); //pdf저장
			});
		});

		function export_to_pdf() {

			html2canvas($('#pdf_wrap'), {
				useCORS : true,
				onrendered : function(canvas) {
					var img = canvas.toDataURL("image/jpeg,1.0");
					var pdf = new jsPDF();

					pdf.addImage(img, 'JPEG', 0, 0);
					pdf.save('filename.pdf');
				}
			});

		}

	</script>
</body>









































































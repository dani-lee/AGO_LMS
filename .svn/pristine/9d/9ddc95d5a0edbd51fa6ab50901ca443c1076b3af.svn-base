<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="member" value="${member }"/>
<c:set var="convert" value="${convert }"/>
<head></head>
<title></title>

<body>
	<div class="container-fluid">
		<div class="row" style="height: 50px; width: 100%; display: inline-block; margin-left: auto; margin-right: auto; background: #646E78;">
			<button id="create_pdf" class="col-1" style="background: none; border: none; color: white;">
				
			</button>
			<button class="float-right" style="background: none; border: none; color: white;">
				
			</button>
		</div>
		<button type="button" class="btn btn-primary" onclick="registExt()">등록 </button>
	</div>
	<div class="container-fluid col-9">
		<div class="mx-auto p-5 row" style="height: 1224px; width: 800px; display: inline-block; margin-left: auto; margin-right: auto;" id="pdf_wrap">
			<div class="mx-auto">
				<h3 class="text-center" style="font-family: 'Nanum Myeongjo', serif; margin-left : 140px;">교육 이수 보고서</h3>
			</div>
			<br>
			<form role="extForm" action="registExt.do" method="post" enctype="multipart/form-data">
				<table border="3" style="width : 800px;">
					<tbody>
						<tr style="height: 30px;">
							<td class="font-weight-bold text-center" style="background-color: lightgrey; width: 110px; font-family: 'Nanum Myeongjo', serif;">부서명</td>
							<td style="width: 160px;">
								<input class="form-control" type="text" name="" style="border: none; border-right: 0px; border-top: 0px; boder-left: 0px; boder-bottom: 0px; background-color: white;" value="${convert.dpId }" readonly>
								<input type="hidden" name="dpId" value="${member.dpId}">
							</td>
								
							<td class="font-weight-bold text-center" style="width: 80px; background-color: lightgrey; font-family: 'Nanum Myeongjo', serif;">직위</td>
							<td style="width: 110px;">
								<input class="form-control" type="text" name="" style="border: none; border-right: 0px; border-top: 0px; boder-left: 0px; boder-bottom: 0px; width: 110px; background-color: white;" value="${convert.positionId }" readonly>
								<input type="hidden" name="dpId" value="${member.positionId}">
							</td>

							<td class="font-weight-bold text-center" style="background-color: lightgrey; width: 100px; font-family: 'Nanum Myeongjo', serif;">성명</td>
							<td style="width: 150px;">
								<input class="form-control" type="text" name="" style="border: none; border-right: 0px; border-top: 0px; boder-left: 0px; boder-bottom: 0px; background-color: white;" value="${member.memName }" readonly>
								<input type="hidden" name="memName" value="${member.memName }">
							</td>
						</tr>
						<tr style="height: 30px;">
							<td class="font-weight-bold text-center" style="background-color: lightgrey; font-family: 'Nanum Myeongjo', serif;">강의명</td>
							<td style="width: 390px;" colspan="5">
								<input class="form-control" type="text" name="clName" style="width: 90%; border: none; border-right: 0px; border-top: 0px; boder-left: 0px; boder-bottom: 0px;">
							</td>

						</tr>
						<tr style="height: 30px;">
							<td class="font-weight-bold text-center" style="background-color: lightgrey; width: 130px; font-family: 'Nanum Myeongjo', serif;">수료날짜</td>
							<td style="width: 120px;" colspan="5">
								<input class="form-control" type="date" name="extRegdate" style="width: 100%; border: none; border-right: 0px; border-top: 0px; boder-left: 0px; boder-bottom: 0px;">
							</td>
							<!-- <td class="font-weight-bold text-center" style="background-color: lightgrey;">학습기간</td>
							<td colspan="2">
								<input class="form-control" type="date" name="" style="width: 90%; border: none; border-right: 0px; border-top: 0px; boder-left: 0px; boder-bottom: 0px;">
							</td> -->
						</tr>
						<tr style="height: 320px;">
							<td class="font-weight-bold text-center" style="background-color: lightgrey; font-family: 'Nanum Myeongjo', serif;">교육내용</td>
							<td style="" colspan="7">
								<textarea class="form-control" name="eduContent" style="width: 100%; height: 100%; border: none; resize: none;" rows="10" cols=""></textarea>
							</td>
						</tr>
						<tr style="height: 380px;">
							<td class="font-weight-bold text-center" style="background-color: lightgrey; font-family: 'Nanum Myeongjo', serif;">교육소감</td>
							<td style="" colspan="7">
								<textarea class="form-control" name="eduReview" style="width: 100%; height: 100%; border: none; resize: none;" rows="10" cols=""></textarea>
							</td>
						</tr>
						<tr style="height: 30px;">
							<td class="font-weight-bold text-center" style="background-color: lightgrey; font-family: 'Nanum Myeongjo', serif;">수료증</td>
							<td colspan="5">
								<!-- <input class="form-control" type="file"> -->

								<div class="custom-file">
									<input type="file" name="attachDoc" class="custom-file-input" id="customFile" style="border: none; border-right: 0px; border-top: 0px; boder-left: 0px; boder-bottom: 0px;">
									<label class="custom-file-label" for="customFile">파일선택</label>
								</div>

							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
		<br>
	</div>
	<!-- pdf 형식으로 다운받기 -->
	<script type="text/javascript">
		$('#create_pdf').click(function() {
			//pdf_wrap을 canvas객체로 변환
			html2canvas($('#pdf_wrap')[0]).then(function(canvas) {
				var doc = new jsPDF('p', 'mm', 'a4'); //jspdf객체 생성
				var imgData = canvas.toDataURL('image/png'); //캔버스를 이미지로 변환
				doc.addImage(imgData, 'PNG', 0, 0); //이미지를 기반으로 pdf생성
				doc.save('sample-file.pdf'); //pdf저장
			});
		});
		
		function registExt(){
			form = $('form[role="extForm"]')[0];
			formData = new FormData(form);

			$.ajax({
				url : 'registExt.do',
				data : formData,
				type : 'post',
				processData : false,
				contentType : false,
				success : function(data) {
					alert(data);
					location.href = "list.do";
				},
				error : function(error) {
					//alert("현재 사진 업로드가 불가합니다. \n 관리자에게 연락바랍니다.");
					AjaxErrorSecurityRedirectHandler(error.status);
					console.log(error.status);
				}
			})
		}
		
	</script>
</body>

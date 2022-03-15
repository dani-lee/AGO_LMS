<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<head>
<meta charset="UTF-8">
<title>교육이수보고서</title>
<style>
body {
	width: 100%;
	height: 100%;
	margin: 0;
	padding: 0;
	background-color: #ddd;
}

* {
	box-sizing: border-box;
	-moz-box-sizing: border-box;
}

.paper {
	width: 210mm;
	min-height: 367mm;
	padding: 20mm; /* set contents area */
	margin: 10mm auto;
	border-radius: 5px;
	background: #fff;
	box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
}

.content {
	padding: 0;
/* 	border: 1px #888 dotted; */
	height: 327mm;
}

@page {
	size: A4;
	margin: 0;
}

@media print {
	html, body {
		width: 210mm;
		height: 367mm;
		background: #fff;
	}
	.paper {
		margin: 0;
		border: initial;
		border-radius: initial;
		width: initial;
		min-height: initial;
		box-shadow: initial;
		background: initial;
		page-break-after: always;
	}
	#printReport {
		display: none;
	}
	#submission {
		display: none;
	}
	#onlyShow {
		display: none;
	}
	.dawrasfsertgdrzhxdtez {
		border: 2px soild red;
	}
}

@media screen {
	#onlyPrint {
		display: none;
	}
}

.trHeight {
	height: 55px;
}

.tdLabel {
	background-color: lightgrey;
}

.showTrHeight {
	height: 10px;
}

.showTdLabel {
	background-color: lightgrey;
}
</style>
</head>
<body>

	<div>
		<div>
			<button class="col-2 ml-3 mt-3 btn btn-default" id="printReport" onclick="print_report();">출력하기</button>
		</div>

		<div id="onlyPrint" class="paper">
			<div class="content" style="padding-left: 50px;">
				<div class="row mb-3" style="height: 130px;">
					<div class="mr-5 pt-4 pl-5" style="width: 357px;">
						<span class="text-center text-bold" style="font-size: 35px;">교육이수보고서</span>
					</div>
					<div style="width: 225px; margin-left: 120px;">
						<table border="1">
							<tr>
								<td class="text-center">교육담당</td>
								<td class="text-center">부서장</td>
							</tr>
							<tr>
								<td style="width: 110px; height: 90px;">얘는 걍 도장 박아놓는거 어떤가염?</td>
								<td style="width: 110px; height: 90px;"></td>
							</tr>
						</table>
					</div>
				</div>
				<form action="" enctype="multipart/form-data">
					<table border="1">
						<tbody>
							<tr class="trHeight">
								<td class="font-weight-bold text-center" style="background-color: lightgrey; width: 100px;" rowspan="3" colspan="1">교육수료자</td>
								<td class="font-weight-bold text-center" style="background-color: lightgrey; width: 100px;" colspan="1">부서명</td>
								<td style="width: 180px;" colspan="3">
									<input class="form-control" type="text" name="department_name" style="border: none; border-right: 0px; border-top: 0px; boder-left: 0px; boder-bottom: 0px;">
								</td>
							</tr>
							<tr class="trHeight">
								<td class="font-weight-bold text-center" style="background-color: lightgrey;" colspan="1">직위</td>
								<td style="width: 120px;" colspan="3">
									<input class="form-control" type="text" name="" style="border: none; border-right: 0px; border-top: 0px; boder-left: 0px; boder-bottom: 0px; width: 100%;">
								</td>
							</tr>
							<tr class="trHeight">
								<td class="font-weight-bold text-center" style="background-color: lightgrey;" colspan="1">성명</td>
								<td style="width: 150px;" colspan="3">
									<input class="form-control" type="text" name="user_name" style="border: none; border-right: 0px; border-top: 0px; boder-left: 0px; boder-bottom: 0px;">
								</td>
							</tr>
							<tr class="trHeight">
								<td class="font-weight-bold text-center" style="background-color: lightgrey;" colspan="1">교육명</td>
								<td style="width: 390px;" colspan="2">
									<input class="form-control" type="text" name="report_class_name" style="width: 100%; border: none; border-right: 0px; border-top: 0px; boder-left: 0px; boder-bottom: 0px;">
								</td>
								<td class="font-weight-bold text-center" style="background-color: lightgrey; width: 100px;" colspan="1">교육분류</td>
								<td colspan="1" style="width: 130px;">자기개발/취미</td>
							</tr>
							<tr class="trHeight">
								<td class="font-weight-bold text-center" style="background-color: lightgrey; width: 130px;" colspan="1">수료날짜</td>
								<td style="width: 120px;" colspan="4">
									<input class="form-control" type="date" name="user_class_no" style="width: 100%; border: none; border-right: 0px; border-top: 0px; boder-left: 0px; boder-bottom: 0px;">
								</td>
							</tr>
							<tr>
								<td class="font-weight-bold text-center" style="background-color: lightgrey;" colspan="1">교육내용</td>
								<td style="height: 380px;" colspan="4">
									<textarea class="form-control" name="education_content" style="width: 100%; height: 95%; border: none; resize: none;" rows="10"></textarea>
								</td>
							</tr>
							<tr>
								<td class="font-weight-bold text-center" style="background-color: lightgrey;" colspan="1">소감</td>
								<td style="height: 380px;" colspan="4">
									<textarea class="form-control" name="education_review" style="width: 90%; height: 90%; border: none; resize: none;" rows="11"></textarea>
								</td>
							</tr>
							<tr class="trHeight">
								<td class="font-weight-bold text-center" style="background-color: lightgrey;" colspan="1">수료증</td>
								<td colspan="4">
									<div class="custom-file">
										<input type="file" name="attach_document" class="custom-file-input" id="customFile" style="border: none; border-right: 0px; border-top: 0px; boder-left: 0px; boder-bottom: 0px;">
										<label class="custom-file-label" for="customFile">파일선택</label>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
		</div>

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
								<td style="width: 110px; height: 90px;">얘는 걍 도장 박아놓는거 어떤가염?</td>
								<td style="width: 110px; height: 90px;"></td>
							</tr>
						</table>
					</div>
				</div>
				<form action="" enctype="multipart/form-data">
					<table border="1">
						<tbody>
							<tr class="trHeight">
								<td class="font-weight-bold text-center" style="background-color: lightgrey; width: 100px;" rowspan="3" colspan="1">교육수료자</td>
								<td class="font-weight-bold text-center" style="background-color: lightgrey; width: 100px;" colspan="1">부서명</td>
								<td style="width: 180px;" colspan="3">
									<input class="form-control" type="text" name="department_name" style="border: none; border-right: 0px; border-top: 0px; boder-left: 0px; boder-bottom: 0px;">
								</td>
							</tr>
							<tr class="trHeight">
								<td class="font-weight-bold text-center" style="background-color: lightgrey;" colspan="1">직위</td>
								<td style="width: 120px;" colspan="3">
									<input class="form-control" type="text" name="" style="border: none; border-right: 0px; border-top: 0px; boder-left: 0px; boder-bottom: 0px; width: 100%;">
								</td>
							</tr>
							<tr class="trHeight">
								<td class="font-weight-bold text-center" style="background-color: lightgrey;" colspan="1">성명</td>
								<td style="width: 150px;" colspan="3">
									<input class="form-control" type="text" name="user_name" style="border: none; border-right: 0px; border-top: 0px; boder-left: 0px; boder-bottom: 0px;">
								</td>
							</tr>
							<tr class="trHeight">
								<td class="font-weight-bold text-center" style="background-color: lightgrey;" colspan="1">교육명</td>
								<td style="width: 390px;" colspan="2">
									<input class="form-control" type="text" name="report_class_name" style="width: 100%; border: none; border-right: 0px; border-top: 0px; boder-left: 0px; boder-bottom: 0px;">
								</td>
								<td class="font-weight-bold text-center" style="background-color: lightgrey; width: 100px;" colspan="1">교육분류</td>
								<td colspan="1" style="width: 130px;">자기개발/취미</td>
							</tr>
							<tr class="trHeight">
								<td class="font-weight-bold text-center" style="background-color: lightgrey; width: 130px;" colspan="1">수료날짜</td>
								<td style="width: 120px;" colspan="4">
									<input class="form-control" type="date" name="user_class_no" style="width: 100%; border: none; border-right: 0px; border-top: 0px; boder-left: 0px; boder-bottom: 0px;">
								</td>
							</tr>
							<tr>
								<td class="font-weight-bold text-center" style="background-color: lightgrey;" colspan="1">교육내용</td>
								<td style="height: 380px;" colspan="4">
									<textarea class="form-control" name="education_content" style="width: 100%; height: 95%; border: none; resize: none;" rows="10" cols=""></textarea>
								</td>
							</tr>
							<tr>
								<td class="font-weight-bold text-center" style="background-color: lightgrey;" colspan="1">소감</td>
								<td style="height: 380px;" colspan="4">
									<textarea class="form-control" name="education_review" style="width: 100%; height: 95%; border: none; resize: none;" rows="10" cols=""></textarea>
								</td>
							</tr>
							<tr class="trHeight">
								<td class="font-weight-bold text-center" style="background-color: lightgrey;" colspan="1">수료증</td>
								<td colspan="4">
									<div class="custom-file">
										<input type="file" name="attach_document" class="custom-file-input" id="customFile" style="border: none; border-right: 0px; border-top: 0px; boder-left: 0px; boder-bottom: 0px;">
										<label class="custom-file-label" for="customFile">파일선택</label>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		function print_report() {
			alert("여기서 데이터 넣어줘야돼....");
			window.print();
		}
	</script>

</body>


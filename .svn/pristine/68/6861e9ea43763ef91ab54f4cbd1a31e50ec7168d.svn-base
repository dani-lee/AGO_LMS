<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<head></head>

<title>회원등록</title>

<body>

	<!-- 메인 헤더 -->
	<!-- Content Header (Page header) -->
	<div class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h4 class="m-0">회원 등록</h4>
				</div>
				<!-- /.col -->
				<!-- <div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item">
							<i class="fas fa-home"></i>
						</li>
						<li class="breadcrumb-item">
							<a href="#">회원관리</a>
						</li>
						<li class="breadcrumb-item active">회원등록</li>
					</ol>
				</div> -->
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
			<form id="forExcel" name="forExcel" action="<%=request.getContextPath() %>/manager/userManagement/uploadExcelFile.do" enctype="multipart/form-data" method="post">
				<div class="d-block">
					<button type="button" class="btn btn-outline-secondary btn-block btn-flat col-4" onclick="location.href='<%=request.getContextPath()%>/manager/userManagement/getFile.do'">
						<i class="fas fa-arrow-alt-circle-down"></i>&nbsp;엑셀 양식 다운
					</button>
				</div>
				<br>
				<div class="form-group d-flex">
						<label for="excelFile" class="btn btn-outline-secondary btn-block btn-flat col-2">파일선택</label>
						<input type="file" id="excelFile" name="excelFile" style="display: none" onchange="fn_checkFile();"/>
						<input id="inputFileName" class="form-control rounded-0" type="text" name="tempPicture" disabled value="-" />
						<label for="upload" class="btn btn-secondary btn-flat col-2" onclick="fn_upload();">업로드</label>
				</div>
			</form>
		</div>
	</section>

<script>

function fn_checkFile(){
	
	let fileInput = document.getElementById('excelFile');   
	let fileName = fileInput.files[0].name;
	let fileFormat = fileName.substr(fileName.lastIndexOf('.')+1).toUpperCase();
	
	if(!(fileFormat == "XLX" || fileFormat == "XLSX")){
		alert("엑셀파일만 업로드 가능합니다.");
		return;
	}
	
// 	if(excelfile.files[0].size > 1024*1024*1){
// 		alert("용량은 1MB 이하만 가능합니다.");
// 		picture.value = "";
// 		return;
// 	}
	
	document.getElementById('inputFileName').value = fileName;
}


function fn_upload() {
	let fileInput = document.getElementById('excelFile').value; 
	if(fileInput == "" || fileInput == null ){
		alert("파일이 선택되지않았습니다.");
	}
	
	if(confirm("업로드 하시겠습니까?")){
		let form = new FormData(document.getElementById('forExcel'));
		$.ajax({
			url : "uploadExcelFile.do",
			data : form,
			processData : false,
			contentType : false,
			type : "POST",
			success : function(data) {
				console.log(data);
				alert("등록되었습니다.");
				opener.location.replace("<%=request.getContextPath()%>/manager/userManagement/list.do");
			    window.close();
// 				document.getElementById('result').innerHTML = JSON.stringify(data);
			}
		})
// 		document.forExcel.submit();
	}
}
</script>

</body>

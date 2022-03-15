<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<head>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/js/summernote/summernote-bs4.min.css" />
<script src="<%=request.getContextPath() %>/resources/js/summernote/summernote-bs4.min.js"></script>
</head>

<title></title>

<body>

<!-- 메인 헤더 -->
<!-- Content Header (Page header) -->
<div class="content-header">
	<div class="container-fluid">
		<div class="row mb-2">
			<div class="col-sm-6">
				<h4 class="m-0">토론게시판</h4>
			</div>
			<!-- /.col -->
			<div class="col-sm-6">
				<ol class="breadcrumb float-sm-right">
				<li class="breadcrumb-item">
					<i class="fas fa-home"></i>
				</li>
				<li class="breadcrumb-item">
					<a href="<%=request.getContextPath()%>/user/community/freeBoard/list.do">커뮤니티</a>
				</li>
				<li class="breadcrumb-item active">토론게시판</li>
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
        
        <form role="registForm" action="modify.do" method="post">
        	<input type="hidden" name="dboardNo" value="${debateBoard.dboardNo }">
			<table id="maincontent" class="table table-sm">
                <thead>
                    <tr>
                        <td class="font-weight-bold text-center" style="background-color:#E6EFFC;">제목</td>
                        <td colspan="4"><input type="text" class="form-control form-control-sm" name="deTitle" id="deTitle" value="${debateBoard.deTitle }"></td>
                    </tr>
        
                    <tr>
                        <td class="font-weight-bold text-center" style="background-color:#E6EFFC;">작성자</td>
                        <td colspan="4">
<!-- 							<input type="text" class="form-control" style="display: none;"> -->
                            <!-- <input type="text" class="form-control" name="writer" value="dani" disabled> -->
                            <input type="text"  readonly class="form-control-plaintext form-control-sm ml-3" name="memId"  id="memId" value="${loginUser.memId}">
                        </td>
                    </tr>               
                </thead>
                <tbody>
                    <tr>
                        <td colspan="5">
                        <textarea class="textarea" name="deContent" id="content" rows="20" placeholder="1000자 내외로 작성하세요." style="display: none;">${fn:escapeXml(debateBoard.deContent) }</textarea>
                        </td>
                    <tr>
                </tbody>
            </table>
        </form>
        
        <%@ include file="/WEB-INF/views/common/summernote.jsp" %>
        
        <div style="float : right; margin-right: 20px;">
            <button class="btn btn-primary"  type="button" onclick="fn_modify()">수정</button>
            <button class="btn btn-default" type="button" onclick="history.go(-1)">취소</button>
        </div>
    
    </div>
</section>
    
    
    <script>
    window.onload = function(){
        summernote_go($('textarea#content'));
    }
    
    
    function fn_modify(){

    	let form = document.querySelector('form[role="registForm"]');
		let inputTitle = document.querySelector("#deTitle");
		if(!inputTitle.value){
			alert("제목을 입력하세요");
			return;
		}
		if(confirm("수정하시겠습니까?")){
			form.submit();
		}
    }
    
    
    
    </script>

</body>
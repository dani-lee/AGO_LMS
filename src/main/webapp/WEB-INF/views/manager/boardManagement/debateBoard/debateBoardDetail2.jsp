<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<head></head>

<title></title>

<body>
	<!-- 메인 바디 -->
	<!-- Main content -->
	<section class="content">
		<div class="container-fluid">
			<div class="col-md-12">
				<!-- Box Comment -->
				<div class="card-widget">
					<div class="card-header row">
						<div class="user-block col-12">
							<div class="row mb-2">
								<div class="col-sm-6">
									<p class="text-secondary">대나무숲</p>
								</div>
								<div class="col-sm-6">
									<ol class="breadcrumb float-sm-right m-0 p-0" style="background-color : white;">
										<li class="breadcrumb-item">
											<i class="fas fa-home"></i>
										</li>
										<li class="breadcrumb-item">
											<a href="#">게시판관리</a>
										</li>
										<li class="breadcrumb-item active">대나무숲</li>
									</ol>
								</div>
							</div>
						</div>
					
						<div class="buttons row">
							<div class="ml-2">
									<button type="button" class="btn btn-tool" onclick="fn_delete();">
										<i class="fas fa-eraser text-danger"></i><span class="text-danger font-weight-bold">&nbsp;삭제&nbsp;</span>
									</button>
								</div>
							<button class="btn btn-default btn-sm float-right ml-auto mr-2" onclick="location.href='list.do'">
								<i class="la la-angle-double-left"></i> &nbsp;목록
							</button>
						</div>
						
						
						<div class="user-block col-12">
							<div class="row">
								<p class="ml-2 text-secondary">대나무숲</p>
							</div>
							<p class="h5">${freeBoard.freeTitle }</p>
							<p class="text-secondary m-0">
								<c:if test="${not empty freeBoard.nickName }">
									<b>${freeBoard.nickName }</b>
								</c:if>
								<c:if test="${empty freeBoard.nickName }">
									<b>${freeBoard.memId }</b>
								</c:if>
							</p>
							
							<div class="d-block">
								<p class="text-secondary float-left">
									<fmt:formatDate value="${freeBoard.freeRegdate}" pattern="yyyy-MM-dd" />
									&nbsp;| &nbsp;
								</p>
								<p class="text-secondary float-left">조회&nbsp;${freeBoard.freeViewCnt}</p>
								<div class="justify-content-end float-right" id="tools">
									<a href="#replies-wrapper">
									<button type="button" class="btn btn-tool" data-spy="scroll">
										<i class="far fa-comment-dots mr-2"></i>댓글&nbsp;<span class="font-weight-bold replyCnt">${freeBoard.freeReplyCnt }</span>
									</button>
									</a>
									<button type="button" class="btn btn-tool" onclick="fn_report(${freeBoard.freeNo});">
										<i class="fas fa-bullhorn mr-2"></i>신고 &nbsp;<span class="font-weight-bold reportCnt">${freeBoard.freeReportCnt }</span>
									</button>
								</div>
							</div>
						</div>

					</div>
					<!-- /.card-header -->
					<div class="card-body">
						<div class="content" style="min-height: 500px;">${freeBoard.freeContent}</div>
					</div>
					<!-- /.card-body -->

					<!--댓글-->
					<div class="card-footer card-comments replies-wrapper" id="replies-wrapper">
						<!--댓글-->
						<div class="replies">
							
								

								
							
						</div>
						<div class='text-center'>
							<ul id="pagination" class="pagination justify-content-center mt-4 mb-2" >

							</ul>
						</div>
					</div>
					<!--/댓글-->
				</div>
				<!-- /.card -->
			</div>
		</div>
	</section>
	<%@ include file="./debateReply_js.jsp"%>
<form role="deleteForm" action="delete.do" method="post">
	<input type="hidden" name="freeNo" id="freeNo" value="${freeBoard.freeNo}">
</form>
<script>
function fn_report(freeNo){
	if(confirm("이 게시글을 신고하시겠습니까?")){
		$.ajax({
			url : 'report.do',
			type : "post",
			data : {"freeNo":freeNo},
			success : function(data){
				document.querySelector('.reportCnt').innerHTML = data;
			},
			error:function(error){
				alert("실패")
			}
		});
	}
}

function fn_delete(){
	let form = document.querySelector('form[role="deleteForm"]');
	
	if(confirm("이 게시글을 삭제하시겠습니까?")){
		form.submit();
	}
}

</script>

</body>
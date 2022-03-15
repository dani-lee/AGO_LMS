<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="cri" value="${dataMap.pageMaker.cri }" />


<head></head>

<title></title>
<script>
	if(${message ne null}){
		alert(message);
	}
</script>
<body>
	<!-- 메인 바디 -->
	<!-- Main content -->
	<section class="content" style="width: 1250px; margin: 0 auto;">
		<div class="container-fluid">
			
			<div class="col-md-12">
				<!-- Box Comment -->
				<div class="card-widget">
					<div class="card-header">
						<div class="buttons row">
							<div class="ml-2">
								<c:if test="${debateBoard.memId eq loginUser.memId }">
									<button type="button" class="btn btn-tool" onclick="location.href='modifyForm.do?dboardNo=${debateBoard.dboardNo}'">
										<i class="far fa-edit"></i>&nbsp;수정&nbsp;<span class="text-secondary font-weight-bold"></span>
									</button>
<!-- 									<span class="float-right text-secondary btn">|</span> -->
									<button type="button" class="btn btn-tool" onclick="fn_delete();">
										<i class="fas fa-eraser text-danger"></i><span class="text-danger font-weight-bold">&nbsp;삭제&nbsp;</span>
									</button>
								</c:if>
								</div>
							<button class="btn btn-default btn-sm float-right ml-auto mr-2" onclick="location.href='list.do'">
								<i class="la la-angle-double-left"></i> &nbsp;목록
							</button>
						</div>
						<div class="user-block col-12">
							<div class="row mb-2">
								<div class="col-sm-6">
									<p class="ml-2 text-secondary">토론게시판</p>
								</div>
								<div class="col-sm-6">
									<ol class="breadcrumb float-sm-right m-0 p-0" style="background-color : white;">
										<li class="breadcrumb-item">
											<i class="fas fa-home"></i>
										</li>
										<li class="breadcrumb-item">
											<a href="<%=request.getContextPath()%>/user/community/freeBoard/list.do">커뮤니티</a>
										</li>
										<li class="breadcrumb-item active">토론게시판</li>
									</ol>
				
								</div>
							</div>
							<p class="h5">${debateBoard.deTitle }</p>
							<p class="text-secondary m-0">
								<b>${debateBoard.memId }</b>
							</p>
							
							<div class="d-block">
								<p class="text-secondary float-left">
									<fmt:formatDate value="${debateBoard.deRegdate}" pattern="yyyy-MM-dd" />
									&nbsp;| &nbsp;
								</p>
								<p class="text-secondary float-left mb-1">조회&nbsp;${debateBoard.deViewCnt}</p>
								<div class="justify-content-end float-right" id="tools">
									<a href="#replies-wrapper">
									<button type="button" class="btn btn-tool" data-spy="scroll">
										<i class="far fa-comment-dots mr-2"></i>댓글&nbsp;<span class="font-weight-bold">${debateBoard.replyCnt }</span>
									</button>
									</a>
									<button type="button" class="btn btn-tool" onclick="fn_report(${debateBoard.dboardNo});">
										<i class="fas fa-bullhorn mr-2"></i>신고 &nbsp;<span class="font-weight-bold reportCnt">${debateBoard.deReportCnt }</span>
									</button>
								</div>
							</div>
						</div>

					</div>
					<!-- /.card-header -->
					<div class="card-body">
						<div class="content" style="min-height: 450px;">${debateBoard.deContent}</div>
					</div>
					<!-- /.card-body -->

					<!--댓글-->
					<div class="card-footer card-comments replies-wrapper" id="replies-wrapper">
						<!--댓글-->
						<div class="replies">
						
						</div>
						<c:if test="${debateBoard.replyCnt ne 0}">
							<div class="card-body text-center">
								<%@include file="/WEB-INF/views/common/pagination.jsp"%>
							</div>
						</c:if>
					</div>
					<!--/댓글-->
				</div>
				<!-- /.card -->
			</div>
		</div>
	</section>
	<%@ include file="./debateReply_js.jsp"%>
	<form role="form">
		<input type="hidden" name="dboardNo" value="${debateBoard.dboardNo }" />
	</form>	
<form role="deleteForm" action="delete.do" method="post">
	<input type="hidden" name="dboardNo" value="${debateBoard.dboardNo}">
</form>
<script>

function registReply(){
	form = $('form[role=registReplyForm]')[0];
	formData = new FormData(form);
		
	
	$.ajax({
		url 		: 'registReply.do',
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
function fn_report(dboardNo){
	if(confirm("이 게시글을 신고하시겠습니까?")){
		$.ajax({
			url : 'report.do',
			type : "post",
			data : {"dboardNo":dboardNo},
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

//글 등록하는 곳에 있길래 옮겨옴...댓글을 상세보기에서 등록해야하지 막둥쓰...!!!
//나 오류나서 보니까 replyService에서도 debateService를 불러서 등록했더라구...그거 아니구...상세에서...비동기로......
function fn_registReply(){
	$.ajax({
		url 		: 'registReply.do',
		data 		: formData,
		type 		: 'post',
		processData : false,
		contentType : false,
		success 	: function(data){
			alert(data);
		    window.opener.location.reload();
		    window.close();


		},
		error 		: function(error){
			AjaxErrorSecurityRedirectHandler(error.status);
			console.log(error.status);
		}
	})	    	
}
</script>

</body>
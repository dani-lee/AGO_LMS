<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${pageMaker.cri }" />
<c:set var="debateReplyList" value="${dataMap.debateReplyList }" />

<c:set var="url" value="detail.do" />

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
									<p class="text-secondary">토론게시판</p>
								</div>
								<div class="col-sm-6">
									<ol class="breadcrumb float-sm-right m-0 p-0" style="background-color : white;">
										<li class="breadcrumb-item">
											<i class="fas fa-home"></i>
										</li>
										<li class="breadcrumb-item">
											<a href="<%=request.getContextPath() %>/manager/free/list.do">게시판관리</a>
										</li>
										<li class="breadcrumb-item active">
											<a href="<%=request.getContextPath() %>/manager/debate/list.do" style="color: black; text-decoration: none;">토론게시판</a>
										</li>
									</ol>
								</div>
							</div>
								
							<p class="h5">${debateBoard.deTitle }</p>
							<p class="text-secondary m-0">
								<b>${debateBoard.memId }</b>
							</p>

							<div class="d-block">
								<p class="text-secondary float-left mb-1">
									<fmt:formatDate value="${debateBoard.deRegdate}" pattern="yyyy-MM-dd" />
									&nbsp;| &nbsp;
								</p>
								<p class="text-secondary float-left">조회&nbsp;
									<c:if test="${cri.keyword ne 'noCount'}">${debateBoard.deViewCnt+1}</c:if>
									<c:if test="${cri.keyword eq 'noCount'}">${debateBoard.deViewCnt}</c:if>
								</p>
								<div class="justify-content-end float-right" id="tools">
									<a href="#replies-wrapper">
										<button type="button" class="btn btn-tool" data-spy="scroll">
											<i class="far fa-comment-dots mr-2 text-primary"></i><span class="text-primary font-weight-bold">댓글&nbsp;${debateBoard.replyCnt }</span>
										</button>
										<button type="button" class="btn btn-tool" onclick="fn_remove(${debateBoard.dboardNo});">
											<i class="fas fa-eraser" style="color:#ff7f00"></i><span class="font-weight-bold" style="color:#ff7f00">&nbsp;삭제&nbsp;</span>
										</button>
										<button class="btn btn-tool" onclick="location.href='list.do'">
											<i class="fas fa-solid fa-list-ul"></i><span class="pl-1 font-weight-bold text-black">목록</span>
										</button>
									</a>
								</div>
							</div>
						</div>

					</div>
					<!-- /.card-header -->
					<div class="card-body">
						<div class="content" style="min-height: 500px;">${debateBoard.deContent}</div>
					</div>
					<!-- /.card-body -->
					
					<!--댓글-->
					<div class="card-footer card-comments replies-wrapper" id="replies-wrapper">
						<input type="hidden" name="keyword" value="noCount">
						<!--댓글-->
						<div class="replies">
							<c:forEach var="debateReply" items="${debateReplyList}" varStatus="status">
								<c:if test="${status.first}">
									<div class="card-comment reply-div">
										<div class="comment-text">
											<div class="username" id="username">
												<span class="username">${debateReply.memId}
													<div class="float-right dropdown">
														<span class="text-muted float-left mr-3">
															<fmt:formatDate value="${debateReply.dereplyRegdate}" pattern="yyyy-MM-dd HH:mm:ss"/>
														</span>
													</div>
												</span>
											</div>
											<span>${debateReply.dereplyContent}</span>
										</div>
								</c:if>
								<c:if test="${status.index ne 0}">
									<c:if test="${debateReply.dereplyPreantNo eq 0}">
										</div>
										<div class="card-comment reply-div">
											<div class="comment-text">
												<div class="username" id="username">
													<span class="username">${debateReply.memId}
														<div class="float-right dropdown">
															<span class="text-muted float-left mr-3">
																<fmt:formatDate value="${debateReply.dereplyRegdate}" pattern="yyyy-MM-dd HH:mm:ss"/>
															</span>
														</div>
													</span>
												</div>
												<span>${debateReply.dereplyContent}</span>
											</div>
									</c:if>
									<c:if test="${debateReply.dereplyPreantNo ne 0}">
										<div class="m-4 reReply-wrapper">
											<div class="m-4">
												<i class="fas fa-reply fa-rotate-180 img-circle img-sm text-secondary"></i>
												<div class="comment-text bg-white p-2">
													<span class="username">${debateReply.memId}
														<div class="float-right dropdown">
															<span class="text-muted float-left mr-3">
																<fmt:formatDate value="${debateReply.dereplyRegdate}" pattern="yyyy-MM-dd HH:mm:ss"/>
															</span>
														</div>
													</span> <span>${debateReply.dereplyContent}</span>
												</div>
											</div>
										</div>
									</c:if>
								</c:if>
								<c:if test="${status.last}">
									</div>
								</c:if>
							</c:forEach>
						</div>	
						<c:if test="${not empty debateReplyList}">
							<div class='text-center'>
								<ul id="pagination" class="pagination justify-content-center mt-4 mb-2" >
									<%@include file="/WEB-INF/views/common/pagination.jsp"%>
								</ul>
							</div>
						</c:if>
					</div>
					<!--/댓글-->
				</div>
			</div>
		</div>
	</section>
<form role="deleteForm" action="remove.do" method="post">
	<input type="hidden" name="dboardNo" id="dboardNo" value="${debateBoard.dboardNo}">
</form>

	<script>
		function fn_remove() {
			let form = document.querySelector('form[role="deleteForm"]');
			
			if(confirm("이 게시글을 삭제하시겠습니까?")){
				form.submit();
			}
		}
	</script>
</body>
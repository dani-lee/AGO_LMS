<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="notice" value="${notice }" />
<head>

</head>

<title>공지사항</title>
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
									<p class="text-secondary">공지사항</p>
								</div>
								<!-- /.col -->
								<div class="col-sm-6">
									<ol class="breadcrumb float-sm-right m-0 p-0" style="background-color : white;">
										<li class="breadcrumb-item">
											<i class="fas fa-home"></i>
										</li>
										<li class="breadcrumb-item">
											<a href="<%=request.getContextPath()%>/manager/management/faq/list.do">운영관리</a>
										</li>
										<li class="breadcrumb-item active">공지사항</li>
									</ol>
				
								</div>
								<!-- /.col -->
							</div>
							<p class="h5">${notice.noticeTitle}</p>
							<p class="text-secondary m-0">
								<b>운영자</b>
							</p>

							<div class="d-block">
								<p class="text-secondary float-left mb-1">
									<fmt:formatDate value="${notice.noticeRegdate}" pattern="yyyy-MM-dd" />
									&nbsp;| &nbsp;
								</p>
								<p class="text-secondary float-left mb-1">조회&nbsp;${notice.noticeViewCnt}</p>
								<div class="justify-content-end float-right" id="tools">
									<button type="button" class="btn btn-tool" onclick="location.href='modifyForm.do?noticeNo=${ notice.noticeNo }';">
										<i class="far fa-edit text-success"></i><span class="text-success font-weight-bold">&nbsp;수정&nbsp;</span>
									</button>
		<!-- 							<span class="float-right text-secondary btn">|</span> -->
									<button type="button" class="btn btn-tool" onclick="fn_remove(${  notice.noticeNo  });">
										<i class="fas fa-eraser" style="color:#ff7f00"></i><span class="font-weight-bold" style="color:#ff7f00">&nbsp;삭제&nbsp;</span>
									</button>
									<button class="btn btn-tool" onclick="location.href='list.do'">
										<i class="fas fa-solid fa-list-ul"></i><span class="pl-1 font-weight-bold text-black">목록</span> 
									</button>
								</div>
							</div>
						</div>

					</div>
					<!-- /.card-header -->
					<div class="card-body">
						<c:forEach items="${notice.attachList }" var="attach">
						<div class="attachment-block clearfix row"  onclick="location.href='<%=request.getContextPath()%>/manager/management/notice/getFile.do?fileName=${attach.fileName }'">
							<div style="cursor: pointer;">
							<i class="fas fa-file-alt ml-2" style="font-size:1.5em;"></i>
							</div>
		                  <div class="attachment-pushed ml-3">
		                    <h5 class="attachment-heading"  style="cursor: pointer;" >${attach.fileRealName}</h5>
		                    <div class="attachment-text"></div>
		                  </div>
		                </div>
						</c:forEach>
						<div class="content" style="height: 450px;">${notice.noticeContent}</div>
					</div>
					<!-- /.card-body -->
				</div>
			</div>

		</div>
	</section>
	
	<script>
		function fn_remove(noticeNo){
			if(confirm("삭제하시겠습니까?")){
				location.href='remove.do?noticeNo='+noticeNo;
			}
		}
	</script>
	
</body>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="ask" value="${ask }" />
<head></head>
    <title>문의 게시판</title>

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
									<p class="text-secondary">문의게시판</p>
								</div>
								<div class="col-sm-6">
									<ol class="breadcrumb float-sm-right m-0 p-0" style="background-color : white;">
										<li class="breadcrumb-item">
											<i class="fas fa-home"></i>
										</li>
										<li class="breadcrumb-item">
											<a href="<%=request.getContextPath()%>/manager/management/faq/list.do">운영관리</a>
										</li>
										<li class="breadcrumb-item active">문의게시판</li>
									</ol>
								</div>
				
							</div>
							<p class="h5">${ask.qnTitle}</p>
							<p class="text-secondary m-0">
								<b>${ask.memId}</b>
							</p>
							
							<div class="d-block">
								<p class="text-secondary float-left mb-1">
									<fmt:formatDate value="${ask.qnRegdate}" pattern="yyyy-MM-dd" />
									&nbsp;| &nbsp;
								</p>
								<p class="text-secondary float-left mb-1">
									<small class="badge badge-warning">
										<c:if test="${ask.askSort eq 'A301'}" >수료문의</c:if>
										<c:if test="${ask.askSort eq 'A302'}">학습문의</c:if> 
										<c:if test="${ask.askSort eq 'A303'}">기타</c:if>
									</small>
								</p>
								<div class="justify-content-end float-right" id="tools">
									<a href="#replies-wrapper">
										<button type="button" class="btn btn-tool" data-spy="scroll">
											<i class="far fa-comment-alt"></i>
											<span class="font-weight-bold">&nbsp; 답변보기 &nbsp;</span>
										</button>
										<button type="button" class="btn btn-tool" onclick="location.href='list.do'">
											<i class="fas fa-solid fa-list-ul"></i><span class="pl-1 font-weight-bold text-black">목록</span>
										</button>
									</a>
								</div>
							</div>
						</div>
					</div>
					<!-- /.card-header -->
					<div class="card-body">
						<div class="content" style="min-height: 250px;">${ask.qnContent}</div>
					</div>
					<!-- /.card-body -->

					<div class="">
						<div class="card-comment" style="height:200px;">
							<div class="comment-text">
								<c:if test="${empty ask.qnAnswer}" >
									<div class="direct-chat-msg">
										<img class="direct-chat-img" src="<%=request.getContextPath()%>/resources/img/manager.png" alt="message user image">
										<div class="direct-chat-text" style="height: 175px;">
											<div class="card-tools float-right">
							                  <span id="regist" class="badge badge-primary" onclick="regist(${ask.qnNo},1)" style="cursor:pointer;"><i class="far fa-edit"></i>&nbsp;등록&nbsp;</span>
							                  <span id='cancel' class="badge badge-secondary" style="cursor:pointer;" onclick="cancel()">&nbsp;취소&nbsp;</span>
							                </div>
											<button type="button" class="btn btn-tool float-right" onclick="regist(${ask.qnNo},1)">
											</button>
											<textarea class="form-control" id="comment1" rows="5" name="ask_reps" style="background-color:transparent; border:1px solid gray;">
죄송합니다. 시스템 상 문제로 발견되었습니다. 
빠른 시일 내로 수정하여 더 만족스러운 AGO가 되기 위해 노력하겠습니다.
수정하기 전까지는 죄송하지만 다시 강의를 재수강하여 동영상을 보기실 바랍니다. 
											</textarea>
											<textarea hidden class="form-control" readonly id="comment3" rows="5" name="ask_reps" style="background-color:transparent; border:none;">${ask.qnAnswer }</textarea>
										</div>
									</div>
								</c:if>
								<c:if test="${not empty ask.qnAnswer}">
							    	<div class="direct-chat-msg">
										<img class="direct-chat-img" src="<%=request.getContextPath()%>/resources/img/manager.png" alt="message user image">
										<div class="direct-chat-text" style="height: 175px;">
											<div class="card-tools float-right">
							                  <span id='regist' class="badge badge-primary" onclick="regist(${ask.qnNo},2)" style="cursor:pointer;"><i class="far fa-edit"></i>&nbsp;등록&nbsp;</span>
							                  <span id='modify' class="badge badge-warning" style="cursor:pointer;" onclick="modify()">&nbsp;수정&nbsp;</span>
							                  <span id='cancel' class="badge badge-secondary" style="cursor:pointer;" onclick="cancel()">&nbsp;취소&nbsp;</span>
							                </div>
											<button type="button" class="btn btn-tool float-right" onclick="regist(${ask.qnNo},1)"></button>
											<textarea class="form-control" readonly id="comment2" rows="5" name="ask_reps" style="background-color:transparent; border:none;">${ask.qnAnswer }</textarea>
											<textarea hidden class="form-control" readonly id="comment3" rows="5" name="ask_reps" style="background-color:transparent; border:none;">${ask.qnAnswer }</textarea>
										</div>
									</div>
								</c:if>
							</div>
						</div>
					</div>
				</div>
				<!-- /.card -->
			</div>
		</div>
	</section>
     
<script type="text/javascript">
	$('#cancel').hide();
	window.onload = function(){
		if($('textarea').attr('id') != 'comment1'){
			$('#regist').hide();
		}else{
			$('#regist').show();
		}	  
		  
	}
	
	function cancel() {
		$('textarea').val($('#comment3').val());
		$('#cancel').hide();
		$('#regist').hide();
		$('#modify').show();
		$('textarea').attr('readonly', true);
	}
	
	function modify() {
		$('textarea').attr('readonly', false);
		$('#cancel').show();
		$('#regist').show();
		$('#modify').hide();
	}
	
	function regist(no, textno) {
		
		content = $('textarea').val();
/* 		alert(no+", "+content+","+textno); */
  		 $.ajax({
             url         : 'regist.do',
             data        : {	'qnNo' : no
            	 			   ,'qnAnswer' : content
             			   },
             type        : 'post',
             success     : function(data){
            	 $('#regist').hide();
            	$('textarea').val(content);
            	$('textarea').attr('readonly', true);
            	if(textno == 1){
            		$('#cancel').hide();
            		$('#cancel').after("<span id='modify' class='badge badge-warning' style='cursor:pointer;' onclick='modify()'>&nbsp;수정&nbsp;</span>");
            		$('#regist').hide();
            	}else if(textno != 1){
            		$('#cancel').hide();
            		$('#regist').hide();
            		$('#modify').show();
            	}
             },
             error         : function(error){
                 //alert("현재 사진 업로드가 불가합니다. \n 관리자에게 연락바랍니다.");
                 AjaxErrorSecurityRedirectHandler(error.status);
                 console.log(error.status);
             }
         })  
	}

</script>
</body>

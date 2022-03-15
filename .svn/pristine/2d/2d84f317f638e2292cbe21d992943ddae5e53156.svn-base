<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="employeeList" value="${dataMap.employeeList}" />
<c:set var="managerList" value="${dataMap.managerList }" />
<c:set var="cri" value="${dataMap.cri}" />

<head></head>
<title></title>

<body>
		<div class="content-header">
			<div class="container-fluid">
				<div class="row navList mt-2 mb-2 align-items-center">
					<h4 class="col-9 m-0">운영자 관리</h4>
					<div class="col-3 text-right">
						<i class="fas fa-home" style="font-size: 15px;"></i>
						<span>
							&nbsp;>&nbsp;
							<span>운영자 관리</span>
					</div>
				</div>
				<!-- /.row -->
			</div>
			<!-- /.container-fluid -->
		</div>
		<!-- /.content-header -->

		<!-- Main content -->
		<section class="content">
			<div class="container-fluid ">
				<div class="row justify-content-between">
					<div class="flex-fill">
						<div class="input-group  mb-2 ">
							<div class="input-group-prepend">
								<select class="form-contr" name="searchType">
									<option value="n" ${cri.searchType eq 'n' ? 'selected':'' }>사원명</option>
									<option value="e" ${cri.searchType eq 'e' ? 'selected':'' }>이메일명</option>
								</select>
							</div>
							<input type="text" placeholder="검색어를 입력해주세요." name="keyword" class="form-control" value="${ param.keyword }">
							<div class="input-group-append">
								<button class="btn btn-primary float-right" onclick="list_go();">검색</button>
							</div>
						</div>

						<div class="card">
							<div class="card-header">
								<div class="d-flex justify-content-between">
									<div class="card-title font-weight-bold col-6 p-0">부서원 목록</div>
									<button type="button" class="btn btn-block btn-outline-primary btn-xs col-3" onclick="location.href ='main.do'">전체보기</button>
								</div>
							</div>
							<div class="text-center row px-3 py-1 m-0 font-weight-bold" style="border-bottom: 1.5px soild gray; height: 35px;">
								<div class="col-4">아이디</div>
								<div class="col-3">이름</div>
								<div class="col-5">이메일</div>
							</div>

							<div id="detailReviewList" style="height: 535px; overflow-y: auto; -ms-overflow-style: none;">
								<ul id="employeeList" class="products-list product-list-in-card">
									<c:if test="${empty employeeList}">
										<li class="item px-2 py-1 row mr-0 ml-1" style="width: 580px; height: 33px; border-bottom: 1.5px soild gray;">
											<span>사원이 존재하지 않습니다.</span>
										</li>
									</c:if>
									<c:if test="${not empty employeeList}">
										<c:forEach items="${employeeList}" var="employee">
											<li id="li${employee.memId }" onclick="selectMember('${employee.memId }')" class="item px-2 py-1 row mr-0 ml-1" style="height: 33px; border-bottom: 1.5px soild gray;">
												<div class="text-center col-4">${employee.memId }</div>
												<div id="${employee.memName }" class="text-center col-3 name">
													<span>${employee.memName }</span>
												</div>
												<div class="col-5">${employee.memEmail }</div>
												<div hidden="" id="input${employee.memId }">
													<input id="${employee.memId }" name="checkbox_e" type="checkbox" value="${employee.memName }">
												</div>
											</li>
										</c:forEach>
									</c:if>

								</ul>
							</div>
						</div>
					</div>
					<div class="text-center align-self-center" style="width: 70px;">
						<span style="font-size: 45px;">
							<i class="fas fa-caret-square-left" onclick="remove()"></i>
						</span>
						<br>
						<span style="font-size: 45px;">
							<i class="fas fa-caret-square-right" onclick="add()"></i>
						</span>
					</div>
					<div class="flex-fill mt-5">
						<div class="card">
							<div class="card-header">
								<div class="card-title font-weight-bold col-6 p-0">운영자 목록</div>
							</div>
							<div class="text-center row px-3 py-1 m-0 font-weight-bold" style="border-bottom: 1.5px soild gray; height: 35px;">
								<div class="col-4">아이디</div>
								<div class="col-3">이름</div>
								<div class="col-5">이메일</div>
							</div>

							<div id="detailReviewList" style="height: 535px; overflow-y: auto; -ms-overflow-style: none;">
								<ul id="employeeList" class="products-list product-list-in-card">
									<c:if test="${empty managerList}">
										<li class="item px-2 py-1 row mr-0 ml-1" style="width: 200px; height: 33px; border-bottom: 1.5px soild gray;">
											<span>사원이 존재하지 않습니다.</span>
										</li>
									</c:if>
									<c:if test="${not empty managerList}">
										<c:forEach items="${managerList}" var="manager">
											<li id="li${manager.memId}" onclick="selectMember('${manager.memId}')" class="item px-2 py-1 row mr-0 ml-1" style="height: 33px; border-bottom: 1.5px soild gray;">
												<div class="text-center col-4">${manager.memId }</div>
												<div id="${manager.memName}" class="text-center col-3 name">
													<span>${manager.memName}</span>
												</div>
												<div class="col-5">${manager.memEmail }</div>
												<div hidden="" id="input${manager.memId }">
													<input id="${manager.memId }" name="checkbox_m" type="checkbox" value="${manager.memName }">
												</div>
											</li>
										</c:forEach>
									</c:if>

								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- /.content -->
	</div>
	<!-- /.content-wrapper -->
	<form id="jobForm">
		<input type="hidden" name="searchType" value="" />
		<input type="hidden" name="keyword" value="" />
	</form>
	<script type="text/javascript">
		var memberIdList = [];
		let chk_Val = [];
		let chkId_Val = [];
		function selectMember(memId) {
			if ($('#li' + memId + '>div>input').is(":checked") == true) {
				$('#li' + memId).removeClass('bg-primary')
				$('#input' + memId + '>input').prop("checked", false);
			} else {
				$('#li' + memId).addClass('bg-primary')
				$('#input' + memId + '>input').prop("checked", true);
			}

		}

		function add() {
			chk_Val = [];
			chkId_Val = [];
			var member = $('#employeeList').children('.bg-primary')
			memberIdList = $('#managerList>li .bg-primary').attr('id')
			// console.log(memberIdList)
			$('input[name=checkbox_e]:checked').each(function() {
				chk_Val.push($(this).val())
				chkId_Val.push($(this).attr('id'))
			})
			if (chk_Val[0] == null) {
				alert("선택된 사원이 없습니다\n권한을 부여를 위해 왼쪽의 사원 목록을 선택하세요.")
			} else {
				var message = "";
				for (i = 0; i < chk_Val.length; i++) {
					message = message + (i + 1) + ". " + chk_Val[i] + "("
							+ chkId_Val[i] + ")\n"
				}
				message = message + "해당 사원에게 운영자 권한을 부여합니다."
				if (confirm(message) == true) {
					// console.log(chk_Val)
					$
							.ajax({
								url : "update.do?check=true&memId=" + chkId_Val,
								type : "get",
								dataType : "json",
								success : function(data) {
									if ($('#managerList>li>span').text() == "사원이 존재하지 않습니다.") {
										$('#managerList').empty();
									}
									$('#employeeList').remove(
											'#' + memberIdList);
									$("#managerList").append(member)
									$('#managerList>li>div>input').attr('name',
											'checkbox_m')
									if ($('#employeeList>li').attr('id') == null) {
										$('#employeeList')
												.append(
														"<li class='item px-2 py-1 row mr-0 ml-1' style='width: 580px; height: 33px; border-bottom:1.5px soild gray;'><span>사원이 존재하지 않습니다.</span></li>")
									}
									
									window.location.reload();
								},
								error : function(error) {
									AjaxErrorSecurityRedirectHandler(error.status);
								}
							});

				} else {
					alert("권한 부여가 취소되었습니다.")
				}
			}
			$('input[type=checkBox]').prop("checked", false);
			$('li').removeClass('bg-primary');

		}

		function remove() {
			chk_Val = [];
			chkId_Val = [];
			var member = $('#managerList').children('.bg-primary')
			memberIdList = $('#managerList').children('.bg-primary').attr('id')

			$('input[name=checkbox_m]:checked').each(function() {
				chk_Val.push($(this).val())
				chkId_Val.push($(this).attr('id'))
			})

			if (chk_Val[0] == null) {
				alert("선택된 사원이 없습니다\n권한을 삭제를 위해 오른쪽의 운영자 목록을 선택하세요.")
			} else {
				var message = "";
				for (i = 0; i < chk_Val.length; i++) {
					message = message + (i + 1) + ". " + chk_Val[i] + "("
							+ chkId_Val[i] + ")\n"
				}
				message = message + "해당 사원에게 부여된 운영자 권한을 삭제합니다."
				if (confirm(message) == true) {
					// console.log(chk_Val)
					$
							.ajax({
								url : "update.do?check=false&memId="
										+ chkId_Val,
								type : "get",
								dataType : "json",
								success : function(data) {
									if ($('#employeeList>li>span').text() == "사원이 존재하지 않습니다.") {
										$('#employeeList').empty();
									}
									$('#managerList')
											.remove('#' + memberIdList);
									$("#employeeList").append(member)
									$('#employeeList>li>div>input').attr(
											'name', 'checkbox_e')
									if ($('#managerList>li').attr('id') == null) {
										$('#managerList')
												.append(
														"<li class='item px-2 py-1 row mr-0 ml-1' style='width: 580px; height: 33px; border-bottom:1.5px soild gray;'><span>사원이 존재하지 않습니다.</span></li>")
									}
									window.location.reload();
								},
								error : function(error) {
									AjaxErrorSecurityRedirectHandler(error.status);
								}
							});
				} else {
					alert("권한 삭제가 취소되었습니다.")
				}
			}
			$('input[type=checkBox]').prop("checked", false);
			$('li').removeClass('bg-primary');

		}

		function list_go() {
			var jobForm = $('#jobForm');

			jobForm.find("[name='searchType']").val(
					$('select[name="searchType"]').val());
			jobForm.find("[name='keyword']").val(
					$('input[name="keyword"]').val());
			
			jobForm.attr({
				action : 'main.do',
				method : 'get'
			}).submit();
		}
	</script>
</body>

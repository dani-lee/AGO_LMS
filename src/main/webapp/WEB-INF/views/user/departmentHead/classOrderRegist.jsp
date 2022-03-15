<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<head>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/jstree/style.min.css" />
<script src="<%=request.getContextPath()%>/resources/js/jstree.min.js"></script>
<script type="text/javascript">
if(${ !empty message }){
	alert("${message}");
}
</script>
</head>

<title></title>

<body>
	<div class="content-wrapper kanban m-0" style="min-width: 1280px; background-color:#ffffff;">
		<!-- 메인 헤더 -->
		<!-- Content Header (Page header) -->
		<div class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h4 class="m-0">수강 지시</h4>
					</div>
					<!-- /.col -->
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item">
								<i class="fas fa-home"></i>
							</li>
							<li class="breadcrumb-item">
								<a href="<%=request.getContextPath()%>/user/departmentHead/main.do">메인보드</a>
							</li>
							<li class="breadcrumb-item">수강 지시</li>
						</ol>
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.container-fluid -->
		</div>
		<!-- /.content-header -->

		<section class="content pb-3">
			<div class="container-fluid" style="height: 600px">

				<section class="h-100">
					<div class="col-12 mb-2">
						<button class="btn btn-primary" onclick="insert_class()">추가</button>
					</div>
					<div class="card card-row card-secondary h-100">
						<div class="card-header p-2">
							<div class="row align-items-center">
								<div class="col-6">
									<h2 class="card-title text-bold pl-3">수강 목록</h2>
								</div>
								<div class="col-6">
									<input class="form-control form-control-sm" style="font-size:12px;" type="text" id="classSearch" placeholder="검색할 단어를 입력하세요">
								</div>
							</div>
						</div>
						<div class="card-body">
							<div id="classData" class="demo"></div>
							<div id="favData" class="demo"></div>
						</div>
					</div>
				</section>
				<section class="h-100">
					<div class="col-12 mb-2">
						<button class="btn btn-primary" onclick="delete_class()">삭제</button>
					</div>
					<div class="card card-row card-primary h-100">
						<div class="card-header p-2">
							<div class="row align-items-center" style="height: 31px">
								<div class="col-6">
									<h2 class="card-title text-bold pl-3">지시 목록</h2>
								</div>
								<div class="col-6"></div>
							</div>
						</div>
						<div class="card-body">
							<div class="form-group" id="selectClass"></div>
						</div>
					</div>
				</section>
				<section class="h-100">
					<div class="col-12 mb-2 text-right">
						<button class="btn btn-default" onclick="openModal();">등록</button>
						<button class="btn btn-warning">취소</button>
					</div>

					<div class="card card-row card-default h-100">
						<div class="card-header bg-info p-2">
							<div class="row align-items-center">
								<div class="col-6">
									<h2 class="card-title text-bold pl-3">지시 사원</h2>
								</div>
								<div class="col-6">
									<input class="form-control form-control-sm" style="font-size:12px;" type="text" id="memSearch" placeholder="검색할 단어를 입력하세요">
								</div>
							</div>
						</div>
						<div class="card-body">
							<div id="employeeData" class="demo"></div>
						</div>
					</div>
				</section>
			</div>
		</section>
		<div class="modal fade" id="modal-lg">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">수강 지시 등록</h4>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<form role="insertOrder" action="isertOrder.do" method="post">
							<div class="row">
								<div class='col-6'>
									<div class="card card-row card-primary w-100 mb-2" style="height: 200px;">
										<div class="card-header">
											<h3 class="card-title text-bold">지시 강의 목록</h3>
										</div>
										<div class="card-body p-2">
											<div class="form-group" id="classForm"></div>
										</div>
									</div>
									<div class="card card-row card-default w-100 m-0" style="height: 200px;">
										<div class="card-header bg-info">
											<h3 class="card-title text-bold">지시 사원 목록</h3>
										</div>
										<div class="card-body p-2">
											<div class="form-group" id="memberForm"></div>
										</div>

									</div>
								</div>
								<div class='col-6'>
									<div class="card card-secondary h-100">
										<div class="card-header">
											<h3 class="card-title text-bold">지시 내용</h3>
										</div>
										<div class="card-body">
											<textarea name="odMsg" style="width: 100%; height: 100%; border: none; resize: none;"></textarea>
										</div>
									</div>
								</div>
							</div>
						</form>
					</div>
					<div class="modal-footer justify-content-end">
						<button type="button" class="btn btn-primary" onclick="go_sub()">등록</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->
	</div>

	<script>
		function openModal() {
			$('#classForm').empty();
			$('#memberForm').empty();
			let select = $('#selectClass label');
			let member = $('#employeeData a.jstree-clicked');
			if (select.length < 1) {
				alert("지시할 강의가 없습니다.");
				return;
			}

			if (member.length < 1) {
				alert("지시할 사원이 없습니다.");
				return;
			}

			for (i = 0; i < select.length; i++) {
				let className = select.eq(i).text();
				let classId = select.eq(i).attr("select-id");
				console.log(classId);
				$div = $('<div></div>');
				$label = $('<label>' + className + '</lable>');
				$div.append($label);
				$input = $('<input type="hidden" name="className" value="'+ classId +'" />');
				$('#classForm').append($div).prepend($input);
			}

			for (i = 0; i < member.length; i++) {
				if (member[i].id == "ROOT_anchor") {
					continue;
				}
				let memName = member[i].text;
				let memId = member[i].id;
				memId = memId.substring(0, memId.lastIndexOf("_anchor"));
				$div = $('<div></div>');
				$label = $('<label>' + memName + '</lable>');
				$div.append($label);
				$input = $('<input type="hidden" name="memberName" value="'+ memId +'" />');
				$('#memberForm').append($div).prepend($input);
			}

			$('#modal-lg').modal('show');
		}

		function go_sub() {
			form = $('form[role=insertOrder]').submit();
		}
	</script>


	<%@include file="/WEB-INF/views/user/departmentHead/Order_js.jsp"%>
</body>
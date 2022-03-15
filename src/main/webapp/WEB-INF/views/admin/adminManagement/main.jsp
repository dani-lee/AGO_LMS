<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
<!-- DataTables -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/plugins/datatables-buttons/css/buttons.bootstrap4.min.css">

</head>

<title></title>

<body>
		<div class="content-header">
			<div class="container-fluid">
				<div class="row navList mt-2 mb-2 align-items-center">
					<h4 class="col-9 m-0">관리자 정보 관리</h4>
					<div class="col-3 text-right">
						<i class="fas fa-home" style="font-size: 15px;"></i>
						<span>&nbsp;>&nbsp;</span>
							<span>관리자 정보 관리</span>
					</div>
				</div>
				<!-- /.row -->
			</div>
			<!-- /.container-fluid -->
		</div>
		<!-- /.content-header -->

		<!-- Main content -->
		<section class="content">
			<div class="container-fluid">
				<!-- Small boxes (Stat box) -->
				<div class="row">
<!-- 					<div class="col-6" id="div"> -->
						
<!-- 					</div> -->
<!-- 					<div class="col-6"> -->
						<div class="col-12">
						<div class="card">
							<table id="dataTable" class="table table-bordered table-striped" style="disp">
								<thead>
									<tr>
										<th>행동</th>
										<th>위치</th>
										<th>IP주소</th>
										<th>날짜</th>
									</tr>
								</thead>
							</table>
						</div>
						<!-- /.card -->
					</div>
				</div>
				<!-- /.row -->
				<!-- Main row -->
			</div>
			<!-- /.container-fluid -->
		</section>
		<!-- /.content -->
	<script>
		let table;

		function setData(data){
		      table = $("#dataTable").DataTable({
		    	  "data": data,
				"columns": [
					{ "data": "action" },
		            { "data": "ServletPath" },
		            { "data": "remoteAddr" },
		            { "data": "date" }

		            ],
		            "columnDefs" : [

		            ],

		        "pagingType" : "full_numbers",
		        "language": {
		          "paginate": {
		            first: "<i class='fas fa-angle-double-left text-white'></i>",
		            previous: '<i class="fas fa-angle-left text-white"></i>',
		            next: '<i class="fas fa-angle-right text-white"></i>',
		            last: "<i class='fas fa-angle-double-right text-white'></i>"
		          }
		        },
		        "lengthChange": false, "autoWidth": false, searching: false,
		        "buttons": [{extend:"csv", charset:'UTF-8', bom:true}, "excel"],
		        "order":[ [ 3, "desc" ], [ 0, "asc"] ]
		      }).buttons().container().appendTo('#dataTable_wrapper .col-md-6:eq(0)');

		}

		function setDateSearch() {
			$IG = $('<div class="input-group flex-row-reverse"><div class="input-group-prepend"><span class="input-group-text" id="basic-addon1">~</span></div></div>')
			$min = $('<input type="date" id="min" />');
			$max = $('<input type="date" id="max" />');
			$IG.prepend($min);
			$IG.append($max);
			$IG.appendTo('#dataTable_wrapper .col-md-6:eq(1)');
			$('#dataTable_wrapper .col-md-6:eq(1)').addClass('text-right');
		}

		$(document).ready(function() {
			$.ajax ({
				url:'<%=request.getContextPath()%>/admin/log/adminLog.do',
				type:'get',
				dataType:'json',
				success:function(data) {
					setData(data);
					console.log(data);
				},
				error:function(){

				}
			})
			// Refilter the table
			$('#min, #max').on('change', function() {
				table.draw();
			});
		});
	</script>
</body>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="mPreList" value="${dataMap.mPreList }" />
<c:set var="fPreList" value="${dataMap.fPreList }" />
<c:set var="examList" value="${dataMap2.examList }" />



<title>Exam Dash Board</title>
<head></head>
<body>
	<section class="content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12">
					<!-- BAR CHART -->
					<div class="card">
						<div class="card-header">
							<h2 class="card-title float-left">
								<b>최근 등록된 강의</b>
							</h2>
							<span class="text-gray float-right" style="cursor: pointer" onclick="location.href='list.do'">더보기></span>
						</div>
						<div class="card-body">
							<div class="chart">
								<canvas id="barChart" style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%;"></canvas>
							</div>
						</div>
						<!-- /.card-body -->
					</div>
					<!-- /.card -->
				</div>
				<!-- col-md-12 -->


					<div class="container-fluid col-md-12">
			<div>
				<!-- <span class="text-gray">최신순</span> <span class="text-gray ml-1 mr-1">|</span> <span class="text-gray">오래된순</span> -->
				<span class="text-black">시험 미등록 강의</span>
			</div>
			<table class="table mt-2 mb-1">
				<thead>
					<tr class="text-center">
						<th>강의코드</th>
						<th>강의분류</th>
						<th>강의명</th>
						<th>시험 등록 유무 </th>
					</tr>
				</thead>
				<tbody>
				<c:if test = "${empty examList }">
					<tr>
						<td colspan="6">등록된 시험 정보가 없습니다.</td>
					</tr>
				</c:if>
				<c:forEach items="${examList }" var="exam">
					<tr>
						<td class="text-center align-middle">${exam.clCode }</td>
						<c:if test="${exam.clCate eq 'A201' }">
							<td class="text-center align-middle">신입교육</td>
						</c:if>
						<c:if test="${exam.clCate eq 'A202' }">
							<td class="text-center align-middle">일반교육</td>
						</c:if>
						<td class="align-middle" style="cursor: pointer" onclick="OpenWindow('mgDetail.pop?clCode=${exam.clCode}','시험관리', 900, 800);">
						${exam.clName }
						</td>
						<td class="col-4 text-center">
							
								<c:if test="${empty exam.ftestFile and empty exam.mtestFile }">
									<span class=" badge badge-danger" style="margin-left: 30px;">시험 미등록</span>
								</c:if>
								<c:if test="${!empty exam.mtestFile and empty exam.ftestFile }">
									<span class=" badge badge-warning" style="margin-left: 30px;">최종평가 미등록</span>
								</c:if>
								
							
						</td>
					</tr>
				</c:forEach>
					
				</tbody>
			</table>
			<div class="card-body text-center pt-0">
				<%@include file="/WEB-INF/views/common/pagination.jsp"%>
			</div>
			<!-- 		<div class="card-body col-md-12 column ui-sortable p-0"></div> -->
		</div>	


				

			</div>
		</div>

	</section>



	<script>
		function go_list(url) {
			window.top.location.replace('<%=request.getContextPath()%>'+url);
		}
	</script>
	<script>
		$(function() {
			/* ChartJS
			 * -------
			 * Here we will create a few charts using ChartJS
			 */

			var areaChartData = {
				labels : [ '11', '22', '33', '44', '55', '66', '77', '88',
						'99', '1010' ],
				datasets : [ {
					label : '기말평가 평균점수',
					backgroundColor : 'rgba(60,141,188,0.9)',
					borderColor : 'rgba(60,141,188,0.8)',
					pointRadius : false,
					pointColor : '#3b8bba',
					pointStrokeColor : 'rgba(60,141,188,1)',
					pointHighlightFill : '#fff',
					pointHighlightStroke : 'rgba(60,141,188,1)',
					data : [ 30, 28, 44, 12, 62, 80, 93, 83, 57, 60 ]
				}, {
					label : '중간평가 평균점수',
					backgroundColor : '#adb5bd',
					borderColor : '#adb5bd',
					pointRadius : false,
					pointColor : 'rgba(210, 214, 222, 1)',
					pointStrokeColor : '#c1c7d1',
					pointHighlightFill : '#fff',
					pointHighlightStroke : 'rgba(220,220,220,1)',
					data : [ 65, 59, 80, 81, 56, 55, 40, 49, 61, 84 ]
				}, ]
			}

			var areaChartOptions = {
				maintainAspectRatio : false,
				responsive : true,
				legend : {
					display : false
				},
				scales : {
					xAxes : [ {
						gridLines : {
							display : false,
						}
					} ],
					yAxes : [ {
						gridLines : {
							display : false,
						}
					} ]
				}
			}

			//-------------
			//- BAR CHART -
			//-------------
			var barChartCanvas = $('#barChart').get(0).getContext('2d')
			var barChartData = $.extend(true, {}, areaChartData)
			var temp0 = areaChartData.datasets[0]
			var temp1 = areaChartData.datasets[1]
			barChartData.datasets[0] = temp1
			barChartData.datasets[1] = temp0

			var barChartOptions = {
				responsive : true,
				maintainAspectRatio : false,
				datasetFill : false
			}

			new Chart(barChartCanvas, {
				type : 'bar',
				data : barChartData,
				options : barChartOptions
			})


			
		})
	</script>

	<script>
		$(function() {
			/* jQueryKnob */

			$('.knob').knob(
					{
						/*change : function (value) {
						 //console.log("change : " + value);
						 },
						 release : function (value) {
						 console.log("release : " + value);
						 },
						 cancel : function () {
						 console.log("cancel : " + this.value);
						 },*/
						draw : function() {

							// "tron" case
							if (this.$.data('skin') == 'tron') {

								var a = this.angle(this.cv) // Angle
								, sa = this.startAngle // Previous start angle
								, sat = this.startAngle // Start angle
								, ea // Previous end angle
								, eat = sat + a // End angle
								, r = true

								this.g.lineWidth = this.lineWidth

								this.o.cursor && (sat = eat - 0.3)
										&& (eat = eat + 0.3)

								if (this.o.displayPrevious) {
									ea = this.startAngle
											+ this.angle(this.value)
									this.o.cursor && (sa = ea - 0.3)
											&& (ea = ea + 0.3)
									this.g.beginPath()
									this.g.strokeStyle = this.previousColor
									this.g.arc(this.xy, this.xy, this.radius - this.lineWidth, sa, ea, false)
									this.g.stroke()
								}

								this.g.beginPath()
								this.g.strokeStyle = r ? this.o.fgColor
										: this.fgColor
								this.g.arc(this.xy, this.xy, this.radius
										- this.lineWidth, sat, eat, false)
								this.g.stroke()

								this.g.lineWidth = 2
								this.g.beginPath()
								this.g.strokeStyle = this.o.fgColor
								this.g.arc(this.xy, this.xy, this.radius
										- this.lineWidth + 1 + this.lineWidth
										* 2 / 3, 0, 2 * Math.PI, false)
								this.g.stroke()

								return false
							}
						}
					})
			/* END JQUERY KNOB */

			//INITIALIZE SPARKLINE CHARTS
			var sparkline1 = new Sparkline($('#sparkline-1')[0], {
				width : 240,
				height : 70,
				lineColor : '#92c1dc',
				endColor : '#92c1dc'
			})
			var sparkline2 = new Sparkline($('#sparkline-2')[0], {
				width : 240,
				height : 70,
				lineColor : '#f56954',
				endColor : '#f56954'
			})
			var sparkline3 = new Sparkline($('#sparkline-3')[0], {
				width : 240,
				height : 70,
				lineColor : '#3af221',
				endColor : '#3af221'
			})

			sparkline1
					.draw([ 1000, 1200, 920, 927, 931, 1027, 819, 930, 1021 ])
			sparkline2.draw([ 515, 519, 520, 522, 652, 810, 370, 627, 319, 630,
					921 ])
			sparkline3.draw([ 15, 19, 20, 22, 33, 27, 31, 27, 19, 30, 21 ])

		})
		
		
		
		
		
	</script>
	<!-- FLOT CHARTS -->
	<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/flot/jquery.flot.js"></script>

	<!-- FLOT RESIZE PLUGIN - allows the chart to redraw when the window is resized -->
	<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/flot/plugins/jquery.flot.resize.js"></script>

	<!-- FLOT PIE PLUGIN - also used to draw donut charts -->
	<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/flot/plugins/jquery.flot.pie.js"></script>

	<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
	<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</body>






























<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>

<script type="text/x-handlebars-template" id="class-info-template">
	<table class="table mt-3 table-sm">
		<tr>
			<td class="font-weight-bold text-center" style="background-color: #E6EFFC; width: 250px;">수료기준안내</td>
			<td colspan="3">
				{{{cutLine}}}
			</td>
		</tr>
		<tr>
			<td class="font-weight-bold text-center" style="background-color: #E6EFFC; width: 250px;">정원</td>
			<td>{{enrPers}}</td>
			<td class="font-weight-bold text-center" style="background-color: #E6EFFC; width: 250px;">강의이수시간</td>
			<td>{{clCreditTime}}</td>
		</tr>
		<tr>
			<td class="font-weight-bold text-center" style="background-color: #E6EFFC; width: 250px;">신청기간</td>
			<td>{{prettifyDate postSdate}} ~ {{prettifyDate postEdate}}</td>
			<td class="font-weight-bold text-center" style="background-color: #E6EFFC; width: 250px;">교육기간</td>
			<td>{{studyDate}}</td>
		</tr>
		<tr>
			<td class="font-weight-bold text-center" style="background-color: #E6EFFC; width: 250px;">과정소개</td>
			<td colspan="3">
				{{{clIntro}}}
			</td>
		</tr>
	</table>
</script>

<script type="text/x-handlebars-template" id="class-chap-template">
<div style="overflow-y:auto; height: 550px;">
	<table class="table table-hover table-sm">
		<thead>
			<tr class="text-center" style="background-color: #E6EFFC;">
				<th scope="col">목차</th>
				<th scope="col">목차명</th>
				<th scope="col">진도율</th>
				<th scope="col">강의보기</th>
			</tr>
		</thead>
		<tbody>
		{{#unless .}}
			<tr class="text-center">
				<td colspan="4">등록된 자료가 없습니다.</td>
			</tr>
		{{/unless}}
		{{#each .}}
		{{#if ${ claz.clFormat eq '오프라인' }}}
			<tr>
				<td class="text-center">1</td>
				<td>${ claz.clName}</td>
				<td class="text-center">
					<div class="progress">
					{{#if memFinishChk}}
						<div class="progress-bar bg-success" role="progressbar" style="width: 100%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100">100%</div>
					{{else}}
						<div class="progress-bar bg-success" role="progressbar" style="width: 0%" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">0%</div>
					{{/if}}
					</div>
				</td>
				<td class="text-center">
						<button class="btn btn-primary btn-xs" onclick="OpenWindow('QRCheck.do?clCode=${ claz.clCode }&opcl=${ claz.opcl }', 'title', 375, 812);");>출석하기</button>
				</td>
			</tr>
		{{else if ${ claz.clFormat eq '실시간' }}}
			<tr>
				<td class="text-center">1</td>
				<td>${ claz.clName}</td>
				<td class="text-center">
					<div class="progress">
					{{#if memFinishChk}}
						<div class="progress-bar bg-success" role="progressbar" style="width: 100%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100">100%</div>
					{{else}}
						<div class="progress-bar bg-success" role="progressbar" style="width: 0%" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">0%</div>
					{{/if}}
					</div>
				</td>
				<td class="text-center">
					<button class="btn btn-primary btn-xs" onclick="OpenWindow('https://192.168.143.25:8443/join.html?room=${claz.opcl}&name=${loginUser.memName}', '', 1600, 1300);");>수강하기</button>
				</td>
			</tr>
		{{else}}
			<tr>
				<td class="text-center">{{clChapNum}}</td>
				<td>{{clChapName}}</td>
				<td class="text-center">
					<div class="progress">
					{{#if memFinishChk}}
						<div class="progress-bar bg-success" role="progressbar" style="width: {{progChap}}%" aria-valuenow="{{progChap}}" aria-valuemin="0" aria-valuemax="100">{{progChap}}%</div>
					{{else}}
						<div class="progress-bar bg-success" role="progressbar" style="width: 0%" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">0%</div>
					{{/if}}
					</div>
				</td>
				<td class="text-center">
					{{#if mTestCheck}}
						<button class="btn btn-primary btn-xs" id="testBtn" onclick="OpenWindow('mtestForm.do?clChap={{clChapNum}}&opcl=${ claz.opcl }&clCode=${ claz.clCode }', 'title', 1300, 750);");>시험보기</button>
					{{else if fTestCheck}}
						<button class="btn btn-primary btn-xs" id="testBtn" onclick="OpenWindow('ftestForm.do?clChap={{clChapNum}}&opcl=${ claz.opcl }&clCode=${ claz.clCode }', 'title', 1300, 750);");>시험보기</button>
					{{else if domTestCheck}}
						<span class="text-muted font-weight-bold">[{{checkScore mScore}}/20]&nbsp;{{mScore}}점</span>
					{{else if dofTestCheck}}
						<span class="text-muted font-weight-bold">[{{checkScore fScore}}/20]&nbsp;{{fScore}}점</span>
					{{else}}
						<button class="btn btn-primary btn-xs" onclick="OpenWindow('clsPlay.do?clChapVideo={{clChapVideo}}&clChap={{clChapNum}}&opcl=${ claz.opcl }&clCode=${ claz.clCode }&clChapName={{clChapName}}', 'title', 1000, 650);");>강의보기</button>
					{{/if}}
				</td>
			</tr>
		{{/if}}
		{{/each}}
		</tbody>
	</table>
</div>
</script>

<script type="text/x-handlebars-template" id="class-doc-template">
<div style="overflow-y:auto; height: 550px;">
	<table class="table table-hover table-sm">
		<thead>
			<tr class="text-center" style="background-color: #E6EFFC;">
				<th scope="col">번호</th>
				<th scope="col">제목</th>
				<th scope="col">비고</th>
			</tr>
		</thead>
		<tbody>
		{{#unless .}}
			<tr class="text-center">
				<td colspan="4">등록된 자료가 없습니다.</td>
			</tr>
		{{/unless}}
		{{#each .}}
			<tr class="text-center">
				<td>{{clDocNo}}</td>
				<td>{{realfileName clDocName}}</td>
				<td>
					<span class="h5" style="cursor: pointer;">
						<i class="fa fa-save" onclick="location.href='downloadDocumentFile.do?clDocName={{clDocName}}'"></i>
					</span>
				</td>
			</tr>
		{{/each}}

		</tbody>
	</table>
</div>
</script>

<script type="text/x-handlebars-template" id="class-review-template">
<div style="overflow-y:auto; height: 550px;">
	<div class="reviews-list">
		<div class="card-header ui-sortable-handle" style="cursor: move;">
    	<ul class="list-group list-group-flush">
		{{#unless .}}
			<li class="list-group-item">
    			<div class="reviews">
    				<p class="text-center">등록된 수강 후기가 없습니다.</p>
    			</div>
    		</li>
		{{/unless}}
		{{#each .}}
    		<li class="list-group-item">
    			<div class="reviews">
    				<div class="row">
    					<div class="col-8">
    						<span>{{securitymemName memName}}</span>
    						<span class="col">{{prettifyDate reviewRegdate}}</span>
    					</div>
    					<div id="reviewScoreStar{{@key}}" class="ml-auto h6">
    					</div>
    				</div>
    				<p class="inline-block">
    					<span class="font-weight-bold">{{reviewContent}}</span>
    				</p>
    			</div>
    		</li>
		{{/each}}
		</ul>
		</div>
	</div>
</div>
</script>

<script type="text/x-handlebars-template" id="reviewScore-detail-template">
{{#if . }}
	<span class="text-warning">({{scope}})</span>
{{else}}

{{/if}}
</script>

<script>
	Handlebars.registerHelper({
		"prettifyDate" : function(timeValue) {
			let dateObj = new Date(timeValue);
			let year = dateObj.getFullYear();
			let month = dateObj.getMonth() + 1;
			month = (month).toString();
			if (month.length < 2) {
				month = "0" + month;
			}

			let date = dateObj.getDate();
			date = (date).toString();
			if (date.length < 2) {
				date = "0" + date;
			}
			return year + "-" + month + "-" + date;
		},
		"checkScore" : function(score){
			let cnt = 0;
			switch(score){
				case 0 :
					cnt = 0;
		        	break;
				case 5 :
					cnt = 1;
		        	break;
				case 10 :
					cnt = 2;
		        	break;
				case 15 :
					cnt = 3;
		        	break;
				case 20 :
					cnt = 4;
		        	break;
				case 25 :
					cnt = 5;
		        	break;
				case 30 :
					cnt = 6;
		        	break;
				case 35 :
					cnt = 7;
		        	break;
				case 40 :
					cnt = 8;
		        	break;
				case 45 :
					cnt = 9;
		        	break;
				case 50 :
					cnt = 10;
		        	break;
				case 55 :
					cnt = 11;
		        	break;
				case 60 :
					cnt = 12;
		        	break;
				case 65 :
					cnt = 13;
		        	break;
				case 70 :
					cnt = 14;
		        	break;
				case 75 :
					cnt = 15;
		        	break;
				case 80 :
					cnt = 16;
		        	break;
				case 85 :
					cnt = 17;
		        	break;
				case 90 :
					cnt = 18;
		        	break;
				case 95 :
					cnt = 19;
		        	break;
				case 100 :
					cnt = 20;
		        	break;
			}
			return cnt;
		},
		"realfileName" : function(fileName){
			let realName = fileName.substring(fileName.lastIndexOf("$$")+2);
			return realName;
		},
		"securitymemName" : function(memName){
			let name1 = memName.substring(0,1);
			let name2 = memName.substring(2, memName.length)
			let realMemName = name1 + "*" +name2;
			return realMemName;
		}
		

	});

	function printData(data, target, templateObject) {
		let template = Handlebars.compile(templateObject.html());
		let html = template(data);
		target.html("").html(html);
	}
</script>


<script>
	let opcl = '${ claz.opcl }';

	window.onload = function() {
		restChap();
	};

	function restInfo() {
		$.ajax({
			url : 'classInfo.do',
			type : 'get',
			data : {
				"opcl" : opcl
			},
			dataType : 'json',
			success : function(data) {
				printData(data, $('#custom-tabs-four-info'), $('#class-info-template'));
				parent.resize(window.parent.document.getElementById("ifr"));
			},
			error : function(error) {
				AjaxErrorSecurityRedirectHandler(error.status);
			}
		});
	}

	function restChap() {
		$.ajax({
			url : 'classChap.do',
			type : 'get',
			data : {
				"opcl" : opcl
			},
			dataType : 'json',
			success : function(data) {
				printData(data, $('#custom-tabs-four-list'), $('#class-chap-template'));
				parent.resize(window.parent.document.getElementById("ifr"));
			},
			error : function(error) {
				AjaxErrorSecurityRedirectHandler(error.status);
			}
		});
	}

	function restDoc() {
		$.ajax({
			url : 'classDoc.do',
			type : 'get',
			data : {
				"opcl" : opcl
			},
			dataType : 'json',
			success : function(data) {
				printData(data, $('#custom-tabs-four-attach'),$('#class-doc-template'));
				parent.resize(window.parent.document.getElementById("ifr"));
			},
			error : function(error) {
				AjaxErrorSecurityRedirectHandler(error.status);
			}
		});
	}

	function restReview() {
		$.ajax({
			url : 'classReview.do',
			type : 'get',
			data : {
				"opcl" : opcl
			},
			dataType : 'json',
			success : function(data) {
				printData(data, $('#custom-tabs-four-review'), $('#class-review-template'));
				for (i = 0; i < data.length; i++) {
					printDataReviewScore(data[i], document.getElementById("reviewScoreStar"+i),$('#reviewScore-detail-template'));
				}
				parent.resize(window.parent.document.getElementById("ifr"));
			},
			error : function(error) {
				AjaxErrorSecurityRedirectHandler(error.status);
			}
		});
	}

	function printDataReviewScore(data, target, templateObject) {
		let template = Handlebars.compile(templateObject.html());
		let html = template(data);
		target.innerHTML+=data.icons;
		target.innerHTML+=html;
	}

</script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>



<script type="text/x-handlebars-template"  id="notice-recent-template" >
{{#if .}}
	{{#each .}}
		<tr>
			<td class="text-center">
				{{faqNo }}
			</td>
			<td onclick="location.href='detail.do?faqNo={{faqNo }}';"
				style="cursor: pointer; max-width: 430px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
				{{faqQuestion}}
			</td>
		</tr>
	{{/each}}	
{{else}}
	<tr class="text-center">
		<td colspan="2">
			등록된 문의가 없습니다.
		</td>
	</tr>
{{/if}}
</script>

<script>
function printData(detail, target, templateObject){
	let template = Handlebars.compile(templateObject.html());
	let html = template(detail);
	console.log(html)
	target.empty();
	target.append(html);
}

function getPage(sortType, searchType){
	$.ajax({
		url : "recent?sortType="+sortType+"&searchType="+searchType,
		type : "get",
		dataType : "json",
		success : function(data){
			if(sortType == 'c'){
				printData(data, $('#recentC'), $('#notice-recent-template'));
			}
			if(sortType == 'l'){
				printData(data, $('#recentL'), $('#notice-recent-template'));
			}
			if(sortType == 'e'){
				printData(data, $('#recentE'), $('#notice-recent-template'));
			}
			
		},
		error:function(error){
			AjaxErrorSecurityRedirectHandler(error.status);
		}
	});
}


</script>
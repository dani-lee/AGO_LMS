<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>



<script type="text/x-handlebars-template"  id="notice-recent-template" >
{{#if .}}
	{{#each .}}
		<tr>
			<td onclick="detail({{noticeNo}})"
				style = "cursor: pointer; 
								 max-width: 390px; 
								 overflow: hidden; 
								 white-space: nowrap; 
								 text-overflow: ellipsis;">
				{{noticeTitle }}
			</td>
			<td class="text-center">
				{{noticeDate}}
			</td>
		</tr>
	{{/each}}	

{{else}}
	<tr>
		<td>
			등록된 공지사항이 없습니다.
		</td>
	</tr>
{{/if}}
    
</script>

<script>
function printData(detail, target, templateObject){
	let template = Handlebars.compile(templateObject.html());
	let html = template(detail);
	console.log(html)
	$('.recent').empty();
	target.append(html);
}

function getPage(sortType){
	$.ajax({
		url : "nomal?sortType="+sortType,
		type : "get",
		dataType : "json",
		success : function(data){
			printData(data, $('.recent'), $('#notice-recent-template'));
		},
		error:function(error){
			AjaxErrorSecurityRedirectHandler(error.status);
		}
	});
}


</script>
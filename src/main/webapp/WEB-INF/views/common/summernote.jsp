<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<script type="text/javascript">
function summernote_go(target, image) {
	
	target.summernote({
		lang : "ko-KR",
		height : 400,
		disableResizeEditor : true,
		callbacks : {
			onImageUpload : function(files, editor, welEditable) {
				for(var file of files){
					// alert(file.name);
					if(file.name.substring(file.name.lastIndexOf(".")+1).toUpperCase() != "JPG") {
						alert("JPG 이미지형식만 가능합니다.");ㅣ
						return;
					}
					if(file.size > 1024*1204*5){
						alert("이미지는 5MB 미만입니다.")
						return;
					}
					
					
				}
				for(var file of files){
					sendFile(file, this);
				}
			},
			
			onMediaDelete : function(target) {
				// alert(target.attr("src")); // JQuery
				// alert(target[0].src); // javascript
				// var splitSrc = target[0].src.split("=");
				// var fileName = splitSrc[splitSrc.length-1];
				// alert(fileName);
				deleteFile(target[0].src);
				
			}
		}
	});
	
	if(image){
		console.log(image);
		$(".note-insert").attr("style", "display:none;");
	}
}

// 파일 전송은 이제 이것만 사용하기
function deleteFile(src){
	var splitSrc = src.split("=");
	var fileName = splitSrc[splitSrc.length-1];
	
	var fileData={"fileName":fileName};
	
	$.ajax({
		url:"<%=request.getContextPath()%>/deleteImg.do",
		data:JSON.stringify(fileData),
		type:"post",
		contentType:"application/json",
		success:function(res){
			console.log(res);
		},
		error:function(){
			alert("이미지 삭제가 불가합니다.");
		}
	})
}

function sendFile(file, el) {
	var form_data = new FormData();
	form_data.append("file", file);
	$.ajax ({
		data : form_data,
		type:'POST',
		url : '<%=request.getContextPath()%>/uploadImg.do',
		cache : false,
		contentType : false,
		processData : false,
		success:function(img_url) {
			$(el).summernote('editor.insertImage', img_url);
		},
		error:function(){
			alert(file.name + "업로드에 실패했습니다.");
		}
	
	});
}
</script>

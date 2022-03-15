<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="img" value="${img}" />

<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<div style="width: 100%; text-align:center;" class="text-center">
		<form role="form" class="form-horizontal" action="autograph/regist.do" method="post" enctype="multipart/form-data">   

			<div class="row" style="display: inline-block;">               
               <input type="hidden" name="oldPicture"  value="${img }"/>
               <input type="file" id="inputFile" onchange="changePicture_go();" name="picture" style="display:none" />
               <div class="input-group col-md-12">
                  <div style="text-align: center; width: 300px;">
                     <div class="" id="pictureView" data-id="imgView" style=" border: 1px solid black; height: 300px; width: 300px; margin: 0 auto; margin-bottom:5px;"></div>                                          
                     <div class="input-group input-group-sm">
                        <label for="inputFile" class=" btn btn-warning btn-sm btn-flat input-group-addon">사진변경</label>
                        <input id="inputFileName" class="form-control" type="text" name="tempPicture" disabled
                           value="${img}"/>
                        <input id="picture" class="form-control" type="hidden" name="uploadPicture" />
                     </div>                  
                  </div>                                    
               </div>
            </div>  
            </form>
	</div>
	<input type="hidden" name="clImg" />
	<script type="text/javascript">
	window.onload=function(){
			dpSealPictureThumb(document.querySelector('[data-id=imgView]'), '${img}', '<%=request.getContextPath()%>');
		}
	
	 function changePicture_go()
     {
        var picture=$('input#inputFile')[0];
        
        var fileFormat=picture.value.substr(picture.value.lastIndexOf(".")+1).toUpperCase();
        
        //이미지 확장자 jpg 확인
      if(!(fileFormat=="JPG"||fileFormat=="JPEG"||fileFormat=="PNG"))
      {
         alert("이미지는 jpg/jpeg/png 형식만 가능합니다.");
         picture.value="";
         return;
      };
      
      //이미지 파일 용량 체크
      if(picture.files[0].size>1024*1024*1)
      {
         alert("사진 용량은 1MB 이하만 가능합니다.");
         picture.value="";
         return;
      };
      
      //이미지 이름 넣기.
      document.getElementById('inputFileName').value=picture.files[0].name;
      
      //이미지 넣기
      if(picture.files&&picture.files[0]) //리스트, 객체.(metadata)
      {
         var reader=new FileReader();
         reader.onload=function(e){
            $('div#pictureView').css({
               'background-image':'url('+e.target.result+')',
               'background-position':'center',
               'background-size':'cover', //'container'
               'background-repeat':'no-repeat'
            });
         }
         reader.readAsDataURL(picture.files[0]);
      }
      
      //이미지 변경 확인
      $('input[name="uploadPicture"]').val(picture.files[0].name);

      form = new FormData($('form[role="form"]')[0]);
      $.ajax({
	         url         : 'autograph/regist.do',
	         data        : 	form,   
	         type        : 'post',
	         processData : false,
	 		 contentType : false,
	         success     : function(data){
				alert("등록되었습니다.");
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
</html>
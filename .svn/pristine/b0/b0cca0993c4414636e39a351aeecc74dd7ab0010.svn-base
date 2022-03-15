<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
function regist(opcl, endDay) {
	if($("input[name='sortType']").val() == 's'){
		if($('input[name=positionId]').val() != 'PS101'){
			alert("신입사원만 수강 가능합니다.");
		}else{
			registFunction(opcl, endDay);
		}		
	}else{
		registFunction(opcl, endDay);
	}
	
	
	
}

function registFunction(opcl, endDay, lecDate, cnt, enrPers) {
	if(enrPers == "제한없음"){
		enrPers = 0;
	}
	if (confirm("해당 강의를 신청하시겠습니까?")) {
		$.ajax({
	        url         : '<%=request.getContextPath()%>/user/rcls/regist',
	        data        : {	'opcl' : opcl,
	       					 'endDay' : endDay,
	       					 'lecDate' : lecDate,
	       					 'totalCount' : enrPers
	        			   },   
	        type        : 'post',
	        success     : function(data){
	       		 
	       		if(data == "1"){
	       			 markState = false;
	        		 alert("신청에 성공했습니다.");
		       		 $.ajax({
		       	         url         : '<%=request.getContextPath()%>/user/rcls/bookmark',
		       	         data        : {	'opcl' : opcl
		       	        	 			   ,'markState' : markState
		       	         			   },
		       	         type        : 'post',
		       	         success     : function(data1){
		       				location.reload();
		       	         },
		       	         error         : function(error){
		       	             //alert("현재 사진 업로드가 불가합니다. \n 관리자에게 연락바랍니다.");
		       	             AjaxErrorSecurityRedirectHandler(error.status);
		       	             console.log(error.status);
		       	         }
		       	     })
	       		}else{
	        		alert("수강인원이 마감되었습니다.")
	        	}
	       		 
	       	
	        },
	        error         : function(error){
	            //alert("현재 사진 업로드가 불가합니다. \n 관리자에게 연락바랍니다.");
	            AjaxErrorSecurityRedirectHandler(error.status);
	            console.log(error.status);
	        }
	    })
	} 
}

function noregist() {
	alert("타부서 강의는 수강할 수 없습니다.")
}
</script>
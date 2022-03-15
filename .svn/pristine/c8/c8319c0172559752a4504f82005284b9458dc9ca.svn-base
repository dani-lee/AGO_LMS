<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="list" value="${graphDataMap.listByDp }"/>
<c:set var="data" value="${graphDataMap.listByAges }" />

 <script src="https://cdn.jsdelivr.net/npm/chart.js@3.5.1/dist/chart.min.js"></script>
 <script>
 
 //-----------------------------------부서별 파이 그래프
const data = {
         labels : [ 
		<c:forEach items="${graphDataMap.listByDp}" var="DpData">
			'${DpData.dpId}',
		</c:forEach>
        	 
        	 
        	 ],
         datasets : [ {
            label : 'Dataset 1',
            data : [ 
            <c:forEach items="${graphDataMap.listByDp }" var="DpData">
            	'${DpData.count}',
            </c:forEach>
            	
            ], //x축 label에 대응되는 데이터 값

            backgroundColor : [
            //색상
            	<c:forEach var="i" begin="1" end="${fn:length(list)}">
                'rgba('+Math.floor(Math.random() * 256)+', '+Math.floor(Math.random() * 256)+',' +Math.floor(Math.random() * 256)+', 0.6)', 
                </c:forEach>
                  ],
            borderColor : [
            //경계선 색상
            <c:forEach var="i" begin="1" end="${fn:length(list)}">
                'rgba(255, 255, 255, 255)', 
             </c:forEach>
                  ],
            borderWidth : 1
         } ]
      };

      var context1 = document.getElementById('pieChart').getContext('2d');
      var pieChart = new Chart(context1, {
         type : 'pie',
         data : data,
         options : {
            responsive : true,
            plugins : {
               legend : {
                  position : 'left',
               },
               title : {
                  display : true,
                  text : '부서별 수강비율 그래프'
               }
            }
         },
      });
      
 //------------------연령별 파이 그래프
 const dataAge = {
         labels : [ 
		<c:forEach items="${graphDataMap.listByAges}" var="agesData">
			'${agesData.ages}대',
		</c:forEach>
        	 
        	 
        	 ],
         datasets : [ {
            label : 'Dataset 1',
            data : [ 
            <c:forEach items="${graphDataMap.listByAges }" var="agesData">
            	'${agesData.count}',
            </c:forEach>
            	
            ], //x축 label에 대응되는 데이터 값

            backgroundColor : [
            //색상
            	<c:forEach var="i" begin="1" end="${fn:length(data)}">
                'rgba('+Math.floor(Math.random() * 256)+', '+Math.floor(Math.random() * 256)+',' +Math.floor(Math.random() * 256)+', 0.6)', 
                </c:forEach>
                  ],
            borderColor : [
            //경계선 색상
            <c:forEach var="i" begin="1" end="${fn:length(data)}">
                'rgba(255, 255, 255, 255)', 
             </c:forEach>
                  ],
            borderWidth : 1
         } ]
      };

      var context2 = document.getElementById('pieChart02').getContext('2d');
      var pieChart2 = new Chart(context2, {
         type : 'pie',
         data : dataAge,
         options : {
            responsive : true,
            plugins : {
               legend : {
                  position : 'left',
               },
               title : {
                  display : true,
                  text : '연령별 수강비율 그래프'
               }
            }
         },
      });
</script>  
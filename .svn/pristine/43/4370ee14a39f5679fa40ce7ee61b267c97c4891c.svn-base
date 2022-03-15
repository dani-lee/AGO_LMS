<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	response.setStatus(403);
%>
<c:if test="${ !empty newLogin }">
	<script>
	alert("여기 들림");
		location.href="<%=request.getContextPath()%>/ago/"
	</script>
</c:if>

<c:if test="${ empty newLogin }">
	<script type="text/javascript">
		alert("권한이 없습니다.");

		if (window.opener) {
			window.close();
		} else {
			history.go(-1);
		}
	</script>
</c:if>
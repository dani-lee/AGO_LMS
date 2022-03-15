<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<%
	response.setStatus(302);
%>
<script type="text/javascript">


		alert("${message}");

	if (window.opener) {
		window.opener.parent.location.reload();
		window.close();
	} else if(self !== top ){
		window.parent.location.reload();
	} else {
		window.location.href="<%=request.getContextPath()%>";
	}
</script>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
<meta content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><decorator:title default="All Gi For Organixation" /></title>
<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/plugins/fontawesome-free/css/all.min.css">
<!-- Ionicons -->
<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- Tempusdominus Bootstrap 4 -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
<!-- iCheck -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
<!-- JQVMap -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/plugins/jqvmap/jqvmap.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/dist/css/adminlte.min.css">
<!-- overlayScrollbars -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
<!-- Daterange picker -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/plugins/daterangepicker/daterangepicker.css">
<link rel="icon" href="<%=request.getContextPath()%>/resources/img/pavicon.png">
<!-- jQuery -->
	<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>

<link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">

<decorator:head />

</head>

<body class="hold-transition dark-mode mx-auto text-sm" style="width: 1280px; max-width: 1280px;">
	<div class="wrapper">

		<!-- Navbar -->
		<nav class="main-header navbar navbar-expand navbar-dark" style="height: 50px;">

			<!-- Right navbar links -->
			<ul class="navbar-nav ml-auto">
						<a href="#" class="dropdown-item mr-5" onclick="logout();">
							<i class="fas fa-unlink"></i>&nbsp;
							<span class="text-sm">로그아웃</span>
						</a>
			</ul>
		</nav>
		<!-- /.navbar -->

		<!-- Main Sidebar Container -->
		<div class="w-100" style="z-index:1000;">
			<aside class="sidebar-dark-primary elevation-4 position-fixed text-md h-100" style="width: 250px; top: 0px;">
				<!-- Brand Logo -->
				<a href="<%=request.getContextPath()%>/">
					<div class="text-center border-bottom border-secondary" style="height: 50px;">
						<img src="<%=request.getContextPath()%>/resources/img/logo.png" alt="AdminLTE Logo" style="height: 100%; opacity: .8">
					</div>
				</a>
				<!-- Sidebar -->
				<div class="sidebar">
					<!-- Sidebar Menu -->
					<nav class="mt-2">
						<ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
							<c:forEach items="${ menuList }" var="m">
								<li class="nav-item">
									<a href="javascript:goPage('<%=request.getContextPath() %>${m.murl }','${m.mcode }');" class=" nav-link ${ m.mcode eq menu.mcode ? 'active' : '' }">
										<i class="${ m.micon }"></i>
										${ m.mname }
									</a>
								</li>
							</c:forEach>
						</ul>
					</nav>
					<!-- /.sidebar-menu -->
				</div>
				<!-- /.sidebar -->
			</aside>
		</div>
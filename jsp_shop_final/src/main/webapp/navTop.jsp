<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Colo Shop</title>
<meta charset="utf-8 ">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Colo Shop Template">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="resource/styles/bootstrap4/bootstrap.min.css">
<link href="resource/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="resource/plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="resource/plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css" href="resource/plugins/OwlCarousel2-2.2.1/animate.css">
<link rel="stylesheet" type="text/css" href="resource/styles/main_styles.css">
<link rel="stylesheet" type="text/css" href="resource/styles/responsive.css">
<link rel="stylesheet" href="resource/plugins/themify-icons/themify-icons.css" />
<link rel="stylesheet" type="text/css" href="resource/plugins/jquery-ui-1.12.1.custom/jquery-ui.css" />

<link rel="stylesheet" type="text/css" href="resource/styles/contact_styles.css">
<link href="resource/css/font-awesome.css" rel="stylesheet">
<!-- <link href="resource/css/bootstrap.min.css" rel="stylesheet"> -->
<!-- <link href="resource/css/animate.min.css" rel="stylesheet"> -->
<!-- <link href="resource/css/owl.carousel.css" rel="stylesheet"> -->
<!-- <link href="resource/css/owl.theme.css" rel="stylesheet"> -->
<!-- <link href="resource/css/style.default.css" rel="stylesheet" id="theme-stylesheet"> -->
<!-- <link href="resource/css/custom.css" rel="stylesheet"> -->
<script src="resource/js/respond.min.js"></script>

<style>
.form-control {
	color: black;
}
#leave {
   cursor: pointer;
}

#leave:hover {
   color: #b5aec4;
}
</style>
</head>

<body>

	<div class="super_container">

		<!-- Header -->

		<header class="header trans_300">

			<!-- Top Navigation -->

			<div class="top_nav">
				<div class="container">
					<div class="row">
						<div class="col-md-6">
							<div class="top_nav_left">H.Genie</div>
						</div>
						<div class="col-md-6 text-right">
							<div class="top_nav_right">
								<ul class="top_nav_menu">

									<!-- Currency / Language / My Account -->
			
									<c:if test="${ses eq null }">
										<li class="account"><a href="#"> My Account <i
												class="fa fa-angle-down"></i>
										</a>
											<ul class="account_selection">
												<li><a href="index.jsp?view=login"><i
														class="fa fa-sign-in" aria-hidden="true"></i>Sign In</a></li>
												<li><a href="index.jsp?view=regist"><i
														class="fa fa-user-plus" aria-hidden="true"></i>Register</a></li>
											</ul></li>
									</c:if>
									<c:if test="${ses ne null }">
										<c:choose>
											<c:when test="${ses.grade == 9 }">
											<li class="currency"><a href="index.jsp?view=preg">Product
														Register</a><i></i>
												<li class="account"><a href="./uctrl?sign=list"> ${ses.name }</a></li>
											</c:when>
											<c:when test="${ses.grade != 9 }">
												<li class="account"><a href="index.jsp?view=user"> ${ses.name }</a></li>
											</c:when>
										</c:choose>
										<li class="account"><a href="./uctrl?sign=logout">
												로그아웃</a></li>
									</c:if>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
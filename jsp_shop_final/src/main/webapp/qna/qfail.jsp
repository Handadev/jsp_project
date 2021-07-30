<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link
	href='http://fonts.googleapis.com/css?family=Roboto:400,500,700,300,100'
	rel='stylesheet' type='text/css'>

<!-- styles -->
<link href="resources/css/font-awesome.css" rel="stylesheet">
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<link href="resources/css/animate.min.css" rel="stylesheet">
<link href="resources/css/owl.carousel.css" rel="stylesheet">
<link href="resources/css/owl.theme.css" rel="stylesheet">

<!-- theme stylesheet -->
<link href="resources/css/style.default.css" rel="stylesheet"
	id="theme-stylesheet">

<!-- your stylesheet with modifications -->
<link href="resources/css/custom.css" rel="stylesheet">

<script src="resources/js/respond.min.js"></script>

<style>
button {
	margin-top: 10px;
}

.box {
	width: 800px;
	margin-top: 200px;
	margin-left: 30%;
}
</style>


<div class="container">
	<div class="col-md-12">
		<div class="box">
			<h3>Q&A</h3>
			<form action="./ProductController" method="post">
				<input type="hidden" name="sign" value="detail"> <input
					type="hidden" name="pno" value="${qvo.pno }">
				<div class="row">
					<div class="col-sm-6">
						<div class="form-group">
							<h4 class="text-muted">비밀번호가 틀렸습니다.</h4>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-6">
						<div class="form-group">
							<div class="text-left text-sm-right">
								<button id="qna_submit" type="submit"
									class="red_button review_submit_btn trans_300">목록으로</button>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>



<script src="resource/js/jquery-3.2.1.min.js"></script>
<script src="resource/styles/bootstrap4/popper.js"></script>
<script src="resource/styles/bootstrap4/bootstrap.min.js"></script>
<script src="resource/plugins/Isotope/isotope.pkgd.min.js"></script>
<script src="resource/plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
<script src="resource/plugins/easing/easing.js"></script>
<script src="resource/plugins/jquery-ui-1.12.1.custom/jquery-ui.js"></script>
<script src="resource/js/single_custom.js"></script>
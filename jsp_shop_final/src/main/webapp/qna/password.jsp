<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link
	href='http://fonts.googleapis.com/css?family=Roboto:400,500,700,300,100'
	rel='stylesheet' type='text/css'>

<link href="resources/css/font-awesome.css" rel="stylesheet">
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<link href="resources/css/animate.min.css" rel="stylesheet">
<link href="resources/css/owl.carousel.css" rel="stylesheet">
<link href="resources/css/owl.theme.css" rel="stylesheet">

theme stylesheet
<link href="resources/css/style.default.css" rel="stylesheet"
	id="theme-stylesheet">

your stylesheet with modifications
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

.input_pwd {
	-webkit-text-security: disc;
}
</style>

<div class="container">
	<div class="col-md-12">
		<div class="box">
			<h3>Q&A</h3>
			<form action="./qctrl" method="post">
				<input type="hidden" name="sign" value="detail2"> <input
					type="hidden" name="qno" value="${qvo.qno }">
				<div class="row">
					<div class="col-sm-6">
						<div class="form-group">
							<h4 class="text-muted">이 글은 비밀글입니다. 4자리 비밀번호를 입력해주세요.</h4>
							<p class="text-center">
								관리자는 <strong>확인</strong>만 누르시면 됩니다.
							</p>
						</div>
					</div>
				</div>
				<c:choose>
					<c:when test="${ses.grade==9 }">
						<input type="hidden" name="qna_pwd" value="${qvo.qna_pwd }">
					</c:when>
					<c:otherwise>
						<div class="row">
							<div class="col-sm-6">
								<div class="form-group">
									<input id="qna_pwd" class="form_input input_pwd"
										type="number" maxlength="4" oninput="lengthCheck(this)"
										name="qna_pwd" placeholder="password" required="required"
										data-error="Valid email is required.">
								</div>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
				<div class="row">
					<div class="col-sm-6">
						<div class="form-group">
							<div class="text-left text-sm-right">
								<button id="qna_submit" type="submit"
									class="red_button review_submit_btn trans_300">확인</button>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>


<script type="text/javascript">
	function lengthCheck(object) {
		if (object.value.length > object.maxLength) {
			object.value = object.value.slice(0, object.maxLength);
		}
	}
</script>


<script src="resource/js/jquery-3.2.1.min.js"></script>
<script src="resource/styles/bootstrap4/popper.js"></script>
<script src="resource/styles/bootstrap4/bootstrap.min.js"></script>
<script src="resource/plugins/Isotope/isotope.pkgd.min.js"></script>
<script src="resource/plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
<script src="resource/plugins/easing/easing.js"></script>
<script src="resource/plugins/jquery-ui-1.12.1.custom/jquery-ui.js"></script>
<script src="resource/js/single_custom.js"></script>
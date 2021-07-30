<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Footer -->

<footer class="footer">
	<div class="container">
		<div class="row">
			<div class="col-lg-6">
				<div
					class="footer_nav_container d-flex flex-sm-row flex-column align-items-center justify-content-lg-start justify-content-center text-center">
					<ul class="footer_nav">
						<li><a href="#">Blog</a></li>
						<li><a href="#">FAQs</a></li>
						<li><a href="contact.html">Contact us</a></li>
					</ul>
				</div>
			</div>
			<div class="col-lg-6">
				<div
					class="footer_social d-flex flex-row align-items-center justify-content-lg-end justify-content-center">
					<ul>
						<li><a href="#"><i class="fa fa-facebook"
								aria-hidden="true"></i></a></li>
						<li><a href="#"><i class="fa fa-twitter"
								aria-hidden="true"></i></a></li>
						<li><a href="#"><i class="fa fa-instagram"
								aria-hidden="true"></i></a></li>
						<li><a href="#"><i class="fa fa-skype" aria-hidden="true"></i></a></li>
						<li><a href="#"><i class="fa fa-pinterest"
								aria-hidden="true"></i></a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<div class="footer_nav_container">
					<div class="cr">
						©2018 All Rights Reserverd. Made with <i class="fa fa-heart-o"
							aria-hidden="true"></i> by <a href="#">Colorlib</a> &amp;
						distributed by <a href="https://themewagon.com">ThemeWagon</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</footer>

</div>
<script>
let result = '${param.result}';
switch(result){

/* ----------- 회원가입 성공 실패 시 알럿 --------------*/
 
case "registO" :
	alert("회원가입이 성공 하였습니다 ㅎㅎ!!");
	break;
	
/* ----------- 로그인 실패 시 알럿 --------------*/

case "loginX" :
	alert("아이디와 비밀번호를 확인하세요!!");
	break;
}
</script>
<script src="resource/js/jquery-3.2.1.min.js"></script>
<script src="resource/styles/bootstrap4/popper.js"></script>
<script src="resource/styles/bootstrap4/bootstrap.min.js"></script>
<script src="resource/plugins/Isotope/isotope.pkgd.min.js"></script>
<script src="resource/plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
<script src="resource/plugins/easing/easing.js"></script>
<script src="resource/plugins/jquery-ui-1.12.1.custom/jquery-ui.js"></script>

<script src="resource/js/custom.js"></script>

<script src="resource/js/single_custom.js"></script>

<script src="resource/js/categories_custom.js"></script>
</body>

</html>
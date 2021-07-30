<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- styles -->
<link href="css/font-awesome.css" rel="stylesheet">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/animate.min.css" rel="stylesheet">
<link href="css/owl.carousel.css" rel="stylesheet">
<link href="css/owl.theme.css" rel="stylesheet">

<!-- theme stylesheet -->
<link href="css/style.default.css" rel="stylesheet"
	id="theme-stylesheet">

<!-- your stylesheet with modifications -->
<link href="css/custom.css" rel="stylesheet">

<script src="js/respond.min.js"></script>

<style>
h3 {
	margin: 200px 0 30px 30px;
}

.form-group {
	width: 700px;
}

.row2 {
	display: block;
	width: 1000px;
}

.col-sm-6 {
	margin-bottom: 30px;
}

.input_pwd {
	-webkit-text-security: disc;
}


</style>


<div id="content">
	<div class="container">
		<div class="col-md-9">
			<form action="./qctrl?sign=regist" method="post" id="qna_form"
				enctype="multipart/form-data">
				<input type="hidden" name="pno" value="${pno}"> <input
					type="hidden" name="qna_writer" value="${qna_writer }">
				<h3 style="margin-top: 200px;">${title } 문의</h3>
				<div class="row2">
					<div class="col-sm-6">
						<div class="form-group">
							<label for="category">Category</label> <select
								class="form-control" id="qna_category" name="qna_category"
								style="height: 50px;">
								<option>-----선택-----</option>
								<option value="상품문의">상품문의</option>
								<option value="배송문의">배송문의</option>
								<option value="교환/환불 문의">교환/환불 문의</option>
								<option value="배송 전 주문변경 문의">배송 전 주문변경 문의</option>
								<option value="기타문의">기타문의</option>
							</select>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="form-group">
							<label for="content">Content</label>
							<textarea id="qna_content" class="input_review"
								name="qna_content" placeholder="내용을 입력하세요" rows="4" required
								data-error="Please, leave us a review." style="height: 500px;"></textarea>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="form-group">
							<label for="file">첨부파일</label> <input id="file1"
								class="form_input input_name" type="file" name="imgfile1">
							<input id="file2" class="form_input input_name" type="file"
								name="imgfile2"> <input id="file3"
								class="form_input input_name" type="file" name="imgfile3">
							<input id="qna_pwd" class="form_input input_pwd" type="number"
								maxlength="4" oninput="lengthCheck(this)" name="qna_pwd"
								placeholder="password" required="required"
								data-error="Valid email is required.">
						</div>
					</div>
					<div class="col-sm-6">
						<div class="form-group">
							<div class="text-left text-sm-right">
								<button id="qna_submit" type="submit"
									class="red_button review_submit_btn trans_300">submit</button>
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
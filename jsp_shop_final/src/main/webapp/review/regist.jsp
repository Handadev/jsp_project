<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

</style>
<div id="tab_3" class="tab_container">
	<div class="row">
		<!-- Add Review -->
		<div class="col-lg-6 add_review_col">

			<div class="add_review">
				<form action="./rctrl?sign=regist" method="post" id="rev_form"
					enctype="multipart/form-data">
					<div>
						<h1 style="margin-top: 200px;">Review</h1>
						<input id="rev_writer" class="form_input input_name" type="text"
							name="rev_writer" placeholder="name" required="required"
							data-error="Name is required."> <input id="pno"
							class="form_input input_name" type="text" name="pno"
							placeholder="pno" required="required"
							data-error="pno is required.">
					</div>
					<div>
						<h3>Content</h3>
						<textarea id="rev_content" class="input_review" name="rev_content"
							placeholder="내용을 입력하세요" rows="4" required
							data-error="Please, leave us a review." style="height: 500px;"></textarea>
						<input id="file" class="form_input input_name" type="file"
							name="imgfile">
					</div>
					<div class="text-left text-sm-right">
						<button id="rev_submit" type="submit"
							class="red_button review_submit_btn trans_300">submit</button>
					</div>
				</form>
			</div>

		</div>

	</div>
</div>
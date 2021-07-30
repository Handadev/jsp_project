<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div id="tab_3" class="tab_container">
	<div class="row">
		<div class="col-lg-6 add_review_col">
			<div class="add_review">
				<form action="./rctrl" method="post">
					<input type="hidden" name="sign" value="myModifySave"> <input
						type="hidden" name="rno" value="${rvo.rno }">
						<input
						type="hidden" name="pno" value="${pno }">
						<input
						type="hidden" name="rev_writer" value="${rev_writer }">
					<div>
						<h4 style="margin-top: 200px;">Review 수정</h4>
						<div>
							<textarea id="rev_content" class="input_review"
								name="rev_content" placeholder="내용을 입력하세요" rows="4" required
								data-error="Please, leave us a review." style="height: 500px;">${rvo.rev_content }</textarea>
						</div>
						<div class="text-left text-sm-right">
							<button id="rev_submit" type="submit"
								class="red_button review_submit_btn trans_300">submit</button>
						</div>
					</div>
				</form>
			</div>

		</div>

	</div>
</div>
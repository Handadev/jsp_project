<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div id="tab_3" class="tab_container">
	<div class="row">
		<div class="col-lg-6 add_review_col">
			<div class="add_review">
				<div>
					<form action="./qctrl" method="post">
						<input type="hidden" name="sign" value="list">
						<h1 style="margin-top: 200px;">Q&A</h1>
						<h3>비밀번호가 틀렸습니다.</h3>

						<div class="text-left text-sm-right">
							<button id="qna_submit" type="submit"
								class="red_button review_submit_btn trans_300">목록으로</button>
						</div>
					</form>
				</div>

			</div>

		</div>
	</div>
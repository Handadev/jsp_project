<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div id="tab_3" class="tab_container">
	<div class="row">
		<!-- list -->
		<div class="col-lg-6 add_review_col">
			<div class="add_review">
				<h1 style="margin-top: 200px;">Q&A List</h1>
				<div class="table-responsive">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>Category</th>
								<th>Date</th>
								<th>Writer</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list }" var="qvo">
								<tr>
									<td><a href="./qctrl?sign=detail&qno=${qvo.qno }">${qvo.qna_category }</a>
									</td>
									<td>${qvo.qna_date }</td>
									<td>${qvo.qna_writer }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<script src="../resource/js/jquery-3.2.1.min.js"></script>
				</div>
			</div>

		</div>

	</div>
</div>
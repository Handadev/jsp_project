<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" type="text/css"
	href="resource/styles/categories_styles.css">
<link rel="stylesheet" type="text/css"
	href="resource/styles/categories_responsive.css">
<style>
.product_section_container .product_section {
	margin-top: 40px;
}

.product_section_container {
	margin-top: 150px;
}
</style>
<div class="container product_section_container">
	<div class="row">
		<div class="col product_section clearfix">
			<!-- Breadcrumbs -->

			<!-- Sidebar -->

			<div class="sidebar">
				<div class="sidebar_section">
					<div class="sidebar_title">
						<h5>Admin Menu</h5>
					</div>
					<ul class="sidebar_categories">
						<li><a href="index.jsp?view=user">- 개인 정보 수정</a></li>
						<li><a href="./uctrl?sign=myCouponList&mno=${ses.mno }">-
								쿠폰 리스트</a></li>
						<li><a href="./uctrl?sign=showOrderList&mno=${ses.mno }">-
								구매내역</a></li>
						<li><a href="./rctrl?sign=mylist&rev_writer=${ses.id }">-
								나의 리뷰</a></li>
						<li><a onclick="leave();" id=leave>- 회원 탈퇴</a></li>
					</ul>
					<input type="hidden" id="sesId" value="${ses.id }">
				</div>
			</div>

			<div class="main_content">
				<!-- Main Content  여기 아래로-->
				<div class="col-md-12" id="center_content">
					<div class="box">
						<h2>쿠폰 리스트</h2>
						<div class="table-responsive">
							<table class="table table-hover">
								<thead>
									<tr>
										<th>쿠폰번호</th>
										<th>이름</th>
										<th>할인율</th>
										<th>기한</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${couponList }" var="ucvo">
										<tr>
											<th>${ucvo.cpno }</th>
											<td>${ucvo.cp_name }</td>
											<td>${ucvo.cp_discount }%</td>
											<td>${ucvo.cp_enddate }까지</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<!--  Main Content여기 위로 -->
			</div>
		</div>
	</div>
</div>
<script>
	function leave() {
		let id_val = $("#sesId").val();
		if (confirm("회원 탈퇴를 하시겠습니까???")) {
			$(location).attr("href", "./uctrl?sign=leave&id=" + id_val);
		}
	}
</script>
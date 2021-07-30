<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" type="text/css" href="resource/styles/categories_styles.css">
<link rel="stylesheet" type="text/css" href="resource/styles/categories_responsive.css">
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
						<li><label>회원 관리</label></li>
						<li><a href="./uctrl?sign=list">-회원 리스트</a></li>
						<li><label>쿠폰 관리</label></li>
						<li><a href="index.jsp?view=couponRegist">-쿠폰 등록</a></li>
						<li><a href="./couponctrl?sign=list">-쿠폰 리스트</a></li>
					</ul>
				</div>
			</div>

			<div class="main_content">
				<!-- Main Content  여기 아래로-->
				<div class="col-md-12" id="center_content">
					<div class="box">
						<h1>쿠폰 리스트</h1>
						<div class="table-responsive">
							<table class="table table-hover">
								<thead>
									<tr>
										<th>쿠폰번호</th>
										<th>이름</th>
										<th>할인율</th>
										<th>기한</th>
										<th>추가 기능</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${couponList }" var="cvo">
									<tr>
										<th>${cvo.cpno }</th>
										<td>${cvo.cp_name }</td>
										<td>${cvo.cp_discount }%</td>
										<td>${cvo.cp_enddate } 까지</td>
										<td><a href="./couponctrl?sign=apply&cpno=${cvo.cpno }" class="btn btn-primary btn-sm">쿠폰적용</a>
										<button type="button" class="btn btn-primary btn-sm" onclick="removeCoupon(this)">쿠폰삭제</button>
										</td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
							<form action="./couponctrl" method="post" id="removeFrom">
								<input type="hidden" name="sign" value="delete">
								<input type="hidden" name="cpno">
							</form>
							<script src="resource/js/jquery-3.2.1.min.js"></script>
							<script>
								function removeCoupon(button) {
									let cpno = $(button).closest("tr").children("th").eq(0).text();
									console.log(cpno);
									$("input[name=cpno]").val(cpno);
									$("#removeFrom").submit();
								}
							</script>
						</div>
					</div>
				</div>
				<!--  Main Content여기 위로 -->
			</div>
		</div>
	</div>
</div>

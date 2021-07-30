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

button {
	margin-left: 2%;
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
				<div class="col-md-8" id="center_content">
					<div class="box">
						<h1>쿠폰 수정</h1>

						<div class="table-responsive">
							<form action="./couponctrl" method="post">
							<input type="hidden" name="sign" value="modifySave">
							<input type="hidden" name="cpno" value="${couponDetail.cpno }">
								<table class="table table-hover">
									<tbody>
										<tr>
											<td><label><strong>쿠폰 번호</strong></label> <input
												type="text" class="form-control" name="cpno"
												value="${couponDetail.cpno }" readonly></td>
										</tr>
										<tr>
											<td><label><strong>쿠폰 이름</strong></label> <input
												type="text" class="form-control" name="couponName"
												value="${couponDetail.cp_name }"></td>
										</tr>
										<tr>
											<td><label><strong>쿠폰 할인율</strong></label> <input
												type="number" class="form-control" name="couponDiscount"
												value="${couponDetail.cp_discount }"></td>
										</tr>
										<tr>
											<td><label><strong>쿠폰 기한</strong></label> <input
												type="date" class="form-control" name="couponEndDate"
												value="${couponDetail.cp_enddate }"></td>
										</tr>
									</tbody>
								</table>
								<button type="submit" class="btn btn-success" id="sbmBtn">수정</button>

							</form>
						</div>
					</div>
				</div>
				<!--  Main Content여기 위로 -->
			</div>
		</div>
	</div>
</div>

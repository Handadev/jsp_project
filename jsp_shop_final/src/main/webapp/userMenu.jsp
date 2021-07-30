<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
						<h5>User Menu</h5>
					</div>
					<ul class="sidebar_categories">
						<li><a href="#">-개인 정보 수정</a></li>
						<li><a href="#">-쿠폰 리스트</a></li>
						<li><a href="#">-찜 목록</a></li>
						<li><a href="#">-장바구니</a></li>
					</ul>
				</div>
			</div>

			<div class="main_content">
				<!-- Main Content  여기 아래로-->
				<div class="col-md-12" id="center_content">
					<div class="box">
						<h1>USER MENU</h1>

						<p class="lead">Your orders on one place.</p>
						<p class="text-muted">
							If you have any questions, please feel free to <a
								href="contact.html">contact us</a>, our customer service center
							is working for you 24/7.
						</p>

						<hr />

						<div class="table-responsive">
							<table class="table table-hover">
								<thead>
									<tr>
										<th>Order</th>
										<th>Date</th>
										<th>Total</th>
										<th>Status</th>
										<th>Action</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th># 1735</th>
										<td>22/06/2013</td>
										<td>$ 150.00</td>
										<td><span class="label label-info">Being prepared</span></td>
										<td><a href="customer-order.html"
											class="btn btn-primary btn-sm">View</a></td>
									</tr>
									<tr>
										<th># 1735</th>
										<td>22/06/2013</td>
										<td>$ 150.00</td>
										<td><span class="label label-info">Being prepared</span></td>
										<td><a href="customer-order.html"
											class="btn btn-primary btn-sm">View</a></td>
									</tr>
									<tr>
										<th># 1735</th>
										<td>22/06/2013</td>
										<td>$ 150.00</td>
										<td><span class="label label-success">Received</span></td>
										<td><a href="customer-order.html"
											class="btn btn-primary btn-sm">View</a></td>
									</tr>
									<tr>
										<th># 1735</th>
										<td>22/06/2013</td>
										<td>$ 150.00</td>
										<td><span class="label label-danger">Cancelled</span></td>
										<td><a href="customer-order.html"
											class="btn btn-primary btn-sm">View</a></td>
									</tr>
									<tr>
										<th># 1735</th>
										<td>22/06/2013</td>
										<td>$ 150.00</td>
										<td><span class="label label-warning">On hold</span></td>
										<td><a href="customer-order.html"
											class="btn btn-primary btn-sm">View</a></td>
									</tr>
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
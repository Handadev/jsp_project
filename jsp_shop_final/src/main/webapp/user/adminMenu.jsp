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
						<br>
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
						<h2>회원 리스트</h2>
						<hr />

						<div class="table-responsive">
							<table class="table table-hover" style="width: 1200px">
								<thead>
									<tr>
										<th>No.</th>
										<th>아이디</th>
										<th>이름</th>
										<th>가입일</th>
										<th>포인트</th>
										<th>등급</th>
										<th>추가 활동</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${list }" var="uvo">
										<tr>
											<th>${uvo.mno }</th>
											<td><a href="./uctrl?sign=upList&mno=${uvo.mno}">${uvo.id }</a></td>
											<td>${uvo.name }</td>
											<td>${uvo.signupdate }</td>
											<td>${uvo.pro_point }</td>
											<c:choose>
												<c:when test="${uvo.grade==9 }">
													<td>관리자</td>
												</c:when>
												<c:when test="${uvo.grade==1 }">
													<td>일반 회원</td>
												</c:when>
												<c:when test="${uvo.grade==2 }">
													<td>우수 회원</td>	
												</c:when>
												<c:when test="${uvo.grade==3 }">
													<td>VIP</td>
												</c:when>
												<c:when test="${uvo.grade==4 }">
													<td>VVIP</td>
												</c:when>
											</c:choose>
											<td id=btTd>
												<button class='btn btn-primary btn-sm' type='button' id='dBtn' onclick='removeUser(this);'>삭제</button>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<form action="./uctrl" method="post" id="rmForm">
								<input type="hidden" name="sign" value="remove"> <input
									type="hidden" name="delId">
							</form>
							<script src="resource/js/jquery-3.2.1.min.js"></script>
							<script>
								function removeUser(obj) {
									let id = $(obj).closest("tr")
											.children("td").eq(0).text();
									$("input[name=delId]").val(id);
									$("#rmForm").submit();
								}
							</script>
						</div>
					</div>
				<!--  Main Content여기 위로 -->
			</div>
		</div>
	</div>
</div>

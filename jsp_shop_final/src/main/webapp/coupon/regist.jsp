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
						<h1>쿠폰 등록</h1>

						<div class="table-responsive">
								<table class="table table-hover">
									<tbody>
										<tr>
											<td><label><strong>쿠폰 이름</strong></label> <input
												type="text" class="form-control" name="couponName"></td>
										</tr>
										<tr>
											<td><label><strong>쿠폰 할인율</strong></label> <input
												type="number" class="form-control" name="couponDiscount"></td>
										</tr>
										<tr>
											<td><label><strong>쿠폰 기한</strong></label> <input
												type="date" class="form-control" name="couponEndDate"></td>
										</tr>
									</tbody>
								</table>
								<button type="submit" class="btn btn-success" id="sbmBtn">등록</button>
							
						</div>
							<hr>
							
							<h3 id="result"></h3>
							<table class="table table-hover" id="couponInfoArea">
							
							</table>
							
							<script src="resource/js/jquery-3.2.1.min.js"></script>
							<script>
							/* 쿠폰 등록시 동적으로 추가되도록 ajax 사용 */
							function function_getCouponInfo() {
								$.ajax({
									url: "./couponctrl",
									type: "post",
									data: {sign: "info"}
								}).done(function(result){
									let json_obj = JSON.parse(result);
									console.log(json_obj);
									let infoTable = "";
									infoTable += "<tr>";
									infoTable += "<td>쿠폰번호 :";
									infoTable += ""+json_obj.cpno+"</td>";
									infoTable += "</tr>";
									infoTable += "<tr>";
									infoTable += "<td>쿠폰이름 :";
									infoTable += ""+json_obj.name+"</td>";
									infoTable += "</tr>";
									infoTable += "<tr>";
									infoTable += "<td>기한 :";
									infoTable += ""+json_obj.endDate+"</td>";
									infoTable += "</tr>";
									infoTable += "<tr>";
									infoTable += "<td>할인율 :";
									infoTable += ""+json_obj.discount+"</td>";
									infoTable += "</tr>";
									$("#result").html("쿠폰 등록 성공");
									$("#couponInfoArea").html(infoTable);
								});
							}
								$("#sbmBtn").on("click", function(){
									$.ajax({
										url: "./couponctrl",
										type: "post",
										data: {
											sign: "regist",
											couponName: $("input[name=couponName]").val(),
											couponDiscount: $("input[name=couponDiscount]").val(),
											couponEndDate: $("input[name=couponEndDate]").val()
										}
									}).done(function(){
										console.log("ajax regist 성공");
										$("input[name=couponName]").val("");
										$("input[name=couponDiscount]").val("");
										$("input[name=couponEndDate]").val("");
										function_getCouponInfo();
									});
								});
							</script>
					</div>
				</div>
				<!--  Main Content여기 위로 -->
			</div>
		</div>
	</div>
</div>

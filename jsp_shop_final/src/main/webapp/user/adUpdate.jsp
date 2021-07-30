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

#adConBox {
	margin-top: 200px;
	width: 1500px;
}
</style>
<div class="container" id="adConBox">
	<div class="row">
		<div>
			<!-- Breadcrumbs -->

			<!-- Sidebar -->

			<div class="sidebar">
				<div class="sidebar_section">
					<div class="sidebar_title">
						<h5>관리자 메뉴</h5>
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

			<div class="main_content" style="width: 900px">
				<!-- Main Content  여기 아래로-->
				<div class="col-md-14">
					<div class="box">
						<h2>회원 자세히 보기</h2>


						<div class="" style="width: 1000px">
							<form action="./uctrl" method="post">
								<input type="hidden" name="sign" value="adUpdate"> <input
									type="hidden" name="mno" value="${uvo.mno }">
								<div class="row">
									<div class="col-sm-5">
										<div class="form-group">
											<label>아이디</label> <input type="text" class="form-control"
												name="id" id="idInput" value="${uvo.id }" readonly>
										</div>
									</div>
									<div class="col-sm-5">
										<div class="form-group">
											<label>비밀번호</label> <input type="text" class="form-control"
												name="pwd" value="${uvo.pwd }" readonly>
										</div>
									</div>
								</div>
								<!-- /.row -->

								<div class="row">
									<div class="col-sm-5">
										<div class="form-group">
											<label>이름</label> <input type="text" class="form-control"
												name="name" value="${uvo.name }" readonly>
										</div>
									</div>
									<div class="col-sm-5">
										<div class="form-group">
											<label>생일</label> <input type="text" class="form-control"
												name="birthday" value="${uvo.birthday }" readonly>
										</div>
									</div>
								</div>
								<!-- /.row -->



								<div class="row">
									<div class="col-sm-5">
										<div class="form-group">
											<label>전화번호</label> <input type="text" class="form-control"
												name="phonenumber" value="${uvo.phonenumber }" readonly>
										</div>
									</div>
									<div class="col-sm-5">
										<div class="form-group">
											<label>주소</label> <input type="text" class="form-control"
												name="address" value="${uvo.address }" readonly>
										</div>
									</div>
								</div>




								<div class="row">
									<div class="col-sm-5">
										<div class="form-group">
											<label>가입일</label> <input type="text" class="form-control"
												name="signupdate" value="${uvo.signupdate }" readonly>
										</div>
									</div>
									<div class="col-sm-5">
										<div class="form-group">
											<label>포인트</label> <input type="text" class="form-control"
												name="pro_point" value="${uvo.pro_point }" readonly>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-5">
										<div class="form-group">
											<label>등급</label> <input type="text" class="form-control"
												name="grade" value="${uvo.grade }" readonly>
										</div>
									</div>
									<div class="col-sm-5">
										<div class="form-group">
											<label>이메일</label> <input type="text" class="form-control"
												name="email" value="${uvo.email }" readonly>
										</div>
									</div>
								</div>

								<div class="row">
									<div class="col-sm-5">
										<div class="form-group">
											<label>보유쿠폰</label> <select class="form-control">
												<c:forEach items="${coupon }" var="cp">
													<option>${cp.cp_name } / ${cp.cp_discount }%</option>
												</c:forEach>
											</select>
										</div>
									</div>
								<div class="col-sm-10 text-center" id="btnDiv"></div>
								</div>
							</form>

						</div>
					</div>
				</div>
				<!--  Main Content여기 위로 -->
			</div>
		</div>
	</div>
</div>
<script src="resource/js/jquery-3.2.1.min.js"></script>
<script>
	let flag = true;
	myFlag();
	function myFlag() {
		console.log("haha");
		if (flag) {
			$("#btnDiv")
					.html(
							"<button type='button' class='btn btn-primary' onclick='UpdateBtn();'>수정하기</button>")
		} else {
			$("#btnDiv")
					.html(
							"<button type='button' class='btn btn-primary' onclick='clearUpdate();'>수정완료</button>")
		}
	}
	function UpdateBtn() {
		flag = false;
		myFlag();
		$(".row").find("input").attr("readonly", false);
	}

	function clearUpdate() {
		let mno_val = $("input[name=mno]").val();
		let id_val = $("input[name=id]").val();
		let pwd_val = $("input[name=pwd]").val();
		let name_val = $("input[name=name]").val();
		let birth_val = $("input[name=birthday]").val();
		let phone_val = $("input[name=phonenumber]").val();
		let address_val = $("input[name=address]").val();
		let signup_val = $("input[name=signupdate]").val();
		let point_val = $("input[name=pro_point]").val();
		let grade_val = $("input[name=grade]").val();
		let email_val = $("input[name=email]").val();
		console.log(mno_val);
		$.ajax({
			url : "./uctrl",
			type : "post",
			data : {
				mno : mno_val,
				id : id_val,
				pwd : pwd_val,
				name : name_val,
				birthday : birth_val,
				phonenumber : phone_val,
				address : address_val,
				signupdate : signup_val,
				pro_point : point_val,
				grade : grade_val,
				email : email_val,
				sign : "adUpdate"
			}

		}).done(function() {
			flag = true;
			myFlag();
			$(".row").find("input").attr("readonly", true);
		});

	}
</script>

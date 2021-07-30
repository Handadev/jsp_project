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

#leave {
cursor: pointer;
}

#leave:hover {
color: #b5aec4;
}

.form-control {
	color: black;
}
</style>
<input type="hidden" value="${ses.id }" id="sesId">
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
						<li><a href="./uctrl?sign=myCouponList&mno=${ses.mno }">-쿠폰 리스트</a></li>
						<li><a href="./uctrl?sign=showOrderList&mno=${ses.mno }">-구매내역</a></li>
						<li><a href="./rctrl?sign=mylist&rev_writer=${ses.id }">-나의 리뷰</a></li>
						<li><a onclick="leave();" id ="leave">- 회원 탈퇴</a></li>
					</ul>
				</div>
			</div>

			<div class="main_content">
				<!-- Main Content  여기 아래로-->
				<div class="col-md-12" id="center_content">
					<div class="box">
						<h3>내 정보</h3>
						<div class="" style="width: 1000px">
							<input type="hidden" id="mno" value="${ses.mno }">
								<input type="hidden" name="sign" value="adUpdate">
								<div class="row">
									<div class="col-sm-5">
										<div class="form-group">
											<label>아이디</label> <input type="text" class="form-control"
												name="id" id="idInput" value="${ses.id }" readonly>
										</div>
									</div>
									<div class="col-sm-5">
										<div class="form-group">
											<label>비밀번호</label> <input id="pwd" type="text" class="form-control"
												name="pwd" value="${ses.pwd }" readonly>
										</div>
									</div>
								</div>
								<!-- /.row -->

								<div class="row">
									<div class="col-sm-5">
										<div class="form-group">
											<label>이름</label> <input type="text" class="form-control"
												name="name" value="${ses.name }" readonly>
										</div>
									</div>
									<div class="col-sm-5">
										<div class="form-group">
											<label for="street">생일</label> 
											<input type="text" class="form-control" name="birthday"	value="${ses.birthday }" readonly>
										</div>
									</div>
								</div>
								<!-- /.row -->



								<div class="row">
									<div class="col-sm-5">
										<div class="form-group">
											<label>전화번호</label> <input id="phonenumber" type="text" class="form-control"
												name="phonenumber" value="${ses.phonenumber }" readonly>
										</div>
									</div>
									<div class="col-sm-5">
										<div class="form-group">
											<label>주소</label> <input id="address" type="text" class="form-control"
												name="address" value="${ses.address }" readonly>
										</div>
									</div>
								</div>




								<div class="row">
									<div class="col-sm-5">
										<div class="form-group">
											<label>가입일</label> <input type="text" class="form-control"
												name="signupdate" value="${ses.signupdate }" readonly>
										</div>
									</div>
									<div class="col-sm-5">
										<div class="form-group">
											<label for="email">포인트</label> <input type="text"
												class="form-control" name="pro_point"
												value="${ses.pro_point }" readonly>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-5">
										<div class="form-group">
											<label for="email">등급</label> <input type="text"
												class="form-control" name="grade" value="${ses.grade }"
												readonly>
										</div>
									</div>
									<div class="col-sm-5">
										<div class="form-group">
											<label for="email">이메일</label> <input id="email" type="text"
												class="form-control" name="email" value="${ses.email }"
												readonly>
										</div>
									</div>
									<div class="col-sm-10 text-center" id="btnDiv"><button type='button' class='btn btn-primary' onclick='myUpdate(this);'>정보수정</button></div>
								</div>
							

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
let birth = $("input[name=birthday]");
birth.val(birth.val().substr(0,10));
let arr = birth.val().split("-");
birth.val(arr[0]+"년 "+arr[1]+"월 " +arr[2]+"일 ");

let signup = $("input[name=signupdate]");
signup.val(signup.val().substr(0,10));
let arr2 = signup.val().split("-");
signup.val(arr2[0]+"년 "+arr2[1]+"월 " +arr2[2]+"일 ");


function leave() {
	let id_val = $("#sesId").val();
	 if (confirm("회원 탈퇴를 하시겠습니까???")) {
		 	$(location).attr("href", "./uctrl?sign=leave&id="+id_val);
     }
     }



let flag = true;
function myFlag(){
	if (flag) {
		$("#btnDiv").html("<button type='button' class='btn btn-primary' onclick='myUpdate();'>정보수정</button>");
	}else{
		$("#btnDiv").html("<button type='button' class='btn btn-primary' onclick='clearUp();'>수정완료</button>");
	}
}

	function myUpdate() {
		flag = false;
		myFlag();
		$("input[name=pwd]").attr("readonly", false);
		$("input[name=phonenumber]").attr("readonly", false);
		$("input[name=address]").attr("readonly", false);
		$("input[name=email]").attr("readonly", false);
	}
	
	function clearUp() {
		let mno_val = $("#mno").val();
		let pwd_val = $("#pwd").val();
		let phone_val = $("#phonenumber").val();
		let address_val = $("#address").val();
		let email_val = $("#email").val();
		flag = true;
		myFlag();
		$.ajax({
			url : "./uctrl",
			type : "post",
			data : {
				mno : mno_val,
				pwd : pwd_val,
				phonenumber : phone_val,
				address : address_val,
				email : email_val,
				sign : "myUpdate"
			}
		
		}).done(function() {
		$("input[name=pwd]").attr("readonly", true);
		$("input[name=phonenumber]").attr("readonly", true);
		$("input[name=address]").attr("readonly", true);
		$("input[name=email]").attr("readonly", true);
		});
		
	}
</script>
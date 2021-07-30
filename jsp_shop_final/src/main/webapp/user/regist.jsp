<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
#reg_con {
	margin-top: 200px;
}
</style>
<div class="container" id="reg_con">
	<h3>회원가입</h3>
	<form action="./uctrl" method="post" id ="regForm">
		<input type="hidden" name="sign" value="regist">
		<div class="row">
			<div class="col-sm-6">
				<div class="form-group">
					<label>아이디</label> <input type="text" class="form-control"	name="id" id="idInput">
				</div>
				<span id="isExist"></span>
			</div>
			<div class="col-sm-6">
				<div class="form-group">
					<label>비밀번호</label> <input type="text" class="form-control" name="pwd" id="pwd">
				</div>
			</div>
		</div>
		<!-- /.row -->

		<div class="row">
			<div class="col-sm-6">
				<div class="form-group">
					<label>이름</label> <input type="text" class="form-control" name="name" id="name">
				</div>
			</div>
			<div class="col-sm-6">
				<div class="form-group">
					<label>생일</label> <input type="date" class="form-control" name="birthday" id="birthday">
				</div>
			</div>
		</div>
		<!-- /.row -->

		<div class="row">
			<div class="col-sm-6">
				<div class="form-group">
					<label>전화번호</label> <input type="text" class="form-control" name="phonenumber" id="phonenumber">
				</div>
			</div>
			<div class="col-sm-6">
				<div class="form-group">
					<label>주소</label> <input type="text" class="form-control" name="address" id="address">
				</div>
			</div>
			<div class="col-sm-6">
				<div class="form-group">
					<label>이메일</label> <input type="text" class="form-control" name="email" id="email">
				</div>
			</div>

		</div>
			<div class="col-sm-12 text-center">
				<button type="button" onclick="regist();" class="btn btn-primary">회원가입</button>
			</div>
	</form>
</div>

<script src="resource/js/jquery-3.2.1.min.js"></script>
<script>
function regist() {
	let id_val = $("#idInput").val();
	let pwd_val = $("#pwd").val();
	let name_val = $("#name").val();
	let birth_val = $("#birthday").val();
	let phone_val = $("#phonenumber").val();
	let address_val = $("#address").val();
	let email_val = $("#email").val();
	
	 if(id_val != "" && pwd_val != "" && name_val != "" && birth_val != "" && phone_val != "" && address_val != "" && email_val != ""){
		$("#regForm").submit();
	} else {
		alert("정보를 확인하세요");
	}
	
} 



	$("#idInput").blur(function() {
		let id_val = $("#idInput").val();
		$.ajax({
			url : "./uctrl",
			type : "post",
			data : {
				id : id_val,
				sign : "idCheck"
			}
		}).done(function(isExist) {
			if (isExist === "true" || id_val == "") {
				$("#isExist").html("사용할 수 없는 아이디 입니다.").css("color", "red");
				$("#idInput").focus();
			} else {
				$("#isExist").html("사용 가능한 아이디 입니다.").css("color", "green");
			}
		});

	});
</script>
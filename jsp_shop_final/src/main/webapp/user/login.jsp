<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.box {
	margin-top: 200px;
	margin-left: 40%;
}

.btn {
	margin-top: 10px;
	margin-left: 20%;
}
</style>
<div class="container">
	<div class="col-md-12">
		<div class="box">
			<h3>Login</h3>

			<form action="./uctrl" method="post">
				<input type="hidden" name="sign" value="login">
				<div class="row">
					<div class="col-sm-6">
						<div class="form-group">
							<label for="password_old">ID</label> <input type="text"
								class="form-control" name="id">
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-6">
						<div class="form-group">
							<label for="password_1">password</label> <input type="password"
								class="form-control" name="pwd">
						</div>
					</div>
				</div>
				<!-- /.row -->


				<button type="submit" class="btn btn-success">Login</button>

			</form>

		</div>
	</div>
</div>
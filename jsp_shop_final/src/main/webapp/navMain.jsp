<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Main Navigation -->
<style>
body {
	margin: 0;
	padding: 0;
	background-color: #fff;
}

.search-box {
	height: 40px;
	background-color: #fff;
	border-radius: 30px;
	transition: 0.5s;
	width: 40px;
}

.search-box:hover {
	box-shadow: 0px 0px 5px 1px #51e3d4;
	width: 282px;
}

.search-btn {
	text-decoration: none;
	background-color: #fff;
	border-radius: 50%;
	display: flex;
	justify-content: center;
	align-items: center;
	color: #51e3d4;
}

.search-box:hover>.search-btn {
	background-color: #fff;
}

.search-box:hover {
	cursor: pointer;
}

.search-txt {
	margin-top: 4.5px;
	display: flex;
	padding: 0;
	width: 0px;
	border: none;
	background: none;
	outline: none;
	float: left;
	font-size: 1rem;
	line-height: 30px;
	transition: 0.5s;
}

.search-box:hover>.search-txt {
	width: 240px;
	padding: 0 6px;
}
</style>
<div class="main_nav_container">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-right">
				<div class="logo_container">
					<a href="index.jsp">H.Genie<span>shop</span></a>
				</div>
				<nav class="navbar">
					<ul class="navbar_menu">
						<li><a href="index.jsp">home</a></li>
						<li><a href="./ProductController?sign=list">products</a></li>
					</ul>
					<ul class="navbar_user">
						<li>
							<div class="search-box">
								<input type="text" class="search-txt" id="search" name="title"
									placeholder="상품 검색"> <a id="searchFunc"
									class="search-btn"><i class="fa fa-search"></i></a>
							</div>
						</li>

						<li><c:choose>
								<c:when test="${ses eq null }">
									<a href="index.jsp?view=login"><i class="fa fa-user"
										aria-hidden="true"></i></a>
								</c:when>
								<c:when test="${ses.grade == 9 }">
									<a href="./uctrl?sign=list"><i class="fa fa-user"
										aria-hidden="true"></i></a>
								</c:when>
								<c:when test="${ses.grade != 9 }">
									<a href="index.jsp?view=user"><i class="fa fa-user"
										aria-hidden="true"></i></a>
								</c:when>
							</c:choose></li>
						</li>
							<li class="checkout">
						<c:choose>
					 	<c:when test="${ses.grade eq null }">
					 	<a href="index.jsp?view=login">
						</c:when> 
						<c:otherwise>
							<a href="./CartController?sign=cartList&mno=${ses.mno }">
						</c:otherwise>
						</c:choose>
						<i class="fa fa-shopping-cart" aria-hidden="true"></i> <!-- <span id="checkout_items" class="checkout_items"></span> -->
						</a>
						</li>
					</ul>
					<div class="hamburger_container">
						<i class="fa fa-bars" aria-hidden="true"></i>
					</div>
				</nav>
			</div>
		</div>
	</div>
</div>
<script src="resource/js/jquery-3.2.1.min.js"></script>
<script>
	$("#search").keypress(
			function(e) {
				if (e.which == 13) {
					let search_val = $("#search").val();
					if (search_val == "") {
						alert("검색어를 입력하세요.");
					} else {
						$(location).attr(
								"href",
								"./ProductController?sign=search&title="
										+ search_val);
					}
				}
			});

	$("#searchFunc").on(
			"click",
			function() {
				let search_val = $("#search").val();
				if (search_val == "") {
					alert("검색어를 입력하세요.");
				} else {
					$(location).attr(
							"href",
							"./ProductController?sign=search&title="
									+ search_val);
				}
			});
	</script>
</header>
<div class="fs_menu_overlay"></div>


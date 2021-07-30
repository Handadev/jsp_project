<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<link rel="stylesheet" type="text/css" href="resource/styles/categories_styles.css">
<link rel="stylesheet" type="text/css" href="resource/styles/categories_responsive.css">
<!--파일질라 계정추가 입니다. 주소 확인해주세요  -->
<c:set var="img_url" value="http://ezentw.dothome.co.kr/shop/" />

<div class="container product_section_container">
	<div class="row">
		<div class="col product_section clearfix">

			<!-- Breadcrumbs -->
			<div class="breadcrumbs d-flex flex-row align-items-center">
				<ul>
					<!-- <li><a href="index.jsp">Home</a></li>
					<li class="active"><a href="index.html"><i
							class="fa fa-angle-right" aria-hidden="true"></i>Men's</a></li> -->
				</ul>
			</div>

			<!-- Sidebar -->
			<div class="sidebar">
				<div class="sidebar_section">
					<div class="sidebar_title">
						<h5>Product Category</h5>
					</div>
					<ul class="sidebar_categories">
						<li><a href="#">outer</a></li>
						<li><a href="#">top</a></li>
						<li><a href="#">bottom</a></li>
						<li><a href="#">dress</a></li>
						<li><a href="#">acc</a></li>
						<!-- <li class="active"><a href="#"><span> <i class="fa fa-angle-double-right" aria-hidden="true"></i></span>top</a></li> -->
					</ul>
				</div>

			</div>

			<!-- Main Content -->
			<div class="main_content">

				<!-- Products -->

				<div class="products_iso">
					<div class="row">
						<div class="col">


							<!-- Product Grid -->

							<div class="product-grid">
								<c:forEach items="${list }" var="pvo">
									<div class="product-item men">
										<div class="product discount product_filter">
											<div class="product_image">
												<img src="${img_url }${pvo.imgfile }">
												<!-- pdetail -->
											</div>
											<div class="favorite favorite_left"></div>
											<div
												class="product_bubble product_bubble_right product_bubble_red d-flex flex-column align-items-center">
												<span>${pvo.pno}</span>
											</div>
											<div class="product_info">
												<h6 class="product_name">
													<a href="#">${pvo.title }</a>
												</h6>
												<div class="product_price">${pvo.price }
												</div>
											</div>
										</div>
										<div class="red_button add_to_cart_button">
											<a href="./ProductController?sign=detail&pno=${pvo.pno }">상품보기</a>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
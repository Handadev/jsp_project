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
<c:set var="img_url" value="http://hustle.dothome.co.kr/shop/" />

<div class="container product_section_container">
	<div class="row">
		<div class="col product_section clearfix">

			<!-- Breadcrumbs -->
			<div class="breadcrumbs d-flex flex-row align-items-center">
				<ul>
				</ul>
			</div>

			<div class="row">
				<div class="col text-center">
					<div class="section_title new_arrivals_title">
						<h2>Product Category</h2>
					</div>
				</div>
			</div>
			<div class="row align-items-center">
				<div class="col text-center">
					<div class="new_arrivals_sorting">
						<ul
							class="arrivals_grid_sorting clearfix button-group filters-button-group" 
							>
							<li
								class="
                      grid_sorting_button
                      button
                      d-flex
                      flex-column
                      justify-content-center
                      align-items-center
                      active
                      is-checked
                    "
								data-filter="*">all</li>
							<li
								class="
                      grid_sorting_button
                      button
                      d-flex
                      flex-column
                      justify-content-center
                      align-items-center
                    "
								data-filter=".Skin">Skin/Toner</li>
							<li
								class="
                      grid_sorting_button
                      button
                      d-flex
                      flex-column
                      justify-content-center
                      align-items-center
                    "
								data-filter=".Lotion">Lotion</li>
							<li
								class="
                      grid_sorting_button
                      button
                      d-flex
                      flex-column
                      justify-content-center
                      align-items-center
                    "
								data-filter=".Lipstick">Lipstick</li>
								<li
								class="
                      grid_sorting_button
                      button
                      d-flex
                      flex-column
                      justify-content-center
                      align-items-center
                    "
								data-filter=".Mascara">Mascara</li>
								<li
								class="
                      grid_sorting_button
                      button
                      d-flex
                      flex-column
                      justify-content-center
                      align-items-center
                    "
								data-filter=".Handwash">Handwash</li>
								</ul>
								<ul
							class="arrivals_grid_sorting clearfix button-group filters-button-group">
								<li
								class="
                      grid_sorting_button
                      button
                      d-flex
                      flex-column
                      justify-content-center
                      align-items-center
                    "
								data-filter=".Perfume">Perfume</li>
								<li
								class="
                      grid_sorting_button
                      button
                      d-flex
                      flex-column
                      justify-content-center
                      align-items-center
                    "
								data-filter=".Shampoo">Shampoo</li>
								<li
								class="
                      grid_sorting_button
                      button
                      d-flex
                      flex-column
                      justify-content-center
                      align-items-center
                    "
								data-filter=".Hairbrush">Hairbrush</li>
								<li
								class="
                      grid_sorting_button
                      button
                      d-flex
                      flex-column
                      justify-content-center
                      align-items-center
                    "
								data-filter=".Eyebrow">Eyebrow</li>
								<li
								class="
                      grid_sorting_button
                      button
                      d-flex
                      flex-column
                      justify-content-center
                      align-items-center
                    "
								data-filter=".Sunscreen">Sunscreen</li>
						</ul>
					</div>
				</div>
			</div>
			<!-- row start  -->
			<div class="row">
				<div class="col">
					<div class="product-grid"
						data-isotope='{ "itemSelector": ".product-item", "layoutMode": "fitRows" }'>

						<!-- Product 들어가는 칸 -->
						<c:forEach items="${list }" var="pvo">
							<div class="product-item ${pvo.category }">
								<div class="product discount product_filter">
									<div class="product_image">
										<img src="${img_url }${pvo.imgfile }" alt=""/>
									</div>
									<div class="favorite favorite_left"></div>

									<div class="product_info">
										<h6 class="product_name">
											<a href="./ProductController?sign=detail&pno=${pvo.pno }">${pvo.title }</a>
										</h6>
										<div class="product_price" style="margin-top:20px">
											₩ ${pvo.price }
											<!-- 왼쪽은 할인된 가격 <span> 안은 할인하기 전 가격 -->
											<!-- $520.00<span>$590.00</span> -->
										</div>
									</div>
								</div>
								<div class="red_button add_to_cart_button">
									<a href="./ProductController?sign=detail&pno=${pvo.pno }">상품
										보기</a>
								</div>
							</div>
						</c:forEach>
						<!-- Product 들어가는 칸 END-->
					</div>
				</div>
			</div>

		</div>
	</div>
</div>
<script src="js/custom.js"></script>
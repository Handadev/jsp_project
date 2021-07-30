<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
<title>Single Product</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Colo Shop Template">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css"
	href="resource/styles/single_styles.css" />
<link rel="stylesheet" type="text/css"
	href="resource/styles/single_responsive.css" />
<!--파일질라 링크 각자 주소로 해주세요.  -->
<c:set var="img_url" value="http://ezentw.dothome.co.kr/shop/" />

<div class="super_container">

	<div class="fs_menu_overlay"></div>

	<div class="container single_product_container">
		<div class="row">
			<div class="col">

				<!-- Breadcrumbs -->

				<div class="breadcrumbs d-flex flex-row align-items-center">
					<ul>
						<li><a href="index.jsp">Home</a></li>
						<li><a href="#"><i class="fa fa-angle-right"
								aria-hidden="true"></i>${pvo.category }</a></li>
					</ul>
				</div>

			</div>
		</div>

		<div class="row">
			<div class="col-lg-7">
				<div class="single_product_pics">
					<div class="row">
						<div class="col-lg-3 thumbnails_col order-lg-1 order-2">
							<!--사이드에 작게 나오는 사진 3개-->
							<div class="single_product_thumbnails">
								<ul>
									<c:forEach items="${imgList }" var="iList">
										<li><img src="${img_url }${iList.pd_iname }" alt=""
											data-image="${img_url }${iList.pd_iname }" width="136px" height="136px"></li>
									</c:forEach>
								</ul>
							</div>
						</div>
						<div class="col-lg-9 image_col order-lg-2 order-1">
							<div class="single_product_image">
								<div class="single_product_image_background"
									style="background-image: url(${img_url }${pvo.imgfile })"></div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-lg-5">
				<div class="product_details">

					<!--상품 수정/삭제  -->
					<c:if test="${ses.grade==9 }">
						<a href="./ProductController?sign=modify&pno=${pvo.pno }"
							class="btn btn-default" id="updateBtn"> product update</a>

						<button type="button" class="btn btn-default" id="removeBtn">
							product remove</button>
					</c:if>

					<hr>
					<form action="./ProductController" method="post" id="removeForm">
						<input type="hidden" name="sign" value="remove"> <input
							type="hidden" name="pno" value="${pvo.pno }"> <input
							type="hidden" name="cartno" value="${cartvo.pno }">
					</form>
					<script src="resource/js/jquery-1.11.0.min.js"></script>
					<script>
						$("#removeBtn").on("click", function() {
							$("#removeForm").submit();
						});
					</script>
					<!--상품 수정/삭제 끝  -->

					<!-- 장바구니 -->
					<form action="CartController" method="post">
						<input type="hidden" name="sign" value="cartRegist"> <input
							type="hidden" name="pno" value="${pvo.pno }"> <input
							type="hidden" name="imgfile" value="${pvo.imgfile }"> <input
							type="hidden" name="title" value="${pvo.title }"> <input
							type="hidden" name="price" value="${pvo.price }"> <input
							type="hidden" name="mno" value="${ses.mno }">


						<div class="product_details_title">
							<h2 style="display:none">${pvo.pno }</h2>
							<h2>${pvo.title }</h2>
							<h4>${pvo.content }</h4>
						</div>
						<div
							class="free_delivery d-flex flex-row align-items-center justify-content-center">
							<span class="ti-truck"></span><span>free delivery</span>
						</div>
						<div class="original_price">${pvo.point }point</div>
						<div class="product_price">${pvo.price }won</div>
						<div
							class="quantity d-flex flex-column flex-sm-row align-items-sm-center">

							<!--디테일에서 수량을 정하는 버튼 => 장바구니, 결제화면에서 해결 -->
							<!-- <span>Quantity:</span>
							<div class="quantity_selector">
								<span class="minus"><i class="fa fa-minus"
									aria-hidden="true"></i></span> <span id="quantity_value">1</span> <span
									class="plus"><i class="fa fa-plus" aria-hidden="true"></i></span>
							</div>&nbsp;&nbsp;&nbsp; -->
							<!-- 결제화면으로  -->
							<c:choose>
								<c:when test="${cartvo.pno eq null}">
									<button type="submit" class="btn btn-danger" id="addToCart">add
										to cart</button>&nbsp;&nbsp;
							</c:when>
								<c:otherwise>
									<input type="button" class="btn btn-danger"
										value="Already added" readonly>
									&nbsp;&nbsp;
							</c:otherwise>
							</c:choose>
							<script>
								$("#addToCart").on("click", function() {
									alert("상품이 장바구니에 추가되었습니다!");
								});
							</script>
					</form>
				</div>
			</div>
		</div>
	</div>

</div>

<!-- Tabs -->

<div class="tabs_section_container">

	<div class="container">
		<div class="row">
			<div class="col">
				<div class="tabs_container">
					<ul
						class="tabs d-flex flex-sm-row flex-column align-items-left align-items-md-center justify-content-center">
						<li class="tab active" data-active-tab="tab_1"><span>Description</span></li>
						<li class="tab" data-active-tab="tab_2"><span>Q&A
								(${qnaList.size() })</span></li>
						<li class="tab" data-active-tab="tab_3"><span>Reviews
								(${revList.size() })</span></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col">

				<!-- Tab Description -->

				<div id="tab_1" class="tab_container active">
					<div class="row">
						<div class="col-lg-5 desc_col">
							<div class="tab_title">
								<h4>Description</h4>
							</div>
							<div class="tab_text_block">
								<h2>Vivamus Ullamcorper</h2>
								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
									Integer nec nibh ornare, aliquet velit vitae, tempus diam. Nunc
									sagittis posuere nibh, a mattis ligula porttitor quis. Etiam
									eget ligula sed diam gravida cursus. Donec enim magna, posuere
									at semper quis, auctor accumsan erat. Aliquam ante libero,
									bibendum sed accumsan porttitor, euismod ut est. Cras id dolor
									est. Morbi imperdiet urna odio, sed posuere odio tempus eget.</p>
							</div>
							<div class="tab_image">
								<img src="${img_url }${imgList[0].pd_iname} " alt="">
							</div>
							<div class="tab_text_block">
								<h2>Aliquam Nunc Lacus</h2>
								<p>Sed purus augue, scelerisque eget ullamcorper eu,
									pharetra posuere mi. Vivamus pellentesque mi venenatis nisi
									dignissim varius. Phasellus sed mauris eget mi luctus ultrices.
									Sed quis massa erat. Phasellus cursus cursus erat eu lacinia.
									Phasellus nec erat aliquam, laoreet mauris eu, blandit dolor.
									Ut rhoncus non lorem ac sollicitudin.</p>
							</div>
						</div>
						<div class="col-lg-5 offset-lg-2 desc_col">
							<div class="tab_image">
								<img src="${img_url }${imgList[1].pd_iname}" alt="">
							</div>
							<div class="tab_text_block">
								<h2>Mauris Lacinia</h2>
								<p>Praesent id tellus pellentesque, dapibus ex non,
									malesuada turpis. Fusce ornare ultrices est vitae facilisis.
									Morbi aliquet efficitur placerat. Nullam pharetra, lacus at
									venenatis fermentum, est erat condimentum ligula, in efficitur
									dui urna ac mauris. Lorem ipsum dolor sit amet, consectetur
									adipiscing elit. Aliquam ut metus vel purus vestibulum semper
									et nec ipsum..</p>
							</div>
							<div class="tab_image desc_last">
								<img src="${img_url }${imgList[2].pd_iname}" alt="">
							</div>
						</div>
					</div>
				</div>
				<!-- Tab Q&A -->

				<div id="tab_2" class="tab_container">
					<div class="row">
						<div class="col additional_info_col">
							<div class="tab_title additional_info_title">
								<h4>Q&A (${qnaList.size() })</h4>
							</div>
							<!-- Add Q&A -->

								<div class="col-lg-6 add_review_col">
								<c:if test="${ses.id ne null}">
									<form action="./qctrl?sign=listToReg" method="post"
										id="qna_to_form">
										<input type="hidden" name="pno" value="${pvo.pno }"> <input
											type="hidden" name="title" value="${pvo.title }"> <input
											type="hidden" name="qna_writer" value="${ses.id }">
										<div class="text-left text-sm-right">
											<button id="qna_reg_submit" type="submit"
												class="red_button review_submit_btn trans_300"
												value="Submit" style="margin-bottom: 100px;">문의 작성</button>
										</div>
									</form>
								</c:if>
							</div>
							
							<div class="table-responsive">
								<table class="table table-hover">
									<thead>
										<tr>
											<th>Category</th>
											<th>Date</th>
											<th>Writer</th>
										</tr>
									</thead>
									<tbody>
										<c:choose>
											<c:when test="${qnaList ne null && qnaList ne ''}">

												<c:forEach items="${qnaList }" var="qvo">
													<tr>
														<td><a href="./qctrl?sign=detail&qno=${qvo.qno }">${qvo.qna_category }</a>
														</td>
														<td>${qvo.qna_date }</td>
														<td>${qvo.qna_writer }</td>
													</tr>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<tr>
													<td></td>
													<td>문의가 없습니다</td>
													<td></td>
												</tr>
											</c:otherwise>
										</c:choose>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>

								<!-- Tab Reviews -->

				<div id="tab_3" class="tab_container">
					<div class="row">
						<!-- Add Review -->
						<div class="col additional_info_col">
							<div class="tab_title reviews_title">
								<h4>Reviews (${revList.size() })</h4>
							</div>
							<div class="col-lg-6 add_review_col">
								<c:if test="${ses.id ne null}">
									<div class="add_review" style="margin-bottom: 100px;">
										<form action="./rctrl?sign=regist" method="post" id="rev_form"
											enctype="multipart/form-data">
											<input type="hidden" name="pno" value="${pvo.pno }">
											<input type="hidden" name="rev_writer" value="${ses.id }">

											<h1>Add Review</h1>
											<div>
												<textarea id="rev_content" class="input_review"
													name="rev_content" placeholder="내용을 입력하세요" rows="4"
													required data-error="Please, leave us a review."
													style="margin-bottom: 10px;"></textarea>
												<input id="file" type="file" name="imgfile"
													style="margin-bottom: 10px;">
											</div>
											<div class="text-left text-sm-right">
												<button id="review_submit" type="submit"
													class="red_button review_submit_btn trans_300"
													value="Submit">submit</button>
											</div>
										</form>
									</div>
								</c:if>
							</div>
						</div>

						<!-- User Review -->
						<div class="table-responsive">
							<table class="table table-hover">
								<thead>
									<tr>
										<th>Date</th>
										<th>Writer</th>
										<th>Content</th>
										<th>Photo</th>
										<th></th>
									</tr>
								</thead>

								<c:choose>
									<c:when test="${revList ne null && revList ne ''}">
										<tbody>
											<c:forEach items="${revList }" var="rvo">
												<tr>
													<td>${rvo.rev_date }</td>
													<td>${rvo.rev_writer }</td>
													<td>${rvo.rev_content }</td>
													<div class="user">
														<c:if test="${rvo.rev_imglist.size() > 0}">
															<c:forEach items="${rvo.rev_imglist }" var="rivo">
																<td><img src=" ${img_url }${rivo.rev_iname }"
																	style="width: 300px;"></td>
															</c:forEach>
														</c:if>
													</div>
													<td><c:if
															test="${ses.grade==9 || ses.id eq rvo.rev_writer}">
															<div>
																<a
																	href="./rctrl?sign=modify&rno=${rvo.rno }&pno=${pvo.pno}">수정</a>&nbsp;&nbsp;
																<a
																	href="./rctrl?sign=remove&rno=${rvo.rno }&pno=${pvo.pno}">삭제</a>&nbsp;&nbsp;
															</div>
														</c:if></td>
												</tr>
											</c:forEach>
										</tbody>
									</c:when>
									<c:otherwise>
									</c:otherwise>
								</c:choose>
							</table>
						</div>



						<%-- <c:choose>
									<c:when test="${revList ne null && revList ne ''}">
										<c:forEach items="${revList }" var="rvo">
											<div
												class="user_review_container d-flex flex-column flex-sm-row">
												<div class="review">
													<div class="review_date">${rvo.rev_date }</div>
													<div class="user_name">${rvo.rev_writer }</div>
													<p>${rvo.rev_content }</p>
												</div>
												<div class="user">
													<c:if test="${rvo.rev_imglist.size() > 0}">
														<c:forEach items="${rvo.rev_imglist }" var="rivo">
															<div style="margin-left: 50px;">
																<img src=" ${img_url }${rivo.rev_iname }"
																	style="width: 50%;">
															</div>
														</c:forEach>
													</c:if>
												</div>

												<c:if test="${ses.grade==9 || ses.id eq rvo.rev_writer}">
													<div>
														<a
															href="./rctrl?sign=modify&rno=${rvo.rno }&pno=${pvo.pno}">수정</a>&nbsp;&nbsp;
														<a
															href="./rctrl?sign=remove&rno=${rvo.rno }&pno=${pvo.pno}">삭제</a>&nbsp;&nbsp;
													</div>
												</c:if>
											</div>

										</c:forEach>
									</c:when>
									<c:otherwise>
										<h3>리뷰가 없습니다</h3>
									</c:otherwise>
								</c:choose> --%>
					</div>
				</div>
			</div>
		</div>

	</div>
</div>

<script src="resource/js/jquery-3.2.1.min.js"></script>
<script src="resource/styles/bootstrap4/popper.js"></script>
<script src="resource/styles/bootstrap4/bootstrap.min.js"></script>
<script src="resource/plugins/Isotope/isotope.pkgd.min.js"></script>
<script src="resource/plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
<script src="resource/plugins/easing/easing.js"></script>
<script src="resource/plugins/jquery-ui-1.12.1.custom/jquery-ui.js"></script>
<script src="resource/js/single_custom.js"></script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<link rel="stylesheet" type="text/css" href="resource/styles/categories_styles.css">
<link rel="stylesheet" type="text/css" href="resource/styles/categories_responsive.css">
<script src="resource/js/categories_custom.js"></script>
<!--파일질라 계정추가 입니다. 주소 확인해주세요  -->
<c:set var="img_url" value="http://hustle.dothome.co.kr/shop/" />

<div class="container product_section_container">
	<div class="row">
		<!-- Main Content -->
		<div class="main_content">
			<hr>
			<h3>My Cart</h3>  <h3><a href="./CartController?sign=payList&mno=${ses.mno }"><button type="button" class="btn btn-danger">To Pay</button></a>
			</h3>

			<!-- Products -->

			<div class="products_iso">
				<div class="row">
					<div class="col">

						<!-- Product Grid -->
						<div class="product-grid">
							 <c:forEach items="${list }" var="cartvo">
                        <c:if test="${ses.mno == cartvo.mno }">
                           <div class="product-item men">
                              <div class="product discount product_filter">
                                 <div class="product_image" style="width:220px; height:220px; ">
                                    <img src="${img_url }${cartvo.imgfile }">
                                 </div>
                                 <div class="favorite favorite_left"></div>
                                 <div class="product_info">
                                    <h6 class="product_name">
                                     <a href="./ProductController?sign=detail&pno=${cartvo.pno }"> ${cartvo.title }</a>
                                      
                                    </h6>
                                    <div class="product_price">₩ ${cartvo.price }</div>
                                    <div>
                                       <button type="button" onclick="minusQuantity(this)"
                                          style="background-color: white; border: 0px solid black;">
                                          <i class="fa fa-minus" aria-hidden="true"></i>
                                       </button>
                                       &nbsp;&nbsp;<span>${cartvo.quantity }</span>&nbsp;&nbsp;
                                       <button type="button" onclick="plusQuantity(this)"
                                          style="background-color: white; border: 0px solid black;">
                                          <i class="fa fa-plus" aria-hidden="true"></i>
                                       </button>
                                    </div>
                                    <!-- cartno, pno 체킹-->
                                    <span style="display: none">${cartvo.cartno}</span><br> <span
                                       style="display: none">pno : ${cartvo.pno}</span>
                                    <button type="button" class="btn btn-danger btn-sm"
                                       onclick="removeCart(this)" style="width:100%;">삭제</button>
                                    <%-- <div class="red_button add_to_cart_button" style="margin-top:10px">
                                       <a href="./ProductController?sign=detail&pno=${cartvo.pno }">상품보기</a>
                                    </div> --%>
                                 </div>
                              </div>
                              <!-- <hr> -->
                           </div>
                        </c:if>
                     </c:forEach>
							<form action="./CartController" method="post" id="removeForm">
								<input type="hidden" name="sign" value="cartRemove"> <input
									type="hidden" name="cartno">
									<input type="hidden" name="mno" value="${ses.mno }">
							</form>
							<script src="resource/js/jquery-3.2.1.min.js"></script>
							<script>
                        function removeCart(button) {
                           let cartno = $(button).closest("div").children("span").eq(0).text();
                           console.log("cartno : " + cartno);
                           console.log("typeof cartno : " + typeof cartno);
                           $("input[name=cartno]").val(cartno);
                           $("#removeForm").submit();
                        };
                        // tbl_cart quantity 증감처리부분
                        // 증가
                       function plusQuantity(button) {
									let cartno = $(button).closest("div").parent("div").children("span").eq(0).text();
									let numObj= $(button).closest("div").find("span");
                                    let quantity = numObj.text();
                                    quantity = parseInt(quantity)+1;
                                    numObj.text(quantity);
									$.ajax({
										url: "./CartController",
										type: "post",
										data: {
											sign: "quantityIncrement",
											cartno: cartno
										}
									}).done(function(button) {
										location.reload();
									});
								};
								// 감소
								function minusQuantity(button) {
									let cartno = $(button).closest("div").parent("div").children("span").eq(0).text();
									let numObj= $(button).closest("div").find("span");
                                    let quantity = numObj.text();
                                    quantity = parseInt(quantity)-1;
                                    numObj.text(quantity);
									$.ajax({
										url: "./CartController",
										type: "post",
										data: {
											sign: "quantityDecrement",
											cartno: cartno
										}
									}).done(function(button) {
										location.reload();
									});
								};
                     </script>
						</div>
					</div>
				</div>
			</div>
	</div>
</div>
<br><br><br>
		<c:set var="sum" value="0" />
			<c:forEach items="${list }" var="cartvo">
				<c:if test="${ses.mno == cartvo.mno }">
					<c:set var="sum" value="${sum + (cartvo.price*cartvo.quantity) }" />
				</c:if>
			</c:forEach>
			<c:choose>
				<c:when test="${sum > 0}">
					<h4 style="color: red; margin-top:5 0px">
						결제할 금액 : ₩
						<c:out value="${sum }" />
					</h4>
				</c:when>
				<c:otherwise>
					<h4>장바구니에 등록된 상품이 없습니다.</h4>
				</c:otherwise>
			</c:choose>
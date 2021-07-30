<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<link rel="alternate" type="application/json+oembed"
	href="https://www.jotform.com/oembed/?format=json&amp;url=https%3A%2F%2Fform.jotform.com%2F211651556502450"
	title="oEmbed Form">
<link rel="alternate" type="text/xml+oembed"
	href="https://www.jotform.com/oembed/?format=xml&amp;url=https%3A%2F%2Fform.jotform.com%2F211651556502450"
	title="oEmbed Form">
<link rel="shortcut icon" href="https://cdn.jotfor.ms/favicon.ico">
<link rel="canonical" href="https://form.jotform.com/211651556502450" />
<title>Product Purchase Order Form</title>
<link type="text/css" media="print" rel="stylesheet"
	href="https://cdn.jotfor.ms/css/printForm.css?3.3.25893" />
<link type="text/css" rel="stylesheet"
	href="https://cdn.jotfor.ms/themes/CSS/5e6b428acc8c4e222d1beb91.css?themeRevisionID=5f30e2a790832f3e96009402" />
<link type="text/css" rel="stylesheet"
	href="https://cdn.jotfor.ms/css/styles/payment/payment_styles.css?3.3.25893" />
<link type="text/css" rel="stylesheet"
	href="https://cdn.jotfor.ms/css/styles/payment/payment_feature.css?3.3.25893" />
<link type="text/css" rel="stylesheet" href="./css/bootstrap.min.css" />
<style type="text/css" id="form-designer-style">
/* Injected CSS Code */
.form-label.form-label-auto {
	display: block;
	float: none;
	text-align: left;
	width: 100%;
}

body {
	margin-top: 85px;
}
/* Injected CSS Code */
</style>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/punycode/1.4.1/punycode.min.js"></script>
<script src="https://cdn.jotfor.ms/static/prototype.forms.js"
	type="text/javascript"></script>
<script src="https://cdn.jotfor.ms/static/jotform.forms.js?3.3.25893"
	type="text/javascript"></script>
<script type="text/javascript">
	JotForm.init(function() {
		productID = {
			"0" : "input_3_1004",
			"1" : "input_3_1005",
			"2" : "input_3_1006"
		};
		paymentType = "product";
		JotForm.setCurrencyFormat('USD', true, 'point');
		JotForm.totalCounter({
			"input_3_1004" : {
				"price" : "5"
			},
			"input_3_1005" : {
				"price" : "7"
			},
			"input_3_1006" : {
				"price" : "9"
			}
		});
		$$('.form-product-custom_quantity').each(
				function(el, i) {
					el.observe('blur', function() {
						isNaN(this.value) || this.value < 1 ? this.value = '0'
								: this.value = parseInt(this.value)
					})
				});
		$$('.form-product-custom_quantity').each(function(el, i) {
			el.observe('focus', function() {
				this.value == 0 ? this.value = '' : this.value
			})
		});
		JotForm.handleProductLightbox();
		JotForm.newDefaultTheme = true;
		JotForm.extendsNewTheme = false;
		JotForm.newPaymentUIForNewCreatedForms = false;
		JotForm.newPaymentUI = true;
		/*INIT-END*/
	});

	JotForm.prepareCalculationsOnTheFly([ null, {
		"name" : "clickTo",
		"qid" : "1",
		"text" : "Purchase Order",
		"type" : "control_head"
	}, {
		"name" : "submit",
		"qid" : "2",
		"text" : "Submit",
		"type" : "control_button"
	}, {
		"name" : "myProducts3",
		"qid" : "3",
		"text" : "My Products",
		"type" : "control_payment"
	}, {
		"name" : "yourName",
		"qid" : "4",
		"text" : "Your Name",
		"type" : "control_fullname"
	}, {
		"name" : "yourEmail",
		"qid" : "5",
		"subLabel" : "example@example.com",
		"text" : "Your E-mail",
		"type" : "control_email"
	}, {
		"name" : "shippingAddress",
		"qid" : "6",
		"text" : "Shipping Address",
		"type" : "control_address"
	} ]);
	setTimeout(function() {
		JotForm.paymentExtrasOnTheFly([ null, {
			"name" : "clickTo",
			"qid" : "1",
			"text" : "Purchase Order",
			"type" : "control_`"
		}, {
			"name" : "submit",
			"qid" : "2",
			"text" : "Submit",
			"type" : "control_button"
		}, {
			"name" : "myProducts3",
			"qid" : "3",
			"text" : "My Products",
			"type" : "control_payment"
		}, {
			"name" : "yourName",
			"qid" : "4",
			"text" : "Your Name",
			"type" : "control_fullname"
		}, {
			"name" : "yourEmail",
			"qid" : "5",
			"subLabel" : "example@example.com",
			"text" : "Your E-mail",
			"type" : "control_email"
		}, {
			"name" : "shippingAddress",
			"qid" : "6",
			"text" : "Shipping Address",
			"type" : "control_address"
		} ]);
	}, 20);
</script>

<div role="main" class="form-all">
	<style>
.form-all:before {
	background: none;
}
</style>
	<ul class="form-section page-section">
		<li id="cid_1" class="form-input-wide" data-type="control_head">
			<div class="form-header-group  header-large">
				<div class="header-text httal htvam">
					<!-- 주문/결제  -->
					<h1 id="header_1" class="form-header" data-component="header">
						주문/결제</h1>
				</div>
			</div>
		</li>

		<!-- 구매자 정보 -->
		<li class="form-line" data-type="control_fullname" id="id_4"><label
			class="form-label form-label-top" id="label_3" for="input_3">
				<h5>
					<b>구매자 정보</b>
				</h5>
		</label> <label class="form-label form-label-left" id="label_4" for="first_4">
				이름 </label>
			<div id="cid_4" class="form-input" data-layout="full">
				<div data-wrapper-react="true">
					<span class="form-sub-label-container" style="vertical-align: top"
						data-input-type="first"> <input type="text" id="first_4"
						name="q4_yourName[first]" class="form-textbox" size="10"
						value="${ses.name }" readonly
						aria-labelledby="label_4 sublabel_4_first" />
					</span>
				</div>
			</div></li>
		<li class="form-line" id="id_5"><label
			class="form-label form-label-left" id="label_5" for="input_5">
				연락처 </label>
			<div id="cid_5" class="form-input" data-layout="half">
				<span class="form-sub-label-container" style="vertical-align: top">
					<input type="number" id="input_5" name="q5_yourEmail"
					class="form-textbox validate[Email]" style="width: 310px"
					size="310" value="${ses.phonenumber }"
					aria-labelledby="label_5 sublabel_input_5" /> <!-- <label class="form-sub-label" for="input_5" id="sublabel_input_5" style="min-height:13px" aria-hidden="false"> example@example.com </label> -->
				</span>
			</div></li>
		<li class="form-line" id="id_5"><label
			class="form-label form-label-left" id="label_5" for="input_5">
				주소 </label>
			<div id="cid_5" class="form-input" data-layout="half">
				<span class="form-sub-label-container" style="vertical-align: top">
					<input type="text" id="input_5" name="q5_yourEmail"
					class="form-textbox validate[Email]" style="width: 310px"
					size="310" value="${ses.address }"
					aria-labelledby="label_5 sublabel_input_5" /> <!-- <label class="form-sub-label" for="input_5" id="sublabel_input_5" style="min-height:13px" aria-hidden="false"> example@example.com </label> -->
				</span>
			</div></li>
		<li class="form-line" data-type="control_address" id="id_6"><label
			class="form-label form-label-left" id="label_6"
			for="input_6_addr_line1"> 배송 요청사항 </label>
			<div id="cid_6" class="form-input" data-layout="full">
				<div summary="" class="form-address-table jsTest-addressField">
					<div
						class="form-address-line-wrapper jsTest-address-line-wrapperField">
						<span
							class="form-address-line form-address-street-line jsTest-address-lineField">
							<span class="form-sub-label-container"
							style="vertical-align: top"> <input type="text"
								id="input_6_addr_line1" name="q6_shippingAddress[addr_line1]"
								class="form-textbox form-address-line" value=""
								data-component="address_line_1"
								aria-labelledby="label_6 sublabel_6_addr_line1" /> <label
								class="form-sub-label" for="input_6_addr_line1"
								id="sublabel_6_addr_line1" style="min-height: 13px"
								aria-hidden="false"> </label>
						</span>
						</span>
					</div>
				</div>
			</div></li>
		<!-- 구매자 정보 끝 => 상품목록 시작 -->
		<!-- 결제할 상품 목록 -->
		<li class="form-line" data-type="control_payment" id="id_3"
			data-payment="true"><label class="form-label form-label-top"
			id="label_3" for="input_3">
				<h5>
					<b>주문 내역</b>
				</h5>
		</label>
			<div id="cid_3" class="form-input-wide" data-layout="full">
				<div data-wrapper-react="true" class="product-container-wrapper">
					<div class="filter-container"></div>
					<input type="hidden" name="simple_fpc" data-payment_type="payment"
						data-component="payment1" value="3" /> <input type="hidden"
						name="payment_total_checksum" id="payment_total_checksum"
						data-component="payment2" />
					<div data-wrapper-react="true">

						<c:forEach items="${payList }" var="payList">
							<span class="form-product-item new_ui"
								categories="non-categorized" pid="1004">
								<div data-wrapper-react="true"
									class="form-product-item-detail new_ui">
									<div class="p_col"></div>
									<div class="p_image">
										<div class="image_area null"
											style="background-image: url(&amp;quot;null&amp;quot;)">
											<div class="image_zoom"></div>
										</div>
									</div>
									<div for="input_3_1004" class="form-product-container">
										<span data-wrapper-react="true">
											<div class="title_description">
												<span class="form-product-name"
													id="product-name-input_3_1004">${payList.title }</span>
												<input type="hidden" name="mno" id="payMno" value="${ses.mno }">
												<span class="form-product-description"
													id="product-name-description-input_3_1004"> </span>
											</div> <span class="form-product-details"> <b> <span
													data-wrapper-react="true"> ₩ <span
														id="input_3_1004_price">${payList.price } / 수량 :
															${payList.quantity }</span>
												</span>
											</b>
										</span>
										</span>
									</div>
								</div>
							</span>
						</c:forEach>
						<!-- 상품 목록 끝 -->
						<div class="payment_footer new_ui ">
							<div class="total_area">
								<div class="form-payment-total">
									<div id="total-text" style="width: 200px;">쿠폰 선택</div>
									<div class="form-payment-price">
										<select class="form-dropdown" id="category" name="category"
												style="width: 200px" data-component="dropdown">
											<option>&nbsp---------------</option>
											<c:forEach items="${userCoupon }" var="cp">
												<option value="${cp.cpno }">&nbsp${cp.cp_name } / ${cp.cp_discount }%</option>
											</c:forEach>
										</select>
									</div>
								</div>
							</div>
						</div>


						<!-- 총 결제 금액  -->
						<!--  -->
                     <c:set var="sum" value="0" />
                     <c:forEach items="${payList }" var="payList">
                        <c:set var="sum"
                           value="${sum + (payList.price*payList.quantity) }" />
                     </c:forEach>
                      <h5 id="total" align="right"><b>총 결제금액 : ₩ <c:out value="${sum }" /></b></h5>
                     
						<span class="form-product-item new_ui"
							categories="non-categorized" pid="1004">
							<div data-wrapper-react="true"
								class="form-product-item-detail new_ui">
								<div class="p_col"></div>
								<div class="p_image">
									<div class="image_area null"
										style="background-image: url(&amp;quot;null&amp;quot;)">
										<div class="image_zoom"></div>
									</div>
								</div>
							</div>
						</span>
					</div>
				</div>
			</div></li>
		<!-- 결제 목록 시작-->
		<li class="form-line" data-type="control_button" id="id_2">
			<div id="cid_2" class="form-input-wide" data-layout="full">
				<div data-align="auto"
					class="form-buttons-wrapper form-buttons-auto   jsTest-button-wrapperField">
					<button id="paymentBtn" type="button" onclick="payment()"
						class="form-submit-button submit-button jf-form-buttons jsTest-submitField"
						data-component="button">
						결제하기 </a>
					</button>
				</div>
				<script src="resource/js/jquery-3.2.1.min.js"></script>
				<script>
					/* 쿠폰 선택 function cpno 받아옴*/
					let cpno = "";
					let totaltext = $("#total").text();
					let total_price = parseInt(totaltext.substr(11));
					let real_total = parseInt(totaltext.substr(11));
					$("#category").change(function() {
						
						cpno = $(this).val();
						console.log("cpno - " + cpno);
						
						let index = $("#category option").index($("#category option:selected"));
						
						let discount_text = $("#category option:eq("+index+")").text();
						let discount = discount_text.substr(discount_text.indexOf("/")+2);
						console.log("discount - " + discount);
						
						
						console.log("total_price - " + typeof total_price);
						console.log("total_price - " + total_price);

						let text = "총 결제금액 : ₩ "
						real_total = (total_price - ((total_price / 100) * parseInt(discount)));
						console.log("real_total - " + real_total);
						$("#total").text(text+real_total);
					});
				
					/* payList.title 을 string으로 바꿔서 orderlist에 던짐. 주문한 제품이름을 저장할 수 있게됨*/
					function payment() {
						let product_name_list = new Array();
						<c:forEach items="${payList }" var="payList">
						product_name_list.push("${payList.title }");
						</c:forEach>
						
						let totaltext = $("h5[id=total]").text();
						let total_price = totaltext.substr(11);
						let product_name = product_name_list.toString();
						let mno = $("#payMno").val(); 
						console.log("real_total2 - " + real_total);
				 	 	 	 $.ajax({
							url : "./CartController",
							type : "post",
							data : {
								sign : "payRemove",
								mno : mno,
								cpno : cpno,
								productName : product_name,
								totalPrice : real_total
							}
						}).done(function() {
							alert("주문이 완료되었습니다.");
							$(location).attr("href", "index.jsp?view=success");
						});  
						console.log("mno : " + mno); 
 					};
				</script>
			</div>
		</li>
		<li style="display: none">Should be Empty: <input type="text"
			name="website" value="" />
		</li>
	</ul>
</div>
<script>
	JotForm.showJotFormPowered = "new_footer";
</script>
<script>
	JotForm.poweredByText = "Powered by JotForm";
</script>
<input type="hidden" class="simple_spc" id="simple_spc"
	name="simple_spc" value="211651556502450" />
<script type="text/javascript">
	var all_spc = document.querySelectorAll("form[id='211651556502450'] .si"
			+ "mple" + "_spc");
	for (var i = 0; i < all_spc.length; i++) {
		all_spc[i].value = "211651556502450-211651556502450";
	}
</script>
<div class="formFooter-heightMask"></div>
<div class="formFooter f6">
	<div class="formFooter-wrapper formFooter-leftSide">
		<a
			href="https://www.jotform.com/?utm_source=formfooter&utm_medium=banner&utm_term=211651556502450&utm_content=jotform_logo&utm_campaign=powered_by_jotform_le"
			target="_blank" class="formFooter-logoLink"><img
			class="formFooter-logo"
			src="https://cdn.jotfor.ms/assets/img/logo/logo-new@1x.png"
			alt="Jotform Logo"></a>
	</div>
	<div class="formFooter-wrapper formFooter-rightSide">
		<span class="formFooter-text"> Now create your own JotForm -
			It's free! </span> <a class="formFooter-button"
			href="https://www.jotform.com/?utm_source=formfooter&utm_medium=banner&utm_term=211651556502450&utm_content=jotform_button&utm_campaign=powered_by_jotform_le"
			target="_blank">Create your own JotForm</a>
	</div>
</div>

<script type="text/javascript">
	JotForm.ownerView = true;
</script>
<script
	src="https://cdn.jotfor.ms//js/vendor/smoothscroll.min.js?v=3.3.25893"></script>
<script src="https://cdn.jotfor.ms//js/errorNavigation.js?v=3.3.25893"></script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Colo Shop Template">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css"
	href="resource/styles/single_styles.css" />
<link rel="stylesheet" type="text/css"
	href="resource/styles/single_responsive.css" />
<!--파일질라 링크 각자 주소로 해주세요.  -->
<c:set var="img_url" value="http://hustle.dothome.co.kr/shop/" />
<c:set var="myRevList" value="${myRevList }" />
<c:set var="revImgList" value="${revImgList2 }" />

<div class="tabs_section_container">
	<div class="container">
	
		<%-- <div class="row">
			<div class="col">
				<div class="tabs_container" style="margin-top: 200px;">
					<ul
						class="tabs d-flex flex-sm-row flex-column align-items-left align-items-md-center justify-content-center">
						<li class="tab" data-active-tab="tab_2"><span>Reviews
								(${myRevList.size() })</span></li>
					</ul>
				</div>
			</div>
		</div> --%>
		<div class="row" style="margin-top: 200px;">
			<div class="col">
				<!-- <div id="tab_2" class="tab_container">
					<div class="row">
						User Reviews
						<div class="col-lg-6 reviews_col">
							<div class="tab_title reviews_title"> -->
				<div>
					<h4>My Reviews</h4>
				</div>
				<!-- </div> -->

				<c:choose>
					<c:when test="${myRevList ne null && myRevList ne ''}">
						<div class="table-responsive">
							<table class="table table-hover">
								<thead>
									<tr>
										<th>상품</th>
										<th>가격</th>
										<th>날짜</th>
										<th>내용</th>
										<th>사진</th>
										<th></th>
									</tr>
								</thead>
								<c:forEach items="${myRevList }" var="rmvo">
									<tbody>
										<tr>
											<td>${rmvo.title }</td>
											<td>${rmvo.price }</td>
											<td>${rmvo.rev_date }</td>
											<td><p>${rmvo.rev_content }</p></td>
											<td><c:if
													test="${revImgList ne null && revImgList ne ''}">
													<c:forEach items="${revImgList }" var="rivo">
														<c:set var="rno" value="${rmvo.rno }" />
														<c:set var="rno2" value="${rivo.rno }" />
														<c:if test="${rno eq rno2 }">
															<div>
																<img src=" ${img_url }${rivo.rev_iname }"
																	style="width: 200px;">
															</div>
														</c:if>
													</c:forEach>
												</c:if></td>
											<td><a href="./rctrl?sign=myModify&rno=${rmvo.rno }&rev_writer=${ses.id}">수정</a>&nbsp;&nbsp;
												<a href="./rctrl?sign=myRemove&rno=${rmvo.rno }&rev_writer=${ses.id}">삭제</a>&nbsp;&nbsp;</td>
										</tr>
									</tbody>
								</c:forEach>
							</table>
						</div>
					</c:when>
					<c:otherwise>
						<h3>작성한 리뷰가 없습니다</h3>
					</c:otherwise>
				</c:choose>

			</div>
		</div>
		<script src="../resource/js/jquery-3.2.1.min.js"></script>
	</div>
</div>
<!-- </div>
</div>
</div> -->



<script src="resource/js/jquery-3.2.1.min.js"></script>
<script src="resource/styles/bootstrap4/popper.js"></script>
<script src="resource/styles/bootstrap4/bootstrap.min.js"></script>
<script src="resource/plugins/Isotope/isotope.pkgd.min.js"></script>
<script src="resource/plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
<script src="resource/plugins/easing/easing.js"></script>
<script src="resource/plugins/jquery-ui-1.12.1.custom/jquery-ui.js"></script>
<script src="resource/js/single_custom.js"></script>
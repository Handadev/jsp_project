<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="img_url" value="http://hustle.dothome.co.kr/shop/" />
<c:set var="revList" value="${revList }" />
<c:set var="revImgList" value="${revImgList }" />

<div id="tab_3" class="tab_container">
	<div class="row">
		<!-- User Reviews -->
		<div class="col-lg-6 reviews_col">
			<div class="tab_title reviews_title">
				<h4 style="margin-top: 200px;">Reviews</h4>
			</div>
			<!-- User Review -->
			<div class="user_review_container d-flex flex-column flex-sm-row">
				<c:choose>
					<c:when test="${revList ne null && revList ne ''}">
						<c:forEach items="${revList }" var="rvo">
							<div class="review">
								<div class="review_date">${rvo.rev_date }</div>
								<div class="user_name">${rvo.rev_writer }</div>
								<p>${rvo.rev_content }</p>
							</div>
							<div>
								<c:if test="${revImgList ne null && revImgList ne ''}">
									<c:forEach items="${revImgList }" var="rivo">
										<c:set var="rno" value="${rvo.rno }" />
										<c:set var="rno2" value="${rivo.rno }" />
										<c:if test="${rno eq rno2 }">
											<div>
												<img src=" ${img_url }${rivo.rev_iname }"
													style="width: 50%;">
											</div>
										</c:if>
									</c:forEach>
								</c:if>
							</div>
							<div>
								<a href="./rctrl?sign=modify&rno=${rvo.rno }">수정</a>&nbsp;&nbsp;
								<a href="./rctrl?sign=remove&rno=${rvo.rno }">삭제</a>&nbsp;&nbsp;
							</div>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<h3>리뷰가 없습니다</h3>
					</c:otherwise>
				</c:choose>

			</div>
		</div>
		<script src="../resource/js/jquery-3.2.1.min.js"></script>
	</div>
</div>
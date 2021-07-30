<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="img_url" value="http://hustle.dothome.co.kr/shop/" />

<div class="container">
	<div class="col-md-9">
		<h3 style="margin-top: 200px;">Q&A</h3>
		<div class="add_review">
			<div class="table-responsive">
				<table class="table">
					<tr>
						<td style="width: 150px;'">카테고리</td>
						<td>${qvo.qna_category}</td>
					</tr>
					<tr>
						<td>날짜</td>
						<td>${qvo.qna_date }</td>
					</tr>
					<tr>
						<td>작성자</td>
						<td>${qvo.qna_writer }</td>
					</tr>
					<tr>
						<td>내용</td>
						<td>${qvo.qna_content }</td>
					</tr>
					<c:set var="imgList" value="${imgList }" />
					<c:choose>
						<c:when test="${imgList ne null && imgList ne ''}">
							<c:forEach items="${imgList }" var="qivo">
								<tr>
									<td></td>
									<td><img src=" ${img_url }
										${qivo.qna_iname }"
										style="width: 50%;"></td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
						</c:otherwise>
					</c:choose>
					<tr>
						<td><a href="./qctrl?sign=modify&qno=${qvo.qno }">수정</a>&nbsp;&nbsp;

							<c:if test="${ses.grade==9 || ses.id eq qvo.qna_writer}">
								<a href="./qctrl?sign=remove&qno=${qvo.qno }&pno=${qvo.pno}">삭제</a>&nbsp;&nbsp;
						</c:if> <%-- <c:if test="${ses.id eq qvo.qna_writer }">
								<a href="./qctrl?sign=remove&qno=${qvo.qno }&pno=${qvo.pno}">삭제</a>&nbsp;&nbsp;
							</c:if> --%> <a
							href="./ProductController?sign=detail&pno=${qvo.pno }">목록</a></td>
						<td></td>
					</tr>

				</table>

				<script src="../resource/js/jquery-3.2.1.min.js"></script>
			</div>
		</div>
	</div>
	<!-- /.col-md-9 -->
</div>
<!-- /.container -->

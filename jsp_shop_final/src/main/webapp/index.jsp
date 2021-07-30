<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:catch>
	<c:choose>
		<c:when test="${param.view==null || param.view=='' }">
			<c:set var="loaded" value="home.jsp" />
		</c:when>
		<c:when test="${param.view.equals('login') }">
			<c:set var="loaded" value="user/login.jsp" />
		</c:when>
		<c:when test="${param.view.equals('regist') }">
			<c:set var="loaded" value="user/regist.jsp" />
		</c:when>
		<c:when test="${param.view.equals('admin') }">
			<c:set var="loaded" value="user/adminMenu.jsp" />
		</c:when>
		<c:when test="${param.view.equals('user') }">
			<c:set var="loaded" value="user/userMenu.jsp" />
		</c:when>
		<c:when test="${param.view.equals('adUpdate') }">
			<c:set var="loaded" value="user/adUpdate.jsp" />
		</c:when>
		<c:when test="${param.view.equals('userOrderList') }">
			<c:set var="loaded" value="user/userOrderList.jsp" />
		</c:when>


		<c:when test="${param.view.equals('userCouponList') }">
			<c:set var="loaded" value="user/userCouponList.jsp" />
		</c:when>
		<c:when test="${param.view.equals('couponRegist') }">
			<c:set var="loaded" value="coupon/regist.jsp" />
		</c:when>
		<c:when test="${param.view.equals('couponList') }">
			<c:set var="loaded" value="coupon/list.jsp" />
		</c:when>
		<c:when test="${param.view.equals('couponModify') }">
			<c:set var="loaded" value="coupon/modify.jsp" />
		</c:when>
		<c:when test="${param.view.equals('couponApply') }">
			<c:set var="loaded" value="coupon/apply.jsp" />
		</c:when>


		<c:when test="${param.view.equals('search') }">
			<c:set var="loaded" value="product/searchResult.jsp" />
		</c:when>
		
		
		<c:when test="${param.view.equals('qreg') }">
         <c:set var="loaded" value="qna/regist.jsp" />
      </c:when>
      <c:when test="${param.view.equals('qlist') }">
         <c:set var="loaded" value="qna/list.jsp" />
      </c:when>
      <c:when test="${param.view.equals('qdetail') }">
         <c:set var="loaded" value="qna/detail.jsp" />
      </c:when>
      <c:when test="${param.view.equals('qpwd') }">
         <c:set var="loaded" value="qna/password.jsp" />
      </c:when>
      <c:when test="${param.view.equals('qfail') }">
         <c:set var="loaded" value="qna/qfail.jsp" />
      </c:when>
      <c:when test="${param.view.equals('qmod') }">
         <c:set var="loaded" value="qna/modify.jsp" />
      </c:when>



		<c:when test="${param.view.equals('rreg') }">
			<c:set var="loaded" value="review/regist.jsp" />
		</c:when>
		<c:when test="${param.view.equals('rlist') }">
			<c:set var="loaded" value="review/list.jsp" />
		</c:when>
		<c:when test="${param.view.equals('rmod') }">
			<c:set var="loaded" value="review/modify.jsp" />
		</c:when>
		<c:when test="${param.view.equals('rmlist') }">
			<c:set var="loaded" value="review/mylist.jsp" />
		</c:when>
		<c:when test="${param.view.equals('rmymod') }">
			<c:set var="loaded" value="review/mymodify.jsp" />
		</c:when>


		<c:when test="${param.view.equals('preg') }">
			<c:set var="loaded" value="product/register.jsp" />
		</c:when>
		<c:when test="${param.view.equals('plist') }">
			<c:set var="loaded" value="product/list.jsp" />
		</c:when>
		<c:when test="${param.view.equals('pdetail') }">
			<c:set var="loaded" value="product/detail.jsp" />
		</c:when>
		<c:when test="${param.view.equals('pmodify') }">
			<c:set var="loaded" value="product/modify.jsp" />
		</c:when>
		<c:when test="${param.view.equals('search') }">
			<c:set var="loaded" value="product/searchResult.jsp" />
		</c:when>


		<c:when test="${param.view.equals('clist') }">
			<c:set var="loaded" value="cart/cartList.jsp" />
		</c:when>
		<c:when test="${param.view.equals('payList') }">
			<c:set var="loaded" value="cart/payment.jsp" />
		</c:when>
		<c:when test="${param.view.equals('success') }">
			<c:set var="loaded" value="cart/success.jsp" />
		</c:when>


	</c:choose>
</c:catch>

<jsp:include page="navTop.jsp"></jsp:include>
<jsp:include page="navMain.jsp"></jsp:include>
<jsp:include page="${loaded }"></jsp:include>
<jsp:include page="footer.jsp"></jsp:include>
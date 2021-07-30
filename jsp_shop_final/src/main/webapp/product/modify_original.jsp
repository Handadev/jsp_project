<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.chicor.com/static/pui/css/sub.css?ver=20210603030140">
</head>
<body>
	<div>
		<main id="contents" class="wrapper-sub">
			<div class="section wrapper-customer">

				<h1 class="title">상품정보 수정</h1>

				<div class="wrap-aside">
					<div class="aside aside-customer"></div>
					<div class="contents">
						<div class="wrapper-question">
							<form
								action="./ProductController?sign=modifySave&pno=${pvoModify.pno }"
								method="post" enctype="multipart/form-data">
								<%-- <input type="hidden" name="sign" value="modifySave">
								<input type="hidden" name="pno" value="${pvoModify.pno }"> --%>
								<!-- <input type="hidden" name="sign" value="regist"> -->
								<h2 class="title"></h2>
								<table class="common-tbl">
									<colgroup>
										<col style="width: 165px;">
										<col style="width: auto;">
									</colgroup>
									<tbody>
										<tr>
											<th scope="row">카테고리<i class="required"></i></th>
											<td class="input-padding1"><select class="select"
												id="category" name="category">
													<option value="스킨/토너"
														${pvoModify.category.equals('스킨/토너') ? 'selected' : '' }>스킨/토너</option>
													<option value="로션"
														${pvoModify.category.equals('로션') ? 'selected' : '' }>로션</option>
													<option value="에센스/세럼"
														${pvoModify.category.equals('에센스/세럼') ? 'selected' : '' }>에센스/세럼</option>
													<option value="크림/젤/밤"
														${pvoModify.category.equals('크림/젤/밤') ? 'selected' : '' }>크림/젤/밤</option>
													<option value="아이케어"
														${pvoModify.category.equals('아이케어') ? 'selected' : '' }>아이케어</option>
													<option value="상품/기타"
														${pvoModify.category.equals('상품/기타') ? 'selected' : '' }>상품/기타</option>
											</select></td>
										</tr>
										<tr id="shopList">
											<th scope="row">브랜드<i class="required"></i></th>
											<td class="input-padding1"><select
												class="select order-select" id="shop" name="brand">
													<option value="디오디너리"
														${pvoModify.category.equals('디오디너리') ? 'selected' : '' }>디오디너리</option>
													<option value="파뮤"
														${pvoModify.category.equals('파뮤') ? 'selected' : '' }>파뮤</option>
													<option value="에스쁘아"
														${pvoModify.category.equals('에스쁘아') ? 'selected' : '' }>에스쁘아</option>
													<option value="헉슬리"
														${pvoModify.category.equals('헉슬리') ? 'selected' : '' }>헉슬리</option>
													<option value="3CE"
														${pvoModify.category.equals('3CE') ? 'selected' : '' }>3CE</option>
											</select></td>
										</tr>
										<tr id="orderList">
											<th scope="row">제품 이름<i></i></th>
											<td class="input-padding1"><input type="text"
												name="title" value="${pvoModify.title }"></td>
										</tr>
										<tr>
											<th scope="row">가격<i class="required"></i></th>
											<td class="input-padding1">
												<div class="input-box">
													<input type="number" name="price"
														value="${pvoModify.price }">
												</div>
											</td>
										</tr>
										<tr>
											<th scope="row" class="title-top">상품 정보<i
												class="required"></i></th>
											<td class="input-padding1">
												<div class="wrap-textarea">
													<textarea class="text-area" id="content" name="content"
														onkeyup="fnCheckWord(this, 2000);" cols="cols"
														style="height: 270px;" onfocus="this.placeholder=''"
														onblur="placeholder='상품 수정사항을 기입해주세요.'">${pvoModify.content }</textarea>
													<div class="wrap-number-letters num" data-num="0">/
														2000</div>
												</div>
												<div class="wrap-upload">
												등록된 파일 : 
													<c:forEach items="${imgList }" var="iList">
														${iList.pd_iname }&nbsp;&nbsp;
													</c:forEach>
													<input type="file" id="files1" name="imgfile1"> 
													<input type="file" id="files2" name="imgfile2"> 
													<input type="file"id="files3" name="imgfile3">
													<!-- <div class="upload-image">
														<div class="wrap-file">
															<input type="file" id="file1" name="imgfile1"
																accept="image/png, image/jpeg, image/gif"
																onchange="fnFileUp(this);"> <img class="loadImg">
														</div>
														<button onclick="fnCancel(this);" type="button"
															class="sp-sub-btn-delete">닫기</button>
													</div>
													<div class="upload-image">
														<div class="wrap-file">
															<input type="file" id="file2" name="imgfile2"
																accept="image/png, image/jpeg, image/gif"
																onchange="fnFileUp(this);"> <img class="loadImg"
																alt="">
														</div>
														<button onclick="fnCancel(this);" type="button"
															class="sp-sub-btn-delete">닫기</button>
													</div>
													<div class="upload-image">
														<div class="wrap-file">
															<input type="file" id="file3" name="imgfile3"
																accept="image/png, image/jpeg, image/gif"
																onchange="fnFileUp(this);"> <img class="loadImg"
																alt="">
														</div>
														<button onclick="fnCancel(this);" type="button"
															class="sp-sub-btn-delete">닫기</button>
													</div>-->
												</div>
												<ul class="common-list-dot">
													<li>3MB 미만의 JPG, GIF, PNG 파일만 등록 가능합니다.</li>
													<li>문의와 무관한 내용이거나 음란 및 불법적인 내용은 통보없이 삭제 됩니다.</li>
													<li>시코르 통합회원에게는 1:1문의 답변이 등록될 경우 답변 등록 알림이 발송됩니다.
														(간편회원에게는 알림 발송불가)</li>
												</ul>
											</td>
										</tr>
									</tbody>
								</table>
								<div class="enroll-btn">
									<button type="submit" id="btnSubmit" class="btn btn-color1">수정</button>
									<!-- onclick="fnRegister(event);">등록</button> -->
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<aside class="side-bar" id="quick"></aside>
		</main>
	</div>
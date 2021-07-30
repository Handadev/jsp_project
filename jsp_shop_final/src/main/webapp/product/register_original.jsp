<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet"
	href="https://cdn.chicor.com/static/pui/css/sub.css">
<div>
	<main id="contents" class="wrapper-sub">
		<div class="section wrapper-customer">
			<h1 class="title">상품등록</h1>
			<div class="wrap-aside">
				<div class="aside aside-customer"></div>
				<div class="contents">
					<div class="wrapper-question">
							<form action="./ProductController?sign=regist" method="post" enctype="multipart/form-data">
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
												<option>카테고리를 선택해주세요.</option>
												<option value="outer">outer</option>
												<option value="top">top</option>
												<option value="bottom">bottom</option>
												<option value="dress">dress</option>
												<option value="acc">acc</option>
										</select></td>
									</tr> 
									<tr id="brand">
										<th scope="row">브랜드<i class="required"></i></th>
										<td class="input-padding1"><select
											class="select order-select" id="brand" name="brand">
												<option>브랜드를 선택해주세요.</option>
												<option value="디오디너리">디오디너리</option>
												<option value="파뮤">파뮤</option>
												<option value="에스쁘아">에스쁘아</option>
												<option value="헉슬리">헉슬리</option>
												<option value="3CE">3CE</option>
										</select></td>
									</tr>
									<tr id="title">
										<th scope="row">제품 이름<i></i></th>
										<td class="input-padding1"><input type="text"
											name="title"></td>
									</tr>
									<tr>
										<th scope="row">가격<i class="required"></i></th>
										<td class="input-padding1">
											<div class="input-box">
												<input type="number" id="price" name="price">
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
													onblur="placeholder='상품 정보를 기입해주세요.'"></textarea>
												<div class="wrap-number-letters num" data-num="0">/
													2000</div>
											</div>
											<input type="file" id="files1" name="imgfile1"> 
											<input type="file" id="files2" name="imgfile2"> 
											<input type="file" id="files3" name="imgfile3">
											<ul class="common-list-dot">
												<li>3MB 미만의 JPG, PNG 파일만 등록 가능합니다.</li>
											</ul>
										</td>
									</tr>
								</tbody>
							</table>
							<div class="enroll-btn">
								<button type="submit" id="btnSubmit" class="btn btn-color1">등록</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</main>
</div>

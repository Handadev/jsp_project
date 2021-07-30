<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<meta charset="UTF-8">
<title></title>
<link rel="alternate" type="application/json+oembed"
	href="https://www.jotform.com/oembed/?format=json&amp;url=https%3A%2F%2Fform.jotform.com%2F211648593756468"
	title="oEmbed Form">
<link rel="alternate" type="text/xml+oembed"
	href="https://www.jotform.com/oembed/?format=xml&amp;url=https%3A%2F%2Fform.jotform.com%2F211648593756468"
	title="oEmbed Form">
<link rel="shortcut icon" href="https://cdn.jotfor.ms/favicon.ico">
<link rel="canonical" href="https://form.jotform.com/211648593756468" />
<link type="text/css" media="print" rel="stylesheet"
	href="https://cdn.jotfor.ms/css/printForm.css?3.3.25890" />
<link type="text/css" rel="stylesheet"
	href="https://cdn.jotfor.ms/themes/CSS/5e6b428acc8c4e222d1beb91.css?themeRevisionID=5f30e2a790832f3e96009402" />
<link type="text/css" rel="stylesheet"
	href="https://cdn.jotfor.ms/css/styles/payment/payment_styles.css?3.3.25890" />
<link type="text/css" rel="stylesheet"
	href="https://cdn.jotfor.ms/css/styles/payment/payment_feature.css?3.3.25890" />
<link type="text/css" rel="stylesheet" href="product/css/style.css" />

<style type="text/css" id="form-designer-style">
.form-label.form-label-auto {
	display: inline-block;
	text-align: left;
}

.form-all:before {
	background: none;
}

body {
	margin-top: 85px;
}
</style>
<div>
	<div role="main" class="form-all">
		<form
			action="./ProductController?sign=modifySave&pno=${pvoModify.pno }&mno=${ses.mno }"
			method="post" enctype="multipart/form-data">
			<ul class="form-section page-section">

				<li id="cid_3" class="form-input-wide" data-type="control_head">
					<div class="form-header-group  header-large">
						<div class="header-text httal htvam">
							<h1 id="header_3" class="form-header" data-component="header">상품
								수정</h1>
						</div>
					</div>
				</li>

				<!-- 카테고리 li 시작  -->
				<li class="form-line" data-type="control_textbox" id="id_6"><label
					class="form-label form-label-left form-label-auto" id="label_6"
					for="input_6">카테고리</label>
					<div class="form-input" data-layout="half">

						<select class="form-dropdown" id="category" name="category"
                     style="width: 310px" data-component="dropdown">
                     <option value="Skin"
                        ${pvoModify.category.equals('Skin') ? 'selected' : '' }>Skin/Toner</option>
                     <option value="Lotion"
                        ${pvoModify.category.equals('Lotion') ? 'selected' : '' }>Lotion</option>
                     <option value="Lipstick"
                        ${pvoModify.category.equals('Lipstick') ? 'selected' : '' }>Lipstick</option>
                     <option value="Mascara"
                        ${pvoModify.category.equals('Mascara') ? 'selected' : '' }>Mascara</option>
                     <option value="Handwash"
                        ${pvoModify.category.equals('Handwash') ? 'selected' : '' }>Handwash</option>
                     <option value="Perfume"
                        ${pvoModify.category.equals('Perfume') ? 'selected' : '' }>Perfume</option>
                     <option value="Shampoo"
                        ${pvoModify.category.equals('Shampoo') ? 'selected' : '' }>Shampoo</option>
                     <option value="Hairbrush"
                        ${pvoModify.category.equals('Hairbrush') ? 'selected' : '' }>Hairbrush</option>
                     <option value="Eyebrow"
                        ${pvoModify.category.equals('Eyebrow') ? 'selected' : '' }>Eyebrow</option>
                     <option value="Sunscreen"
                        ${pvoModify.category.equals('Sunscreen') ? 'selected' : '' }>Sunscreen</option>
                  </select>
					</div></li>
				<!-- 카테고리 li 끝  -->
				<%-- <!-- 브랜드 li 시작  -->
				<li class="form-line" data-type="control_textbox" id="id_6"><label
					class="form-label form-label-left form-label-auto" id="label_6"
					for="input_6">브랜드</label>
					<div id="cid_6" class="form-input" data-layout="half">
						<select class="form-dropdown" id="brand" name="brand"
							style="width: 310px" data-component="dropdown">
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
						</select>
					</div></li>
				<!-- 브랜드 li 끝  --> --%>
				<!-- 타이틀 li 시작  -->
				<li class="form-line" data-type="control_textbox" id="id_6"><label
					class="form-label form-label-left form-label-auto" id="label_6"
					for="input_6">제품 이름</label>
					<div id="cid_6" class="form-input" data-layout="half">
						<input type="text" id="title" name="title"
							data-type="input-textbox" class="form-textbox"
							style="width: 310px" size="310" value="${pvoModify.title }"
							data-component="textbox" aria-labelledby="label_6" />
					</div></li>
				<!-- 타이틀 li 끝  -->
				<!-- 가격 li 시작 -->
				<li class="form-line" data-type="control_textbox" id="id_6"><label
					class="form-label form-label-left form-label-auto" id="label_6"
					for="input_6">가격</label>
					<div id="cid_6" class="form-input" data-layout="half">
						<input type="number" id="price" name="price"
							data-type="input-textbox" class="form-textbox"
							style="width: 310px" size="310" value="${pvoModify.price }"
							data-component="textbox" aria-labelledby="label_6" />
					</div></li>
				<!-- 가격 li 끝 -->
				<!-- 상품정보 li 시작  -->
				<li class="form-line" data-type="control_textarea" id="id_7"><label
					class="form-label form-label-left form-label-auto" id="label_7"
					for="input_7"> 상품 정보 </label>
					<div id="cid_7" class="form-input" data-layout="full">
						<textarea id="content" class="form-textarea" name="content"
							style="width: 648px; height: 163px" data-component="textarea"
							aria-labelledby="label_7">${pvoModify.content }</textarea>
					</div></li>
				<!-- 상품정보 li 시작  -->
				<!-- 파일 li 시작 -->
				<li class="form-line" data-type="control_textbox" id="id_6"><label
					class="form-label form-label-left form-label-auto" id="label_6"
					for="input_6"></label>
					<div id="cid_6" class="form-input" data-layout="half">
						등록된 파일 :<br>
						<c:forEach items="${imgList }" var="iList">
						${iList.pd_iname }
						</c:forEach>
						<div class="filebox">
							<input type="text" class="upload-name" disabled="disabled" value="">
							<label for="files1">파일선택</label> <input type="file" id="files1"
								name="imgfile1" class="upload-hidden">
						</div>
						<div class="filebox">
							<input type="text" class="upload-name" disabled="disabled">
							<label for="files2">파일선택</label> <input type="file" id="files2"
								name="imgfile2" class="upload-hidden">
						</div>
						<div class="filebox">
							<input type="text" class="upload-name" disabled="disabled">
							<label for="files3">파일선택</label> <input type="file" id="files3"
								name="imgfile3" class="upload-hidden">
						</div>

						<ul>
							<li>3MB 미만의 JPG, PNG 파일만 등록 가능합니다.</li>
						</ul>
					</div></li>
				<!-- 파일 li 끝 -->

				<li class="form-line" data-type="control_button" id="id_2">
					<div id="cid_2" class="form-input-wide" data-layout="full">
						<div data-align="auto"
							class="form-buttons-wrapper form-buttons-auto   jsTest-button-wrapperField">
							<button type="submit" class="btn btn-primary"
								style="width: 150px;">등록</button>
						</div>
					</div>
				</li>
				<li style="display: none">Should be Empty: <input type="text"
					name="website" value="" />
				</li>
			</ul>
		</form>
	</div>
</div>
<script src="resource/js/jquery-3.2.1.min.js"></script>
<script>
	$(document).ready(
			function() {
				var fileTarget = $('.filebox .upload-hidden');
				fileTarget.on('change', function() {
					// 값이 변경되면 
					if (window.FileReader) {
						// modern browser 
						var filename = $(this)[0].files[0].name;
					} else { // old IE 
						var filename = $(this).val().split('/').pop().split(
								'\\').pop();
						// 파일명만 추출 
					} // 추출한 파일명 삽입 
					$(this).siblings('.upload-name').val(filename);
				});
			});
</script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="../common/error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물을 등록하세요.</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="resources/css/reset.css" rel="stylesheet">
<link href="resources/css/style.css" rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
	rel="stylesheet">


<style>
section {
	/* box-sizing: border-box; */
	text-align: center;
	margin: 0 auto;
	width: 900px;
	height: 820px;
	background-color: white;
	border-radius: 20px;
	box-shadow: 2px 2px 10px grey;
}

section ul li:nth-child(1) {
	padding: 15px 0;
	font-weight: bold;
	font-size: 16px;
	/* border-bottom: #F0F0F0 2px solid; */
}

section ul li:last-child {
	position: relative;
	bottom: 43px;
	left: 430px;
}

.uploadPic, .takePic {
	width: 150px;
	height: 40px;
	font-weight: bold;
	border: none;
	border-radius: 10px;
	transition: 0.5s ease-in-out;
	box-shadow: 2px 2px 5px gray;
	color: #333;
	background-color: #E5E5E5;
	margin-left: 10px;
}

.uploadPic:hover, .takePic:hover {
	color: white;
	background-color: #F95E25;
}

.uploadPic a, .takePic a {
	display: block;
}

section {
	margin-top: 30px;
}

.btn {
	padding: 300px 0;
}

.closeBtn {
	position: relative;
	top: -35px;
}

.admit {
	width: 100px;
	height: 40px;
	font-weight: bold;
	border: none;
	border-radius: 10px;
	transition: 0.5s ease-in-out;
	color: #333;
	background-color: #E5E5E5;
	margin-left: 10px;
	position: relative;
	bottom: -415px;
	left: 5px;
}
.admit:hover {
	cursor: pointer;
	background-color: #F95E25;
}

textarea {
	font-weight: normal;
	width: 410px;
	height: 300px;
	border: #f8f9fa 2px solid;;
	position: relative;
	bottom: -24px;
	left: 445px;
}

li>#preview {
	width: 450px;
	height: auto;
	object-fit: cover;
}
.postBox {
	position: relative;
	bottom: 100px;
	left: 100px;
}
.post {
	display: flex;
	width: 900px;
}
.idid {
	position: relative;
	bottom: -10px;
	left: 357px;
}

</style>

<script type="text/javascript">
	function validation() {
		var fileValue = document.getElementById("boFiles").value;
		if($("#cam").val() != null){
			return true;
		}
		if (fileValue == null || fileValue == "") {
			alert("이미지 첨부는 필수 입니다.");
			return false;
		}
		return true;
	};
</script>

<script>
function readURL(input) {
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
	      document.getElementById('preview').src = e.target.result;
	    };
	    reader.readAsDataURL(input.files[0]);
	  } else {
	    document.getElementById('preview').src = "";
	  }
	}
</script>
</head>
<c:import url="/WEB-INF/views/common/nav.jsp" />

<body>

	<section>
		<ul>
			<li>새 게시물 만들기</li>
			<li class="closeBtn"><a
				href="${ pageContext.servletContext.contextPath }/main.do"><i
					class="fa-solid fa-x"></i></a></li>
		</ul>
		<form id="regForm" action="binsert.do" method="post"
			enctype="multipart/form-data" onsubmit="return validation();" style="position: absolute;" class="post">
			<c:if test="${ not empty file_name }">
				<input type="hidden" name="cam" value="${ file_name }" id="cam">
			</c:if>
			<div type="content">
				<div class="title-wrap" >
					<!-- 아이디 보임 -->
					<div class="idid">
						<input type="text" style="font-weight: bold;width: 120px;height:2rem; border:2px solid #f8f9fa; top:48px;text-align:center;border-radius:20px;" name="userid"
							readonly value="${ sessionScope.loginMember.userid }" required>
						<select name="b_open" required  style="width: 100px;height:2.5rem; border:none; top:48px;text-align:center; right:308px;border-radius:20px;">
							<option value="2" selected>전체공개</option>
							<option value="1">친구공개</option>
							<option value="0">비공개</option>
						</select>
					</div>
					<!-- 컨텐츠 입력 -->
					<textarea id="b_content" name="b_content"  maxlength="200" required></textarea>
					<div class="btn">
						<!-- 						<button class="uploadPic" onclick="showfile(); return false;">
							컴퓨터에서 선택</button> -->

						<script type="text/javascript">
							function showfile() {
								document.getElementById("boFiles").click();
							};
						</script>

						
						<br>
						
						<button class="takePic">
							<a href="${ pageContext.servletContext.contextPath }/boardTakePictures.do">사진
								찍기</a>
						</button>
						<!-- 이미지업데이트 -->
						<ul style="position: relative; bottom: 670px; left: 5px;">
							<li><img id="preview"  src="${ pageContext.servletContext.contextPath }/resources/uploaded_foodImage/${ file_name }"></li>
							<input multiple="multiple" id="boFiles" type="file"
								name="boFiles" onchange="readURL(this);" />
							<br>
							<br>
							<label>저장할 이미지에 대한 태그를 선택해주세요<br> <br> <select
								name="b_category" style="font-weight: bold;width: 120px;height:2rem; border:2px solid #f8f9fa; top:48px;text-align:center;border-radius:20px;">
									<option value="갈비탕">갈비탕
									<option value="과일채소샐러드">과일채소샐러드
									<option value="닭갈비">닭갈비
									<option value="마르게리따피자">마르게리따피자
									<option value="마카롱">마카롱
									<option value="모듬초밥">모듬초밥
									<option value="바게트빵">바게트빵
									<option value="순대국밥">순대국밥
									<option value="순살찜닭">순살찜닭
									<option value="스테이크">스테이크
									<option value="스튜">스튜
							</select>
							</label>
						</ul>
					</div>
				</div>
			</div>
			<p>
				<input class="admit" type="submit" value="등록하기">&nbsp; <input class="admit" type="reset"
					value="작성취소"> &nbsp;
				<button class="admit" onclick="javascript:history.go(-1); return false;">목록</button>
		</form>
	</section>

	<script src="https://kit.fontawesome.com/6478f529f2.js"
		crossorigin="anonymous"></script>
</body>
</html>

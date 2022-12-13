<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 수정</title>
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.eyes.co.kr/assets/css/reset.css?v=1669255025">
<link rel="stylesheet" href="https://www.eyes.co.kr/assets/css/swiper.min.css">
<link rel="stylesheet" href="https://www.eyes.co.kr/assets/css/jquery.mCustomScrollbar.min.css">
<link rel="stylesheet" href="https://www.eyes.co.kr/assets/css/site.css?v=1669255025"> -->

<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.1.min.js"></script>
<!-- <script src="https://www.eyes.co.kr/assets/js/libs/swiper.min.js"></script>
<script src="https://www.eyes.co.kr/assets/js/libs/chart.min.js"></script>
<script src="https://www.eyes.co.kr/assets/js/libs/jquery.mCustomScrollbar.concat.min.js"></script>
<script src="https://www.eyes.co.kr/assets/js/site.js?v=1669259435"></script> -->

<style>
h2 {
	text-align: center;
}
.stab {
	width: 100%;
	margin-top: 60px;
	/* position: relative;
    left:-350px;
    top:55px */;
}
.container {	
}
td {
	margin: -1px;
}
th {
	width: 30px;
	font-weright: normal;
	font-size: 15px;
}
tr th {
	font-weight: normal;
	font-size: 16px;
}
td>input {
	height: 10px;
}
td>input:hover {
	background-color: #ffffff
}
td>textarea {
	border-radius: none;
}
td>textarea:hover {
	background-color: #ffffff
}

/* 버튼 */
.board_btn {
	margin-top: 10px;
	margin-bottom: 10px;
	text-align: center;
	overflow: hidden;
	width: 100%;
}

.board_bt_style01:hover {
	background-color: #F95E25;
}

.board_bt_style01 {
	border: 0px;
	color: #fff;
	background: #666c74;
	width: 83px;
	height: 30px;
	line-height: 29px;
	font-size: 14px;
	cursor: pointer;
	border-radius: 5px;
	text-align: center;
}
.table {
	margin: 30px auto;
}
.tbox {
	border-radius: 0px;
	border: 1px solid #787878;
}
.importance {
}

input::placeholder {
  color: black;
  font-size: 14px;
  font-family: 'ariel';
}
.textarea_type {
}
textarea {
	width: 400px; 
	height: 14rem; 
	border: 1px solid black; 
	margin-top: 10px;
	margin-bottom: 1px;
	padding-left: 5px;
	padding-top: 5px;
    display: block;
    font-family: '나눔고딕';
    font-size: 14px;
    vertical-align: middle;
    display:block;
}
input::tbox {
}
</style>
</head>
<body>
<c:import url="/WEB-INF/views/common/nav.jsp" />
<h2 align="center">
	<ul class="stab">
	<span align="center"><img src="${ pageContext.servletContext.contextPath }/resources/notice_img/w_title2.png" align="center"></span>
	</ul>
	</h2>
	<!-- form 태그에서 입력된 값들(문자열)과 첨부파일을 같이 전송하려면,
	반드시 enctype 속성을 form 태그에 추가해야 됨
	enctype="multipart/form-data" 값을 지정해야 함
	method="post" 로 지정해야 함
 -->
 <div class="container">
	<form action="nupdate.do" method="post" enctype="multipart/form-data">
	<input type="hidden" name="noticeno" value="${ notice.noticeno }">

<table align="center" width="500" cellspacing="0" height="30" cellpadding="5" class="table">
	<tr>
	<th style="width: 80px;">제 목</th>
					<td><input type="text" class="tbox" name="noticetitle"
						style="width: 400px; height: 2rem; border: 1px solid black; margin-bottom: 5px; padding-left: 5px;"
						value="${ notice.noticetitle }">
					<div class="">
					<c:if test="${ notice.importance eq 1 }">
						<input type="checkbox" name="importance" value="2"
						style="width: 1rem; height: 1rem; border: 1px solid black;">
						중요도
						</c:if>
					<c:if test="${ notice.importance eq 2 }">
						<input type="checkbox" name="importance" value="2" checked="checked"
						style="width: 1rem; height: 1rem; border: 1px solid black;">
						중요도
						</c:if>
					</td>
	</tr>	
	<tr><th>작성자</th>
	<td><input type="text" name="userid" readonly 
	value="${ sessionScope.loginMember.userid }" placeholder= " admin" 
	style="width: 400px; height: 2rem; border: 1px solid black; padding-left: 5px;"></td>
	</tr>	
	<tr>
	<th>첨부파일</th>
		<td class="file_area">
		<!-- 원래 첨부파일이 있는 경우 -->
			<%-- <c:if test="${ !empty notice.attaches }">
				${ notice.attaches } &nbsp; 
								<input type="checkbox" name="delFlag" value="yes"
				style="width: 1rem; height: 1rem; border: 1px solid black;"> 파일삭제 <br>
			</c:if> --%>
			<input multiple="multiple"  type="file"  name="boFiles" style="width: 406px; height: 2rem; border: 1px solid black;">
			<c:forEach var="f" items="${notice.attaches}" varStatus="st">
				<div>
					# 파일 ${st.count} <a style="color: #337ab7;" href="<c:url value='/attachDownload.do/${f.atch_no}' />" target="_blank"> 
					${f.atch_original_name}</a>									 
					Size : ${f.atch_fancy_size} Down : ${f.atch_down_hit}
					<button class="btn_file_delete" data-atch-no="${f.atch_no}">
					<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
					</button>
					</div>
			</c:forEach>	
		</td>
	</tr>
	<tr>
	<th>내 용</th>
	<td><textarea name="noticecontent" >${ notice.noticecontent }</textarea></td>
	</tr>
	<tr align="center">
		<th colspan="2">
		<div class="board_btn">	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="submit" value="수정하기" class="board_bt_style01" style="margin-left:20px;"> 
		<input type="reset" value="수정취소" class="board_bt_style01" style="margin-left: 20px;">
		<button type="button" onclick="location.href = '${ pageContext.servletContext.contextPath }/nlist.do';" class="board_bt_style01" style="margin-left: 20px;">목록</button>
	</div>
	</th>
	</tr>
</table>
</form>
		<script>
				// 상위객체를 통해 이벤트 위임  
				$('.file_area').on('click','.btn_delete', function(){
					$(this).closest('div').remove();
				});
				 
				// 기존 첨부파일 삭제 클릭 
				$('.btn_file_delete').click(function(){
					$btn = $(this);
					$btn.closest('div').html(
							 '<input type="hidden" name="delAtchNos" value="' + $btn.data("atch-no")  + '" />'
							); 
				});   //
				</script>
</div>
<br>
</body>
</html>

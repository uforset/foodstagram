<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 등록</title>
<link href="resources/css/reset.css"  rel="stylesheet">
<link href="resources/css/style.css"  rel="stylesheet">
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
	width: 399px; 
	height: 14rem; 
	border: 1px solid black; 
	margin-top: 1px;
	margin-bottom: 1px;
	padding-left: 5px;
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
	<img src="${ pageContext.servletContext.contextPath }/resources/notice_img/w_title.png">
	</ul>
	</h2>
	<!-- form 태그에서 입력된 값들(문자열)과 첨부파일을 같이 전송하려면,
	반드시 enctype 속성을 form 태그에 추가해야 됨
	enctype="multipart/form-data" 값을 지정해야 함
	method="post" 로 지정해야 함
 -->
	<div class="container">
		<form action="ninsert.do" method="post" enctype="multipart/form-data">
			<table align="center" width="500" cellspacing="0" height="30" cellpadding="5" class="table">
				<tr>
					<th style="width: 80px;">제 목</th>
					<td><input type="text" class="tbox" name="noticetitle"
						style="width: 400px; height: 2rem; border: 1px solid black; margin-bottom: 5px; padding-left: 5px;"
						value="${ notice.noticetitle }">
						<input type="checkbox" name="importance" value="2" 
						style="width: 1rem; height: 1rem; border: 1px solid black;">
						중요도
				</td>
				</tr>
				<tr> 	
					<th>작성자</th>
					<td><input type="text" class="tbox" name="userid" readonly
						value="${ sessionScope.loginMember.userid }" placeholder=" admin"
						style="width: 395px; height: 2rem; border: 1px solid black; padding-left: 10px;"></td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td>
						<input class="tbox" type="file" name="boFiles" id="file" value="파일추가"
						style="width: 406px; height: 2rem; border: 1px solid black;"  multiple="multiple">
					</td>
				</tr>
				<tr>
					<th>내 용</th>
					<td><textarea rows="8" cols="80" name="noticecontent" wrap="hard" name="content"></textarea></td>
					</div>
				</tr>
				<tr align="center">
					<th colspan="2">
					<div class="board_btn">	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="submit" value="등록하기" class="board_bt_style01" style="margin-left: 20px;"> 
					<input type="reset" value="작성취소" class="board_bt_style01" style="margin-left: 20px;">
						<button type="button" onclick="location.href = '${ pageContext.servletContext.contextPath }/nlist.do';" class="board_bt_style01" style="margin-left: 20px;">목록</button>
					</div>
					</th>
				</tr>
			</table>
		</form>
	</div>
	<br>
</body>
</html>

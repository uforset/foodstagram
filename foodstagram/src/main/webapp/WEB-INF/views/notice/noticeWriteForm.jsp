<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style>

	h2 {
		font-weight:normal;
	}
	
	
	th {
		width:30px;
		font-weright:normal;
		font-size: 15px;
	}
	 
	 tr th {
	 	font-weight:normal;
		font-size: 16px;
	 }
	 
	 td > input {
	 	transition:0.6s;
	 }
	 
	 td > textarea {
	 	transition:0.6s;
	 }
	 
	 td > input:hover {
	 	background-color:#f8f9fa;
	 }
	 
	 td>textarea:hover{
	 	background-color:#f8f9fa;
	 }
	 
	 .button {
		width: 100px;
		height: 45px;
		 font-size: 16px;
		letter-spacing: 2px;
		color: #000;
		background-color: #f1f3f5;
		border: none;
		border-radius: 45px;
		cursor: pointer;
		outline: none;
		transition: 0.6s;
	}
	
	.button:hover {
		background-color:salmon;
	}
	
	.table {
		 margin:50px auto;
}


</style>
</head>
<body>
<!-- 절대경로로 대상 파일의 위치를 지정한 경우 -->
<c:import url="/WEB-INF/views/common/menubar.jsp" />
<br><br>
<h2 align="center">새 공지글 등록 페이지</h2>
<!-- form 태그에서 입력된 값들(문자열)과 첨부파일을 같이 전송하려면,
	반드시 enctype 속성을 form 태그에 추가해야 됨
	enctype="multipart/form-data" 값을 지정해야 함
	method="post" 로 지정해야 함
 -->
<form action="ninsert.do" method="post" enctype="multipart/form-data">
<table align="center" width="500" cellspacing="0" 
cellpadding="5" class="table">
	<tr><th style="width: 80px;">제 목</th><td><input type="text" name="noticetitle"  style="width: 25rem;height:3rem; border:3px solid #f8f9fa; margin-bottom:20px;"></td></tr>
	<tr><th>작성자</th>
	<td><input type="text" name="userid" readonly value="${ sessionScope.loginMember.userid }"   style="width: 25rem;height:3rem; border:3px solid #f8f9fa;" class="write"></td></tr>
	<tr><th>&nbsp;&nbsp;&nbsp;&nbsp;</th><td><input type="checkbox" name="importance" value="2"> 중요도</td></tr>
	<tr><th>첨부파일</th><td><input type="file" name="upfile" style="width: 25rem;height:3rem; border:3px solid #f8f9fa; margin-bottom:20px;" class="upfile"></td></tr>
	<tr><th>내 용</th><td><textarea rows="5" cols="50" name="noticecontent" style="width: 25rem;height:4rem; border:3px solid #f8f9fa; margin-bottom:20px;"></textarea></td></tr>
	<tr  align="center"><th colspan="2">
		&nbsp;&nbsp;&nbsp;	<input type="submit" value="등록하기"  class="button" style="margin-left:30px;"> &nbsp; 
		<input type="reset" value="작성취소" class="button" style="margin-left:30px;"> &nbsp; 
		<button onclick="javascript:history.go(-1);" class="button" style="margin-left:30px;">목록</button>
	</th></tr>
</table>
</form>
<br>
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>









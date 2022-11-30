<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="<c:url value="/resources/css/common.css" />">
<style>

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
		        footer{
         width:100%;
/*             margin-top: 205px; */
            padding-top: 250px;
            background-color: #333;
            height: 150px;
            text-align: center;
            color: white;
            font-weight: 200;
        }
</style>
</head>
<body>
<!-- 절대경로로 대상 파일의 위치를 지정한 경우 -->
<c:import url="/WEB-INF/views/common/menubar.jsp" />
<br><br>
<h2 align="center" style="font-weight:normal;">${ notice.noticeno }번 공지글 수정 페이지</h2>
<!-- form 태그에서 입력된 값들(문자열)과 첨부파일을 같이 전송하려면,
	반드시 enctype 속성을 form 태그에 추가해야 됨
	enctype="multipart/form-data" 값을 지정해야 함
	method="post" 로 지정해야 함
 -->
<form action="nupdate.do" method="post" enctype="multipart/form-data">
	<input type="hidden" name="noticeno" value="${ notice.noticeno }">
	<c:if test="${ !empty notice.notice_upfile }">
	<!-- 첨부파일이 있는 공지글이라면 -->
		<input type="hidden" name="notice_upfile" value="${ notice.notice_upfile }">
		<input type="hidden" name="notice_refile" value="${ notice.notice_refile }">
	</c:if>
<table align="center" width="500" cellspacing="0" cellpadding="5"  class="table">
	<tr><th  style="width: 80px;">제 목</th><td><input type="text" name="noticetitle" value="${ notice.noticetitle }">
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<c:if test="${ notice.importance eq 2 }">
	<input type="checkbox" name="importance" value="2" checked> 중요도
	</c:if>
	<c:if test="${ notice.importance eq 1 }">
	<input type="checkbox" name="importance" value="2"> 중요도
	</c:if>
	
	</td></tr>
	<tr><th>작성자</th>
	<td><input type="text" name="useri" readonly value="${ notice.userid }"  style="width: 25rem;height:3rem; border:3px solid #f8f9fa;"></td></tr>
	<tr><th>첨부파일</th>
		<td>
			<!-- 원래 첨부파일이 있는 경우 -->
			<c:if test="${ !empty notice.notice_upfile }">
				${ notice.notice_upfile } &nbsp; 
				<input type="checkbox" name="delFlag" value="yes"> 파일삭제 <br>
			</c:if>
			<br>
			새로 첨부 : <input type="file" name="upfile" style="width: 25rem;height:3rem; border:3px solid #f8f9fa; margin-bottom:20px;">
		</td>
	</tr>
	<tr><th>내 용</th><td><textarea rows="5" cols="50" name="noticecontent"  style="width: 25rem;height:4rem; border:3px solid #f8f9fa; margin-bottom:20px;">${ notice.noticecontent }</textarea></td></tr>
	<tr align="center"><th colspan="2">
		<input type="submit" value="수정" class="button" style="margin-left:30px;"> &nbsp; 
		<button onclick="javascript:history.go(-1);" class="button"  style="margin-left:30px; width:120px;">이전페이지</button>
	</th></tr>
</table>
</form>
<br>

<%-- <c:import url="/WEB-INF/views/common/footer2.jsp" /> --%>
</body>
</html>
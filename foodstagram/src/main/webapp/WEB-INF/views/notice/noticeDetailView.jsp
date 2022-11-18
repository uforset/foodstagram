<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" rel="stylesheet"> 
<style>
		.table {
		 margin:50px auto;
	}
	
	th {
		font-weight:normal;
		font-size: 16px;
	}
	
	td {
		width: 25rem;
		height:3rem; 
		border:3px solid #f8f9fa; 
		margin:20px 0;
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
	
</style>
</head>
<body>
<%-- <c:import url="/WEB-INF/views/common/menubar.jsp" /> --%>

<br>
<table align="center" width="500" cellspacing="0" cellpadding="5"  class="table">
	<tr><th>제 목</th><td>${notice.noticetitle }</td></tr>
	<tr><th>작성자</th><td>${notice.userid }</td></tr>
	<tr><th>날 짜</th><td>${notice.noticedate }</td></tr>
	<tr><th>조회수</th><td>${notice.readcount }</td></tr>
	<tr><th>내 용</th><td>${notice.noticecontent}</td></tr>
	<tr><th>첨부파일</th>
		<td>
			<!-- 첨부파일이 있다면, 파일명 클릭시 다운로드 실행되게 함 -->
			<c:if test="${!empty notice.notice_upfile }">
				<c:url var="nfd" value="/nfdown.do">
					<c:param name="ofile" value="${notice.notice_upfile }"/>
					<c:param name="rfile" value="${notice.notice_refile }"/>
				</c:url>
				<a href="${ nfd }">${notice.notice_upfile }</a>
			</c:if>
			<!-- 첨부파일이 없다면 공백처리함 -->
			<c:if test="${empty notice.notice_upfile }">
				&nbsp;
			</c:if>
		</td>
	<tr><th colspan="2">
		<button onclick = "javascript:history.go(-1)"  style="margin-top:50px;" class="button">목록</button>
	</th></tr>
</table>

<%-- <c:import url="/WEB-INF/views/common/footer.jsp" />  --%>
<script src="https://kit.fontawesome.com/6478f529f2.js" crossorigin="anonymous"></script>
</body>
</html>
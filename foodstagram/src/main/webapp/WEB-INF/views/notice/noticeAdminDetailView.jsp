<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="<c:url value="/resources/css/common.css" />">
<style>
	table {
		margin-top:50px;
	}
	
	th {
		font-weight:normal;
		font-size: 16px;
	}
	
	td {
		width: 25rem;
		height:3rem; 
		border:3px solid #f8f9fa; 
		margin-bottom:20px;
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
		margin-top:50px;
		margin-left:10px;
	}
	
	.button:hover {
		background-color:salmon;
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
<%-- <c:import url="/WEB-INF/views/common/menubar.jsp" /> --%>

<br>
<table align="center" width="500" cellspacing="0" 
cellpadding="5"  class="table">
	<tr><th>제 목</th><td>${ notice.noticetitle }</td></tr>
	<tr><th>작성자</th><td>${ notice.userid }</td></tr>
	<tr><th>날 짜</th><td>${ notice.noticedate }</td></tr>
	<tr><th>조회수</th><td>${notice.readcount}</td></tr>
	<tr><th>중요도</th>
	<td><c:if test="${ notice.importance eq 1 }">일반</c:if>
		<c:if test="${ notice.importance eq 2 }">중요</c:if>
	</td></tr>
	<tr><th>첨부파일</th>
		<td>
			<!-- 첨부파일이 있다면, 파일명 클릭시 다운로드 실행되게 함 -->
			<c:if test="${ !empty notice.notice_upfile }">
				<c:url var="nfd" value="/nfdown.do">
					<c:param name="ofile" value="${ notice.notice_upfile }" />
					<c:param name="rfile" value="${ notice.notice_refile }" />
				</c:url>
				<a href="${ nfd }">${ notice.notice_upfile }</a>
			</c:if>
			<!-- 첨부파일이 없다면 공백으로 처리함 -->
			<c:if test="${ empty notice.notice_upfile }">
				&nbsp;
			</c:if>
		</td>
	</tr>
	<tr><th>내 용</th><td>${ notice.noticecontent }</td></tr>
	<tr><th colspan="2">
		<button onclick="javascript:history.go(-1);" class="button">목록</button>
		
		<!-- 수정페이지로 이동 버튼 -->
		<c:url var="movenup" value="/nmoveup.do">
			<c:param name="noticeno" value="${ notice.noticeno }" />			
		</c:url>
		<button onclick="javascript:location.href='${ movenup }';" class="button">수정</button>
		<!-- 삭제하기 버튼 -->
		<c:url var="ndel" value="/ndel.do">
			<c:param name="noticeno" value="${ notice.noticeno }" />
			<c:param name="rfile" value="${ notice.notice_refile }" />
		</c:url>
		<button onclick="javascript:location.href='${ ndel }';" class="button">글삭제</button>
	</th></tr>
</table>
<br>
<footer>
<br><br> Copyright ©Circle: Project 'Foodstagram' <br><br>
</footer>
</body>
</html>
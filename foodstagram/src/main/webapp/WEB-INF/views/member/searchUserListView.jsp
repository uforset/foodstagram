<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="listCount" value="${ requestScope.listCount }" />
<c:set var="startPage" value="${ requestScope.startPage }" />
<c:set var="endPage" value="${ requestScope.endPage }" />
<c:set var="maxPage" value="${ requestScope.maxPage }" />
<c:set var="currentPage" value="${ requestScope.currentPage }" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="resources/css/reset.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" rel="stylesheet">
<title>Foodstagram 가입 사용자 목록</title>
<style type="text/css">
h1 {font-weight: bold; font-size: 18px; margin-bottom: 10px;}
th, td {
   border-bottom:3px solid #f8f9fa;
    padding: 15px 20px;
}

/* button:hover {background-color: #F95E25;} */
</style>
</head>
<c:import url="/WEB-INF/views/common/nav.jsp" />
<body>
	<table align="center"  cellspacing="0" cellpadding="3" style="margin:0 auto; border-collapse: collapse; border-top:3px solid #f8f9fa;">
		<thead>
		<tr>
			<th>아이디</th>
			<th>이름</th>
		</tr>
		</thead>
		
		<c:forEach items="${ requestScope.list }" var="m">
			<tr>
			<c:url var="callMyinfo" value="/myinfo.do">
                        <c:param name="userid" value="${ m.userid  }" />
              </c:url>
			<td><a href="${ callMyinfo }">${ m.userid }</a></td>
			<td>${ m.username }</td>
			</tr>
		</c:forEach>
	
	
	</table>
	
	<!-- 페이지 표시 영역 -->
	<div style="text-align:center; margin:30px;"> 
	<!-- 1페이지로 이동 처리 -->
	<c:if test="${ currentPage eq 1 }">
		 [맨처음] &nbsp;
	</c:if>
	<c:if test="${ currentPage > 1 }">
		<c:url var="nsl" value="searchUser.do">
			<c:param name="keyword" value="${ keyword }" />
			<c:param name="page" value="1" />
		</c:url>
			
		<a href="${ nsl }">[맨처음]</a> &nbsp;
	</c:if>
	<!-- 이전 페이지그룹으로 이동 처리 -->
	<c:if test="${ (currentPage - 10) < startPage and (currentPage - 10) > 1 }">

		<c:url var="nsl" value="searchUser.do">
			<c:param name="keyword" value="${ keyword }" />
			<c:param name="page" value="${ startPage - 10 }" />
		</c:url>

		<a href="${ nsl }">[이전그룹]</a> &nbsp;
	</c:if>
	<c:if test="${ !((currentPage - 10) < startPage and (currentPage - 10) > 1) }">
		[이전그룹] &nbsp;
	</c:if>
	<!-- 현재 페이지가 속한 페이지 그룹 페이지 숫자 출력 -->
	<c:forEach var="p" begin="${ startPage }" end="${ endPage }" step="1">
		<c:if test="${ p eq currentPage }">
			<font size="4" color="red"><b>[${ p }]</b></font>
		</c:if>
		<c:if test="${ p ne currentPage }">
			<c:url var="nsl" value="searchUser.do">
				<c:param name="keyword" value="${ keyword }" />
				<c:param name="page" value="${ p }" />
			</c:url>
			<a href="${ nsl }">${ p }</a> 
		</c:if>
	</c:forEach>
	<!-- 다음 페이지그룹으로 이동 처리 -->
	<c:if test="${ (currentPage + 10) > endPage and (currentPage + 10) < maxPage }">

		<c:url var="nsl" value="searchUser.do">
			<c:param name="keyword" value="${ keyword }" />
			<c:param name="page" value="${ endPage + 10 }" />
		</c:url>

		<a href="${ nsl }">[다음그룹]</a> &nbsp;
	</c:if>
	<c:if test="${ !((currentPage + 10) > endPage and (currentPage + 10) < maxPage) }">
		[다음그룹] &nbsp;
	</c:if>
	<!-- 끝페이지로 이동 처리 -->
	<c:if test="${ currentPage eq maxPage }">
		[맨끝] &nbsp; 
	</c:if>
	<c:if test="${ currentPage < maxPage }">

		<c:url var="nsl" value="searchUser.do">
			<c:param name="keyword" value="${ keyword }" />
			<c:param name="page" value="${ maxPage }" />
		</c:url>	
		<a href="${ nsl }">[맨끝]</a> &nbsp;
	</c:if>
</div>
<!-- 검색 목록 페이징 처리 -->
</body>
</html>
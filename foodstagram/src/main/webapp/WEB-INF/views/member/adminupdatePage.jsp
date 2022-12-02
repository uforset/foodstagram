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
<title>adminupdate</title>
<style type="text/css">
/* table#outer { border: 2px solid navy;}

a:link { color: black; text-decoration: none;}
a:visited { color: black; text-decoration: none;}
a:hover { color: blue; text-decoration: underline;}
 */
table.qa-table{
	width: 500px;
	text-align:center;
	border : 1px solid #ccc;
	margin-left: auto; 
	margin-right: auto;
	border-collapse: collapse;
	line-height: 1.5;
}
table.qa-table thead{
	border-right: 1px solid #ccc;
	border-left: 1px solid #ccc;
	background: #4886FA;
}
table.qa-table thead th {
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	color: #fff;
}
table.qa-table tbody tr{;
	font-weight: bold;
	border-bottom: 1px solid #ccc;
	background: #fff;
	height : 38px;
}
table.qa-table tbody tr th{;
	font-weight: bold;
	border-bottom: 1px bold #ccc;
	background: #F0F8FF;
	height : 38px;
}
.paging {
    position: fixed;
    bottom: 100px;
    width: 100%;
	text-align : center;
} 
</style>

</head>
<body>
<c:import url="../common/nav.jsp" />
<br>
<h1 align="center">회원 정보 수정 페이지</h1>
<br>
<form action="amupdate.do" method="post">
<table class="qa-table">
	<tbody>
	<tr>
		<th width="120">이 름</th>
		<td><input type="test" name="username" value="${ member.username }" readonly></td>
	</tr>
	<tr>
		<th width="120">아이디</th>
		<td><input type="text" name="userid" id="userid" value="${ member.userid }" readonly></td>
	</tr>
	<tr>
		<th width="120">이메일</th>
		<td><input type="email" name="email" value="${ member.email }"></td>
	</tr>
	<tr>
		<th colspan="2">
			<input type="submit" value="수정하기"> &nbsp;
			<input type="reset" value = "수정취소"> &nbsp;
			<a href="javascript:history.go(-1);">이전 페이지로 이동</a> &nbsp;
			<a href="mpage.do">시작페이지로 이동</a>
		</th>
	</tr>
	</tbody>
</table>
</form>

</body>
</html>

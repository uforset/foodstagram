<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Select Write Form(Take a pictures or upload images)</title>
    <link href="resources/css/reset.css" rel="stylesheet">
    <link href="resources/css/style.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" rel="stylesheet">

<title>FoodStagram</title>
</head>
<c:import url="/WEB-INF/views/common/nav.jsp" />

<body>

<br><br><br><br><br><br>

<h1 align="center">Error Page</h1>
<!-- 다른 jsp 에서 exception이 넘어온 경우의 처리 -->
<c:set var="e" value="<%= exception %>" />
<c:if test="${ !empty e }">  <!-- if(e != null) 과 같음 -->
	<h3 align="center"> jsp 페이지 오류 발생 : ${ message }</h3>
</c:if>

<!-- 서버 측에서 서비스 요청에 대한 에러메세지 리턴한 경우의 처리 -->
<c:if test="${ empty e }">  <!-- if(e == null) 과 같음 -->
	<H3 align="center"><%-- 컨트롤러 요청 실패 메세지 : ${ message } --%></H3>
</c:if>
<hr>

<c:url var="movemain" value="/main.do" />
<h3 align="center"><a href="javascript:history.go(-1);">◀ 이전 페이지로 이동</a></h3><br><br>
<hr>
<h3 align="center"><a href="${ movemain }">▶시작 페이지로 이동</a></h3>

<script src="https://kit.fontawesome.com/6478f529f2.js" crossorigin="anonymous"></script>
</body>
</html>

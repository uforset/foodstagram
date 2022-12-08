<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="resources/css/reset.css" rel="stylesheet"> 
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" rel="stylesheet">

<title>프로필 편집</title>
<style type="text/css">

table.u-table {
   width: 500px;
   text-align: center;
   margin-left: auto;
   margin-right: auto;
   border-collapse: collapse;
   line-height: 1.5;
   margin-top:50px;
}

.paging {
   position: fixed;
   bottom: 100px;
   width: 100%;
   text-align: center;
}

input {
   width: 200px;
   height: 2rem;
   border: 3px solid #f8f9fa;
   border-radius: 20px;
   margin-bottom: 15px;
}


.userupdate {
             width: 600px;
          height: 450px;
          margin: 0 auto;
          padding: 15px 10px;
          border-radius: 20px;
          box-shadow: 2px 2px 10px grey;
          box-sizing: border-box;
          position: relative;
          left: 100px;
}
form ul:first-child {
    display: flex;
    padding-bottom: 15px;
    border-bottom: #E5E5E5 2px solid;
    justify-content: space-between;
}

</style>
<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.1.min.js"></script>
<script type="text/javascript">

function validate(){
	//암호확인의 포커스가 사라질 때 암호와 암호확인 일치하는지 검사
	
	//암호와 암호확인이 일치하는지 확인
	var pwd1 = document.getElementById("upwd1").value;
	var pwd2 = document.getElementById("upwd2").value;
	
	if(pwd1 !== pwd2){
		alert("암호와 암호 확인의 값이 일치하지 않습니다.\n"
				+ "다시 입력하세요.");
		document.getElementById("upwd1").select();		
	}
}
</script>
<br>
</head>

<c:import url="/WEB-INF/views/common/nav.jsp" />
<body>
<br>
<form action="mupdate.do" method="post" class="userupdate">
<ul>
       <li><a href="javascript:history.go(-1);"><i class="fa-solid fa-arrow-left fa-1x"> </i> </a></li>
       <li><h1 align="center" style="font-weight: bold;">회원 정보 수정 페이지</h1></li>
       <li><a href="main.do"><i class="fa-solid fa-house fa-1x"></i></a></li>
</ul>

	<input type="hidden" name="origin_userpwd" value="${ member.userpwd }">
<table class="u-table"  align="center">
	<tbody>
	<tr>
		<th width="120">이 름</th>
		<td><input type="text" name="username" value="${ member.username }" readonly></td>
	</tr>
	<tr>
		<th width="120">아이디</th>
		<td><input type="text" name="userid" id="userid" value="${ member.userid }" readonly></td>
	</tr>
	<tr>
		<th width="120">암 호</th>
		<td><input type="password" name="userpwd" id="upwd1" value=""></td>
	</tr>
	<tr>
		<th width="120">암호확인</th>
		<td><input type="password" id="upwd2" onblur="validate();"></td>
	</tr>
	<tr>
		<th width="120">이메일</th>
		<td><input type="email" name="email" value="${ member.email }"></td>
	</tr>
	<tr>
		<th colspan="2">
			<input type="submit" value="수정하기" style="margin:20px;
               width: 100px;
            height: 30px;
            font-weight: bold;
            border: none;
            border-radius: 10px;
            transition: 0.5s ease-in-out;
            color: #333;
            background-color: #E5E5E5;
            font-size: 13px;"> &nbsp;
			<input type="reset" value="수정취소" style="margin:20px;
               width: 100px;
            height: 30px;
            font-weight: bold;
            border: none;
            border-radius: 10px;
            transition: 0.5s ease-in-out;
            color: #333;
            background-color: #E5E5E5;
            font-size: 13px;"> &nbsp;
		</th>
	</tr>
	</tbody>
</table>
</form>
</body>
</html>
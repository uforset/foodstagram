<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
	rel="stylesheet">
	<link href="resources/css/reset.css" rel="stylesheet"> 
    <link href="resources/css/style.css" rel="stylesheet"> 
<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.1.min.js"></script>
<script type="text/javascript">
function isSame(){
   //전송보내기 전(submit 버튼 클릭시) 입력값 유효한 값인지 검사
   
   //암호와 암호확인이 일치하는지 확인
   var pwd1 = document.getElementById("upwd1").value;
   var pwd2 = document.getElementById("upwd2").value;
   
   if(pwd1 !== pwd2){
      alert("암호와 암호 확인의 값이 일치하지 않습니다.\n"
            + "다시 입력하세요.");
      document.getElementById("upwd1").select();   
      return false;  //전송 안 함
   }
   
   return true; //전송함
}
</script>
<%-- <link rel="stylesheet" href="<c:url value="/resources/css/common.css" />">  --%>
<style type="text/css">
th {
   font-size: 10pt;
   margin: 0;
   align: left;
   margin-top: 10px;
}

td{
   margin: 100px;
}

.input-group-addon {
   margin-left: -20px;
}

table{
   border-spacing: 0 20px;
   margin:0 auto;
}

form {
    margin-top: 50px;
    align: center;
    width: 100%;
    height: 100%;
}
form {
		          width: 600px;
          height: 350px;
          margin: 50px auto;
          padding: 15px 10px;
          border-radius: 20px;
          box-shadow: 2px 2px 10px grey;
          box-sizing: border-box;
          position: relative;
}

.from-button{
            width: 100px;
            height: 30px;
            font-weight: bold;
            border: none;
            border-radius: 10px;
            transition: 0.5s ease-in-out;
            color: #333;
            font-size: 13px;
            cursor:pointer;
}
.from-button:hover {
	background-color: #F95E25;
}

a {
  text-decoration: none;
}

.startPage:link {
  color : black;
}
.startPage:visited {
  color : black;
}
.startPage:hover {
  color : black;
}
.startPage:active {
  color : black;
}
input {
	width: 200px;
	height: 2rem;
	border: 3px solid #f8f9fa;
	border-radius: 20px;
	margin-bottom: 15px; 
}
h2{font-size:20px; font-weight:bold; padding:20px 0 30px 0;}
th {font-size:15px;}
</style>

</head>
<body>
<br><br>

<form action="resetpwd.do" method="POST"    onsubmit="return isSame();">
	<ul>
		<li><img src="resources/images/name.png"></li>
		<li><h2 align="center">비밀번호 수정</h2></li>
	</ul>
   <table align="center"  class="table" >
      <input type="hidden" name="userid" value="${ member.userid }" readonly>
      <tr>
         <th width="120">새비밀번호</th>
            <td>
               <input id="upwd1" name="userpwd" type="password" required>
            </td>
      </tr>
      <tr class="textbox">
         <th width="120">새비밀번호 확인</th>
            <td>
               <input id="upwd2" type="password" onblur="isSame();" required>
            </td>
      </tr>
      <tr>
         <th>
            <td>
               <input type="submit" class="from-button" id="check" value="비밀번호변경">
            </td>
         </th>
      </tr>
   </table>

</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<link rel="stylesheet" href="<c:url value="/resources/css/common.css" />"> 
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
   background-color: #f8f9fa;
   padding: 40px;
   border-spacing: 0 20px;
}

form {
    margin-top: 50px;
    align: center;
    width: 100%;
    height: 100%;
}

.from-button{
   width: 7rem;
   height: 1.5rem;
   border: 0px;
   background-color: #f8f9fa;
   cursor: pointer;
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
</style>

</head>
<body>
<br><br>
<h1 align="center">MyGallery</h1>
<h2 align="center">회원 정보 수정 페이지</h2>
<form action="resetpwd.do" method="POST"    onsubmit="return isSame();">
   <table align="center"  class="table" style="text-align:center;">
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
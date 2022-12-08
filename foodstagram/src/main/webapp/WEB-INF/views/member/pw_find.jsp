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

function checkID(){
	//입력된 아이디가 중복되지 않았는지 확인 : jQuery.ajax() 사용
	//jQuery 는 $ 로 줄일 수 있음
	//jQuery.ajax(); => $.ajax();
	if($("#userid").val() == ''){
		alert('아이디를 작성해주세요')
	}else{
		$.ajax({
			url: "idchk.do",
			type: "post",
			data: { userid: $("#userid").val() },
			success: function(data){
				console.log("success : " + data);
				if(data == "ok"){
					alert("존재하지 않는 아이디 입니다.");
					$("#userid").select();
				}else{
					$("#email").focus();
				}
			},
			error: function(jqXHR, textStatus, errorThrown){
				console.log("error : " + jqXHR + ", " + textStatus + ", " + errorThrown);
			}
		});
	}
	return false;  //클릭 이벤트 전달을 막음
}

</script>

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
	margin-left: -30px;
}



form {
    margin-top: 50px;
    align: center;
    width: 100%;
    height: 100%;
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

#check:hover {
	background-color: #F95E25;
}

a {
  text-decoration: none;
}

.startPage:link {
  color : white;
}
.startPage:visited {
  color : white;
}
.startPage:hover {
  color : white;
}
.startPage:active {
  color : white;
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
input {
	width: 200px;
	height: 2rem;
	border: 3px solid #f8f9fa;
	border-radius: 20px;
	margin-bottom: 15px;
}
h2{font-size:20px; font-weight:bold; padding:20px;}
th {font-size:15px;}

</style>
</head>
<body>

<form action="PWDmailCheck.do" method="GET">
	<ul>
		<li><img src="resources/images/name.png"></li>
		<li><h2 align="center">비밀번호 찾기</h2></li>
	</ul>
	<table  style="width: 20%; height: 100px; margin: auto; text-align: center;">
		<tr>
	  		<th width="120">아이디 :</th>
	  		<td>
	  			<input id="userid" name=userid placeholder="아이디" required type="text" onchange="return checkID();"/>
	 		</td>
	 	</tr>
		<tr>
			<th width="120">이메일 : </th>
			<td>
	  			<input id="email" name=email placeholder="이메일" required type="email" />
			</td>
		</tr>
		<tr>
			<th>
				<input type="submit" class="from-button" id="check" value="비밀번호찾기">
			</th>
			<td>
				<a class="from-button" href="loginPage.do"><i class="fa-solid fa-house fa-2x" style="color:#F95E25;"></i></a>
			</td>
		</tr>
  	</table>
</form>
</body>
</html>
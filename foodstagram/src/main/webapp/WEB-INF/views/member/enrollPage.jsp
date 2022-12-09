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
<style type="text/css">
form {
		          width: 600px;
          height: 630px;
          margin: 50px auto;
          padding: 15px 10px;
          border-radius: 20px;
          box-shadow: 2px 2px 10px grey;
          box-sizing: border-box;

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
button, #button {
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
button:hover, #button:hover {background-color: #F95E25;}
</style>
<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.1.min.js"></script>
<script type="text/javascript">

//아이디 중복 체크 확인을 위한 ajax 실행 처리용 함수
//ajax(Asynchronous Javascript And Xml) : 
//페이지를 바꾸지 않고, 서버와 통신하는 기술임 
//(서버측에 서비스 요청하고 결과받음)
function dupCheckId(){
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
					alert("사용 가능한 아이디입니다.");
					$("#upwd1").focus();
				}else{
					alert("이미 사용중인 아이디입니다.\n다시 입력하세요.");
					$("#userid").select();
				}
			},
			error: function(jqXHR, textStatus, errorThrown){
				console.log("error : " + jqXHR + ", " + textStatus + ", " + errorThrown);
			}
		});
	}
	
	return false;  //클릭 이벤트 전달을 막음
}

function validate(){
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
</head>
<body>

	
<form action="enroll.do" method="post" onsubmit="return validate();">
<ul>
		<li><img src="resources/images/name.png"></li>
		<li><h2 align="center">회원가입</h2></li>
	</ul>
<table class="table" align="center" style="position:relative; left:80px;">
	<tr>
		<th>이 름 :</th>
		<td>
			<input type="text" name="username" placeholder="이름" required style="magin: 100px;"></td>
	</tr>
	<tr>
		<th width="120">아이디 :</th>
		<td>
			<input type="text" name="userid" id="userid" placeholder="아이디" required>
			&nbsp;
			<input type="button" class="from-button" value="중복 체크" onclick="return dupCheckId();" style="width: 6rem; cursor:pointer;">
		</td>
	</tr>
	<tr>
		<th width="120">암 호 :</th>
		<td><input type="password" name="userpwd" id="upwd1" placeholder="비밀번호" required></td>
	</tr>
	<tr>
		<th width="120">암호확인 :</th>
		<td><input type="password" id="upwd2" placeholder="비밀번호재확인" onblur="validate();" required></td>
	</tr>
	<tr>
		<th for="email">이메일 :</th>
		<td class="input-group">
			<input type="email" class="form-control" name=email id="email" placeholder="이메일" required>
		</td>
	</tr>
	<tr>
		<th width="120">성 별 :</th>
		<td>
			<input type="radio" name="gender" value="M" required style="width: 1rem; height:1rem; cursor:pointer;"> 남자 &nbsp;
			<input type="radio" name="gender" value="F" required style="width: 1rem; height:1rem; cursor:pointer;"> 여자
		</td>
	</tr>
	<tr>	
		<th width="120">생년월일 :</th>
		<td>
			<input type="date" name="birth_date"/>
		</td>
	</tr>
	<tr>
		<th colspan="2">
		<br><br>
			<input type="submit" class="from-button" value="가입하기"  name="enrolldo" id="button"> &nbsp; 
			<input type="reset" class="from-button" value="작성취소"  id="button"> &nbsp; 
			<button id="button"  style="width:180px;">
			<a class="startPage" href="loginPage.do" style="text-decoration:none;">로그인 페이지 이동</a></button>
		</th>		
	</tr>
</table>
</form>
</body>
</html>
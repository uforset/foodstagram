<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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

table{
	background-color: #f8f9fa;
	padding: 20px;
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
</style>
</head>
<body>
<div height = "150"></div>
<h2 align="center">비밀번호 찾기</h2>
<form action="PWDmailCheck.do" method="GET">
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
				<a class="from-button" href="loginPage.do">시작페이지로 이동</a>
			</td>
		</tr>
  	</table>
</form>
</body>
</html>
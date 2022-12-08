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

/* 아이디 찾기 */ 
function findId_click(){
	var username=$('#username').val()
	var email=$('#email').val()
	
	if(username == '' | email == ''){
		alert("이름 또는 이메일을 입력해주세요.")
	}else{
		$.ajax({
			url:"find_id.do",
			type:"POST",
			data:{"username":username, "email":email} ,
			success:function(data){
				if(data == 0){
					alert("이름 혹은 이메일 정보가 정확하지 않습니다 재입력 해주세요.");
				} else {
					alert("아이디는 : " + data + "입니다.");
				}
			},
			 error:function(){
	                alert("에러입니다");
	            }
		});
	};
};

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

	border-spacing: 0 20px;
}

form {
    margin-top: -200px;
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
form {
		          width: 600px;
          height: 350px;
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
</style>
</head>
<body>
<form>
	
	<ul>
		<li><img src="resources/images/name.png"></li>
		<li><h2 align="center">아이디 찾기</h2></li>
	</ul>
	<table  style="width: 20%; height: 100px; margin: auto; text-align: center;">
			<tr>
				<th width="120">이름 :
				</th>
				<td>
					<input type="text" id="username" name="username" placeholder="이름을 입력해주세요." required>
				</td>
			</tr>
			<tr>
				<th width="120">이메일 : 
				</th>
					<td>
					<input type="email" id="email" name="email" placeholder="이메일을 입력해주세요." required>
					</td>
			</tr>
			<tr>
				<th>
					<button type="button" class="from-button" id='find_id' onclick="findId_click()">아이디 찾기</button>
				</th>
				<td>
				<a class="startPage" href="loginPage.do"><i class="fa-solid fa-house fa-2x" style="color:#F95E25;"></i></a>
				</td>
			</tr>
	</table>
</form>

</body>
</html>
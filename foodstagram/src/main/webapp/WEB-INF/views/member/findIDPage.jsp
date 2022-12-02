<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

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
	background-color: #f8f9fa;
	padding: 20px;
	border-spacing: 0 20px;
}

form {
    margin-top: -200px;
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
<div height = "150"></div>
	<h2 align="center">아이디 찾기</h2>
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
				<a class="startPage" href="loginPage.do">시작페이지로 이동</a>
				</td>
			</tr>
	</table>
</body>
</html>
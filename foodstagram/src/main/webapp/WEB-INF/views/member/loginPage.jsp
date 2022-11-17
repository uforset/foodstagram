<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 로그인</title>
  <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
  <script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.1.min.js"></script>
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
  <script src="https://accounts.google.com/gsi/client" async defer></script>
  <script src="https://apis.google.com/js/platform.js" async defer></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.1.min.js"></script>
  <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
  <script type="text/javascript">
  $.ajax({
	  urt:"",
	  type:'POST',
	  dataType:'json',
	  data:JSON.stringify(sendObject),
	  contentType: 'text/html:charset=UTF-8',
	  mimeType: 'application/json',
	  success:function(data){
		  if(data.MESSAGE){
			  alert("로그인성공");
			  window.location.href="main.html";  
		  }else{
			  alert("아이디 또는 비밀번호를 확인해 주세요.");
		  }
	  },
	  error:function(data,status,er){
		  alert("error : " + data + "status : " + status + "er : " + er);
	  }
  })
  </script>
</head>
<body>
<h1 align="center">FoodStagram</h1>
<form action="login.do" method="post" align="center">
<tr align="center">
			<c:if test="${ !empty message }">
				<th>${ message }
				</th>
			</c:if>
		</tr>
		<table id="logtable" style="width: 300px ; height: 100px; margin: auto; text-align: center;">
			<tr>
				<td ><font size="4">아  이  디 : &nbsp;</font></td>
				<td><input width="300px" height ="10px" type="text" name="userid" class="pos"></td>
				</th>
			</tr>
			<tr>
				<td><font size="4">패스워드 : &nbsp; </font></td>
				<td><input type="password" name="userpwd" class="pos"></td>
			</tr>
			<tr>
				<th colspan="2"><input type="submit" value="로그인">
				</th>
			</tr>
		</table>
		<br>
		<a href="pw_find.do" style="text-decoration:none;">비밀번호찾기</a>
<br><br>
<table>
<!-- 네이버 로그인 버튼 노출 영역 -->
  <div align="center" id="naver_id_login" ></div><br>
  <!-- //네이버 로그인 버튼 노출 영역 -->
  <script type="text/javascript">
  	var naver_id_login = new naver_id_login("Vj4dFHCEvSx5oz95b7Ws", "http://localhost:8080/foodstagram/");
  	var state = naver_id_login.getUniqState();
  	naver_id_login.setButton("white", 2,40);
  	naver_id_login.setDomain("http://localhost:8080/foodstagram/");
  	naver_id_login.setState(state);
  	naver_id_login.init_naver_id_login();
  </script>
  <!-- 구글 로그인 -->
  <script>
        function handleCredentialResponse(response) {
        	const responsePayload = parseJwt(response.credential);
        	console.log("ID: " + responsePayload.sub);
            console.log('Full Name: ' + responsePayload.name);
            console.log('Given Name: ' + responsePayload.given_name);
            console.log('Family Name: ' + responsePayload.family_name);
            console.log("Image URL: " + responsePayload.picture);
            console.log("Email: " + responsePayload.email);
        }
        function parseJwt (token) {
            var base64Url = token.split('.')[1];
            var base64 = base64Url.replace(/-/g, '+').replace(/_/g, '/');
            var jsonPayload = decodeURIComponent(atob(base64).split('').map(function(c) {
                return '%' + ('00' + c.charCodeAt(0).toString(16)).slice(-2);
            }).join(''));

            return JSON.parse(jsonPayload);
        };
        window.onload = function () {
          google.accounts.id.initialize({
            client_id: "134558823520-frjf75vdh2eia14jqkkrfaqlcme9cvkm.apps.googleusercontent.com",
            callback: handleCredentialResponse
          });
          google.accounts.id.renderButton(
            document.getElementById("buttonDiv"),
            { theme: "outline", size: "large" }  // customization attributes
          );
          google.accounts.id.prompt(); // also display the One Tap dialog
        }
    </script>
    <div align="center" id="buttonDiv"></div>
    
    <br>
    <!-- 카카오 로그인 -->
    <script type="text/javascript">
    Kakao.init('a6d2a7aa522e1a56f705fac9d21e56e1');
    console.log(Kakao.isInitialized());
    function kakaoLogin(){	
    	Kakao.Auth.login({	
    		success : function(response) {				
    			Kakao.API.request({
    				url : '/v2/user/me',
    				success : function(response) {
    					console.log(response)
    				},
    				fail : function(error) {
    					console.log(error)
    				},
    			})
    		},
    		fail : function(error) {
    			console.log(error);				
    		},
    	})
    }

    //카카오로그아웃  
    function kakaoLogout() {
        if (Kakao.Auth.getAccessToken()) {
          Kakao.API.request({
            url: '/v1/user/unlink',
            success: function (response) {
            	console.log(response)
            },
            fail: function (error) {
              console.log(error)
            },
          })
          Kakao.Auth.setAccessToken(undefined)
        }
    }  
    </script>
    <center>
	<img src="${ pageContext.servletContext.contextPath }/resources/images/kakao_login.png" 
	onclick="kakaoLogin();"> <br>
</center>
</table>
<br><br><br><br>
<a href="enrollPage.do" style="text-decoration:none;">회원가입</a>
</form>
</body>
</html>
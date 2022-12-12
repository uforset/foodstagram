<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<link href="resources/css/reset.css" rel="stylesheet">
<link href="resources/css/style.css" rel="stylesheet">
<style>
body {
	margin: 0 auto;

}

img {
	margin: 15px 0;
}

#wrap {
	text-align: center;
}

.boxImg {
	position: relative;
	margin: 0 auto;
	background-color: pink;
	width: 465px;
}

/* 건들지마라 */
.box {
	margin: 0 auto;
	position: absolute;
	right: 250px;
}

li img {
	width: 250px;
	height: 541px;
	overflow: hidden;
	object-fit: cover;
	position: absolute;
	left: -96px;
	top: 27px;
}

.loginBtn:hover {
	cursor: pointer;
	background-color: #F95E25;
}

form {
	width: 400px;
	height: 750px;
	margin: 50px auto;
	padding: 15px 10px;
	border-radius: 20px;
	box-shadow: 2px 2px 10px grey;
	box-sizing: border-box;
	position: relative;
	left: 170px;
}

td a:hover {
	color: red;
}

.btn:hover {color:#F95E25;}
</style>
<meta charset="UTF-8">
<title>회원 로그인</title>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.1.min.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="https://accounts.google.com/gsi/client" async defer></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript"
	src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.1.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript">
        //애플리케이션 등록하고 발급받은 javascript 앱키를 사용해야 함
        Kakao.init('a6d2a7aa522e1a56f705fac9d21e56e1');
        //sdk 초기화여부 판단
        console.log(Kakao.isInitialized());

        //카카오 로그인
        function kakaoLogin() {
          Kakao.Auth.login({
            success: function (response) {
              Kakao.API.request({
                url: '/v2/user/me',
                success: function (response) {
                  console.log(response)
                },
                fail: function (error) {
                  console.log(error)
                },
              })
            },
            fail: function (error) {
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
        
        
        /*아이디 쿠키에 적용하기*/
        $(document).ready(function(){
        	//저장된 쿠기값 가져오기
            var userInputId = getCookie("userInputId");
            
        	//저장된 아이디 쿠키값이 있고
            if((userInputId != null || userInputId != "") && userInputId.length > 0){
                // 아이디 저장하기가 체크되어있다면
                if($("#idSaveCheck").attr("checked") == true){ 
                	// ID 값을 input 에 출력하기함
                	$("input[name='userid']").val(userInputId); 
                }
            }    
             
         	// 아이디 기억하기 체크박스의 체크상태의 변화가 발생했다면
            $("#idSaveCheck").change(function(){ 
            	// 아이디 기억하기 체크박스가 체크된 상태이면
                if($("#idSaveCheck").is(":checked")){ 
                    var userInputId = $("input[name='userid']").val();
                    if(userInputId != "" && userInputId.length > 0){
        	         	// 쿠키에 입력된 userid 를 7일 동안 기록 저장함
        	            setCookie("userInputId", userInputId, 7); 
                    }
                }else{ // 아이디 기억하기 체크 해제 시,
                    deleteCookie("userInputId"); //쿠키에 저장된 아이디 삭제함
                }
            });
             
            // 아이디 기억하기를 체크한 상태에서 userid를 입력하는 경우에도 쿠키에 저장되게 함.
            $("input[name='userid']").keyup(function(){ // userid 입력 칸에 아이디를 입력할 때,
                if($("#idSaveCheck").is(":checked")){ // ID 저장하기를 체크한 상태라면,
                    var userInputId = $("input[name='userid']").val();
                    setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
                }
            });
        });  //jQuery.document.ready
         
        function setCookie(cookieName, value, exdays){
            var expireDate = new Date();
            expireDate.setDate(expireDate.getDate() + exdays);
            var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + expireDate.toGMTString());
            document.cookie = cookieName + "=" + cookieValue;
        }
         
        function deleteCookie(cookieName){
            var expireDate = new Date();
            expireDate.setDate(expireDate.getDate() - 1);
            document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
        }
         
        function getCookie(cookieName) {
            cookieName = cookieName + '=';
            var cookieData = document.cookie;
            var start = cookieData.indexOf(cookieName);
            var cookieValue = '';
            if(start != -1){
                start += cookieName.length;
                var end = cookieData.indexOf(';', start);
                if(end == -1)end = cookieData.length;
                cookieValue = cookieData.substring(start, end);
            }
            return unescape(cookieValue);
        }
        
        
      </script>
<script>
        var index = 0; //이미지에 접근하는 인덱스
        window.onload = function () {
          slideShow();
        }

        function slideShow() {
          var i;
          var x = document.getElementsByClassName("item"); //slide1에 대한 dom 참조
          for (i = 0; i < x.length; i++) {
            x[i].style.display = "none"; //처음에 전부 display를 none으로 한다.
          }
          index++;
          if (index > x.length) {
            index = 1; //인덱스가 초과되면 1로 변경
          }
          x[index - 1].style.display = "inline"; //해당 인덱스는 block으로
          setTimeout(slideShow, 2000); //함수를 4초마다 호출

        }
      </script>
</head>

<body>

	<div id="wrap">
		<div class="boxImg">
			<div class="box">
				<img src="resources/images/box.png">
			</div>
			<span>
				<li class="item"><img src="resources/images/box2.png" alt=""></li>
				<li class="item"><img src="resources/images/box1.png" alt=""></li>
				<li class="item"><img src="resources/images/box3.png" alt=""></li>
			</span>
		</div>

		<form action="login.do" method="post" align="center">
			<h1 align="center" style="margin-top: 5px;">
				<a href="#"><img src="resources/images/name.png"></a>
			</h1>
			<tr align="center">
				<c:if test="${ !empty message }">
					<th>${ message }</th>
				</c:if>
			</tr>
			<table id="logtable"
				style="width: 300px; height: 100px; margin: auto; text-align: center;">
				<tr>
					<td><font size="4">아 이 디 &nbsp;</font></td>
					<td><input type="text" name="userid" class="pos"
						style="width: 200px; height: 2rem; border: 3px solid #f8f9fa; border-radius: 20px; margin-bottom: 15px;">
					</td>
					</th>
				</tr>
				<tr>
					<td><font size="4">패스워드 &nbsp; </font></td>
					<td><input type="password" name="userpwd" class="pos"
						style="width: 200px; height: 2rem; border: 3px solid #f8f9fa; border-radius: 20px;"></td>
				</tr>
				<tr>
					<th colspan="2"><input type="submit" value="로그인"
						class="loginBtn"
						style="width: 296px; height: 40px; font-weight: bold; border: none; border-radius: 10px; transition: 0.5s ease-in-out; color: #333;font-size: 16px; margin: 20px 0 10px 0;">
					</th>
				</tr>
			</table>
			<br> <a href="findIDPage.do"
				class="btn" style="text-decoration: none; padding: 5px; border-radius: 10px; hover: background-color: #F95E25;">아이디찾기
			</a>|
			<td><a href="pw_find.do"
				class="btn" style="text-decoration: none; padding: 5px; border-radius: 10px;">비밀번호찾기
			</a>|<a href="enrollPage.do"
				class="btn" style="text-decoration: none; padding: 5px; border-radius: 10px;">회원가입</a>
				<div class="id_remember" style="padding: 20px 0; ">
					<input type="checkbox" id="idSaveCheck" > 아이디 기억하기
				</div>
				<table>
					<center>		
	<!-- 카카오 로그인 창으로 이동 -->
	<div id="kakao_id_login" class="kakao_id_login" style="text-align: center">
	<a href="<c:url value='${kakaoUrl}'/>" class="cp"> 
		<img width="230" height="60" src="${ pageContext.servletContext.contextPath }/resources/images/kakao_login.png" alt="카카오로그인">
	</a>
	</div>

</center>
<center>
<!-- 네이버 로그인 화면으로 이동 시키는 URL -->
<!-- 네이버 로그인 화면에서 ID, PW를 올바르게 입력하면 callback 메소드 실행 요청 -->
<div id="ndfin" style="text-align:center">
	<a href="${naverUrl}" id='.cp_naver'>
		<img width="230" height="60" src="${ pageContext.servletContext.contextPath }/resources/images/naver.png" alt="네이버로그인">
	</a>
</div>

</center>
<center>
<!-- 구글 로그인 화면으로 이동 시키는 URL -->
<!-- 구글 로그인 화면에서 ID, PW를 올바르게 입력하면 oauth2callback 메소드 실행 요청-->
<div id="google_id_login" style="text-align:center">
	<a href="${googleUrl}">
		<img width="230" height="60" src="${pageContext.request.contextPath}/resources/images/google.png" alt="구글로그인">
	</a>
</div>
</center>
				</table> <br>
		</form>
	</div>
</body>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" rel="stylesheet">
    <script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.1.min.js"></script>
    <title></title>
    <style>
        * {
    font-family: system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
    font-size: 14px;
}
/* 네브 및 로고 */
nav {
    background-color: white;
    /* border-bottom: 1px solid #E5E5E5; */
    width: 1200px;
    margin: 0 auto;
    margin-bottom: -20px;
    padding-top: 30px;
    padding-bottom: -10px;
}
nav ul {
    display: flex;
    text-align: center;
}
nav ul .searchBox {
    position: relative;
    left: 150px;
    padding-left: 30px;
}
nav ul li ol {
    display: flex;
}
.logo {
    width: 40px;
}
.h1 {
	height: 32px;
    margin-left: 10px;
    font-size: 32px;
    font-weight: 700;
    letter-spacing: -3px;
    background: linear-gradient(to right top, rgb(240, 216, 83) 15%, rgb(255, 36, 16) 70%);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
}
nav ul li ol:first-child {
    margin-right: -15px;
}
nav ul li:last-child ol li a {
    margin-left: 30px;
}
i {
    color: #E5E5E5;
    transition: 0.6s ease-out;
}
i:hover {
    color: #F95E25;
}
/* 이미지 및 이미지크기 고정 설정 */
/* 동그란 프로필 이미지 */
#profile {
    width: 33px;
    border-radius: 50%;
    overflow: hidden;
}
#profile img {
    max-width: 100%;
    height: auto;
    display: block;
}
#shareBtn:hover {
    display: block;
    cursor: pointer;
}
#shareBtn {
    padding: 0 10px 0 10px;
    position: relative;
    top: 10px;
    left: 5px;
}
.shareContent {
    display: none;
    position: absolute;
    z-index: 1;
    font-weight: 900;
    background-color: #ececec;
    min-width: 200px;
    transition: 0.5s ease-in-out;
    border-radius: 20px;
}
.shareContent a {
    display: block;
    color: rgb(37, 37, 37);
    font-size: 14px;
    padding: 12px 20px;
}
.shareContent:hover {
    background-color: #F95E25;
}
.share:hover .shareContent {
    display: block;
}
.noneRead {
    width: 5px;
    height: 5px;
    background-color: red;
    border-radius: 50%;
}
.searchBtn {
    position: relative;
    bottom: 33px;
    left: 160px;
    border-radius: 10px;
    background-color: white;
    border: none;
    font-size: 16px;
    transition: 0.5s ease-out;
}
.searchBtn:hover {
   color:#F95E25;
}
li {list-style: none;}
</style>
<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.1.min.js"></script>
    <script type="text/javascript">
   $(function(){
	   var memberid = "${member.userid}";
	   var loginuserid = "${loginMember.userid}";
	   var call = "";
	   var userid;
	   if(memberid === loginuserid){
	      userid ="${loginMember.userid}";
	   }else{
	      userid ="${member.userid}";
	   } 
	   
      $.ajax({
         url: "/foodstagram/readCheck.do",
         type: "get",
         data: { userid: userid },
         dataType: 'json',
         success: function(data, jqXHR, textStatus){
            //alert("readcheck : " + data.read);
            if( data.read == "read" ) {
               //
            } else {
               console.log("hi");
               $("ol.navlist").append("<li class='noneRead'></li>");
               
            }
         },
         error: function(jqXHR, textStatus, errorThrown){
            console.log("xxxxxxxxxxxxxxxxxxxx");
            console.log(jqXHR + ", " + textStatus + ", " + errorThrown);
         }
      });
   });
   </script>
    <script src="https://kit.fontawesome.com/6478f529f2.js" crossorigin="anonymous"></script>

    <script>
        function Change2() {
            var key = test2.value;
            if (key == 1) {
                document.all["d4"].style.display = "block";
                document.all["d5"].style.display = "none";
                document.all["d6"].style.display = "none";
            }
            if (key == 2) {
                document.all["d4"].style.display = "none";
                document.all["d5"].style.display = "block";
                document.all["d6"].style.display = "none";
            }
            if (key == 3) {
                document.all["d4"].style.display = "none";
                document.all["d5"].style.display = "none";
                document.all["d6"].style.display = "block";
            }
        }
    </script>
</head>

<body>
   <nav>
        <ul>
            <!--클릭시 홈으로이동-->
            <li>
                <ol>
                    <li><a href="${ pageContext.servletContext.contextPath }/main.do"> <img src="/foodstagram/resources/images/logo.png" class="logo"></a></li>
                    <li><a href="${ pageContext.servletContext.contextPath }/main.do">
                            <h1 class="h1">𝓕𝓸𝓸𝓭𝓼𝓽𝓪𝓰𝓻𝓪𝓶</h1>
                        </a>
                    </li>
                    <li class="share">
                        <i class="fas fa-regular fa-chevron-down fa-1x" id="shareBtn">
                            <div class="shareContent"><a href="${ pageContext.servletContext.contextPath }/logout.do">로그아웃</a></div>
                        </i></a>
                    </li>
                </ol>
            </li>

            <li style="text-align: center;">
                <span>
                    <select id="test2" onchange="Change2()"
                        style="width: 100px;height:2.5rem; border:none; top:48px;text-align:center; right:308px;">
                        <option value="1">음식 키워드</option>
                        <option value="2">다른 사용자</option>
                        <option value="3">여행지</option>
                    </select>

                    <span id="d4" style="position:relative; bottom: 40px; left: 190px;">
                        <form action="bsearch.do" method="get">
                        	<select type="search" name="b_category"  placeholder="'음식명'을 입력해주세요" required
                                style="width: 260px;height:2.5rem; border:3px solid #f8f9fa; border-radius: 20px;">
                        		<option value="갈비탕">갈비탕
                              	<option value="과일채소샐러드">과일채소샐러드
                              	<option value="닭갈비">닭갈비
                              	<option value="마르게리따피자">마르게리따피자
                              	<option value="마카롱">마카롱
                              	<option value="모듬초밥">모듬초밥
                              	<option value="바게트빵">바게트빵
                              	<option value="순대국밥">순대국밥
                              	<option value="순살찜닭">순살찜닭
                              	<option value="스테이크">스테이크
                              	<option value="스튜">스튜
                        	</select>
                            <input type="submit" class="searchBtn" value="검색">
                        </form>
                    </span>
                    <span id="d5" style="display: none;position:relative; bottom: 40px; left: 190px;">
                        <form action="searchUser.do" method="get">
                            <input type="search" name="keyword" placeholder="'아이디'를 입력해주세요" required
                                style="width: 260px;height:2.5rem; border:3px solid #f8f9fa; border-radius: 20px;">
                            <button onclick="searchUser.do" class="searchBtn" type="submit" name="검색">검색</button>

                        </form>
                    </span>
                    <span id="d6" style="display: none;position:relative; bottom: 40px; left: 190px;">
                        <form action="searchLocalstore.do" method="get">
                            <input type="search" name="keyword" placeholder="'지역명 맛집'을 입력해주세요" required
                                style="width: 260px;height:2.5rem; border:3px solid #f8f9fa; border-radius: 20px;"> 
                           <button onclick="searchLocalstore.do" class="searchBtn" type="search" name="keyword">검색</button>

                        </form>
                    </span>
            </li>
            <!--실행메뉴들 순서대로 홈(메인페이지), 친구메신저, 게시물 등록(촬영 및 업로드), 내프로필(마이페이지), 공지사항 이동 -->
            <li style="width: 350px;margin-left: 350px;">
                <ol class="navlist">
                    <li><a href="${ pageContext.servletContext.contextPath }/main.do"><i class="fa-solid fa-house fa-2x"></i></a></li>
                    <li><a href="${ pageContext.servletContext.contextPath }/chatting.do"><i class="fa fa-light fa-user-group fa-2x"></i></a></li>
                    <c:if test="${ (!empty sessionScope.loginMember and !empty sessionScope.sns) or sessionScope.loginMember.admin ne 'Y'}">
	                    <li><a href="${ pageContext.servletContext.contextPath }/selectbwform.do"><i class="fa-solid fa-camera-retro fa-2x"></i></a></li>
	                </c:if>
               

                    <!--밑부분은 사용자의 프로필이 뜨는 부분으로 예시를 위해 넣어음 -->
                    <c:url var="callMyinfo" value="/myinfo.do">
                        <c:param name="userid" value="${ loginMember.userid }" />
                    </c:url>
                    <li><a href="${ callMyinfo }"><img src="/foodstagram/resources/images/profile.jpg" id="profile"></a></li>
                    <!-- <li><a href="${ pageContext.servletContext.contextPath }/myinfo.do"><img src="resources/images/profile.jpg" id="profile"></a></li> -->
                    <li><a href="${ pageContext.servletContext.contextPath }/nlist.do"><i class="fa-solid fa-bell fa-2x"></i></a></li>
                    <%-- <c:if test="${ read eq 'unread'}" ><li class="noneRead"></li></c:if> --%>
                </ol>
            </li>
        </ul>
    </nav>

</body>

</html>

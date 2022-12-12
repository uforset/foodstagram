<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="../common/error.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="resources/css/reset.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" rel="stylesheet">
    <title>mypage</title>
    <style>
        /* 메인페이지 */
        section {
            margin: 0 auto;
            width: 930px;
            background-color: #FAFAFA;
        }

        td img {
            width: 290px;
            height: 290px;
            border: 10px solid #FAFAFA;
            overflow: hidden;
            object-fit: cover;
        }

        /* 모달창 */
        .modal {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .modal .bg {
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.6);
        }

        .modalBox {
            position: absolute;
            background-color: #fff;
            width: 900px;
            height: 550px;
            padding: 10px;
            /* overflow: hidden; */
        }

        .modalBox button {
            display: block;
            width: 80px;
            margin: 0 auto;
        }

        .hidden {
            display: none;
        }

        .myPost img {
            width: 33px;
            height: 33px;
            border-radius: 50%;
            object-fit: cover;
            border: none;
            margin-bottom: 10px;
        }

        .closeBtn {
            display: inline-block;
            position: relative;
            bottom: 50px;
            left: 900px;
            cursor: pointer;
            display: block;
        }

        .closeBtn a {
            display: block;
        }

        .dot {
            display: inline-block;
            position: relative;
            left: 870px;
            bottom: 10px;
            cursor: pointer;
            display: block;
        }

        .dot i {
            color: #ececec;
        }

        .dot a {
            display: block;
        }

        .dot i:hover {
            color: #F95E25;
        }

        .modalImg img {
            display: inline-block;
            position: relative;
            right: 35px;
            width: 450px;
            height: auto;
            object-fit: cover;
            border: none;
        }

        ul:not(.replyList) {
            display: flex;
        }

        ul li:not(.modalImg) {
            position: relative;
            left: -10px;
        }

        ul li ol {
            display: flex;
        }

        .id {
            position: relative;
            bottom: 20px;
            font-weight: bold;
        }

        .modalContent {
            padding-bottom: 20px;
            border-bottom: 1px solid #E5E5E5;
            width: 435px;
            height: 100px;
            margin-bottom: 10px;
            font-size: 14px;
            overflow: auto;
        }

        .modalContent span a {
            color: rgb(116, 77, 116);
        }

        /* 하트, 댓글 */

        .lr {
            position: relative;
            top: 380px;
            right: 430px;
            border-bottom: 1px solid #E5E5E5;
            width: 435px;
            padding: 5px 0 10px 0
        }

        .lr li {
            margin-left: 18px;
        }

        .fa-heart:hover {
            color: red;
        }

        .countingLike {
            font-weight: bold;
        }

        .resetBtn a {
            padding: 5px;
            display: block;
        }

        #recipe,
        #restaurant {
            width: 80px;
            height: 30px;
            font-weight: bold;
            border: none;
            border-radius: 10px;
            transition: 0.5s ease-in-out;
            color: #333;
            background-color: #E5E5E5;
            font-size: 13px;
        }

        #restaurant:hover {
            background-color: #F95E25;
        }

        #recipe:hover {
            background-color: #F95E25;
        }

        .replyBox {
            position: relative;
            top: 475px;
            right: 430px;
        }

        .replyRig {
            width: 400px;
            height: 25px;
            border-radius: 30px;
            background-color: #F0F0F0;
            border: #F0F0F0;
            transition: 0.5s ease-out;
        }


        .replyBtn {
            width: 80px;
            border: none;
            display: block;
            position: relative;
            left: 30px;
            bottom: -6px;
            font-weight: bold;
            color: #333;
            cursor: pointer;
            margin-left: -100px;
        }

        .replyBtn:hover {
            display: block;
            color: #F95E25;
        }

        .replyList {
            position: relative;
            top: 345px;
            right: 440px;
            width: 415px;
            height: 80px;
            padding: 10px;
            overflow: auto;
        }

        .replyList li {
            margin-bottom: 5px;
        }

        .mypageInfo {
            padding: 20px 10px;
            width: 880px;
            height: 130px;
            border-bottom: 1px solid #E5E5E5;
        }

        .mypageImg img {
            width: 70px;
            height: 70px;
            border-radius: 50%;
            object-fit: cover;
            border: none;
            margin: 10px;
        }

        .mypageInfo li {
            margin-left: 15px;
        }

        .mypageInfo li:nth-child(2) {
            height: 30px;
            line-height: 30px;
        }

        #id {
            font-weight: bold;
            font-size: 16px;
        }

        .updateProfile,
        .adminMember {
            width: 100px;
            height: 30px;
            font-weight: bold;
            border: none;
            border-radius: 10px;
            transition: 0.5s ease-in-out;
            color: #333;
            background-color: #E5E5E5;
            font-size: 13px;
        }
        

        .adminMember {
            width: 100px;
            height: 30px;
            font-weight: bold;
            border: none;
            border-radius: 10px;
            transition: 0.5s ease-in-out;
            color: #333;
            background-color: #E5E5E5;
            font-size: 13px;
        }

        
        .logout,
        .updateProfile,
        .adminMember {
            width: 100px;
            height: 30px;
            font-weight: bold;
            border: none;
            border-radius: 10px;
            transition: 0.5s ease-in-out;
            color: #333;
            background-color: #E5E5E5;
            font-size: 13px;
        }
        
        .delbutton {
            width: 100px;
            height: 30px;
            font-weight: bold;
            border: none;
            background-color: #FAFAFA;
            text-decoration:underline;
            border-radius: 10px;
            position:relative;
            left:710px;
            bottom:15px;
            
        }

        .adminMember:hover,
        .updateProfile:hover, .logout:hover, {


        .adminMember:hover,
        .updateProfile:hover {

            background-color: #F95E25;
        }

        .mypageInfo li ul:nth-child(3) {
            font-weight: bold;
            margin-bottom: 10px;
        }

        .old {margin-left: 10px;}

        .old, .new {
            width: 130px;
            height: 30px;
            font-weight: bold;
            border: none;
            border-radius: 10px;
            transition: 0.5s ease-in-out;
            color: #333;
            background-color: #E5E5E5;
            font-size: 14px;
        }

        .old:hover, .new:hover {
            background-color: #F95E25;
        }

        .chatBot {
            position: fixed;
            bottom: 3%;
            right: 10%;
            width: 150px;
            height: 150px;
            background-color: pink;
        }
    </style>
</head>
<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.1.min.js"></script>
<script type="text/javascript">
var userid = "${member.userid}";
var loginuserid = "${loginMember.userid}";
var call = "";

if(userid === loginuserid){

   call ="blistmy.do";
}else{
   call ="blistfriend.do";

	call ="blistmy.do";
}else{
	call ="blistfriend.do";

}
<!-- 게시글 리스트 출력처리 -->
$(function(){
   
   
   $.ajax({
      url: call,
      type: "post",
      dataType: "json",
      data: {
         userid: "${sessionScope.loginMember.userid}"
      },
      success: function(data){

         var jsonStr = JSON.stringify(data);
         var json = JSON.parse(jsonStr);
         
         var bvalues = "";
         var count = 1;
         for(var i in json.list){
            if(count % 3 == 1){
               bvalues += "<tr>";
            }
            bvalues +=  '<td><a href="bdetail.do?b_no=' + json.list[i].atch_parent_no + '"><img src="resources/board_upfiles/' + json.list[i].atch_file_name + '" class="openBtn"></a></td>';
            count++;
            if(count % 3 == 1){
               bvalues += "</tr>";
               }
         }
         if(count != 4){

            for(var n = count; n <= 3; n++){
               bvalues += "<td>&nbsp;</td>";
            }
            bvalues += "</tr>";
         }
         $("#blist").html($("#blist").html() + bvalues);
         
         $("#lSize").html("게시물 " + json.list.length);
         
         
      },
      error: function(jqXHR, textStatus, errorThrown){

         console.log("blist error : " + call + "," +jqXHR 

         console.log("btop3 error : " + jqXHR 

               + ", " + textStatus + ", " + errorThrown);
      }
   });      
});
</script>
<c:import url="/WEB-INF/views/common/nav.jsp" />
<body>
    <section>
        <ul class="mypageInfo">
            <li class="mypageImg"><a href="#"><img src="resources/images/profile.jpg"></a></li>
            <li>
                <ul>

                   <c:url var="callMyinfo" value="/myinfo.do">
                        <c:param name="userid" value="${ member.userid }" />
                    </c:url>
                    <li><a href="${ callMyinfo }"><span id="id">${ member.userid }</span></a></li> 
                     <c:url var="moveup" value="/moveup.do">
                        <c:param name="userid" value="${ member.userid }"/>
                     </c:url>
                    <li><a href="${ moveup }" ><button class="updateProfile">프로필 편집</button></a></li>
                    <!-- 관리자로그인일때 회원관리 버튼이 나타나야함 -->
                    <c:if test="${ empty sessionScope.sns }">
	                    <c:if test="${ !empty sessionScope.loginMember and sessionScope.loginMember.admin eq 'Y'}">
	                         <li><a href="${ pageContext.servletContext.contextPath }/mmlist.do"><button class="adminMember">회원관리</button></a></li>  
	                    </c:if>

                	<c:url var="callMyinfo" value="/myinfo.do">
                        <c:param name="userid" value="${ member.userid }" />
                    </c:url>
                    <li><a href="${ callMyinfo }"><span id="id">${ member.userid }</span></a></li> 
                  	<c:url var="moveup" value="/moveup.do">
                     	<c:param name="userid" value="${ member.userid }"/>
                  	</c:url>
                    <li><a href="${ moveup }" ><button class="updateProfile">프로필 편집</button></a></li>
                    <!-- 관리자로그인일때 회원관리 버튼이 나타나야함 -->
                    <c:if test="${ !empty sessionScope.loginMember and sessionScope.loginMember.admin eq 'Y'}">
                   		<li><a href="${ pageContext.servletContext.contextPath }/mmlist.do"><button class="adminMember">회원관리</button></a></li>  

                    </c:if>
                </ul>
                <ul>
                    <li id="lSize"></li>
                    <li>친구 10명</li>
                </ul>

                <ul>이름 : ${ member.username }</ul>
                <c:url var="mdel" value="/mdel.do">
	                  <c:param name="userid" value="${ member.userid }"/>
	               </c:url>
	                     <button class="delbutton"><a href="${ mdel }">탈퇴하기</a></button>
            </li>
        </ul>
        <c:if test="${ empty sessionScope.sns }">
	        <c:if test="${ !empty sessionScope.loginMember and (sessionScope.loginMember.admin ne 'Y' or !empty sessionScope.sns)}">
	         <table class="mainPage" id="blist">
	         <!-- 게시글 출력 영역 -->
	         </table>
	        </c:if>
        </c:if>
      
    </section>
    <!-- TWC chatbot Scripts -->
   <script src="https://public-common-sdk.s3.ap-northeast-2.amazonaws.com/sdk/seller/Twc.plugin.js"></script>

   <script>
   (function() {
       Twc('init', {
         brandKey: "m0qEkQGszGQPOJycVHShoA",
         channelType: "scenario",
      scenarioId: "Njk=",
         buttonOption: {
           showLauncher: true,
           zIndex: 10,
           bottom: 25,
           right: 25
             }
        })
   })();
   </script>
   <!--  End TWC chatbot Scripts -->


    <script src="https://kit.fontawesome.com/6478f529f2.js" crossorigin="anonymous"></script>
    <script>
        // 모달창
        const open = () => {
            document.querySelector(".modal").classList.remove("hidden");
        }

        const close = () => {
            document.querySelector(".modal").classList.add("hidden");
        }

        document.querySelector(".openBtn").addEventListener("click", open);
        document.querySelector(".closeBtn").addEventListener("click", close);
        document.querySelector(".bg").addEventListener("click", close);

    </script>
</body>

</html>
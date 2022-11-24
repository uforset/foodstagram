<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp" %>
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
    <title>Foodstagram</title>
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
        }

        .modalBox button {
            display: block;
            width: 80px;
            margin: 0 auto;
        }

        .hidden {
            display: none;
        }

        #otherProfile img {
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

        .addFriend {
            padding: 5px;
            margin-left: 20px;
            position: relative;
            bottom: 20px;
            font-weight: bold;
            border: 1px solid #E5E5E5;
            color: #F95E25;
            border-radius: 10px;
            font-size: 14px;
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

        /* 하트, 댓글등 */

        .lr {
            position: relative;
            top: 380px;
            right: 430px;
            border-bottom: 1px solid #E5E5E5;
            width: 435px;
            height: 33px;
            line-height: 33px;
            padding: 5px 0 10px 0;
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

        .chatBot {
            position: fixed;
            bottom: 3%;
            right: 10%;
            width: 150px;
            height: 150px;
            background-color: pink;
        }
        
        .searchBtn{
        	position:relative;
        	bottom: 33px;
        	left: 90px;
        	border-radius: 10px;
        	background-color: pink;
        }
        
    </style>
</head>
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

<body>
 <c:import url="/WEB-INF/views/common/nav.jsp" />
    <section>
        <table class="mainPage">
            <tr>
                <td>
                    <a href="#"><img src="resources/images/test1.png" class="openBtn"></a>
                    <!-- 이미지 클릭시 모달창 -->
                    <div class="modal hidden">
                        <div class="bg"></div>
                        <div class="modalBox">
                            <ul>
                                <div class="dot"><a href="#"><i class="fa-solid fa-ellipsis fa-2x"></i></a></div>
                                <div class="closeBtn"><a href="#"><i class="fa-solid fa-x"></i></a></div>
                                <!-- 컨텐츠 이미지 -->
                                <a href="#">
                                    <li class="modalImg"><img src="resources/images/test1.png"></li>
                                </a>
                                <li>
                                    <!-- 다른 유저의 프로필사진, id, 글쓴내용, 지도  -->
                                    <ol>
                                        <li>
                                            <span id="otherProfile"><a href="#"><img
                                                        src="resources/images/test3.png"></a></span>
                                            <span class="id">like_summer</span>
                                            <span class="addFriend"><a href="#">친구 추가</a></span>
                                            <p class="modalContent">오늘은 춥다 ㅠ<span><a href="#"><br>#겨울</a></span>
                                            </p>
                                            <!-- 임시 -->
                                            <iframe
                                                src="https://www.google.com/maps/embed?pb=!1m16!1m12!1m3!1d25311.64860821957!2d126.86131198716856!3d37.53253268002548!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!2m1!1z7YyM7Iqk7YOA!5e0!3m2!1sko!2skr!4v1667037455409!5m2!1sko!2skr"
                                                width="435" height="200" style="border:0;" allowfullscreen=""
                                                loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>

                                        </li>
                                        <li>
                                            <ol class="lr">
                                                <!-- 좋아요 수 -->
                                                <li><a href="#">
                                                        <i class="fa-solid fa-heart"></i>
                                                        <span class="countingLike">255</span>
                                                    </a>
                                                </li>
                                                <!-- 댓글 -->
                                                <li class="reply"><a href="#"><i class="fa-regular fa-message"></i></a>
                                                </li>
                                                <li><i class="fa-solid fa-paper-plane"></i></li>
                                                <li><a href="#"><button id="recipe">레시피</button></a></li>
                                                <li><a href="#"><button id="restaurant">주변맛집</button></a></li>

                                            </ol>
                                            <div>
                                                <ul class="replyBox">
                                                    <li><input class="replyRig"></li>
                                                    <li><span class="replyBtn">댓글등록</span></li>
                                                    <!-- 새로고침 -->
                                                    <li class="resetBtn"><a href="#">
                                                            <i class="fa-solid fa-arrows-rotate"></i>
                                                        </a></li>
                                                </ul>
                                                <ul class="replyList">
                                                    <li>댓글</li>
                                                    <li>댓글</li>

                                                </ul>

                                            </div>
                                        </li>
                                    </ol>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <!--modal-->
                </td>

                <td><a href="#"><img src="resources/images/test2.png" class="image"></a></td>
                <td><a href="#"><img src="resources/images/test3.png" class="image"></a></td>
            </tr>
            <tr>
                <td><a href="#">4</a></td>
                <td><a href="#">5</a></td>
                <td><a href="#">6</a></td>
            </tr>
            <tr>
                <td><a href="#">7</a></td>
                <td><a href="#">8</a></td>
                <td><a href="#">9</a></td>
            </tr>
        </table>
    </section>

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
    <script src="https://kit.fontawesome.com/6478f529f2.js" crossorigin="anonymous"></script>
</body>

</html>
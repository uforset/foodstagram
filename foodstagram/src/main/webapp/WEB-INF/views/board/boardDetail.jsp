<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="../common/error.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="./css/reset.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" rel="stylesheet">
    <link href="./css/style.css" rel="stylesheet">
    <title>게시물</title>
    <style>
        section {
            width: 950px;
            margin: 40px auto;
            padding: 20px 10px;
            border-radius: 20px;
            box-shadow: 2px 2px 10px grey;
            box-sizing: border-box;
        }

        .content {
            margin-left: 15px;
        }

        #otherProfile img {
            width: 33px;
            height: 33px;
            border-radius: 50%;
            object-fit: cover;
            border: none;
        }

        section ul:first-child:not(.replyBox) {
            display: flex;
            margin-bottom: 10px;
            border-bottom: #E5E5E5 2px solid;
            justify-content: space-between;
        }

        .modalImg img {
            display: inline-block;
            width: 450px;
            height: auto;
            object-fit: cover;
            border: none;
        }

        ul:not(.replyList) {
            display: flex;
        }

        ul li:not(.modalImg) {

            left: -10px;
        }

        ul li ol {
            display: flex;
        }

        .id {
            position: relative;
            bottom: 10px;
            font-weight: bold;
        }

        .addFriend {
            padding: 5px;
            margin-left: 20px;
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
            padding-top: 10px;
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
     .etc {
      width: 180px;
      text-align: center;
      position: relative;
      bottom: 185px;
      border-left: 1px solid #E5E5E5;
    }

    .etc li {
      height: 30px;
      line-height: 30px;
      padding: 5px;
      padding-bottom: 5px;
      border-bottom: #E5E5E5 1px solid;
    }

    .etc li a {
      display: block;
    }

    .etc li a:hover {
      border-bottom: 3px solid #F95E25;
    }
    a {
     text-decoration:none 
    }
        
    </style>
<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.1.min.js"></script>

</head>

<body>
    <c:import url="/WEB-INF/views/common/nav.jsp" />
    <section>
        <ul>
            <li><a href="javascript:history.go(-1);"><i class="fa-solid fa-arrow-left fa-1x"> </i> </a></li>
            <li>
                <h1 align="center" style="font-weight: bold;">게시물</h1>
            </li>
            <li><a href="#"><i class="fa-solid fa-ellipsis fa-2x"></i></a></li>
        </ul>

        <ul>
            <!-- 컨텐츠 이미지 -->
           	<!--<c:forEach items="${aList }" var="at">
	            <a href="#">
                	<li class="modalImg"><img src="resources/board_upfiles/${at.atch_file_name }"></li>
	            </a>
            </c:forEach>-->
            <li class="content">
                <!-- 다른 유저의 프로필사진, id, 글쓴내용, 지도  -->
                <ol>
                    <li>
                        <c:url var="callMyinfo" value="/myinfo.do">
	                        <c:param name="userid" value="${ board.userid }" />
	                    </c:url>
	                    <li><a href="${ callMyinfo }"><span id="id" class="id">${ board.userid }</span></a></li> 
                   		<c:if test="${board.userid ne loginMember.userid }">
	                        <p class="modalContent">${board.b_content }
	                        <span><a href="bsearch.do?b_category=${board.b_category }"><br>${board.b_category }</a></span>
	                        </p>
                        </c:if>
                        <c:if test="${board.userid eq loginMember.userid }">
                            <p class="modalContent"><textarea rows="7" cols="30" name="b_content" id="b_content">${board.b_content }</textarea> 
	                        <span><br><a href="bsearch.do?b_category=${board.b_category }">${board.b_category }</a></span>
	                        <spen>카테고리를 변경할 경우 선택해주세요.</spen>
	                        <select name="b_category" id="b_category">
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
	                        </p>
	                        <ul class="etc">
									<li><a href="bdel.do?b_no=${board.b_no }">삭제</a></li>
									<li><a href="javascript:bupdate();">수정</a></li>
							</ul>
                        </c:if>
						<script type="text/javascript">
							function bupdate(){
								var contentValue = document.getElementById("b_content").value;
								var categoryValue = document.getElementById("b_category").value;
								
								location.href='bupdate.do?b_content='+ contentValue +'&b_category='+categoryValue +'&b_no=${board.b_no}';
							}
						</script>
                        <!-- 임시 구글지도api
                        <iframe
                            src="https://www.google.com/maps/embed?pb=!1m16!1m12!1m3!1d25311.64860821957!2d126.86131198716856!3d37.53253268002548!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!2m1!1z7YyM7Iqk7YOA!5e0!3m2!1sko!2skr!4v1667037455409!5m2!1sko!2skr"
                            width="435" height="200" style="border:0;" allowfullscreen="" loading="lazy"
                            referrerpolicy="no-referrer-when-downgrade">
                        </iframe>-->
                        

                    </li>
                    
                    <li>
                        <ol class="lr">
                            <!-- 좋아요 수 -->
                            <li><a href="javascript:location.href='addlike.do?b_no=${board.b_no }';">
                                    <i class="fa-solid fa-heart"></i></a>
                            	<span class="countingLike">${board.b_like }</span>
                                
                            </li>
                            <li class="reply"><a href="#"><i class="fa-regular fa-message"></i></a>
                            </li>
                            <li><i class="fa-solid fa-paper-plane"></i></li>
                            <li><a href="#"><button id="recipe">레시피</button></a></li>
                            <li><a href="#"><button id="restaurant">주변맛집</button></a></li>

                        </ol>
                            <!-- 댓글 -->
                        <div>
                            <ul class="replyBox">
	                            <form action="rinsert.do" method="POST">
	                            	<input type="hidden" name="b_no" value="${board.b_no }">
	                            	<input type="hidden" name="userid" value="${loginMember.userid }">
	                                <li><textarea class="replyRig" name="b_reply_content"></textarea></li>
                                	<li><input class="replyBtn" type="submit" value="댓글등록"></li>
                                </form>
                                <!-- 새로고침 -->
                                <li class="resetBtn"><a href="#">
                                        <i class="fa-solid fa-arrows-rotate"></i>
                                    </a></li>
                            </ul>
                            <ul class="replyList">
                            	<c:forEach items="${rList }" var="r">
	                            	<c:if test="${r.userid ne loginMember.userid }">
	                            		<li>${r.b_reply_content }</li>
									</c:if>
									<c:if test="${r.userid eq loginMember.userid }">
	                            		<li><textarea id="b_reply_content">${r.b_reply_content }</textarea>
	                            		<button onclick="rupdate();">수정</button>
	                            		<button onclick="javascript:location.href='rdel.do?b_no=${board.b_no }&b_reply_no=${r.b_reply_no}';">삭제</button>
	                            		</li>
									</c:if>
			                        <script type="text/javascript">
										function rupdate(){
											var contentValue = document.getElementById("b_reply_content").value;
											location.href='rupdate.do?b_reply_content='+ contentValue +'&b_reply_no=${r.b_reply_no}&b_no=${board.b_no}';
										}
									</script>
                            	</c:forEach>
                            </ul>

                        </div>


					</li>
                </ol>
            </li>
        </ul>


    </section>
</body>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="../common/error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<script type="text/javascript">
let currentIdx = 0;
</script>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="resources/css/reset.css">
<!-- <link href="resources/css/style.css"> -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
	rel="stylesheet">
<title>게시물</title>
<link href="resources/css/reset.css" rel="stylesheet">
<link href="resources/css/style.css" rel="stylesheet">
<style>
section {
	width: 950px;
	/* height: 660px; */
	height: 722px;
	margin: 40px auto;
	padding: 20px 10px;
	border-radius: 20px;
	box-shadow: 2px 2px 10px grey;
	box-sizing: border-box;
}

.content {
	margin-left: 18px;
	position: relative;
	top: 20px;
}

section ul:first-child:not(.replyBox) {
	border-bottom: #E5E5E5 2px solid;
	justify-content: space-between;
}

.modalImg img {
	display: inline-block;
	width: 450px;
	/* height:auto; */
	max-height: 500px;
	object-fit: cover;
	border: none;
}

/* 레시피목록 */
ul:not(.replyBox) {
	/* display: flex;    */
	
}

ul li:not(.modalImg) {
	left: 7px;
}

ul li ol {
	display: flex;
}

.id {
	position: relative;
	bottom: 10px;
	font-weight: bold;
	color: #333;
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
	/* border-bottom: 1px solid #E5E5E5; */
	width: 430px;
	height: 100px;
	margin-bottom: 10px;
	padding-top: 10px;
	font-size: 14px;
	/* overflow: auto; */
	position: relative;
	left: -30px;
}

.modalContent span a {
	color: rgb(116, 77, 116);
}

a {
	text-decoration: none;
}

/* 하트, 댓글등 */
.lr {
	position: relative;
	top: 212px;
	right: 475px;
	/*    border-bottom: 1px solid #E5E5E5; */
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
	padding: 5px 10px;
	display: block;
}

#recipe, #restaurant {
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

#aibutton {
	width: 120px;
	height: 30px;
	font-weight: bold;
	border: none;
	border-radius: 10px;
	transition: 0.5s ease-in-out;
	color: #333;
	background-color: #E5E5E5;
	font-size: 13px;
	margin: 10px 50px 0;
}

#aibutton:hover {
	background-color: #F95E25;
}

.replyBox {
	position: relative;
	top: 470px;
	right: 417px;
}

.replyRig {
	width: 340px;
	height: 25px;
	border-radius: 30px;
	background-color: #F0F0F0;
	border: none;
}

.replyBtn {
	/* width: 80px; */
	border: none;
	display: block;
	position: relative;
	left: 29px;
	bottom: 28px;
	font-weight: bold;
	color: #333;
	cursor: pointer;
	margin-left: -100px;
	background-color: white;
}

.replyBtn:hover {
	display: block;
	color: #F95E25;
}

.replyList {
	position: relative;
	top: 269px;
	right: 480px;
	width: 420px;
	height: 115px;
	padding: 10px;
	overflow: auto;
	/* background-color:yellow; */
	border: 2px solid #F0F0F0;
	border-radius: 10px;
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
	bottom: 163px;
	left: 34px;
	/* border-left: 1px solid #E5E5E5; */
}

.etc li {
	height: 30px;
	line-height: 30px;
	padding: 5px 5px 5px 5px;
	padding-bottom: 5px;
	color: #333;
	/*    border-bottom: #E5E5E5 1px solid; */
}

.etc li a {
	display: block;
	color: #333;
}

.etc li a:hover {
	color: #F95E25;
}

li {
	list-style: none;
}

.kind_wrap {
	/* border: 2px solid black; */
	width: 100%;
	max-width: 410px;
	margin: 0 auto;
	position: relative;
	/* left: -35px; */
}

.kind_wrap>.kind_slider {
	overflow: hidden;
}

.kind_wrap>.kind_slider .slider {
	position: relative;
	transition: 0.5s;
	left: -40px;
}

.kind_wrap>.kind_slider .slider li {
	float: left;
}

.kind_wrap>.kind_slider img {
	vertical-align: top;
}

.kind_wrap .arrow>a.prev {
	position: absolute;
	left: -50px;
	top: 150px;
}

.kind_wrap .arrow>a.next {
	position: absolute;
	right: -50px;
	top: 150px;
}

/* 삼각형 디자인 */
.next {
	width: 0;
	height: 0;
	border-bottom: 30px solid transparent;
	border-top: 30px solid transparent;
	border-right: 50px solid transparent;
	border-left: 30px solid #E5E5E5;
}

.prev {
	width: 0;
	height: 0;
	border-bottom: 30px solid transparent;
	border-top: 30px solid transparent;
	border-right: 30px solid #E5E5E5;
	border-left: 50px solid transparent;
}

/* 시작 안넣어도됨 */
.modalImg img {
	display: inline-block;
	width: 450px;
	height: auto;
	object-fit: cover;
	border: none;
}

ul {
	/* display: ; */
	
}

#b_content:not(#b_reply_content) {
	/* border: 2px solid red; */
	border: none;
	width: 430px;
	height: 100px;
}

/* hover시 영양정보 */
i:hover {
	color: green
}

.food-wrap {
	display: flex;
	justify-content: center;
	align-items: center
}

.food {
	position: relative;
	width: 300px;
	height: 300px;
}

div.info {
	padding: 15px 20px;
	border-radius: 5px;
	font-weight: 1000;
	color: #fff;
	position: absolute;
	background: rgba(0, 0, 0, 0.3);
	top: 30%;
	left: 10%;
	margin: auto;
	text-align: left;
	display: none;
	z-index: 10;
}

/* 전체 */
ul:not(.replyList) {
	display: flex;
}
</style>
<script type="text/javascript"
	src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.1.min.js"></script>
<!-- 슬라이드 -->
<script>
$(function () { 
   console.log('${aList.toString()}')
   var ary = JSON.stringify('${aList.toString()}');
   
$('#aibutton').click(function () {
   $.ajax({
       url: "/foodstagram/extractImgtoResult.do",
       type: "post",
       data: { b_no: ${board.b_no} ,
                index: currentIdx   
       },
       success: function(data){
           console.log(data);
           
         $("#extractedtxt").val(data);
       },
       error: function () {
           // handle upload error
           // ...
       }
   });      
});
});
</script>
<script>
                    window.onload = function () {
                        const kindWrap = document.querySelector('.kind_wrap');
                        const slider = kindWrap.querySelector('.slider');
                        const slideLis = slider.querySelectorAll('li')
                        const moveButton = kindWrap.querySelector('.arrow');

                        /* ul 넓이 계산해 주기 */
                        const liWidth = slideLis[0].clientWidth;
                        var sliderWidth = liWidth * slideLis.length;
                        slider.style.width = sliderWidth + "px";
                        /* 리스너 설치하기 */
                        //let currentIdx = 0; // 슬라이드 현재 번호
                        let translate = 0; // 슬라이드 위치 값
                        moveButton.addEventListener('click', moveSlide);

                        function moveSlide(event) {
                            event.preventDefault();
                            if (event.target.className === 'next') {
                                if (currentIdx !== slideLis.length - 1) {
                                    translate -= liWidth;
                                    slider.style.transform = 'translateX(' + translate + 'px)';
                                    currentIdx += 1;
                                }
                            } else if (event.target.className === 'prev') {
                                if (currentIdx !== 0) {
                                    translate += liWidth;
                                    slider.style.transform = 'translateX(' + translate + 'px)';
                                    currentIdx -= 1;
                                }
                            }
                        }

                    }
                </script>
<!-- 게시물 수정용 -->
<script type="text/javascript">
                    function bupdate() {
                        var contentValue = document.getElementById("b_content").value;
                        var categoryValue = document.getElementById("b_category").value;

                        location.href = 'bupdate.do?b_content=' + contentValue + '&b_category='
                            + categoryValue + '&b_no=${board.b_no}';
                    }
                </script>
<script type="text/javascript">
                    $(function () {
                        $("ul.slider").on("mouseover", function () {
                            $("div.info").css("display", "block");
                        });
                        $("ul.slider").on("mouseleave", function () {
                            $("div.info").css("display", "none");
                        });
                    });
                </script>
</head>

<body>
	<c:import url="/WEB-INF/views/common/nav.jsp" />
	<section>
		<ul>
			<li><a href="javascript:history.go(-1);"><i
					class="fa-solid fa-arrow-left fa-2x"> </i> </a></li>
			<li>
				<h1 align="center" style="font-weight: bold;">게시물</h1> <a href="#"
				align="center"><button id="aibutton">AI 인식 Start</button></a><br>
				<br>
				<div align="center" id="extractedTxt" name="extractedTxt" readonly>
					<input id="extractedtxt">
				</div>
			</li>
			<li><a href="#"><i class="fa-solid fa-ellipsis fa-2x"></i></a></li>
		</ul>
		<!--슬라이드처리  및 영양정보-->
		<ul>
			<div class="kind_wrap">
				<div class="kind_slider">
					<ul class="slider">
						<c:forEach items="${aList }" var="at">
							<!--  영양정보관련 : 후버시 영양정보 뜸 class="food"-->
							<a href="#">
								<li class="modalImg"><img
									src="resources/board_upfiles/${at.atch_file_name }"></li>
							</a>
							<!--  영양정보 -->
							<div class="food-wrap">
								<div class="info" style="line-height: 160%">
									<h2>${ food.fname }</h2>
									<c:choose>
										<c:when test="${ food.fname eq '마르게리따피자'}">
											<c:if test="${ food.fsize ne null }">1조각 당</c:if>
											<c:if test="${ food.fsize eq null }">1조각 (${ food.fsize }g)
                                                        </c:if>
											<br>
										</c:when>
										<c:when test="${ food.fname eq '마카롱'}">
											<c:if test="${ food.fsize ne null }">1개 당</c:if>
											<c:if test="${ food.fsize eq null }">1개 (${ food.fsize }g)
                                                        </c:if>
											<br>
										</c:when>
										<c:otherwise>
											<c:if test="${ food.fsize eq null }">1인분 당</c:if>
											<c:if test="${ food.fsize ne null }">1인분 (${ food.fsize }g)
                                                        </c:if>
											<br>
										</c:otherwise>
									</c:choose>
									칼로리 : ${ food.kcal }kcal<br> 탄수화물 : ${ food.carb }g<br>
									단백질 : ${ food.protein }g<br> 지방 : ${ food.fat }g
								</div>
							</div>
						</c:forEach>
					</ul>
				</div>
				<div class="arrow">
					<a href="#" class="prev"></a> <a href="#" class="next"></a>
				</div>
			</div>
			<ul class="content_box">
				<li class="content">
					<!-- 다른 유저의 프로필사진, id, 글쓴내용, 지도  -->
					<ol>
						<li><c:url var="callMyinfo" value="/myinfo.do">
								<c:param name="userid" value="${ board.userid }" />
							</c:url></li>
						<li><a href="${ callMyinfo }"><span id="id" class="id">${ board.userid }</span></a>
						</li>
						<li><c:if test="${board.userid ne loginMember.userid }">
								<p class="modalContent">${board.b_content }
									<span><a
										href="bsearch.do?b_category=${board.b_category }"><br>${board.b_category
                                                        }</a></span>
								</p>
							</c:if></li>
						<li style="position: relative;"><c:if
								test="${board.userid eq loginMember.userid }">
								<p class="modalContent">
									<textarea name="b_content" id="b_content">${board.b_content }</textarea>
									<span  style="border-bottom:3px solid  #F95E25"><br> <a
										href="bsearch.do?b_category=${board.b_category }">${board.b_category
                                                       }</a></span>
									<span>카테고리를 변경할 경우 선택해주세요.</span> <br> <br> <select
										name="b_category" id="b_category"
										style="font-weight: bold; width: 120px; height: 2rem; border: 2px solid #f8f9fa; top: 48px; text-align: center; border-radius: 20px;">
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
							</c:if></li>


					</ol>

				</li>
				<li>
					<ol class="lr">
						<!-- 좋아요 수 -->
						<li><a
							href="javascript:location.href='addlike.do?b_no=${board.b_no }';">
								<i class="fa-solid fa-heart"></i>
						</a> <span class="countingLike">${board.b_like }</span></li>
						<li class="reply"><a href="#"><i
								class="fa-regular fa-message"></i></a></li>
						<li><i class="fa-solid fa-paper-plane"></i></li>
						<li><a href="#"><button id="recipe">레시피</button></a></li>
						<li><a href="#"><button id="restaurant">주변맛집</button></a></li>

					</ol> <!-- 댓글 -->
					<div>
						<ul class="replyBox">
							<form action="rinsert.do" method="POST">
								<input type="hidden" name="b_no" value="${board.b_no }">
								<input type="hidden" name="userid"
									value="${loginMember.userid }">
								<li><textarea class="replyRig" name="b_reply_content"></textarea></li>
								<li><input class="replyBtn" type="submit" value="댓글등록"
									style="cusor: pointer;"><a href="#"></a></li>
							</form>
							<!-- 새로고침 -->
							<li class="resetBtn"><a href="#"> <i
									class="fa-solid fa-arrows-rotate"></i>
							</a></li>
						</ul>
						<ul class="replyList">
							<c:forEach items="${rList }" var="r">
								<c:if test="${r.userid ne loginMember.userid }">
									<li>${r.b_reply_content }</li>
								</c:if>
								<c:if test="${r.userid eq loginMember.userid }">
									<li style="positon: relative; left: 100px; bottom: 100px;"><textarea
											id="b_reply_content">${r.b_reply_content }</textarea>
										<button onclick="rupdate();">수정</button>
										<button
											onclick="javascript:location.href='rdel.do?b_no=${board.b_no }&b_reply_no=${r.b_reply_no}';">삭제</button>
									</li>
								</c:if>
								<script type="text/javascript">
                                                function rupdate() {
                                                    var contentValue = document
                                                        .getElementById("b_reply_content").value;
                                                    location.href = 'rupdate.do?b_reply_content='
                                                        + contentValue
                                                        + '&b_reply_no=${r.b_reply_no}&b_no=${board.b_no}';
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
	</ul>
</body>

</html>

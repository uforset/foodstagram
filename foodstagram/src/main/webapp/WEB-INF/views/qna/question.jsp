<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko"><head>
<meta charset="UTF-8">

<title>FOODSTAGRAM Question</title>
<link rel="stylesheet" href="https://www.eyes.co.kr/assets/css/reset.css?v=1669255025">
<link rel="stylesheet" href="https://www.eyes.co.kr/assets/css/swiper.min.css">
<link rel="stylesheet" href="https://www.eyes.co.kr/assets/css/jquery.mCustomScrollbar.min.css">
<link rel="stylesheet" href="https://www.eyes.co.kr/assets/css/site.css?v=1669255025">


<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.1.min.js"></script>
<script src="https://www.eyes.co.kr/assets/js/libs/swiper.min.js"></script>
<script src="https://www.eyes.co.kr/assets/js/libs/chart.min.js"></script>
<script src="https://www.eyes.co.kr/assets/js/libs/jquery.mCustomScrollbar.concat.min.js"></script>
<script src="https://www.eyes.co.kr/assets/js/site.js?v=1669259435"></script>
</head>
<script type="text/javascript">
$(function(){
	currNav(4, 2); 
});
</script>
<body>

<!-- container -->
	<main class="sub">
		<div class="loc-menu">
						<div> 
				<a href="/main/MV" class="home">홈</a>
				<div class="dpt dpt1 on">
					<div class="curr">
						<a href="/customer/notice" class="curr-tit">고객센터</a>
					</div>
					<div class="sub">
						<ul>
							<li data-dpt="1"><a href="/payplan/info">요금제</a></li>
							<li data-dpt="2"><a href="/goods/product">휴대폰·유심</a></li>
							<li data-dpt="3"><a href="/mohae/mohae">#MOHAE</a></li>
							<li data-dpt="4"><a href="/customer/notice">고객센터</a></li>
							<li data-dpt="5"><a href="/event/event">이벤트</a></li>							
							<li data-dpt="6"><a href="/btob/lte">B2B</a></li>
							<li data-dpt="7"><a href="/mypage/main">마이페이지</a></li>
						</ul>
					</div>
				</div>

				<!-- 1. 요금제 -->
				<div class="dpt dpt2" data-dpt="1">
					<div class="curr"></div>
					<div class="sub">
						<ul>
							<li data-dpt="1-1"><a href="/payplan/info">알뜰요금제</a></li>
							<li data-dpt="1-2"><a href="/payplan/addition">부가서비스</a></li>
							<li data-dpt="1-3"><a href="/prepaid/prepaid">선불서비스</a></li>
						</ul>
					</div>
				</div>

				<!-- 2. 요금제 -->
				<div class="dpt dpt2" data-dpt="2">
					<div class="curr"></div>
					<div class="sub">
						<ul>
							<li data-dpt="2-1"><a href="/goods/product">알뜰휴대폰</a></li>
							<li data-dpt="2-2"><a href="/goods/unused">자급제·중고</a></li>
							<li data-dpt="2-3"><a href="/payplan/usim">유심·eSIM</a></li>
						</ul>
					</div>
				</div>
				
				<!-- 3. MOHAE -->
				<div class="dpt dpt2" data-dpt="3">
					<div class="curr"></div>
					<div class="sub">
						<ul>
							<li data-dpt="3-1"><a href="/mohae/mohae">MOHAE</a></li>
							<li data-dpt="3-2"><a href="/mohae/tip">아이즈꿀팁</a></li>
							<li data-dpt="3-3"><a href="/mohae/review">후기 게시판</a></li>
						</ul>
					</div>
				</div>

				<!-- 4. 안내·문의 -->
				<div class="dpt dpt2" data-dpt="4">
					<div class="curr"></div>
					<div class="sub">
						<ul>
							<li data-dpt="4-4"><a href="/customer/serviceinfo">서비스 조회·변경</a></li>
							<li data-dpt="4-2"><a href="/customer/inquiry">1:1 문의</a></li>
							<li data-dpt="4-3"><a href="/customer/faq">자주하는 질문</a></li>							
							<li data-dpt="4-5"><a href="/customer/form">서식지다운</a></li>
							<li data-dpt="4-1"><a href="/customer/notice">공지사항</a></li>
						</ul>
					</div>
				</div>

				<!-- 5. 이벤트 -->
				<div class="dpt dpt2" data-dpt="5">
					<div class="curr"></div>
					<div class="sub">
						<ul>
							<li data-dpt="5-1"><a href="/event/event">이벤트</a></li>
							<li data-dpt="5-2"><a href="/event/ssaida">싸이다 교환소</a></li>
							<li data-dpt="5-3"><a href="/payplan/alliance">제휴·혜택</a></li>
						</ul>
					</div>
				</div>
				
				<!-- 6. B2B -->
				<div class="dpt dpt2" data-dpt="6">
					<div class="curr"></div>
					<div class="sub">
						<ul>
							<li data-dpt="6-1"><a href="/btob/lte">LTE무전기</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>

		<div class="content">
			<div class="title-wrap">
				<h3 class="h3">1:1문의</h3>
			</div>

			<div class="tab-type1">
				<ul>
					<li class="on"><a href="${ pageContext.servletContext.contextPath }/question.do">상담문의</a></li>
										<li><a href="${ pageContext.servletContext.contextPath }/myQuestionListView.do">문의내역</a></li>
									</ul>
			</div>

			<div class="inquiry-wrap">
				<strong>
					FOODSTAGRAM 이용 중 궁금하시거나<br class="m-br"> 불편하신 내용을 남겨주시면,<br>
					전문상담원이 친절하게 안내해드립니다.
				</strong>
				<p>(평일 운영시간 : 09:00 ~ 18:00 /<br class="m-br"> 주말, 공휴일 휴무)</p>
				<div class="btn-wrap">
										<button type="button" class="btn-type1 min-w primary m-w100p" onclick="location.href='questionReg.do'">1:1 문의</button>
															
				</div>
			</div>

			<div class="dv-line dv-line-type1"></div>

			
		</div>
	</main>
</body>

  
</html>
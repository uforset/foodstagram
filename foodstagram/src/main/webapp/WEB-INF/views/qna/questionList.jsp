<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FOODSTAGRAM QuestionList</title>
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
</head>
<body>
	<!-- container -->
	<main class="sub">
		<div class="loc-menu">
						<div> 
				<a href="/main/MV" class="home">홈</a>
				<div class="dpt dpt1 on">
					<div class="curr"></div>
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
					<li><a href="/customer/inquiry">상담문의</a></li>
					<li class="on"><a href="/customer/inquiry_list">문의내역</a></li>
				</ul>
			</div>

			<div class="board-list inquiry">
				<div class="thead">
					<div class="state">상태</div>
					<div class="sbj">제목</div>
					<div class="date">등록일</div>
					<div class="rating">만족도 평가</div>
				</div>
				<ul class="tbody">
										<li>
						<div class="state"><strong>답변</strong></div>
						<div class="sbj"><a href="/customer/inquiry_view/7275">글쓰는 도중에 연락이왔습니다.</a></div>
						<div class="date">2022-11-09</div>
												<div class="rating"><a href="/customer/inquiry_rating/7275" class="btn-type4 min-w">평가하기</a></div>
											</li>
										<li>
						<div class="state"><strong>답변</strong></div>
						<div class="sbj"><a href="/customer/inquiry_view/6999">반품해지 해주세요</a></div>
						<div class="date">2022-11-08</div>
												<div class="rating"><a href="/customer/inquiry_rating/6999" class="btn-type4 min-w">평가하기</a></div>
											</li>
										<li>
						<div class="state"><strong>답변</strong></div>
						<div class="sbj"><a href="/customer/inquiry_view/6978">요금이 다르네요</a></div>
						<div class="date">2022-11-08</div>
												<div class="rating"><a href="/customer/inquiry_rating/6978" class="btn-type4 min-w">평가하기</a></div>
											</li>
										<li>
						<div class="state"><strong>답변</strong></div>
						<div class="sbj"><a href="/customer/inquiry_view/6299">반품요청</a></div>
						<div class="date">2022-11-04</div>
												<div class="rating"><a href="/customer/inquiry_rating/6299" class="btn-type4 min-w">평가하기</a></div>
											</li>
										<li>
						<div class="state"><strong>완료</strong></div>
						<div class="sbj"><a href="/customer/inquiry_view/5813">가입할때랑 요금이 달라요</a></div>
						<div class="date">2022-11-03</div>
												<div class="rating"><img src="/assets/images/common/rating1.png" alt="" class="rating-bar"></div>
											</li>
					<!-- 					<li> -->
<!-- 						<div class="state"><strong>답변</strong></div> -->
<!-- 						<div class="sbj"><a href="/customer/inquiry_view">IMEI등록 관련 문의</a></div> -->
<!-- 						<div class="date">2021.11.26</div> -->
<!-- 						<div class="rating"><a href="/customer/inquiry_rating" class="btn-type4 min-w">평가하기</a></div> -->
<!-- 					</li> -->
<!-- 					<li> -->
<!-- 						<div class="state"><strong>완료</strong></div> -->
<!-- 						<div class="sbj"><a href="/customer/inquiry_view">미성년자 가입시 필요서류</a></div> -->
<!-- 						<div class="date">2021.11.26</div> -->
<!-- 						<div class="rating"><img src="/assets/images/common/rating0.png" alt="" class="rating-bar"></div> -->
<!-- 					</li> -->
<!-- 					<li> -->
<!-- 						<div class="state"><strong>완료</strong></div> -->
<!-- 						<div class="sbj"><a href="/customer/inquiry_view">LGU+알뜰폰 유심결합 문의</a></div> -->
<!-- 						<div class="date">2021.11.26</div> -->
<!-- 						<div class="rating"><img src="/assets/images/common/rating1.png" alt="" class="rating-bar"></div> -->
<!-- 					</li> -->
<!-- 					<li> -->
<!-- 						<div class="state"><strong>완료</strong></div> -->
<!-- 						<div class="sbj"><a href="/customer/inquiry_view">IMEI등록 관련 문의</a></div> -->
<!-- 						<div class="date">2021.11.26</div> -->
<!-- 						<div class="rating"><img src="/assets/images/common/rating2.png" alt="" class="rating-bar"></div> -->
<!-- 					</li> -->
<!-- 					<li> -->
<!-- 						<div class="state"><strong>완료</strong></div> -->
<!-- 						<div class="sbj"><a href="/customer/inquiry_view">미성년자 가입시 필요서류</a></div> -->
<!-- 						<div class="date">2021.11.26</div> -->
<!-- 						<div class="rating"><img src="/assets/images/common/rating3.png" alt="" class="rating-bar"></div> -->
<!-- 					</li> -->
<!-- 					<li> -->
<!-- 						<div class="state"><strong>완료</strong></div> -->
<!-- 						<div class="sbj"><a href="/customer/inquiry_view">LGU+알뜰폰 유심결합 문의</a></div> -->
<!-- 						<div class="date">2021.11.26</div> -->
<!-- 						<div class="rating"><img src="/assets/images/common/rating4.png" alt="" class="rating-bar"></div> -->
<!-- 					</li> -->
<!-- 					<li> -->
<!-- 						<div class="state"><strong>완료</strong></div> -->
<!-- 						<div class="sbj"><a href="/customer/inquiry_view">IMEI등록 관련 문의</a></div> -->
<!-- 						<div class="date">2021.11.26</div> -->
<!-- 						<div class="rating"><img src="/assets/images/common/rating5.png" alt="" class="rating-bar"></div> -->
<!-- 					</li> -->
<!-- 					<li> -->
<!-- 						<div class="state"><strong>완료</strong></div> -->
<!-- 						<div class="sbj"><a href="/customer/inquiry_view">미성년자 가입시 필요서류</a></div> -->
<!-- 						<div class="date">2021.11.26</div> -->
<!-- 						<div class="rating"><img src="/assets/images/common/rating5.png" alt="" class="rating-bar"></div> -->
<!-- 					</li> -->
<!-- 					<li> -->
<!-- 						<div class="state"><strong>완료</strong></div> -->
<!-- 						<div class="sbj"><a href="/customer/inquiry_view">LGU+알뜰폰 유심결합 문의</a></div> -->
<!-- 						<div class="date">2021.11.26</div> -->
<!-- 						<div class="rating"><img src="/assets/images/common/rating5.png" alt="" class="rating-bar"></div> -->
<!-- 					</li> -->
<!-- 					<li> -->
<!-- 						<div class="state"><strong>완료</strong></div> -->
<!-- 						<div class="sbj"><a href="/customer/inquiry_view">IMEI등록 관련 문의</a></div> -->
<!-- 						<div class="date">2021.11.26</div> -->
<!-- 						<div class="rating"><img src="/assets/images/common/rating5.png" alt="" class="rating-bar"></div> -->
<!-- 					</li> -->
<!-- 					<li> -->
<!-- 						<div class="state"><strong>완료</strong></div> -->
<!-- 						<div class="sbj"><a href="/customer/inquiry_view">미성년자 가입시 필요서류</a></div> -->
<!-- 						<div class="date">2021.11.26</div> -->
<!-- 						<div class="rating"><img src="/assets/images/common/rating5.png" alt="" class="rating-bar"></div> -->
<!-- 					</li> -->
<!-- 					<li> -->
<!-- 						<div class="state"><strong>완료</strong></div> -->
<!-- 						<div class="sbj"><a href="/customer/inquiry_view">LGU+알뜰폰 유심결합 문의</a></div> -->
<!-- 						<div class="date">2021.11.26</div> -->
<!-- 						<div class="rating"><img src="/assets/images/common/rating5.png" alt="" class="rating-bar"></div> -->
<!-- 					</li> -->
<!-- 					<li> -->
<!-- 						<div class="state"><strong>완료</strong></div> -->
<!-- 						<div class="sbj"><a href="/customer/inquiry_view">IMEI등록 관련 문의</a></div> -->
<!-- 						<div class="date">2021.11.26</div> -->
<!-- 						<div class="rating"><img src="/assets/images/common/rating5.png" alt="" class="rating-bar"></div> -->
<!-- 					</li> -->
<!-- 					<li> -->
<!-- 						<div class="state"><strong>완료</strong></div> -->
<!-- 						<div class="sbj"><a href="/customer/inquiry_view">미성년자 가입시 필요서류</a></div> -->
<!-- 						<div class="date">2021.11.26</div> -->
<!-- 						<div class="rating"><img src="/assets/images/common/rating5.png" alt="" class="rating-bar"></div> -->
<!-- 					</li> -->
				</ul>
				<!--
				<div class="empty">
					<p>문의내역이 없습니다.</p>
				</div>
				-->
			</div>

			<!-- pc -->
			<div class="paginate m-hide">
				<a class='first' href='https://www.eyes.co.kr//customer/inquiry_list/?biz_gb=MV&s_keyword=&current_page=1' title='처음'></a><a class='prev' href='#' style='cursor:default' title='이전'></a><a class='curr' href='#'>1</a><a class='next' href='#' style='cursor:default' title='다음'></a><a class='last' href='https://www.eyes.co.kr//customer/inquiry_list/?biz_gb=MV&s_keyword=&current_page=1' title='마지막'></a>			</div>

			<!-- mo -->
			<div class="paginate p-hide">
				<a class='first' href='https://www.eyes.co.kr//customer/inquiry_list/?biz_gb=MV&s_keyword=&current_page=1' title='처음'></a><a class='prev' href='#' style='cursor:default' title='이전'></a><a class='curr' href='#'>1</a><a class='next' href='#' style='cursor:default' title='다음'></a><a class='last' href='https://www.eyes.co.kr//customer/inquiry_list/?biz_gb=MV&s_keyword=&current_page=1' title='마지막'></a>			</div>
		</div>
	</main>
	<!-- //container -->
</body>
</html>
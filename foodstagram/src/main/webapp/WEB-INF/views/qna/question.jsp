<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
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
<c:import url="/WEB-INF/views/common/nav.jsp" />
<!-- container -->
	<main class="sub">
		<c:import url="/WEB-INF/views/qna/locMenu.jsp" />

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
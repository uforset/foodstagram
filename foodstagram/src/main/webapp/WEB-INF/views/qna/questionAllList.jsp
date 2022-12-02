<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<c:import url="/WEB-INF/views/common/nav.jsp" />
	<!-- container -->
	<main class="sub">
		<c:import url="/WEB-INF/views/qna/locMenu.jsp" />

		<div class="content">
			<div class="title-wrap">
				<h3 class="h3">1:1문의 관리</h3>
			</div>

			<!-- <div class="tab-type1">
				<ul>
					<li><a href="/foodstagram/question.do">상담문의</a></li>
					<li class="on"><a href="/foodstagram/myQuestionListView.do">문의내역</a></li>
				</ul>
			</div> -->

			<div class="board-list inquiry">
				<div class="thead">
					<div class="state">상태</div>
					<div class="sbj">제목</div>
					<div class="date">등록일</div>
				</div>
				<ul class="tbody">
						<c:forEach items="${ list }" var="q" varStatus="status">
						<c:if test="${ q.answercheck eq 'N' }">
							<c:set var="check" value="문의"></c:set>
						</c:if>
						<c:if test="${ q.answercheck eq 'Y' }">
							<c:set var="check" value="답변"></c:set>
						</c:if>
						
						<li>
							<div class="state"><strong>${ check }</strong></div>
							<div class="sbj"><a href="/foodstagram/qnaDetail.do?q_no=${ q.q_no }">${ q.q_title }</a></div>
							<div class="date"><fmt:formatDate value="${ q.q_date }" pattern="yyyy-MM-dd" /></div>
						</li>
						</c:forEach>

				</ul>
				<!--
				<div class="empty">
					<p>문의내역이 없습니다.</p>
				</div>
				-->
			</div>

			<!-- pc 페이지 표시 영역-->
			<div class="paginate m-hide">
				<!-- 1페이지로 이동 처리 -->
				<c:url var="ql1" value="/questionManage.do">
					<c:param name="page" value="1" />
				</c:url>
				<a class='first' href='${ ql1 }' title='처음'></a>
				<!-- 이전 페이지그룹으로 이동 처리 -->
				<c:if test="${ (currentPage - 10) <= startPage and (currentPage - 10) >= 1 }">
					<c:url var="ql2" value="/questionManage.do">
						<c:param name="page" value="${ startPage - 10 }" />
					</c:url>
					<a class='prev' href='${ ql2 }' style='cursor:default' title='이전그룹'></a>
				</c:if>
				<c:if test="${ !((currentPage - 10) <= startPage and (currentPage - 10) >= 1) }">
					<a class='prev' href='#' style='cursor:default' title='이전그룹'></a>
				</c:if>
				<!-- 현재 페이지가 속한 페이지 그룹 페이지 숫자 출력 -->
				<c:forEach var="p" begin="${ startPage }" end="${ endPage }" step="1" >
					<c:if test="${ p eq currentPage }">
						<a class='curr' href='#'>${ p }</a>
					</c:if>
					<c:if test="${ p ne currentPage }">
						<c:url var="ql" value="/questionManage.do">
							<c:param name="page" value="${ p }" />
						</c:url>
						<a href='${ ql }'>${ p }</a>
					</c:if>
				</c:forEach>
				<!-- 다음 페이지그룹으로 이동 처리 -->
				<c:if test="${ (currentPage + 10) > endPage and (endPage + 1 ) < maxPage }">
					<c:url var="ql3" value="/questionManage.do">
						<c:param name="page" value="${ endPage+1 }" />
					</c:url>
					<a class='next' href='${ ql3 }' style='cursor:default' title='다음그룹'></a>
				</c:if>
				<c:if test="${ !((currentPage + 10) > endPage and (endPage + 1) < maxPage) }">
					<a class='next' href='#' style='cursor:default' title='다음그룹'></a>
				</c:if>
				<!-- 끝페이지로 이동 처리 -->
				<c:url var="ql4" value="/questionManage.do">
					<c:param name="page" value="${ maxPage }" />
				</c:url>
				<a class='last' href='${ ql4 }' title='마지막'></a>
			</div>

			<!-- mo -->
			<div class="paginate p-hide">
				<a class='first' href='https://www.eyes.co.kr//customer/inquiry_list/?biz_gb=MV&s_keyword=&current_page=1' title='처음'></a><a class='prev' href='#' style='cursor:default' title='이전'></a><a class='curr' href='#'>1</a><a class='next' href='#' style='cursor:default' title='다음'></a><a class='last' href='https://www.eyes.co.kr//customer/inquiry_list/?biz_gb=MV&s_keyword=&current_page=1' title='마지막'></a>			</div>
		</div>
	</main>
	<!-- //container -->
</body>
</html>
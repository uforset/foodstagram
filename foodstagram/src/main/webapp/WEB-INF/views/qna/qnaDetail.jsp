<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>문의 상세 보기</title>
<link rel="stylesheet" href="https://www.eyes.co.kr/assets/css/reset.css?v=1669255025">
<link rel="stylesheet" href="https://www.eyes.co.kr/assets/css/swiper.min.css">
<link rel="stylesheet" href="https://www.eyes.co.kr/assets/css/jquery.mCustomScrollbar.min.css">
<link rel="stylesheet" href="https://www.eyes.co.kr/assets/css/site.css?v=1669255025">

<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.1.min.js"></script>
<script src="https://www.eyes.co.kr/assets/js/libs/swiper.min.js"></script>
<script src="https://www.eyes.co.kr/assets/js/libs/chart.min.js"></script>
<script src="https://www.eyes.co.kr/assets/js/libs/jquery.mCustomScrollbar.concat.min.js"></script>
<script src="https://www.eyes.co.kr/assets/js/site.js?v=1669259435"></script>

<script type="text/javascript">
$(function(){
	currNav(4, 2);
});
</script>
</head>
<body class="">
<div id="wrap">
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

			<div class="board-view-type2">
				<table>
					<colgroup>
						<col style="width: 200px;">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<th>접수일시</th>
							<td><fmt:formatDate value="${ q.q_date }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						</tr>
						<tr>
							<th>유형</th>
							<td>
								<select name="con_cate" id="con_cate" disabled>
            						                                    <option value="T01"	>알뜰요금제</option>
                                                                        <option value="T02"	>알뜰휴대폰</option>
                                                                        <option value="T03"	selected>가입,변경,해지</option>
                                                                        <option value="T04"	>부가서비스</option>
                                                                        <option value="T05"	>요금조회,납부</option>
                                                                        <option value="T08"	>기타</option>
                                                                        <option value="T06"	>개통문의</option>
                                                                        <option value="T07"	>홈페이지</option>
                                                					</select>
							</td>
						</tr>
						<tr>
							<th>회원아이디</th>
							<td>${ q.userid }</td>
						</tr>
						<tr>
							<th>제목</th>
							<td>${ q.q_title }</td>
						</tr>
						<tr>
							<th>문의내용</th>
							<td>${ q.q_content }</td>
						</tr>
						<tr>
							<th>첨부파일</th>
							<td>
								<c:forEach var="f" items="${ q.attaches }" varStatus="st">
								<div> 파일 ${st.count} <a href="<c:url value='/attach/download/${f.atch_no}' />" target="_blank"> 
						        <span class="glyphicon glyphicon-save" aria-hidden="true"></span> ${f.atch_original_name}
						        </a> Size : ${f.atch_fancy_size} Down : ${f.atch_down_hit}
						        </div>
								</c:forEach>
							</td>
						</tr>
					</tbody>
				</table>
				<div class="btn-wrap">
					<a href="/foodstagram/myQuestionListView.do" class="btn-type1 min-w">목록</a> 
					<a href="/customer/inquiry_list" class="btn-type3 tert min-w">수정</a>
				</div>
								<div class="dv-line dv-line-type1"></div>

				<h4 class="h4">전문 답변</h4>
				<table>
					<colgroup>
						<col style="width: 200px;">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<th>담당자</th>
<!--							<td>관리자(--><!--)</td>-->
							<td><img src="/assets/images/re_BI_MVNO.png"></td>
						</tr>
						<tr>
							<th>답변</th>
							<td>
							안녕하세요.<br><br>신청을 아이즈 맘껏 1GB+ 요금제로 신청 하셨습니다.<br>홈페이지상에는 다른 금액등으로 나와 있을 수 있으나,<br>11월 1일부로 리뉴얼되면서 발생되는 오류로 확인됩니다.<br>현재 전산팀에서 바삐 수정중입니다.<br>자세한 내용은 고객센터로 전화 주세요.<br><br>타통신사 이동시 최소 15일~3개월 이후 가능하며,<br>개통이 되면 이전 통신사는 자동으로 '해지'됩니다.<br><br>전통신사로 돌아가고 싶으시다면<br>전화 주셔서 '반품해지' 신청하시면 됩니다.<br><br>감사합니다.<br><br><br>---------------------------------------------<br>아이즈모바일SKT 1800-6100 (유료)<br>아이즈모바일KT 1800-6200 (유료)<br>아이즈모바일LG 1800-4100 (유료)<br>이용고객의 경우 국번 없이 114 (무료)<br>팩스 02-6333-9999<br>이메일 eyesmobile@eyesvision.com<br>---------------------------------------------							</td>
						</tr>
											</tbody>
				</table>
							</div>

			<div class="btn-wrap">
				<a href="/foodstagram/myQuestionListView.do" class="btn-type1 min-w">목록</a>
			</div>

		</div>
	</main>
	<!-- //container -->
</div>
	<script type="text/javascript" src="//wcs.naver.net/wcslog.js"> </script>
	<script>
		if (!wcs_add) var wcs_add={};
		wcs_add["wa"] = "s_a22954112f5";
		if (!_nasa) var _nasa={};
		wcs.inflow();
		wcs_do(_nasa);
	</script>
	



	
</body>
</html>

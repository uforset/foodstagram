<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>     

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>문의 상세 보기</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
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
			<script type="text/javascript">
			</script>
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
							<% pageContext.setAttribute("LF", "\n"); %>
							<td>${fn:replace(q.q_content, LF, '<br>')}</td>
						</tr>
						<tr>
							<th>첨부파일</th>
							<td>
								<c:forEach var="f" items="${ q.attaches }" varStatus="st">
								<div> 파일 ${st.count} <a style="color: #337ab7;" href="<c:url value='/attachDownload.do/${f.atch_no}' />" target="_blank"> 
						        <span class="glyphicon glyphicon-save" aria-hidden="true"></span> ${f.atch_original_name}
						        </a> Size : ${f.atch_fancy_size} Down : ${f.atch_down_hit}
						        </div>
								</c:forEach>
							</td>
						</tr>
					</tbody>
				</table>

				<h4 class="h4">답변 수정</h4>
				<div class="btn-wrap">
					<!-- 관리자인 경우 답변입력폼 출력함-->
					<!-- 여기는 답변 수정 -->
					<c:if test="${ loginMember.admin eq 'Y' }">
						<form id="regForm" name="regForm" method="post" >
							<input type="hidden" id="userid" name="userid" value="${ loginMember.userid }">
							<input type="hidden" id="a_id" name="a_id" value="${ a.a_id }">
							<input type="hidden" id="a_ref" name="a_ref" value="${ q.q_no }">
						<div class="board-view-type2">
							<table>
								<colgroup>
									<col style="width: 200px;">
									<col>
								</colgroup>
								<tbody>
									<tr>
										<th>담당자</th>
										<td>${ loginMember.userid }</td>
									</tr>
									<tr>
										<th>답변</th>
										<td><textarea id="a_content" name="a_content" placeholder="내용을 입력해 주세요">${ a.a_content }</textarea></td>
									</tr>
								</tbody>
							</table>
						</div>
						</form>
					</c:if>
				
					
					<!-- 관리자인 경우 -->
					<c:if test="${ loginMember.admin eq 'Y' }">
						<%-- <a href="/foodstagram/questionReg.do/${ q.q_no }" style="background-color: white; color: black;" class="btn-type1 tert min-w">답변 등록</a> --%>
						<div class="btn-wrap col2">
							<div></div>
							<div class="col2 m-col2">
								<a href="/foodstagram/qnaDetail.do?q_no=${ q.q_no }" class="btn-type1 scd min-w">취소</a>
								<a href="#none" onclick="answerSave()" class="btn-type1 min-w">저장</a>
								<a href="#none" onclick="answerDelete()" class="btn-type1 min-w">삭제</a>
							</div>
						</div>
					</c:if>
				</div>

			</div>

		</div>
	</main>
	<!-- //container -->
</div>
<script>
function answerSave(){
/* 	if($("#a_title").val() == "") {
		alert('글 제목을 입력해주시기 바랍니다.');
		return false;
	} */

/* 	if($("#recv_phone").val() == "") {
		alert('연락가능한 전화번호를 입력해주시기 바랍니다.');
		return false;
	} */


	if($("#a_content").val() == "") {
		alert('답변 내용을 입력해주시기 바랍니다.');
		return false;
	}


	$.ajax({
        url: "/foodstagram/updateAnswer.do",
        type: "post",
        data: new FormData($("#regForm")[0]),
        //enctype: "multipart/form-data",
        processData: false,
        contentType: false,
        cache: false,
        success: function(data){
        	if(data.indexOf("error")>=0){
        		alert("오류가 발생 하였습니다 .\r\n"+data);
        		return false;
        	}
            var jsonobj = JSON.parse(data);
            console.log(data);
            if(jsonobj.result=="success"){
            	alert("수정 완료 되었습니다.");
            	location.href='/foodstagram/qnaDetail.do?q_no=${ q.q_no }';
            	return false;
            }else{
            	alert("잠시 후 다시 시도해 주시기 바랍니다.");
        		return false;
            }
            return false;
        },
        error: function () {
            // handle upload error
            // ...
        }
    });			

}

function answerDelete(){
	
	if(confirm('정말로 삭제하시겠습니까?')) {
		console.log('yes클릭ㅋ');
	} else {
		return false;
	}
	

	$.ajax({
        url: "/foodstagram/answerDelete.do",
        type: "post",
        data: new FormData($("#regForm")[0]),
        //enctype: "multipart/form-data",
        processData: false,
        contentType: false,
        cache: false,
        success: function(data){
        	if(data.indexOf("error")>=0){
        		alert("오류가 발생 하였습니다 .\r\n"+data);
        		return false;
        	}
            var jsonobj = JSON.parse(data);
            console.log(data);
            if(jsonobj.result=="success"){
            	alert("삭제 되었습니다.");
            	location.href='/foodstagram/myQuestionListView.do';
            	return false;
            }else{
            	alert("잠시 후 다시 시도해 주시기 바랍니다.");
        		return false;
            }
            return false;
        },
        error: function () {
            // handle upload error
            // ...
        }
    });			

}
</script>


	
</body>
</html>

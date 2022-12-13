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
<c:import url="/WEB-INF/views/common/nav.jsp" />
<div id="wrap">
	<!-- container -->
	<main class="sub">
		<c:import url="/WEB-INF/views/qna/locMenu.jsp" />

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
						<!-- <tr>
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
						</tr> -->
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
				<div class="dv-line dv-line-type1"></div>
				<!-- 답변이 없을경우 -->
				<c:if test="${ q.answercheck eq 'N' }" > 
					<c:if test="${ loginMember.admin eq 'Y' }">
						<h4 class="h4">답변 입력</h4>
					</c:if>
				<div class="btn-wrap">
					<!-- 관리자인 경우 답변입력폼 출력함-->
					<c:if test="${ loginMember.admin eq 'Y' }">
						
						<form id="regForm" name="regForm" method="post" action="insertAnswer.do" >
							<input type="hidden" id="userid" name="userid" value="${ loginMember.userid }">
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
										<td><textarea id="a_content" name="a_content" placeholder="내용을 입력해 주세요"></textarea></td>
									</tr>
								</tbody>
							</table>
						</div>
						</form>
					</c:if>
				
					
					<!-- 본인인 경우만 수정가능 -->
					<c:if test="${ q.userid eq loginMember.userid }">
						<a href="/foodstagram/myQuestionListView.do" class="btn-type1 min-w">목록</a> 
						<a href="/foodstagram/questionReg.do/${ q.q_no }" style="background-color: white; color: black;" class="btn-type1 tert min-w">수정</a>
					</c:if>
					<!-- 관리자인 경우 -->
					<c:if test="${ loginMember.admin eq 'Y' }">
						<%-- <a href="/foodstagram/questionReg.do/${ q.q_no }" style="background-color: white; color: black;" class="btn-type1 tert min-w">답변 등록</a> --%>
						<div class="btn-wrap col2">
							<div></div>
							<div class="col2 m-col2">
								<a href="/foodstagram/question.do" class="btn-type1 scd min-w">취소</a>
								<a href="#none" onclick="answerSave()" class="btn-type1 min-w">저장</a>
							</div>
						</div>
					</c:if>
				</div>
				</c:if>
				
				<!-- 답변이 있을경우 -->
				<c:if test="${ q.answercheck eq 'Y' }">
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
							<td><img width="50" height="50" src="/foodstagram/resources/images/logo.png"></td>
						</tr>
						<tr>
							<th>답변일시</th>
							<td><fmt:formatDate value="${ a.a_date }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						</tr>
						<tr>
							<th>답변</th>
							<td>${fn:replace(a.a_content, LF, '<br>')}</td>
						</tr>
					</tbody>
				</table>
				
				<div class="btn-wrap">
					<a href="/foodstagram/myQuestionListView.do" class="btn-type1 min-w">목록</a> 
					<!-- 관리자인 경우 수정가능-->
					<c:if test="${ loginMember.admin eq 'Y' }">
					<a href="/foodstagram/answerModify.do/${ q.q_no }" style="background-color: white; color: black;" class="btn-type1 tert min-w">수정</a>
					</c:if>
				</div>
				</c:if>

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
        url: "/foodstagram/insertAnswer.do",
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
            	alert("등록 되었습니다.");
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
</script>


	
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Question Registry</title>
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
<body>
<c:import url="/WEB-INF/views/common/nav.jsp" />
<!-- container -->
	<main class="sub">
		<c:import url="/WEB-INF/views/qna/locMenu.jsp" />

		<div class="content">
			<div class="title-wrap">
				<h3 class="h3">1:1문의</h3>
			</div>
			<form id="regForm" name="regForm" method="post" enctype="multipart/form-data" >
			<!-- <input type="hidden" id="con_seq" name="con_seq" value="">
			<input type="hidden" id="biz_gb" name="biz_gb" value="MV">
			<input type="hidden" id="mw_seq" name="mw_seq" value="Ldno00003914"> -->
			<input type="hidden" id="userid" name="userid" value="${ loginMember.userid }">
			<input type="hidden" id="q_no" name="q_no" value="${ q.q_no }">
			<!-- <input type="hidden" id="consult_sta" name="consult_sta" value="R"> -->
			<div class="board-view-type2">
				<table>
					<colgroup>
						<col style="width: 200px;">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<th>접수일시</th>
							<td></td>							
						</tr>
						<!-- <tr>
							<th>유형</th>
							<td>
								<select name="con_cate" id="con_cate">
            						                                    <option value="T01"	>알뜰요금제</option>
                                                                        <option value="T02"	>알뜰휴대폰</option>
                                                                        <option value="T03"	>가입,변경,해지</option>
                                                                        <option value="T04"	>부가서비스</option>
                                                                        <option value="T05"	>요금조회,납부</option>
                                                                        <option value="T08"	>기타</option>
                                                                        <option value="T06"	>개통문의</option>
                                                                        <option value="T07"	>홈페이지</option>
                                                					</select>
							</td>
						</tr> -->
						<tr>
							<th>아이디</th>
							<td>${ loginMember.userid }</td>
						</tr>
						<!-- <tr>
							<th>연락가능 전화번호</th>
							<td><input type="text" id="recv_phone" name="recv_phone" value="" maxlength="11" oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');"></td>
						</tr> -->
						<tr>
							<th>제목</th>
							<td><input type="text" id="q_title" name="q_title" value="${ q.q_title }" placeholder="제목을 입력해 주세요"></td>
						</tr>
						<tr>
							<th>문의내용</th>
							<td><textarea id="q_content" name="q_content" placeholder="내용을 입력해 주세요">${ q.q_content }</textarea></td>
						</tr>
						<tr>
							<th>첨부파일</th>
							<td class="file_area">
							<input multiple="multiple"  type="file"  name="boFiles">
							<c:forEach var="f" items="${q.attaches}" varStatus="st">
								<div>
									# 파일 ${st.count} <a style="color: #337ab7;" href="<c:url value='/attachDownload.do/${f.atch_no}' />" target="_blank"> <span class="glyphicon glyphicon-save" aria-hidden="true"></span> ${f.atch_original_name}
									</a> Size : ${f.atch_fancy_size} Down : ${f.atch_down_hit}
									<button class="btn_file_delete" data-atch-no="${f.atch_no}">
									<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
									</button>
								</div>
							</c:forEach>	
							</td>
						</tr>
					</tbody>
				</table>
				</div>
				</form>
				<script>
				// 상위객체를 통해 이벤트 위임  
				$('.file_area').on('click','.btn_delete', function(){
					$(this).closest('div').remove();
				});
				 
				// 기존 첨부파일 삭제 클릭 
				$('.btn_file_delete').click(function(){
					$btn = $(this);
					$btn.closest('div').html(
							 '<input type="hidden" name="delAtchNos" value="' + $btn.data("atch-no")  + '" />'
							); 
				});   //
				</script>
				
				
				
				
				<div class="dv-line dv-line-type1"></div>				
			

			<div class="btn-wrap col2">
				<div></div>
				<div class="col2 m-col2">
					<a href="/foodstagram/qnaDetail.do?q_no=${ q.q_no }" class="btn-type1 scd min-w">취소</a>
					<a href="#none" onclick="inquirySave()" class="btn-type1 min-w">저장</a>
					<a href="#none" onclick="inquiryDelete()" class="btn-type1 min-w">삭제</a>
				</div>
			</div>

		</div>
	</main>
	<!-- //container -->
	<script>
function inquirySave(){
	console.log($("#regForm")[0]);
	
	if($("#q_title").val() == "") {
		alert('글 제목을 입력해주시기 바랍니다.');
		return false;
	}

/* 	if($("#recv_phone").val() == "") {
		alert('연락가능한 전화번호를 입력해주시기 바랍니다.');
		return false;
	} */

	if($("#q_content").val() == "") {
		alert('문의 내용을 입력해주시기 바랍니다.');
		return false;
	}


	$.ajax({
        url: "/foodstagram/questionModify.do",
        type: "post",
        data: new FormData($("#regForm")[0]),
        enctype: "multipart/form-data",
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
            	alert("수정 되었습니다.");
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

function inquiryDelete(){
	
	if(confirm('정말로 삭제하시겠습니까?')) {
		console.log('yes클릭ㅋ');
	} else {
		return false;
	}
	

	$.ajax({
        url: "/foodstagram/questionDelete.do",
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
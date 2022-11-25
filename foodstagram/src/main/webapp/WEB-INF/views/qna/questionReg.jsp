<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Question Registry</title>
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
			<form id="regForm" name="regForm" method="post" enctype="multipart/form-data" action="insertQuestion.do" >
			<!-- <input type="hidden" id="con_seq" name="con_seq" value="">
			<input type="hidden" id="biz_gb" name="biz_gb" value="MV">
			<input type="hidden" id="mw_seq" name="mw_seq" value="Ldno00003914"> -->
			<input type="hidden" id="userid" name="userid" value="${ loginMember.userid }">
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
							<td><input type="text" id="q_title" name="q_title" value="" placeholder="제목을 입력해 주세요"></td>
						</tr>
						<tr>
							<th>문의내용</th>
							<td><textarea id="q_content" name="q_content" placeholder="내용을 입력해 주세요"></textarea></td>
						</tr>
						<tr>
							<th>첨부파일</th>
							<td><input multiple="multiple"  type="file" name="picFile"></td>
						</tr>
					</tbody>
				</table>
				</form>
				<div class="dv-line dv-line-type1"></div>				
			</div>

			<div class="btn-wrap col2">
				<div></div>
				<div class="col2 m-col2">
					<a href="/foodstagram/question.do" class="btn-type1 scd min-w">취소</a>
					<a href="#none" onclick="inquirySave()" class="btn-type1 min-w">저장</a>
				</div>
			</div>

		</div>
	</main>
	<!-- //container -->
	<script>
function inquirySave(){
	if($("#q_title").val() == "") {
		alert('글 제목을 입력해주시기 바랍니다.');
		return false;
	}

	if($("#recv_phone").val() == "") {
		alert('연락가능한 전화번호를 입력해주시기 바랍니다.');
		return false;
	}


	if($("#q_content").val() == "") {
		alert('문의 내용을 입력해주시기 바랍니다.');
		return false;
	}


	$.ajax({
        url: "insertQuestion.do",
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
            if(jsonobj.success==true){
            	alert("등록 되었습니다.");
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
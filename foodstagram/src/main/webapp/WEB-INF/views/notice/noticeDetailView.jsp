<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link href="/foodstagram/resources/css/reset.css">
<link href="/foodstagram/resources/css/style.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.eyes.co.kr/assets/css/reset.css?v=1669255025">
<link rel="stylesheet" href="https://www.eyes.co.kr/assets/css/swiper.min.css">
<link rel="stylesheet" href="https://www.eyes.co.kr/assets/css/jquery.mCustomScrollbar.min.css">
<link rel="stylesheet" href="https://www.eyes.co.kr/assets/css/site.css?v=1669255025">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">

<style>
/*Layout*/
#wrap {
	width: 1274px;
	position: relative;
	text-align: center;
	margin: 0 auto;
	background: #fff;
	text-align: left;
}

#header {
	width: 1274px;
	position: fixed;
	background: #fff;
	height: 191px;
	z-index: 99;
	left: 50%;
	top: 0;
	margin-left: -637px;
}

#container {
	width: 956px;
	position: relative;
	margin: 0 auto;
	padding-top: 191px;
	/* background:#f5f3ed; */
	min-height: 700px;
}

#scontainer00 {
	width: 956px;
	position: relative;
	margin: 0 auto;
	padding-top: 191px;
	background: #fff;
	min-height: 700px;
}

#scontainer01 {
	width: 956px;
	position: relative;
	margin: 0 auto;
	padding-top: 191px;
	background: #ece5d6;
	min-height: 700px;
}

.s_container {
	width: 956px;
	margin: 0 auto;
	padding-top: 0px;
	padding-bottom: 0px;
	position: relative;
	line-height: 22px;
}

.m_container {
	width: 956px;
	margin: 0 auto;
	padding-bottom: 60px;
}
/*Basic*/
#board_area {
	text-align: center;
	font-size: 12px;
	color: #666;
	min-height: 20px;
	font-family: 'NanumGothic', 'Malgun Gothic', 'verdana', 'arial', 'dotum', '돋움';
	position: relative;
}

#board_area a:link, #board_area a:visited, #board_area a:active {
	color: #666;
	text-decoration: none;
}

.a_right {
	position: absolute;
	top: 20px;
	right: 0;
}
 a:link { text-decoration:none; color:#2f2f2f;}
 a:visited { text-decoration:none;color:#2f2f2f;}
 a:active {text-decoration:none; color:#2f2f2f; }
 a:hover { text-decoration:none; color:#8f8f8f;}
 
#board_area a:hover {
	color: #2f2f2f;
	/*color:#d60c0c; (red)*/
	/*color:#ff7200; (orange)*/
}

.color_red {
	color: #d60c0c;
}
/* 버튼 */
.board_btn {
	margin-top: 10px;
	margin-bottom: 40px;
	text-align: center;
	overflow: hidden;
	width: 100%;
}

.board_bt_style01:hover {
	background-color: #F95E25;
}

input.board_bt_style01 {
	border: 0px;
	color: #fff;
	background: #666c74;
	width: 83px;
	height: 30px;
	line-height: 29px;
	font-size: 14px;
	cursor: pointer;
	border-radius: 5px;
	text-align: center;
}

input.board_bt_style02 {
	border: 0px;
	width: 83px;
	height: 30px;
	line-height: 29px;
	color: #7c7b7b;
	background: #e7e7e7;
	font-size: 0.9em;
	cursor: pointer;
}

input.board_bt_style03 {
	border: 0px;
	width: 50px;
	height: 25px;
	line-height: 25px;
	color: #fff;
	background: #666c74;
	font-size: 1em;
	cursor: pointer;
}
/*LIST*/
.free_board, .free_board_view, .free_board_write {
	align: center;
	width: 1000px;
	border-top: 2px solid #a17d33;
}

.free_board th {
	border-bottom: 1px solid #ddd;
	padding: 15px 10px;
/* 	background: url("../notice_img/line_bg.gif") no-repeat center right; */
}

.free_board td, .free_board_view td {
	border-bottom: 1px solid #ddd;
	padding: 15px 10px;
}

.bor_l {
	border-left: 3px solid #ddd;
}

.bor_r {
	border-right: 3px solid #ddd;
}

.title_area {
	text-align: left;
}

.title_area span {
	font-weight: bold;
	color: #dd4949;
}

.bt_list {
	padding: 6px 25px;
	background: #005faf;
	color: #fff;
	font-weight: bold;
	border: 0px solid;
}

.board_search {
	float: right;
	width: 280px;
	*width: 280px;
	height: 39px;
	margin: 0;
	text-align: right;
}

.board_search select {
	height: 25px;
}

.search_b {
	width: 200px;
	height: 25px;
	text-align: left;
	margin-left: 3px;
}

.board_bottom_bar {
	width: 130px;
	_background: #326cb4;
	border: 1px #ddd solid;
	color: #666;
	height: 23px;
	margin-left: 3px;
	line-height: 23px;
}

/*VIEW*/
.free_board_view {
	border-bottom: 1px solid #ddd;
	text-align: center;
}

.free_board_view th {
	border-bottom: 1px solid #ddd;
	padding: 15px 8px;
	/* background: url("../notice_img/line_bg.gif") no-repeat center right; */
	text-align: center;
}

.free_board_view td {
	text-align: left;
	padding: 5px 10px;
}

.board_title01 {
	font-size: 14px;
	font-weight: bold;
	text-align: center;
}

.board_b {
	border-bottom: 1px solid #ddd;
}

.board_bn {
	border-bottom: none;
}

.view_pd {
	padding: 15px;
	line-height: 20px;
}

.board_data {
	font-size: 14px;
	font-weight: normal;
}
.board_data2 {
	font-size: 14px;
	font-weight: normal;
	margin-left: 10px;
}
th.board_stitle {
	font-weight: normal;
	font-size: 11px;
}
th.a_left {
	text-align: left;
}
.number {
	margin: 20px 0;
	clear: both;
}
.number img {
	vertical-align: middle;
}

td.notice {
	background: #fff;
}

.notice span {
	font-weight: bold;
}

span.notice_bg {
	height: 10px;
	width: 30px;
	margin-top: 1px;
	padding: 4px 5px 0px 5px;
	text-align: center;
	background: #a17d33;
}

th.last_bg {
	background: none;
}

.board_fLeft {
	float: left;
	width: 60%;
	text-align: left;
}

.board_fRight {
	float: right;
	width: 30%;
	text-align: right;
}

.p {
	display: block;
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
}
/*Footer*/
#footer {
	width: 100%;
	position: relative;
	clear: both;
	background: #332722;
	height: 63px;
}
</style>
</head>
<body>

	<!-- Wrap -->
	<div id="wrap">
		<!-- Header -->
		<div id="header">
			<c:import url="/WEB-INF/views/common/nav.jsp" />
		</div>
		<!-- END Header -->
		<!-- Container -->
		<div id="scontainer00">
			<div class="s_container">
				<ul class="stab">
					<!--Button-->
					<div class="board_btn">
						<input type="button" class="board_bt_style01" title=""
							value="목록으로" name=""
							onclick="location.href ='${ pageContext.servletContext.contextPath }/nlist.do';">
					<p></p>
					</div>
			</div>
			</ul>
			<div id="board_area">
				<!--Board_View-->
				<table cellpadding="0" cellspacing="0" class="free_board_view"
					summary="">
					<colgroup>
						<col width="85">
						<col width="*">
						<col width="85">
						<col width="100">
						<col width="85">
						<col width="80">
					</colgroup>
					<tbody>
						<tr>
							<th>&nbsp;&nbsp;&nbsp;&nbsp;<img
								src="${ pageContext.servletContext.contextPath }/resources/notice_img/t_01.png"
								border="0" alt="제목">
							<td colspan="4" class="board_title01">${ notice.noticetitle }&nbsp;&nbsp;&nbsp;&nbsp;
								<c:if test="${ notice.importance eq 1 }"></c:if> <c:if
									test="${ notice.importance eq 2 }">
									<img
										src="${ pageContext.servletContext.contextPath }/resources/notice_img/notice.png">
								</c:if>
							<td style="text-align: right;"><span class="mr2"> <img
									src="../notice_img/empty.png" width="16" height="16" border="0"
									alt=""></a></span> <span class="mr2"><img
									src="../notice_img/empty.png" width="17" height="16" border="0"
									alt=""></a></span></td>
						</tr>
						<tr>
							<th><img
								src="${ pageContext.servletContext.contextPath }/resources/notice_img/t_02.png"
								border="0" alt="작성자 "></th>
							<td class="board_data">${ notice.userid }</td>
							<th><img
								src="${ pageContext.servletContext.contextPath }/resources/notice_img/t_04.png"
								border="0" alt="등록일 "></th>
							<td><fmt:formatDate value="${ notice.noticedate }" pattern="yyyy-MM-dd" /></td>
							<th><img
								src="${ pageContext.servletContext.contextPath }/resources/notice_img/t_06.png"
								border="0" alt="조회수"></th>
							<td class="board_data">${ notice.readcount }</td>
						</tr>

						<tr>
							<td colspan="6" class="board_data2">
								<!-- 파일이 그림일 경우 출력(gif/jpg) -->
								<p style="line-height: 2;"></p>
								<p align="justify" style="text-align: justify; line-height: 2;">
									<span style="font-family:"나눔고딕", "NanumGothic" , Sans-serif; font-size: 10pt;">
										<div style="padding: 30px","font-family:"나눔고딕", "NanumGothic" , Sans-serif; font-size: 10pt;" >
											${ notice.noticecontent } <br><br><br><br><br><br></div></span>
								</p>
								</p>
						</td>
						</tr>
						
					</tbody>
				</table>
			</div>
			<!-- END View -->
			<table cellpadding="20px" cellspacing="0" class="pre_next" summary="">
			<br>
				<tbody>
					<tr class="board_data">
						<th style="width: 20"><img
							src="${ pageContext.servletContext.contextPath }/resources/notice_img/t_05.png"
							width="41" height="14" border="0" alt="첨부파일"></th>
						<td>
							<c:forEach var="f" items="${ notice.attaches }" varStatus="st">
								<div> &nbsp;&nbsp;&nbsp;&nbsp;파일 ${st.count} <a href="<c:url value='/noticeAttachDownload.do/${f.atch_no}' />" target="_blank"> 
						        &nbsp;${f.atch_original_name}
						      	 </a> (Size : ${f.atch_fancy_size} Down : ${f.atch_down_hit})
						        </div>
								</c:forEach>
						</td>
					</tr>
				</tbody>
			</table>
			</div>
			</div>
			
	<!--END Board-->

	<!-- Footer Start -->
	<!-- Footer End -->
</body>
</html>

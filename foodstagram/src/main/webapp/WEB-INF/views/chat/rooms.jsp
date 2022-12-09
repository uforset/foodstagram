<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="../common/error.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
</head>
<body>
	<div class="container">
		<div>
			<c:forEach var="room" items="${ list }">
				<li><a
					href="/foodstagram/chat/room?roomId=${room.chat_room_id}">[${room.title}]</a></li>
			</c:forEach>
		</div>
	</div>
	<form action="/foodstagram/chat/room" method="post">
		<input type="text" name="name" class="form-control">
		<button class="btn btn-secondary">개설하기</button>
	</form>

	<!-- Modal HTML embedded directly into document -->
	<div id="ex1" class="modal">
		<div class="sc-dJjYzT dBWvOS">
			<div radius="12" class="sc-eCImPb jviKBE">
				<div class="sc-gWXbKe hoQshO">
					<div class="sc-bYoBSM dzSZyO">
						<svg aria-label="닫기" color="#262626" fill="#262626" height="18"
							role="img" viewBox="0 0 24 24" width="18">
							<polyline fill="none" points="20.643 3.357 12 12 3.353 20.647"
								stroke="currentColor" stroke-linecap="round"
								stroke-linejoin="round" stroke-width="3"></polyline>
							<line fill="none" stroke="currentColor" stroke-linecap="round"
								stroke-linejoin="round" stroke-width="3" x1="20.649" x2="3.354"
								y1="20.649" y2="3.354"></line></svg>
						<h1>새로운 메시지</h1>
						<button>다음</button>
					</div>
					<div class="sc-ikJyIC jgKhFI">
						<h4>받는 사람:</h4>
						<div class="input-container">
							<div class="button-container"></div>
							<input type="text" placeholder="검색..." value="">
						</div>
					</div>
					<div class="sc-hiCibw kWLlWY">
						<span>추천</span>
						<div class="new-chat-recommend-container"></div>
					</div>
				</div>
			</div>
		</div>
		<a href="#" rel="modal:close">Close</a>
	</div>

	<!-- Link to open the modal -->
	<p>
		<a href="#ex1" rel="modal:open">Open Modal</a>
	</p>

</body>
</html>
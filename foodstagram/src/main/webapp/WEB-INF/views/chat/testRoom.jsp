<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link href="/foodstagram/resources/css/reset.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />

<link type="text/css" rel="stylesheet" href="/foodstagram/resources/css/chat.css"/>
<link type="text/css" rel="stylesheet" href="https://static.cdninstagram.com/rsrc.php/v3/yW/l/0,cross/GRBLtORsLSv68D1ULvQ1ZXlWNJTd1nq3EyhmpWE7yj6sPrzZdOfaaOJGNIqRzhKKJ4G1MYIIw_sSJ.css?_nc_x=Ij3Wp8lg5Kz" data-bootloader-hash="d4wCzse" crossorigin="anonymous" data-p=":24,48,9,25,4,108,53" data-c="1" onload="" onerror="" />
<link type="text/css" rel="stylesheet" href="data:text/css; charset=utf-8,body._a3wf&#123;background:rgb(var(--ig-primary-background));color:rgb(var(--ig-primary-text));font-family:var(--font-family-system);font-size:var(--system-14-font-size);line-height:var(--system-14-line-height);margin:0;overflow-y:visible&#125;%23bootloader_Fm4crfp&#123;height:42px;&#125;.bootloader_Fm4crfp&#123;display:block!important;&#125;" data-bootloader-hash="Fm4crfp" data-p=":0" data-c="1" onload="" onerror="" />
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" rel="stylesheet">    

<style type="text/css">
.sk-circle {
  margin: 20px auto;
  width: 40px;
  height: 40px;
  position: relative;
}
.sk-circle .sk-child {
  width: 100%;
  height: 100%;
  position: absolute;
  left: 0;
  top: 0;
}
.sk-circle .sk-child:before {
  content: '';
  display: block;
  margin: 0 auto;
  width: 15%;
  height: 15%;
  background-color: black;
  border-radius: 100%;
  -webkit-animation: sk-circleBounceDelay 0.5s infinite ease-in-out both;
          animation: sk-circleBounceDelay 1.2s infinite ease-in-out both;
}
.sk-circle .sk-circle2 {
  -webkit-transform: rotate(30deg);
      -ms-transform: rotate(30deg);
          transform: rotate(30deg); }
.sk-circle .sk-circle3 {
  -webkit-transform: rotate(60deg);
      -ms-transform: rotate(60deg);
          transform: rotate(60deg); }
.sk-circle .sk-circle4 {
  -webkit-transform: rotate(90deg);
      -ms-transform: rotate(90deg);
          transform: rotate(90deg); }
.sk-circle .sk-circle5 {
  -webkit-transform: rotate(120deg);
      -ms-transform: rotate(120deg);
          transform: rotate(120deg); }
.sk-circle .sk-circle6 {
  -webkit-transform: rotate(150deg);
      -ms-transform: rotate(150deg);
          transform: rotate(150deg); }
.sk-circle .sk-circle7 {
  -webkit-transform: rotate(180deg);
      -ms-transform: rotate(180deg);
          transform: rotate(180deg); }
.sk-circle .sk-circle8 {
  -webkit-transform: rotate(210deg);
      -ms-transform: rotate(210deg);
          transform: rotate(210deg); }
.sk-circle .sk-circle9 {
  -webkit-transform: rotate(240deg);
      -ms-transform: rotate(240deg);
          transform: rotate(240deg); }
.sk-circle .sk-circle10 {
  -webkit-transform: rotate(270deg);
      -ms-transform: rotate(270deg);
          transform: rotate(270deg); }
.sk-circle .sk-circle11 {
  -webkit-transform: rotate(300deg);
      -ms-transform: rotate(300deg);
          transform: rotate(300deg); }
.sk-circle .sk-circle12 {
  -webkit-transform: rotate(330deg);
      -ms-transform: rotate(330deg);
          transform: rotate(330deg); }
.sk-circle .sk-circle2:before {
  -webkit-animation-delay: -1.1s;
          animation-delay: -1.1s; }
.sk-circle .sk-circle3:before {
  -webkit-animation-delay: -1s;
          animation-delay: -1s; }
.sk-circle .sk-circle4:before {
  -webkit-animation-delay: -0.9s;
          animation-delay: -0.9s; }
.sk-circle .sk-circle5:before {
  -webkit-animation-delay: -0.8s;
          animation-delay: -0.8s; }
.sk-circle .sk-circle6:before {
  -webkit-animation-delay: -0.7s;
          animation-delay: -0.7s; }
.sk-circle .sk-circle7:before {
  -webkit-animation-delay: -0.6s;
          animation-delay: -0.6s; }
.sk-circle .sk-circle8:before {
  -webkit-animation-delay: -0.5s;
          animation-delay: -0.5s; }
.sk-circle .sk-circle9:before {
  -webkit-animation-delay: -0.4s;
          animation-delay: -0.4s; }
.sk-circle .sk-circle10:before {
  -webkit-animation-delay: -0.3s;
          animation-delay: -0.3s; }
.sk-circle .sk-circle11:before {
  -webkit-animation-delay: -0.2s;
          animation-delay: -0.2s; }
.sk-circle .sk-circle12:before {
  -webkit-animation-delay: -0.1s;
          animation-delay: -0.1s; }

@-webkit-keyframes sk-circleBounceDelay {
  0%, 80%, 100% {
    -webkit-transform: scale(0);
            transform: scale(0);
  } 40% {
    -webkit-transform: scale(1);
            transform: scale(1);
  }
}

@keyframes sk-circleBounceDelay {
  0%, 80%, 100% {
    -webkit-transform: scale(0);
            transform: scale(0);
  } 40% {
    -webkit-transform: scale(1);
            transform: scale(1);
  }
}

.modify {
	 display: none;
}

</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment-with-locales.min.js" integrity="sha512-NOqkPURPEeHGvb+6NAzb8hfxqUh9XvuaCDP+FevWSPM5a9yD8eLTVCwDzHh0G+mDRXH044rGtMKxyaDncAW4cw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script type="text/javascript">
// 선택한 userid 저장용도임
moment.locale('ko');
var users = [];
var page = 2;
var endflag = false;

var isLoading = false;

function leaveChatRoom() {
	
	var leave = confirm('채팅 나가기.\n 채팅을 나갈경우 다시들어올 수 없습니다.')
	
	if(leave){
		$.ajax({
		    url: "/foodstagram/chat/leaveChatRoom.do", // 호출할 주소
		    type: "post",
		    data: { userid: '${loginMember.userid}',
		    		chat_room_id: '${selectedRoom.chat_room_id}'}, // 넘길 데이터
		    dataType: "json", // 데이터 타입 json으로 설정 <- 이걸 안하면 밑에 처럼 JSON.parse를 해야함
		    success: function(data) {
		    	alert('채팅방 나가기 성공, 방목록으로 이동');
		    	location.href='/foodstagram/chat/rooms';
		    },
		    error: function () {
	        }
		});
		

	}
}

function titleEdit() {
	var ttle= prompt('채팅방 이름 변경');
	console.log(ttle);
	$.ajax({
	    url: "/foodstagram/chat/roomTitleEdit.do", // 호출할 주소
	    type: "post",
	    data: { title: ttle,
	    		chat_room_id: '${selectedRoom.chat_room_id}'}, // 넘길 데이터
	    dataType: "json", // 데이터 타입 json으로 설정 <- 이걸 안하면 밑에 처럼 JSON.parse를 해야함
	    success: function(data) {
	    	$('#title').html(ttle);
	    	$('#title2').html(ttle);
	    },
	    error: function () {
        }
	});
}

function deleteMessage() {
	
	let dgo = confirm('메시지 전송을 취소하시겠어요?\n메시지 전송을 취소하면 모든 사람에게 보낸 메시지가 삭제됩니다.\n상대방이 이미 메시지를 확인했을 수 있습니다.');
	//console.log($(this).parent().parent().parent().parent().parent().parent());
	var dmg = $(this).closest('.mButton').parent();
	console.log($(this).val());
	if(dgo){
		$.ajax({
		    url: "/foodstagram/chat/deleteMessage.do", // 호출할 주소
		    type: "post",
		    data: { cm_no: $(this).val() }, // 넘길 데이터
		    dataType: "json", // 데이터 타입 json으로 설정 <- 이걸 안하면 밑에 처럼 JSON.parse를 해야함
		    success: function(data) {
				dmg.remove();
		    },
		    error: function () {
	        }
		});
	}
}


function visibleUsers() {
	$('._aa2u > div._ab8m').remove();
	users.forEach(function(element) {
		$('._aa2u > input').before('<div class=" _ab8m  _ab8p _ab8w  _ab94 _ab99 _ab9h _ab9k _ab9p _abaj _aba_ _abbh _abbz  _ab9z _abcm" style="height: 26px;"><button class="_acan _acao _acas _aj1-" type="button"><div class="_aacl _aaco _aacu _aad0 _aad6">'
		+element+
		'</div></button><div class="_ab8w  _ab94 _ab99 _ab9h _ab9m _ab9p  _abb0 _abcm"><button class="_abl- _abm2" type="button"><div class="_abm0"><svg aria-label="물품 삭제" class="_ab6-" color="#0095f6" fill="#0095f6" height="12" role="img" viewBox="0 0 24 24" width="12"><polyline fill="none" points="20.643 3.357 12 12 3.353 20.647" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="3"></polyline><line fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="3" x1="20.649" x2="3.354" y1="20.649" y2="3.354"></line></svg></div></button></div></div>')
	})
	$('._ab8w > ._abl-._abm2').click(function (){
		console.log(this);
		var name = $(this).parent().parent().find('div._aacl').html()
		console.log(name);
		//먼져 users배열에 삭제해쥼,,,
		let idx = users.indexOf(name);
		users.splice(idx, 1);
		console.log('유저추가목록에서 제거완료 리스트에 있으면 체크 제거함.');
		
		//위에 찾음 배열에 userid 찾은거 삭제하고 체크표시도 풀어쥼....
		var tmp= $('div._abm4[role=button]').find('#f35c4a31fcb4da').find('div._aad6');
		
		for(i=0; i<tmp.length; i++) {
			console.log(tmp[i].innerHTML);
			if(tmp[i].innerHTML == name) {
				console.log('같은거발견 단숨에 지워줄게');
				name=tmp[i].innerHTML;
				//checked=$(tmp[i]).parent().parent();
				checked=$(tmp[i]).closest('._abm4').find('._abm0');
				console.log(checked);
				//let idx = users.indexOf(name);
        		//users.splice(idx, 1);
        		//console.log('유저추가목록에서 제거완료 체크도제거함.');
        		checked.html('');
        		checked.html(`<svg aria-label="선택 여부 변경" class="_ab6-" color="#262626" fill="#262626" height="24" role="img" viewBox="0 0 24 24" width="24">
                        <circle cx="12.008" cy="12" fill="none" r="11.25" stroke="currentColor" stroke-linejoin="round" stroke-width="1.5"></circle>
	                    </svg>`);
        		console.log(users);
			}
		}
		visibleUsers();
		nextCheck();
	});
}
</script>
<!-- 채팅 부분 -->
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<c:url var="url22" value="/stomp/chat"></c:url>
<script type="text/javascript">

function enterkey() {
	if (window.event.keyCode == 13) {
		sendMsg();
    }
}

	$(document).ready(function() {

		var roomName = "${selectedRoom.title}";
		var roomId = "${selectedRoom.chat_room_id}";
		var userid = "${ loginMember.userid }";
		var username = "${ loginMember.username }";

		console.log(roomName + ", " + roomId + ", " + username);
		
		
		var sockJs = new SockJS("${pageContext.request.contextPath}/stomp");
		//1. SockJS를 내부에 들고있는 stomp를 내어줌
		var stomp = Stomp.over(sockJs);

		//2. connection이 맺어지면 실행
		stomp.connect({}, function() {
			console.log("STOMP Connection");

			//4. subscribe(path, callback)으로 메세지를 받을 수 있음
			stomp.subscribe("/sub/chat/room/" + roomId, function(chat) {
				console.log("STOMP subscribe");
				console.log(chat);

				var content = JSON.parse(chat.body);

				var writer = content.userid;
				var str = '';
				console.log(content.create_date);
				console.log(Date(content.create_date));
				
				if (writer === userid) { //보낸사람이 나임
					str = `<div class="_ab8w  _ab94 _ab96 _ab9f _ab9k _ab9p _abcm">
					    <div class="_ab8w  _ab94 _ab99 _ab9f _ab9m _ab9p  _abak _abbi _abcm">
				        <div class="_ab8w  _ab94 _ab99 _ab9f _ab9m _ab9p _abcm" style="height: 24px; width: 24px;"></div>
				    </div>
				    <div class="mButton _ac72" role="listbox" tabindex="0">
				        <div class="x78zum5 xdt5ytf">
				            <div class="_acd2 _acd3">
				                <div class="_acqt _acqv" role="listbox" tabindex="0">
				                <button class="modify _abl-" type="button">
		                        <div class="_abm0 _abm1"><svg aria-label="전송 취소" class="_ab6-" color="#262626" fill="#262626" height="24" role="img" viewBox="0 0 24 24" width="24">
		                                <circle cx="12" cy="12" r="1.5"></circle>
		                                <circle cx="6" cy="12" r="1.5"></circle>
		                                <circle cx="18" cy="12" r="1.5"></circle>
		                            </svg></div>
		                        <div class="_abm0 _abl_"><svg aria-label="전송 취소" class="_ab6-" color="#8e8e8e" fill="#8e8e8e" height="24" role="img" viewBox="0 0 24 24" width="24">
		                        		<circle cx="12" cy="12" r="1.5"></circle>
		                                <circle cx="6" cy="12" r="1.5"></circle>
		                                <circle cx="18" cy="12" r="1.5"></circle>
		                            </svg></div>
		                    </button>
		                    <div class="modify _acqw _acqx">
		                        <div aria-hidden="true" class="_abw6 _abw7 _abwc _abwa">
		                            <div class="_abwe _ae-l" style="left: calc(50% - 20px);">
		                                <div class="_ad8p _abwa"></div>
		                            </div>
		                            <div class="_abwm">
		                                <div class="_ab8w  _ab94 _ab99 _ab9f _ab9m _ab9p _abcm"><button id="deleteButton" value="`+content.cm_no+`" class="_acan _aiit _acao _aija _acas _aj1-" type="button">
		                                        <div class="_aacl _aaco _aacw _aad3 _aad6 _aadc _aade">전송 취소</div>
		                                    </button></div>
		                            </div>
		                        </div>
		                    </div>
		                    <div class="modify" style="color: #8e8e8e; padding-right: 3px;">`+moment(new Date(content.create_date)).format('YYYY-MM-DD HH:mm:ss')+`</div>    
				                
				                <div class=" _ac1n">
				                        <div class=" _ac1q _ac1r _ac1v _ac1w">
				                            <div role="button" class="_aa06" tabindex="-1">
				                                <div class="_ab8w  _ab94 _ab99 _ab9h _ab9m _ab9p  _ab9- _abaa _abcm" style="min-height: 44px;">
				                                    <div class="_aacl _aaco _aacu _aacx _aad9 _aadf">
				                                        <div class="_aacl _aaco _aacu _aacx _aad6 _aade">`+content.message+`</div>
				                                    </div>
				                                </div>
				                            </div>
				                        </div>
				                    </div>
				                </div>
				            </div>
				        </div>
				    </div>
				</div>`;
					$("#msgArea").html($("#msgArea").html() + str);

				} else { // 보낸사람이 내가아님
					str = `<div class="_ab8w  _ab94 _ab96 _ab9f _ab9k _ab9p _abcm">
						<div class="_aacl _aacn _aacu _aacy _aada">`+content.username+`</div>
						</div>`;
					str += `<div class="_ab8w  _ab94 _ab96 _ab9f _ab9k _ab9p _abcm">
						<div class="mButton _ac72" role="listbox" tabindex="0">
					    <div class="x78zum5 xdt5ytf">
					        <div class=" _acd3">
					            <div class="_acqt _acqu" role="listbox" tabindex="0">
					            <div class="modify"><svg aria-label="전송 취소" class="_ab6-" color="#8e8e8e" fill="#8e8e8e" height="20" role="img"  width="180">
			                    <text x="10" y="20">`+moment(new Date(content.create_date)).format('YYYY-MM-DD HH:mm:ss')+`</text>
			                </svg></div>
			        
			        <div class="_acqw _acqy">
			            <div aria-hidden="true" class="_abw6 _abw7 _abwc _abwa">
			                <div class="_abwe _ae-l" style="left: calc(-50% + 20px);">
			                    <div class="_ad8p _abwa"></div>
			                </div></div></div>
					            	<div class=" _ac1n">
					                    <div class=" _ac1r _ac1w">
					                        <div role="button" class="_aa06" tabindex="-1">
					                            <div class="_ab8w  _ab94 _ab99 _ab9h _ab9m _ab9p  _ab9- _abaa _abcm" style="min-height: 44px;">
					                                <div class="_aacl _aaco _aacu _aacx _aad9 _aadf">
					                                    <div class="_aacl _aaco _aacu _aacx _aad6 _aade">`+content.message+`</div>
					                                </div>
					                            </div>
					                        </div>
					                    </div>
					                </div>
					            </div>
					        </div>
					    </div>
					</div>
					</div>`;
					$("#msgArea").html($("#msgArea").html() + str);
				}
				console.log(str)
				$('#scroll').scrollTop($('#scroll')[0].scrollHeight);
				//$("#msgArea").html($("#msgArea").html() + str);
			});

			//3. send(path, header, message)로 메세지를 보낼 수 있음
			//stomp.send('/pub/chat/enter', {}, JSON.stringify({
			//	roomId : roomId,
			//	userid : username
			//}))
		});
		
		
		$("#button-send").click(function sendMsg() {
			//var msg = document.getElementById("msg");
			var msg = $('#msg');
			
			console.log(username + ":" + msg.val());
			stomp.send('/pub/chat/message', {}, JSON.stringify({
				chat_room_id : roomId,
				message : msg.val(),
				userid : userid,
				username : username,
				//create_date : new Date(),
			}));
			msg.val('');
		});
	    
		$("#msg").keyup(function (){
			if(window.event.keyCode==13) {
				var str = $('#msg').val();
				$('#msg').val( str.replace(/\n$/, ''));
				$("#button-send").trigger('click');
			}
		})
	});

</script>


</head>
<body>
<c:import url="/WEB-INF/views/common/nav.jsp" />
    <script type="application/json" data-content-len="91" data-sjs>
    {
        "require": [
            ["injectQPLTagsServerJSIntoWindow", "injectQPLTagsServerJSIntoWindow", null, []]
        ]
    }
    </script>
    <div style="height: 100%; width: 100%;">
        <section class="x78zum5 xdt5ytf x1iyjqo2 x6ikm8r x5yr21d xh8yej3">
            <div class="xnz67gz x78zum5 xdt5ytf x1iyjqo2 x5yr21d xmz0i5r x1jbp7et" style="padding-top: 10px;">
                <div class="_ab8w  _ab94 _ab99 _ab9f _ab9m _ab9o _abcm" style="height: 100%; width: 100%;">
                    <div class="_aa5b">
                        <div class="_ab8j _ab8l _ab8w  _ab94 _ab99 _ab9h _ab9k _ab9o _ab9s _abcm" style="height: 100%; width: 100%; max-height: 800px; max-width: 935px;">
                            <div class="_aa5c">
                                <div class="_aa4j" style="z-index: 1;">
                                    <div class="_aa4k">
                                        <div class="_aa4m _aa4n"></div>
                                        <div class="_aa4o">
                                            <div class="_ab8w  _ab94 _ab99 _ab9f _ab9m _ab9p _abcm" style="width: 100%;"><button aria-label="계정 전환 - tjgyqo2" class="_acan _acao _acas" type="button" tabindex="0">
                                                    <div class="_ab8w  _ab94 _ab97 _ab9h _ab9k _ab9p _abcm" style="width: 100%;">
                                                        <div class="_abyj">
                                                            <div class="_aacl _aacp _aacw _aacx _aada _aade">${ loginMember.userid }</div>
                                                        </div>
                                                        <div class="_ab8w  _ab94 _ab99 _ab9f _ab9m _ab9p  _ab9y _aba8 _abcm"><span style="display: inline-block; transform: rotate(180deg);"><svg aria-label="아래쪽 V자형 아이콘" class="_ab6-" color="#262626" fill="#262626" height="20" role="img" viewBox="0 0 24 24" width="20">
                                                                    
                                                                </svg></span></div>
                                                    </div>
                                                </button></div>
                                        </div>
                                        <div class="_aa4m _aa4p"><a href="#ex1" rel="modal:open"><button class="_abl- _abm2" type="button">
                                                <div class="_abm0"><svg aria-label="새로운 메시지" class="_ab6-" color="#262626" fill="#262626" height="24" role="img" viewBox="0 0 24 24" width="24">
                                                        <path d="M12.202 3.203H5.25a3 3 0 0 0-3 3V18.75a3 3 0 0 0 3 3h12.547a3 3 0 0 0 3-3v-6.952" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"></path>
                                                        <path d="M10.002 17.226H6.774v-3.228L18.607 2.165a1.417 1.417 0 0 1 2.004 0l1.224 1.225a1.417 1.417 0 0 1 0 2.004Z" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"></path>
                                                        <line fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" x1="16.848" x2="20.076" y1="3.924" y2="7.153"></line>
                                                    </svg></div>
                                            </button></a></div>
                                    </div>
                                </div>
                                <div class="_ab8w  _ab94 _ab99 _ab9f _ab9m _ab9p _ab9s _abcm" style="height: 100%;">
                                    <div class="_ab8w  _ab94 _ab99 _ab9f _ab9m _ab9o _abcm" style="height: 100%;">
                                        <div class="_abyl">
                                            <div class="_abyk" style="height: 100%; overflow: hidden auto;">
                                                <div style="position: relative; display: flex; flex-direction: column; padding-bottom: 0px; padding-top: 0px;">
                                                	
                                                    <!-- 챗방 추가 -->
                                                    <c:forEach var="room" items="${ list }">
                                                    	<c:if test="${ room.chat_room_id eq selectedRoom.chat_room_id }">
                                                    	<div class=" _ab8o _ab8w  _ab94 _ab99 _ab9f _ab9m _ab9p _abcm">
                                                    	</c:if>
                                                    	<c:if test="${ room.chat_room_id ne selectedRoom.chat_room_id }">
                                                    	<div class=" _ab8s _ab8w  _ab94 _ab99 _ab9f _ab9m _ab9p _abcm">
                                                    	</c:if>
                                                        <div class="_abm4"><a class="x1i10hfl xjbqb8w x6umtig x1b1mbwd xaqea5y xav7gou x9f619 x1ypdohk xt0psk2 xe8uvvx xdj266r x11i5rnm xat24cr x1mh8g0r xexx8yu x4uap5 x18d9i69 xkhd6sd x16tdsg8 x1hl2dhg xggy1nq x1a2a7pz _a6hd" href="/foodstagram/chat/room?roomId=${room.chat_room_id}" role="link" tabindex="0">
                                                                <div aria-labelledby="f31ad56cacbb6a4 f3baa4da491f23 f2889a7ac87d5a f3c41205ec58798" class="_ab8w  _ab94 _ab97 _ab9f _ab9k _ab9p  _ab9_ _aba8 _abcm">
                                                                    <c:if test="${room.participants.size() <= 2}">
                                                                    <div class="_ab8w  _ab94 _ab99 _ab9f _ab9m _ab9p  _abbj _abcm">
                                                                        <div class="_ab8w  _ab94 _ab96 _ab9g _ab9k _ab9p _abcm"><span class="xnz67gz x14yjl9h xudhj91 x18nykt9 xww2gxu x9f619 x1lliihq x2lah0s x6ikm8r x10wlt62 x1n2onr6 x1ykvv32 xougopr x159fomc xnp5s1o x194ut8o x1vzenxt xd7ygy7 xt298gk x1xrz1ek x1s928wv x162n7g1 x2q1x1w x1j6awrg x1n449xj x1m1drc7" role="link" tabindex="-1" style="width: 56px; height: 56px;"><img alt="tjgyqo2님의 프로필 사진" class="x6umtig x1b1mbwd xaqea5y xav7gou xk390pu x5yr21d xpdipgo xdj266r x11i5rnm xat24cr x1mh8g0r xexx8yu x4uap5 x18d9i69 xkhd6sd x11njtxf xh8yej3" crossorigin="anonymous" draggable="false" src="/foodstagram/resources/images/userImage.jpg"></span></div>
                                                                    </div>
                                                                    </c:if>
                                                                    
                                                                    <c:if test="${room.participants.size() > 2}">
                                                                    <div class="_ab8w  _ab94 _ab99 _ab9f _ab9m _ab9p  _abbj _abcm">
																	    <div class="_ab8w  _ab94 _ab99 _ab9f _ab9m _ab9p  _abcj _abcm" style="height: 56px; width: 56px;"><span class="xnz67gz x14yjl9h xudhj91 x18nykt9 xww2gxu x9f619 x1lliihq x2lah0s x6ikm8r x10wlt62 x1n2onr6 x1ykvv32 xougopr x159fomc xnp5s1o x194ut8o x1vzenxt xd7ygy7 xt298gk x1xrz1ek x1s928wv x162n7g1 x2q1x1w x1j6awrg x1n449xj x1m1drc7" role="link" tabindex="-1" style="width: 40px; height: 40px;"><img alt="프로필 사진" class="x6umtig x1b1mbwd xaqea5y xav7gou xk390pu x5yr21d xpdipgo xdj266r x11i5rnm xat24cr x1mh8g0r xexx8yu x4uap5 x18d9i69 xkhd6sd x11njtxf xh8yej3" crossorigin="anonymous" draggable="false" src="/foodstagram/resources/images/userImage.jpg"></span>
																	        <div class="_aa2p _aa2q">
																	            <div class="_ab8w  _ab94 _ab96 _ab9g _ab9k _ab9p _abcm"><span class="xnz67gz x14yjl9h xudhj91 x18nykt9 xww2gxu x9f619 x1lliihq x2lah0s x6ikm8r x10wlt62 x1n2onr6 x1ykvv32 xougopr x159fomc xnp5s1o x194ut8o x1vzenxt xd7ygy7 xt298gk x1xrz1ek x1s928wv x162n7g1 x2q1x1w x1j6awrg x1n449xj x1m1drc7" role="link" tabindex="-1" style="width: 40px; height: 40px;"><img alt="프로필 사진" class="x6umtig x1b1mbwd xaqea5y xav7gou xk390pu x5yr21d xpdipgo xdj266r x11i5rnm xat24cr x1mh8g0r xexx8yu x4uap5 x18d9i69 xkhd6sd x11njtxf xh8yej3" crossorigin="anonymous" draggable="false" src="/foodstagram/resources/images/userImage.jpg"></span></div>
																	        </div>
																	    </div>
																	</div>
                                                                    </c:if>
                                                                    
                                                                    
                                                                    <div class="_ab8w  _ab94 _ab99 _ab9h _ab9m _ab9o _abcm">
                                                                        <div class="_ab8w  _ab94 _ab99 _ab9f _ab9m _ab9p _abcm" id="f3baa4da491f23">
                                                                            <div class="_aacl _aaco _aacu _aacx _aada">
                                                                                <div class="_ab8w  _ab94 _ab97 _ab9f _ab9k _ab9p _abcm">
                                                                                    <div class="_ab8w  _ab94 _ab99 _ab9f _ab9m _ab9q _ab9s _abcm">
                                                                                        <div id="title2" class="_aacl _aaco _aacu _aacx _aada">${room.title}</div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="_ab8w  _ab94 _ab99 _ab9f _ab9m _ab9p  _abb- _abcm" id="f2889a7ac87d5a">
                                                                            <div class="_aacl _aaco _aacu _aacy _aada">
                                                                                <div class="_ab8w  _ab94 _ab99 _ab9f _ab9k _ab9p _abcm"><span class="_ab6a"><span class="_aacl _aaco _aacu _aacy _aad7"></span></span><span class="_ab68 _ac6e _ac6f _ac6h"></span><time class="_ab69" datetime="2022-10-28T07:58:51.863Z" title="10월 28, 2022"></time></div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </a></div>
                                                    </div>
                                                    </c:forEach>

                                                    <div class="_ab8w  _ab94 _ab97 _ab9h _ab9m _ab9p  _aba8 _abcm" style="height: 72px;"></div>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class=" _ab8s _ab8w  _ab94 _ab99 _ab9f _ab9m _ab9o _abcm" style="height: auto;">
                                <!-- 채팅방 info -->
                                <div class="_ab61">
								    <div class="_aa4j" style="z-index: 1;">
								        <div class="_aa4k _aa4l">
								            <div class="_aa4m _aa4n"></div>
								            <div class="_aa4o">
								                <div class="_ab8w  _ab94 _ab97 _ab9f _ab9k _ab9p _abcm" style="width: 100%;">
								                
								                	<c:if test="${ selectedRoom.participants.size() > 2 }">
								                    <div class="_ab8w  _ab94 _ab99 _ab9f _ab9m _ab9p  _abb0 _abbz _abcm"><button class="_acan _aiit _acao _aija _acas _aj1-" type="button">
								                            <div class="_ab8w  _ab94 _ab99 _ab9f _ab9m _ab9p  _abcj _abcm" style="height: 32px; width: 32px;">
								                            <span class="xnz67gz x14yjl9h xudhj91 x18nykt9 xww2gxu x9f619 x1lliihq x2lah0s x6ikm8r x10wlt62 x1n2onr6 x1ykvv32 xougopr x159fomc xnp5s1o x194ut8o x1vzenxt xd7ygy7 xt298gk x1xrz1ek x1s928wv x162n7g1 x2q1x1w x1j6awrg x1n449xj x1m1drc7" role="link" tabindex="-1" style="width: 20px; height: 20px;"><img alt="프로필 사진" class="x6umtig x1b1mbwd xaqea5y xav7gou xk390pu x5yr21d xpdipgo xdj266r x11i5rnm xat24cr x1mh8g0r xexx8yu x4uap5 x18d9i69 xkhd6sd x11njtxf xh8yej3" crossorigin="anonymous" draggable="false" src="/foodstagram/resources/images/userImage.jpg"></span>
								                                <div class="_aa2p _aa2r">
								                                    <div class="_ab8w  _ab94 _ab96 _ab9g _ab9k _ab9p _abcm"><span class="xnz67gz x14yjl9h xudhj91 x18nykt9 xww2gxu x9f619 x1lliihq x2lah0s x6ikm8r x10wlt62 x1n2onr6 x1ykvv32 xougopr x159fomc xnp5s1o x194ut8o x1vzenxt xd7ygy7 xt298gk x1xrz1ek x1s928wv x162n7g1 x2q1x1w x1j6awrg x1n449xj x1m1drc7" role="link" tabindex="-1" style="width: 20px; height: 20px;"><img alt="프로필 사진" class="x6umtig x1b1mbwd xaqea5y xav7gou xk390pu x5yr21d xpdipgo xdj266r x11i5rnm xat24cr x1mh8g0r xexx8yu x4uap5 x18d9i69 xkhd6sd x11njtxf xh8yej3" crossorigin="anonymous" draggable="false" src="/foodstagram/resources/images/userImage.jpg"></span>
								                                        
								                                    </div>
								                                </div>
								                            </div>
								                        </button></div>
								                     </c:if>  
								                     <c:if test="${ selectedRoom.participants.size() <= 2 }"> 
								                        <div class="_ab8w  _ab94 _ab99 _ab9f _ab9m _ab9p  _abb0 _abcm"><button class="_acan _aiit _acao _aija _acas _aj1-" type="button">
												            <div class="_ab8w  _ab94 _ab96 _ab9g _ab9k _ab9p _abcm"><span class="xnz67gz x14yjl9h xudhj91 x18nykt9 xww2gxu x9f619 x1lliihq x2lah0s x6ikm8r x10wlt62 x1n2onr6 x1ykvv32 xougopr x159fomc xnp5s1o x194ut8o x1vzenxt xd7ygy7 xt298gk x1xrz1ek x1s928wv x162n7g1 x2q1x1w x1j6awrg x1n449xj x1m1drc7" role="link" tabindex="-1" style="width: 24px; height: 24px;"><img alt="프로필 사진" class="x6umtig x1b1mbwd xaqea5y xav7gou xk390pu x5yr21d xpdipgo xdj266r x11i5rnm xat24cr x1mh8g0r xexx8yu x4uap5 x18d9i69 xkhd6sd x11njtxf xh8yej3" crossorigin="anonymous" draggable="false" src="/foodstagram/resources/images/userImage.jpg"></span></div>
												        </button></div>
								                       </c:if> 
								                    <div class="_ab8w  _ab94 _ab99 _ab9f _ab9m _ab9q  _abb1 _abcm" style="min-width: 0px;">
								                    <button class="_acan _aiit _acao _aija _acaq _acat _aj1-" type="button" onclick="titleEdit();">
								                            <div class="_ab8w  _ab94 _ab95 _ab9h _ab9m _ab9p _abcm" style="height: 40px;">
								                                <div class="_ab8w  _ab94 _ab99 _ab9f _ab9k _ab9p _abcm">
								                                    <div id="title" class="_aacl _aacp _aacw _aacx _aada">${ selectedRoom.title }</div>
								                                </div>
								                                <div class="_ab8w  _ab94 _ab95 _ab9f _ab9m _ab9p  _abb- _abcm">
								                                    <div class="_aacl _aacn _aacu _aacy _aad6"></div>
								                                </div>
								                            </div>
								                        </button></div>
								                </div>
								            </div>
								            <div class="_aa4m _aa4p">
								                <button class="_abl-" type="button" onclick="leaveChatRoom();">
								                    <div class="_abm0"><img src="https://img.icons8.com/external-tanah-basah-basic-outline-tanah-basah/24/null/external-exit-essentials-tanah-basah-basic-outline-tanah-basah-2.png"/>나가기</div>
								                </button></div>
								        </div>
								    </div>
								</div>
  								<!-- 채팅내역 -->
  								<div class="_ab5w">
							    <div class="_ab5x _ab5y">
							        <div class="_ab8w  _ab94 _ab99 _ab9g _ab9m _ab9o _abcm" style="height: 100%; width: 100%;">
							        <!-- 실제 채팅시작부분 -->
							            <div class="_ab5z _ab5_" id="scroll">
								            <div id="observer" class="sk-circle">
											  <div class="sk-circle1 sk-child"></div>
											  <div class="sk-circle2 sk-child"></div>
											  <div class="sk-circle3 sk-child"></div>
											  <div class="sk-circle4 sk-child"></div>
											  <div class="sk-circle5 sk-child"></div>
											  <div class="sk-circle6 sk-child"></div>
											  <div class="sk-circle7 sk-child"></div>
											  <div class="sk-circle8 sk-child"></div>
											  <div class="sk-circle9 sk-child"></div>
											  <div class="sk-circle10 sk-child"></div>
											  <div class="sk-circle11 sk-child"></div>
											  <div class="sk-circle12 sk-child"></div>
											</div>
							                <div id="msgArea">
											<c:forEach var="m" items="${mlist}" varStatus="status">
											<c:if test="${ m.userid eq loginMember.userid }"> <!-- 본인인경우 -->
											<div class="_ab8w  _ab94 _ab96 _ab9f _ab9k _ab9p _abcm">
						                        <div class="_ab8w  _ab94 _ab99 _ab9f _ab9m _ab9p  _abak _abbi _abcm">
						                        <div class="_ab8w  _ab94 _ab99 _ab9f _ab9m _ab9p _abcm" style="height: 24px; width: 24px;"></div>
						                        </div>
						                    <div class="mButton _ac72" role="listbox" tabindex="0">
						                        <div class="x78zum5 xdt5ytf">
						                            <div class="_acd2 _acd3">
						                                <div class="_acqt _acqv" role="listbox" tabindex="0">
						                                <button class="modify _abl-" type="button">
		                        <div class="_abm0 _abm1"><svg aria-label="전송 취소" class="_ab6-" color="#262626" fill="#262626" height="24" role="img" viewBox="0 0 24 24" width="24">
		                                <circle cx="12" cy="12" r="1.5"></circle>
		                                <circle cx="6" cy="12" r="1.5"></circle>
		                                <circle cx="18" cy="12" r="1.5"></circle>
		                            </svg></div>
		                        <div class="_abm0 _abl_"><svg aria-label="전송 취소" class="_ab6-" color="#8e8e8e" fill="#8e8e8e" height="24" role="img" viewBox="0 0 24 24" width="24">
		                        		<circle cx="12" cy="12" r="1.5"></circle>
		                                <circle cx="6" cy="12" r="1.5"></circle>
		                                <circle cx="18" cy="12" r="1.5"></circle>
		                            </svg></div>
		                    </button>
		                    <div class="modify _acqw _acqx">
		                        <div aria-hidden="true" class="_abw6 _abw7 _abwc _abwa">
		                            <div class="_abwe _ae-l" style="left: calc(50% - 20px);">
		                                <div class="_ad8p _abwa"></div>
		                            </div>
		                            <div class="_abwm">
		                                <div class="_ab8w  _ab94 _ab99 _ab9f _ab9m _ab9p _abcm"><button id="deleteButton" value="${ m.cm_no }" class="_acan _aiit _acao _aija _acas _aj1-" type="button">
		                                        <div class="_aacl _aaco _aacw _aad3 _aad6 _aadc _aade">전송 취소</div>
		                                    </button></div>
		                            </div>
		                        </div>
		                    </div>
		                    <div class="modify" style="color: #8e8e8e; padding-right: 3px;"><fmt:formatDate value="${m.create_date }" pattern="YYYY-MM-dd HH:mm:ss"/></div> 
						                                    <div class=" _ac1n">
						                                        <div class=" _ac1q _ac1r _ac1v _ac1w">
						                                            <div role="button" class="_aa06" tabindex="-1">
						                                                <div class="_ab8w  _ab94 _ab99 _ab9h _ab9m _ab9p  _ab9- _abaa _abcm" style="min-height: 44px;">
						                                                    <div class="_aacl _aaco _aacu _aacx _aad9 _aadf">
						                                                        <div class="_aacl _aaco _aacu _aacx _aad6 _aade">${m.message}</div>
						                                                    </div></div></div></div></div></div></div></div></div></div>
											</c:if>
											<c:if test="${ m.userid ne loginMember.userid }">
											<div class="_ab8w  _ab94 _ab96 _ab9f _ab9k _ab9p _abcm">
					                        <div class="_aacl _aacn _aacu _aacy _aada">${ m.username }</div>
					                        </div>
					                        <div class="_ab8w  _ab94 _ab96 _ab9f _ab9k _ab9p _abcm">
					                        <div class="mButton _ac72" role="listbox" tabindex="0">
					                        <div class="x78zum5 xdt5ytf">
					                            <div class=" _acd3">
					                                <div class="_acqt _acqu" role="listbox" tabindex="0">
					                                <div class="modify"><svg aria-label="전송 취소" class="_ab6-" color="#8e8e8e" fill="#8e8e8e" height="20" role="img"  width="180">
			                    <text x="10" y="20"><fmt:formatDate value="${m.create_date }" pattern="YYYY-MM-dd HH:mm:ss"/></text>
			                </svg></div>
			        
			        <div class="_acqw _acqy">
			            <div aria-hidden="true" class="_abw6 _abw7 _abwc _abwa">
			                <div class="_abwe _ae-l" style="left: calc(-50% + 20px);">
			                    <div class="_ad8p _abwa"></div>
			                </div></div></div>
					                                    <div class=" _ac1n">
					                                        <div class=" _ac1r _ac1w">
					                                            <div role="button" class="_aa06" tabindex="-1">
					                                                <div class="_ab8w  _ab94 _ab99 _ab9h _ab9m _ab9p  _ab9- _abaa _abcm" style="min-height: 44px;">
					                                                    <div class="_aacl _aaco _aacu _aacx _aad9 _aadf">
					                                                        <div class="_aacl _aaco _aacu _aacx _aad6 _aade">${m.message}</div>
					                                                    </div></div></div></div></div></div></div></div></div></div>
											</c:if>
											
											</c:forEach>
							                </div>
							            </div>
							         <!-- 실제 채팅끝부분 -->
							        </div>
							        
							        <!-- 메시지 입력부분 -->
							        <div class="_ab8w  _ab94 _ab99 _ab9f _ab9m _ab9p _abcm">
							            <div class="_ab8w  _ab94 _ab99 _ab9f _ab9m _ab9p  _ab9_ _abab _abcm">
							                <div class="_acrb">
							                    
							                    <div class="_ab8w  _ab94 _ab99 _ab9f _ab9m _ab9o  _abbh _abcm"><textarea id="msg" placeholder="메시지 입력..." class="" style="height: 18px !important;"></textarea></div>
							                    <!-- <button class="_abl-" type="button">
							                        <div class="_abm0"><svg aria-label="사진 또는 동영상 추가" class="_ab6-" color="#262626" fill="#262626" height="24" role="img" viewBox="0 0 24 24" width="24">
							                                <path d="M6.549 5.013A1.557 1.557 0 1 0 8.106 6.57a1.557 1.557 0 0 0-1.557-1.557Z" fill-rule="evenodd"></path>
							                                <path d="m2 18.605 3.901-3.9a.908.908 0 0 1 1.284 0l2.807 2.806a.908.908 0 0 0 1.283 0l5.534-5.534a.908.908 0 0 1 1.283 0l3.905 3.905" fill="none" stroke="currentColor" stroke-linejoin="round" stroke-width="2"></path>
							                                <path d="M18.44 2.004A3.56 3.56 0 0 1 22 5.564h0v12.873a3.56 3.56 0 0 1-3.56 3.56H5.568a3.56 3.56 0 0 1-3.56-3.56V5.563a3.56 3.56 0 0 1 3.56-3.56Z" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"></path>
							                            </svg></div>
							                    </button>
							                    <form enctype="multipart/form-data" method="POST" role="presentation"><input accept="image/jpeg,image/png,image/heic,image/heif" class="_ac69" type="file"></form><button class="_abl-" type="button">
							                        <div class="_abm0"><svg aria-label="좋아요" class="_ab6-" color="#262626" fill="#262626" height="24" role="img" viewBox="0 0 24 24" width="24">
							                                <path d="M16.792 3.904A4.989 4.989 0 0 1 21.5 9.122c0 3.072-2.652 4.959-5.197 7.222-2.512 2.243-3.865 3.469-4.303 3.752-.477-.309-2.143-1.823-4.303-3.752C5.141 14.072 2.5 12.167 2.5 9.122a4.989 4.989 0 0 1 4.708-5.218 4.21 4.21 0 0 1 3.675 1.941c.84 1.175.98 1.763 1.12 1.763s.278-.588 1.11-1.766a4.17 4.17 0 0 1 3.679-1.938m0-2a6.04 6.04 0 0 0-4.797 2.127 6.052 6.052 0 0 0-4.787-2.127A6.985 6.985 0 0 0 .5 9.122c0 3.61 2.55 5.827 5.015 7.97.283.246.569.494.853.747l1.027.918a44.998 44.998 0 0 0 3.518 3.018 2 2 0 0 0 2.174 0 45.263 45.263 0 0 0 3.626-3.115l.922-.824c.293-.26.59-.519.885-.774 2.334-2.025 4.98-4.32 4.98-7.94a6.985 6.985 0 0 0-6.708-7.218Z"></path>
							                            </svg></div>
							                    </button> -->
							                    <div class="_ab8w  _ab94 _ab99 _ab9f _ab9m _ab9p  _abbi _abcm">
							                    	<button class="_acan _aiit _acao _aija _acas _aj1-" id="button-send" type="button">보내기</button>
							                    </div>
							                </div>
							            </div>
							        </div>
							    </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
   <!-- 모달 -->
<div id="ex1" class="modal" style="max-width: 440px;" >
										<div 
											class="x7r02ix xf1ldfh x131esax xdajt7p xxfnqb6 xb88tzc xw2csxc x1odjw0f x5fp0pe x5yr21d"
											role="dialog" style="overflow: hidden;">
											<div
												style="display: flex; flex-direction: column; height: 100%; max-width: 100%;">
												<div class="x1qjc9v5 x78zum5 xdt5ytf">
													<div class="_ac76">
														<div
															class="_ab8w  _ab94 _ab97 _ab9h _ab9m _ab9p  _abch _abcm"
															style="height: 100%; width: 100%;">
															<h1 class="_ac78" tabindex="-1"
																style="width: calc(100% - 0px);">
																<div class="_ac7a">새로운 메시지</div>
															</h1>
														</div>
														<div class="_ac7b _ac7c">
															<div
																class="_ab8w  _ab94 _ab99 _ab9f _ab9m _ab9p  _ab9- _abcm">
																
															</div>
														</div>
														<div class="_ac7b _ac7d">
															<div
																class="_ab8w  _ab94 _ab99 _ab9f _ab9m _ab9p  _ab9- _abcm">
																<button class="_acan _acao _acas _acav" id="insertChatRoomButton" disabled=""
																	type="button">
																	<div class="_aagz">다음</div>
																</button>
															</div>
														</div>
													</div>
												</div>
												<div
													class="_ab8w  _ab94 _ab99 _ab9f _ab9m _ab9o _ab9s _abcm">
													<div class="_aag-">
														<div class="_aa2s">
															<div
																class="_ab8w  _ab94 _ab99 _ab9f _ab9m _ab9p  _ab9z _aba7 _abcm">
																<h4 class="_aacl _aacp _aacw _aacx _aad8 _aade">받는사람:</h4>
															</div>
															<div class=" _aa2u">
																
																<input autocomplete="off" id="memberSearch"
																	class="_aaie _aaif _aaid _ag7n" name="queryBox"
																	placeholder="검색..." spellcheck="false" type="text"
																	value="" data-focus-visible-added>
																<div></div>
															</div>
														</div>
													</div>
													<div id="memberList"
														class="_ab8w  _ab94 _ab99 _ab9f _ab9m _ab9o  _ab9v _abcm" style="height: 450px">
														
													</div>
												</div>
											</div>
										</div>
									</div>
</body>
<script type="text/javascript">
function toggleDialog(sh) {
    dialog = document.getElementById("ex1");
    //okbutton = document.getElementById("ok");
    pagebackground = document.getElementById("bg");

    if (sh == "show") {
        dialogOpen = true;

        // 다이얼로그 표시
        dialog.style.display = 'block';

        // 다이얼로그 표시 이후, 그 안의 요소에 포커스하기
        okbutton.focus();

        // "숨겨질" 콘텐츠로에서 포커스가 나간 *후에* 배경을 숨깁니다.
        pagebackground.setAttribute("aria-hidden","true");

    } else {
        dialogOpen = false;
        dialog.style.display = 'none';
        pagebackground.setAttribute("aria-hidden","false");
        lastFocus.focus(); 
    }
}

</script>

<script type="text/javascript">
$(function (){
	$("#memberSearch").keyup(function(){
		if($('#memberSearch').val().length == 0) {
			return false;
		}
		$.ajax({
		    url: "/foodstagram/chat/getMembers.do", // 호출할 주소
		    type: "post",
		    data: { keyword: $('#memberSearch').val() }, // 넘길 데이터
		    dataType: "json", // 데이터 타입 json으로 설정 <- 이걸 안하면 밑에 처럼 JSON.parse를 해야함
		    success: function(data) { // 결과 받기
		        //data = JSON.parse(data); // JSON 형태로 파싱
		        console.log(data);
		        $('#memberList').html(" ") //비우기
		        if( data.length > 0) {
			        for(i=0; i< data.length; i++) {
			        	//$('#memberList').append(
			        	var str=`<div class="_abm4" aria-disabled="false" role="button" tabindex="0" style="cursor: pointer;">
			        		    <div aria-labelledby="f22a28fc103805c f35c4a31fcb4da f12ffed1465434 f10dca3efcffcf8" class="_ab8w  _ab94 _ab97 _ab9f _ab9k _ab9p  _ab9- _aba8 _abcm">
			        	        <div class="_ab8w  _ab94 _ab99 _ab9f _ab9m _ab9p  _abbj _abcm">
			        	            <span class="xnz67gz x14yjl9h xudhj91 x18nykt9 xww2gxu x9f619 x1lliihq x2lah0s x6ikm8r x10wlt62 x1n2onr6 x1ykvv32 xougopr x159fomc xnp5s1o x194ut8o x1vzenxt xd7ygy7 xt298gk x1xrz1ek x1s928wv x162n7g1 x2q1x1w x1j6awrg x1n449xj x1m1drc7" role="link" tabindex="-1" style="width: 44px; height: 44px;"><img alt="프로필 사진" class="x6umtig x1b1mbwd xaqea5y xav7gou xk390pu x5yr21d xpdipgo xdj266r x11i5rnm xat24cr x1mh8g0r xexx8yu x4uap5 x18d9i69 xkhd6sd x11njtxf xh8yej3" crossorigin="anonymous" draggable="false" src="/foodstagram/resources/images/userImage.jpg"></span>
			        	        </div>
			        	        <div class="_ab8w  _ab94 _ab99 _ab9h _ab9m _ab9o _abcm">
			        	            <div class="_ab8w  _ab94 _ab99 _ab9f _ab9m _ab9p _abcm" id="f35c4a31fcb4da">
			        	                <div class="_aacl _aaco _aacu _aacx _aada">
			        	                    <div class="_aacl _aaco _aacw _aacx _aad6">`+data[i].userid+`</div>
			        	                </div>
			        	            </div>
			        	            <div class="_ab8w  _ab94 _ab99 _ab9f _ab9m _ab9p  _abb- _abcm" id="f12ffed1465434">
			        	                <div class="_aacl _aaco _aacu _aacy _aada">`+data[i].username+`</div>
			        	            </div>
			        	        </div>
			        	        <div class="_ab8w  _ab94 _ab97 _ab9h _ab9k _ab9p  _abb0 _abcm" id="f22a28fc103805c">
			        	            <button class="_abl-" type="button">
			        	                <div class="_abm0">`;
			        	if(!users.includes(data[i].userid)){
			        		console.log('없음');
				        	str+=`<svg aria-label="선택 여부 변경" class="_ab6-" color="#262626" fill="#262626" height="24" role="img" viewBox="0 0 24 24" width="24">
				        	                        <circle cx="12.008" cy="12" fill="none" r="11.25" stroke="currentColor" stroke-linejoin="round" stroke-width="1.5"></circle>
				        	                    </svg>
				        	                </div>
				        	            </button>
				        	        </div>
				        	    </div>
				        	</div>`;
			        	} else {
			        		console.log('존재함 체크표시해줌');
			        		str+=`<svg aria-label="선택 여부 변경" class="_ab6-" color="#0095f6" fill="#0095f6" height="24" role="img" viewBox="0 0 24 24" width="24"><path d="M12.001.504a11.5 11.5 0 1 0 11.5 11.5 11.513 11.513 0 0 0-11.5-11.5Zm5.706 9.21-6.5 6.495a1 1 0 0 1-1.414-.001l-3.5-3.503a1 1 0 1 1 1.414-1.414l2.794 2.796L16.293 8.3a1 1 0 0 1 1.414 1.415Z"></path></svg>
					        				</div>
				        	            </button>
				        	        </div>
				        	    </div>
				        	</div>`;
			        	}
			        	$('#memberList').append(str);
			        }
			        $('div._abm4[role=button]').click(function userClick() {
			        	console.log(this);
			        	var name = $(this).find('._aad6').html();
			        	var checked = $(this).find('._abm0');
			        	if ( !users.includes(name) ) {//없으면
			        		console.log(name);
			        		users[users.length] = name;
			        		console.log(users);
			        		checked.html('<svg aria-label="선택 여부 변경" class="_ab6-" color="#0095f6" fill="#0095f6" height="24" role="img" viewBox="0 0 24 24" width="24"><path d="M12.001.504a11.5 11.5 0 1 0 11.5 11.5 11.513 11.513 0 0 0-11.5-11.5Zm5.706 9.21-6.5 6.495a1 1 0 0 1-1.414-.001l-3.5-3.503a1 1 0 1 1 1.414-1.414l2.794 2.796L16.293 8.3a1 1 0 0 1 1.414 1.415Z"></path></svg>');
			        	} else {
			        		console.log('존재함 제거진행');
			        		let idx = users.indexOf(name);
			        		users.splice(idx, 1);
			        		console.log('유저추가목록에서 제거완료 체크도제거함.');
			        		checked.html(`<svg aria-label="선택 여부 변경" class="_ab6-" color="#262626" fill="#262626" height="24" role="img" viewBox="0 0 24 24" width="24">
        	                        <circle cx="12.008" cy="12" fill="none" r="11.25" stroke="currentColor" stroke-linejoin="round" stroke-width="1.5"></circle>
	        	                    </svg>`);
			        		console.log(users);
			        	}
			        	
			        	//참여자목록 보여주기
			        	visibleUsers();
			        	nextCheck();
			        })
		        }
		        else {
		        	$('#memberList').append(`<div class="_ab8w  _ab94 _ab99 _ab9f _ab9m _ab9p  _abam _abb2 _abbk _abc0 _abcm"><div class="_aacl _aaco _aacu _aacy _aad6">계정을 찾을 수 없습니다.</div></div>`);
		        }
		    }
		});
	});
	
});	
</script>
<script type="text/javascript">
function nextCheck(){
	if(users.length > 0) {
		$('#insertChatRoomButton').attr('disabled',false);
	} else {
		$('#insertChatRoomButton').attr('disabled',true);
	}
}

$(function (){
	$('div._abm4[role=button]').click(function() {
		console.log(this);
	});
	
	$('#insertChatRoomButton').click(function() {
		$.ajax({
		    url: "/foodstagram/chat/room", // 호출할 주소
		    type: "post",
		    data: { userList: users.toString() }, // 넘길 데이터
		    dataType: "json", // 데이터 타입 json으로 설정 <- 이걸 안하면 밑에 처럼 JSON.parse를 해야함
		    success: function(data) {
		    	//alert("DM방 생성완료.");
		    	location.href='/foodstagram/chat/room?roomId='+data.uuid;
		    },
		    error: function () {
	            // handle upload error
	            // ...
	        }
		});
	});
	
	$('.h1').css("margin-top", "7px"); 
	$('#scroll').scrollTop($('#scroll')[0].scrollHeight);
	
	let count = 0;
	let timer;
	
	// IntersectionObserver의 options를 설정합니다.
	const options = {
	  root: null,
	  // 타겟 이미지 접근 전 이미지를 불러오기 위해 rootMargin을 설정했습니다.
	  rootMargin: '0px 0px 30px 0px',
	  threshold: 0
	}
	function makeListElement() {
		  
		 
		  var before = $('#msgArea').height();
		  console.log('hihihi' + before);
		  
		  $.ajax({
			    url: "/foodstagram/chat/getNextChat.do/"+page, // 호출할 주소
			    type: "get",
			    data: { id: '${selectedRoom.chat_room_id}' }, // 넘길 데이터
			    dataType: "json", // 데이터 타입 json으로 설정 <- 이걸 안하면 밑에 처럼 JSON.parse를 해야함
			    success: function(data) {
			    	//alert("봐라" + data);
			    	console.log('page : '+page++);
			    	//location.href='/foodstagram/chat/room?roomId='+data.uuid;
			    	console.log(data.length); // 20개가 아니면 마지막인것
			    	if(data.length != 20){
			    		endflag=true;
			    		$('.sk-circle').toggleClass();
			    	}
			    	
					for(i=0; i<data.length; i++){
						if (data[i].userid === '${loginMember.userid}') { //보낸사람이 나임
							str = `<div class="_ab8w  _ab94 _ab96 _ab9f _ab9k _ab9p _abcm">
							    <div class="_ab8w  _ab94 _ab99 _ab9f _ab9m _ab9p  _abak _abbi _abcm">
						        <div class="_ab8w  _ab94 _ab99 _ab9f _ab9m _ab9p _abcm" style="height: 24px; width: 24px;"></div>
						    </div>
						    <div class="mButton _ac72" role="listbox" tabindex="0">
						        <div class="x78zum5 xdt5ytf">
						            <div class="_acd2 _acd3">
						                <div class="_acqt _acqv" role="listbox" tabindex="0">
				                <button class="modify _abl-" type="button">
		                        <div class="_abm0 _abm1"><svg aria-label="전송 취소" class="_ab6-" color="#262626" fill="#262626" height="24" role="img" viewBox="0 0 24 24" width="24">
		                                <circle cx="12" cy="12" r="1.5"></circle>
		                                <circle cx="6" cy="12" r="1.5"></circle>
		                                <circle cx="18" cy="12" r="1.5"></circle>
		                            </svg></div>
		                        <div class="_abm0 _abl_"><svg aria-label="전송 취소" class="_ab6-" color="#8e8e8e" fill="#8e8e8e" height="24" role="img" viewBox="0 0 24 24" width="24">
		                        		<circle cx="12" cy="12" r="1.5"></circle>
		                                <circle cx="6" cy="12" r="1.5"></circle>
		                                <circle cx="18" cy="12" r="1.5"></circle>
		                            </svg></div>
		                    </button>
		                    <div class="modify _acqw _acqx">
		                        <div aria-hidden="true" class="_abw6 _abw7 _abwc _abwa">
		                            <div class="_abwe _ae-l" style="left: calc(50% - 20px);">
		                                <div class="_ad8p _abwa"></div>
		                            </div>
		                            <div class="_abwm">
		                                <div class="_ab8w  _ab94 _ab99 _ab9f _ab9m _ab9p _abcm"><button id="deleteButton" value="`+data[i].cm_no+`" class="_acan _aiit _acao _aija _acas _aj1-" type="button">
		                                    <div class="_aacl _aaco _aacw _aad3 _aad6 _aadc _aade">전송 취소</div>
		                                    </button></div>
		                            </div>
		                        </div>
		                    </div>
		                    <div class="modify" style="color: #8e8e8e; padding-right: 3px;">`+moment(new Date(data[i].create_date)).format('YYYY-MM-DD HH:mm:ss')+`</div>
						               <div class=" _ac1n">
						                        <div class=" _ac1q _ac1r _ac1v _ac1w">
						                            <div role="button" class="_aa06" tabindex="-1">
						                                <div class="_ab8w  _ab94 _ab99 _ab9h _ab9m _ab9p  _ab9- _abaa _abcm" style="min-height: 44px;">
						                                    <div class="_aacl _aaco _aacu _aacx _aad9 _aadf">
						                                        <div class="_aacl _aaco _aacu _aacx _aad6 _aade">`+data[i].message+`</div>
						                                    </div>
						                                </div>
						                            </div>
						                        </div>
						                    </div>
						                </div>
						            </div>
						        </div>
						    </div>
						</div>`;
							$('#msgArea').prepend(str);
							//$("#msgArea").html($("#msgArea").html() + str);

						} else { // 보낸사람이 내가아님
							str = `<div class="_ab8w  _ab94 _ab96 _ab9f _ab9k _ab9p _abcm">
								<div class="_aacl _aacn _aacu _aacy _aada">`+data[i].username+`</div>
								</div>`;
							str += `<div class="_ab8w  _ab94 _ab96 _ab9f _ab9k _ab9p _abcm">
								<div class="mButton _ac72" role="listbox" tabindex="0">
							    <div class="x78zum5 xdt5ytf">
							        <div class=" _acd3">
							            <div class="_acqt _acqu" role="listbox" tabindex="0">
						            
					            	
						            <div class="modify"><svg aria-label="전송 취소" class="_ab6-" color="#8e8e8e" fill="#8e8e8e" height="20" role="img"  width="180">
							                    <text x="10" y="20">`+moment(new Date(data[i].create_date)).format('YYYY-MM-DD HH:mm:ss')+`</text>
							                </svg></div>
							        
							        <div class="_acqw _acqy">
							            <div aria-hidden="true" class="_abw6 _abw7 _abwc _abwa">
							                <div class="_abwe _ae-l" style="left: calc(-50% + 20px);">
							                    <div class="_ad8p _abwa"></div>
							                </div>
							                <div class="_abwm">
							                    <div class="_ab8w  _ab94 _ab99 _ab9f _ab9m _ab9p  _abbi _abcm"><button class="_acan _aiit _acao _aija _acau _aj1-" type="button">좋아요</button></div>
							                    <div class="_ab8w  _ab94 _ab99 _ab9f _ab9m _ab9p  _abbi _abcm"><button class="_acan _aiit _acao _aija _acau _aj1-" type="button">복사</button></div><button class="_acan _aiit _acao _aija _acau _aj1-" type="button">신고</button>
							                </div>
							            </div>
							        </div>
							                <div class=" _ac1n">
							                    <div class=" _ac1r _ac1w">
							                        <div role="button" class="_aa06" tabindex="-1">
							                            <div class="_ab8w  _ab94 _ab99 _ab9h _ab9m _ab9p  _ab9- _abaa _abcm" style="min-height: 44px;">
							                                <div class="_aacl _aaco _aacu _aacx _aad9 _aadf">
							                                    <div class="_aacl _aaco _aacu _aacx _aad6 _aade">`+data[i].message+`</div>
							                                </div>
							                            </div>
							                        </div>
							                    </div>
							                </div>
							            </div>
							        </div>
							    </div>
							</div>
							</div>`;
							$('#msgArea').prepend(str);
							//$("#msgArea").html($("#msgArea").html() + str);
						}
						
						
					}
					var after = $('#msgArea').height();
					console.log(after);
					$('#scroll').scrollTop(after-before+45);
			    },
			    error: function () {
		           /// handle upload error
		           /// ...
		        }
			});
		  
		  
		  
		  
		  
		  
		  
		  }
		  //var temp2 = $('#scroll')[0].scrollTop();
		  
		
	
	
	const observer = document.getElementById('observer');
	const io = new IntersectionObserver(function (entries, observer) {
	  clearTimeout(timer);
	  if (entries[0].isIntersecting) {
		if(endflag){
			observer.unobserve(entries[0].target);
		} else {
	    	timer = setTimeout(() => makeListElement(), 1200);
		}
	}

	}, options);
	
	io.observe(observer);
	
	
	$(document).on('mouseenter','.mButton',function(){
		$(this).find('.modify').show();
	});
	$(document).on('mouseleave','.mButton',function(){
		$(this).find('.modify').hide();
	});
	
	//메세지 클릭
	$(document).on('click','.modify._abl-',function(){
		console.log('cl')
		const a = $(this).next().children('div._abw6._abw7._abwc._abwa')[0];
		
		console.log(a)
		$(a).attr('aria-hidden', 'false');
		console.log(a)
		$(a).toggleClass();
		$(a).toggleClass('_abw6 _abwc _abwa');
		//a.attr('aria-hidden', 'false');_abw6 _abwc _abwa
		//a.toggleClass('_abw6 _abwc _abwa');
	});
	$(document).on('blur','.modify._abl-',function(){
		const a = $(this).next().children('div._abw6._abwc._abwa')[0];
		$(a).attr('aria-hidden', 'true');
		$(a).toggleClass();
		$(a).toggleClass('_abw6 _abw7 _abwc _abwa');
		//a.attr('aria-hidden', 'true');
		//a.toggleClass('_abw6 _abw7 _abwc _abwa');	
	});
	$(document).on('click', '#deleteButton', deleteMessage);
	
});
</script>
<form id="form1" action="">

</form>
</html>
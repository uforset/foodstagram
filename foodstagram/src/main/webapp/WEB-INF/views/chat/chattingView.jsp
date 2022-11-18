<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<!-- cnd방식으로 sockjs불러오기 -->
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<!-- 부트스트랩적용 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>실시간 채팅</title>
<script>
    /* SockJS객체생성 보낼 url경로를 매개변수로 등록 */
    var sock = new SockJS("<c:url value='/chat'/>");
    /* /info : https://github.com/sockjs/sockjs-protocol/blob/master/sockjs-protocol.py#L250-L263 */
    
    sock.onmessage=onMessage;
	//sock.onclose=onClose;
    
    var today=null;
    
   $(function(){
        $("#sendBtn").click(function(){
            console.log("send message.....");
            /* 채팅창에 작성한 메세지 전송 */
            sendMessage();
            /* 전송 후 작성창 초기화 */
            $("#message").val('');
        });
        
        $("#exitBtn").click(function(){
            console.log("exit message.....");
            /* 채팅창에 작성한 메세지 전송 */
            sock.onclose();
        });
  });
    
    function sendMessage() {
        /* 맵핑된 핸들러 객채의 handleTextMessage매소드가 실행 */
        sock.send($("#message").val());
    };
    
    function onMessage(evt){
        var data=evt.data;//new text객체로 보내준 값을 받아옴.
        var host=null;//메세지를 보낸 사용자 ip저장
        var strArray=data.split("|");//데이터 파싱처리하기
        var userName=null;//대화명 저장
        
        //전송된 데이터 출력해보기
        for(var i=0;i<strArray.length;i++) {
            console.log('str['+i+'] :' + strArray[i]);	 		
        }
        
        if(strArray.length>1) {
            sessionId=strArray[0];
            message=strArray[1];
            host=strArray[2].substr(1,strArray[2].indexOf(":")-1);
            userName=strArray[3];
            today=new Date();
            printDate=today.getFullYear()+"/"+today.getMonth()+"/"+today.getDate()+" "+today.getHours()+":"+today.getMinutes()+":"+today.getSeconds();
            
            console.log(today);
            var ck_host='${host}';
     
            console.log(sessionId);
            console.log(message);
            console.log('host : '+host);
            console.log('ck_host : '+ck_host);
            /* 서버에서 데이터를 전송할경우 분기 처리 */
            if(host==ck_host||(host==0&&ck_host.includes('0:0:'))) {
                var printHTML="<div class='well' style='margin-left: 30%;'>";
                printHTML+="<div class='alert alert-info'>";
                printHTML+="<sub>"+printDate+"</sub><br/>";
                printHTML+="<strong>["+userName+"] : "+message+"</strong>";
                printHTML+="</div>";
                printHTML+="</div>";
                $('#chatdata').append(printHTML);
            } else {
                var printHTML="<div class='well'  style='margin-left: -5%;margin-right:30%;'>";
                printHTML+="<div class='alert alert-warning'>";
                printHTML+="<sub>"+printDate+"</sub><br/>";
                printHTML+="<strong>["+userName+"] : "+message+"</strong>";
                printHTML+="</div>";
                printHTML+="</div>";
                $('#chatdata').append(printHTML);
                
            }
            //console.log('chatting data : '+data);
        } else {
            //나가기 구현
            today=new Date();
            printDate=today.getFullYear()+"/"+today.getMonth()+"/"+today.getDate()+" "+today.getHours()+":"+today.getMinutes()+":"+today.getSeconds();
            message=strArray[0];
            var printHTML="<div class='well'  style='margin-left30%:'>";
            printHTML+="<div class='alert alert-danger'>";
            printHTML+="<sub>"+printDate+"</sub><br/>";
            printHTML+="<strong>[서버관리자] : "+message+"</strong>";
            printHTML+="</div>";
            printHTML+="</div>";
            $('#chatdata').append(printHTML);	
        }
    };
    
    function onClose(){
        location.href='${pageContext.request.contextPath}';
        self.close();
    };
</script>
<style>
div { padding:5%; }
</style>
</head>
<body>
<div class='form-group'>
    <label id='sessionuserid'><h3>${member.userName}님, 어서오세요!</h3></label><br/>
    <!-- 대화내용이 출력되는 부분 -->
    <div class='panel panel-default'>
        <div id='chatdata' class='panel-body'></div>
    </div>
    <!-- 메세지 작성부분 -->
    <textarea name='message' id='message' style="width:100%;"></textarea><br/>
    <button class='btn btn-primary' type="button" id='sendBtn'>전송</button>
    <button class='btn btn-primary' type="button" id='exitBtn'>나가기</button>
</div>

</body>
</html>
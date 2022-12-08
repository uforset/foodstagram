<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="resources/css/reset.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" rel="stylesheet">
    <title>Foodstagram</title>
    <style>
        /* 메인페이지 */
        section {
            margin: 0 auto;
            width: 930px;
            background-color: #FAFAFA;
        }
        td img {
            width: 290px;
            height: 290px;
            border: 10px solid #FAFAFA;
            overflow: hidden;
            object-fit: cover;
        }
        /* 모달창 */
        .modal {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .modal .bg {
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.6);
        }
        .modalBox {
            position: absolute;
            background-color: #fff;
            width: 900px;
            height: 550px;
            padding: 10px;
        }
        .modalBox button {
            display: block;
            width: 80px;
            margin: 0 auto;
        }
        .hidden {
            display: none;
        }
        #otherProfile img {
            width: 33px;
            height: 33px;
            border-radius: 50%;
            object-fit: cover;
            border: none;
            margin-bottom: 10px;
        }
        .closeBtn {
            display: inline-block;
            position: relative;
            bottom: 50px;
            left: 900px;
            cursor: pointer;
            display: block;
        }
        .closeBtn a {
            display: block;
        }
        .dot {
            display: inline-block;
            position: relative;
            left: 870px;
            bottom: 10px;
            cursor: pointer;
            display: block;
        }
        .dot i {
            color: #ececec;
        }
        .dot a {
            display: block;
        }
        .dot i:hover {
            color: #F95E25;
        }
        .modalImg img {
            display: inline-block;
            position: relative;
            right: 35px;
            width: 450px;
            height: auto;
            object-fit: cover;
            border: none;
        }
        ul:not(.replyList) {
            display: flex;
        }
        ul li:not(.modalImg) {
            position: relative;
            left: -10px;
        }
        ul li ol {
            display: flex;
        }
        .id {
            position: relative;
            bottom: 20px;
            font-weight: bold;
        }
        .addFriend {
            padding: 5px;
            margin-left: 20px;
            position: relative;
            bottom: 20px;
            font-weight: bold;
            border: 1px solid #E5E5E5;
            color: #F95E25;
            border-radius: 10px;
            font-size: 14px;
        }
        .modalContent {
            padding-bottom: 20px;
            border-bottom: 1px solid #E5E5E5;
            width: 435px;
            height: 100px;
            margin-bottom: 10px;
            font-size: 14px;
            overflow: auto;
        }
        .modalContent span a {
            color: rgb(116, 77, 116);
        }
        /* 하트, 댓글등 */
        .lr {
            position: relative;
            top: 380px;
            right: 430px;
            border-bottom: 1px solid #E5E5E5;
            width: 435px;
            height: 33px;
            line-height: 33px;
            padding: 5px 0 10px 0;
        }
        .lr li {
            margin-left: 18px;
        }
        .fa-heart:hover {
            color: red;
        }
        .countingLike {
            font-weight: bold;
        }
        .resetBtn a {
            padding: 5px;
            display: block;
        }
        #recipe,
        #restaurant {
            width: 80px;
            height: 30px;
            font-weight: bold;
            border: none;
            border-radius: 10px;
            transition: 0.5s ease-in-out;
            color: #333;
            background-color: #E5E5E5;
            font-size: 13px;
        }
        #restaurant:hover {
            background-color: #F95E25;
        }
        #recipe:hover {
            background-color: #F95E25;
        }
        .replyBox {
            position: relative;
            top: 475px;
            right: 430px;
        }
        .replyRig {
            width: 400px;
            height: 25px;
            border-radius: 30px;
            background-color: #F0F0F0;
            border: #F0F0F0;
            transition: 0.5s ease-out;
        }
        .replyBtn {
            width: 80px;
            border: none;
            display: block;
            position: relative;
            left: 30px;
            bottom: -6px;
            font-weight: bold;
            color: #333;
            cursor: pointer;
            margin-left: -100px;
        }
        .replyBtn:hover {
            display: block;
            color: #F95E25;
        }
        .replyList {
            position: relative;
            top: 345px;
            right: 440px;
            width: 415px;
            height: 80px;
            padding: 10px;
            overflow: auto;
        }
        .replyList li {
            margin-bottom: 5px;
        }
        .chatBot {
            position: fixed;
            bottom: 3%;
            right: 10%;
            width: 150px;
            height: 150px;
            background-color: pink;
        }
        
        .searchBtn{
           position:relative;
           bottom: 33px;
           left: 90px;
           border-radius: 10px;
           background-color: pink;
        }
        
    </style>
</head>
<!-- TWC chatbot Scripts -->
<script src="https://public-common-sdk.s3.ap-northeast-2.amazonaws.com/sdk/seller/Twc.plugin.js"></script>

<script>
(function() {
 Twc('init', {
   brandKey: "m0qEkQGszGQPOJycVHShoA",
   channelType: "scenario",
scenarioId: "Njk=",
   buttonOption: {
     showLauncher: true,
     zIndex: 10,
     bottom: 25,
     right: 25
    }
  })
})();
</script>

<script type="text/javascript">
<!-- 게시글 리스트 출력처리 -->

$(function(){
	$.ajax({
		url: "blistAll.do",
		type: "post",
		dataType: "json",
		success: function(data){
			console.log("success : " + data); //Object 로 출력됨
			
			//받은 object => string 으로 바꿈
			var jsonStr = JSON.stringify(data);
			//string => json 객체로 바꿈
			var json = JSON.parse(jsonStr);
			
			console.log(json.list);
			var bvalues = "";
			var count = 1;
			for(var i in json.list){  //인덱스 i가 자동 1씩 증가하는 루프문
				if(count % 3 == 1){
					bvalues += "<tr>";
				}
				bvalues +=  '<td><a href="bdetail.do?b_no=' + json.list[i].atch_parent_no + '"><img src="resources/board_upfiles/' + json.list[i].atch_file_name + '" class="openBtn"></a></td>';
				count++;
				if(count % 3 == 1){
					bvalues += "</tr>";
					}
			} //for in
			if(count != 4){

				for(var n = count; n <= 3; n++){
					bvalues += "<td>&nbsp;</td>";
				}
				bvalues += "</tr>";
			}
			$("#blist").html($("#blist").html() + bvalues);
			
		},
		error: function(jqXHR, textStatus, errorThrown){
			console.log("btop3 error : " + jqXHR 
					+ ", " + textStatus + ", " + errorThrown);
		}
	});		
});
</script>
<!--  End TWC chatbot Scripts -->

<body>
 <c:import url="/WEB-INF/views/common/nav.jsp" />
    <section>
        <table class="mainPage" id="blist">
        
        </table>
    </section>
    <script src="https://kit.fontawesome.com/6478f529f2.js" crossorigin="anonymous"></script>
</body>

</html>
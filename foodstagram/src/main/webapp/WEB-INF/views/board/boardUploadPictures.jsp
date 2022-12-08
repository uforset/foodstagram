<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물을 등록하세요.</title>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="resources/css/reset.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" rel="stylesheet">

<link rel="stylesheet" href="https://www.eyes.co.kr/assets/css/reset.css?v=1669255025">
<link rel="stylesheet" href="https://www.eyes.co.kr/assets/css/swiper.min.css">
<link rel="stylesheet" href="https://www.eyes.co.kr/assets/css/jquery.mCustomScrollbar.min.css">
<link rel="stylesheet" href="https://www.eyes.co.kr/assets/css/site.css?v=1669255025">

<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.1.min.js"></script>
<script src="https://www.eyes.co.kr/assets/js/libs/swiper.min.js"></script>
<script src="https://www.eyes.co.kr/assets/js/libs/chart.min.js"></script>
<script src="https://www.eyes.co.kr/assets/js/libs/jquery.mCustomScrollbar.concat.min.js"></script>
<script src="https://www.eyes.co.kr/assets/js/site.js?v=1669259435"></script>


<script src="https://unpkg.com/dropzone@5/dist/min/dropzone.min.js"></script>
<link rel="stylesheet" href="https://unpkg.com/dropzone@5/dist/min/dropzone.min.css" type="text/css"/>

<!-- 부트스트랩5 -->
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css' />

<script>
function inquirySave(){
   if($("#boFiles").val() == "") {
      alert('이미지를 첨부해주세요.');
      return false;
   }

/*    if($("#recv_phone").val() == "") {
      alert('연락가능한 전화번호를 입력해주시기 바랍니다.');
      return false;
   } */


   if($("#b_content").val() == "") {
      alert('내용을 입력해주시기 바랍니다.');
      return false;
   }
   
   $.ajax({
        url: "binsert.do",
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
               alert("등록 되었습니다.");
               location.href='/foodstagram/myinfo.do'
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

<style>
.admit,
.cancel {
    width: 100px;
    height: 40px;
    font-weight: bold;
    border: none;
    border-radius: 10px;
    transition: 0.5s ease-in-out;
    color: #333;
    background-color: #E5E5E5;
    margin-left: 10px;
}
</style>

</head>

<c:import url="/WEB-INF/views/common/nav.jsp" />

<body>


<!--     <div type="content">
        <div class="title-wrap"> -->
        <form id="regForm" method="post" enctype="multipart/form-data">


            <tr>
            <td>
               <p id="otherProfile">
            <a href="#">
                <img src="resources/images/defaultprofile.png">
            </a>
            </td>
            </tr>
            <tr>
               <td>
                   <input type="text" name="userid" readonly value="${ sessionScope.loginMember.userid }" required>
               </td>
               <td>
                   <select name="b_open" required>
                       <option value="2">전체공개</option>
                       <option value="1">친구공개</option>
                       <option value="0">비공개</option>
                   </select>
               </td>
               
               <br><br>
               <tr>
	                <td>
	                   <input multiple="multiple" id="boFiles" type="file" name="boFiles" required>
	                </td>
            	</tr>
            	<br><br>
   
   
               <td class="modalContent">
                  <textarea rows="" cols="" id="b_content" name="b_content" required></textarea>
               </td>
           </tr>
        </form>
            <tr>
                <p><a href="#" onclick="inquirySave()">등록하기
                <p><input type="reset" value="작성취소">
                <p><button onclick="javascript:history.go(-1); return false;">목록</button>
            </tr>
<!-- 
        </div>
    </div> -->

</body>
</html>
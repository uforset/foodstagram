<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    

<c:set var="listCount" value="${ requestScope.listCount }" />
<c:set var="startPage" value="${ requestScope.startPage }" />
<c:set var="endPage" value="${ requestScope.endPage }" />
<c:set var="maxPage" value="${ requestScope.maxPage }" />
<c:set var="currentPage" value="${ requestScope.currentPage }" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="resources/css/reset.css" rel="stylesheet"> 
    <link href="resources/css/style.css" rel="stylesheet"> 
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" rel="stylesheet">
<title>memberListView</title>
<style type="text/css">
h1 {font-weight: bold; font-size: 18px; margin-bottom: 10px;}
th, td {
   border-bottom:3px solid #f8f9fa;
    padding: 15px 20px;
}
</style>
<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.1.min.js"></script>
<script type="text/javascript">
function Change(){
    var key = test.value;
    if(key==1){
    document.all["d1"].style.display="block";
    document.all["d2"].style.display="none";
    document.all["d3"].style.display="none"; 
    }
    if(key==2){
    document.all["d1"].style.display="none";
    document.all["d2"].style.display="block";
    document.all["d3"].style.display="none";
    }
    if(key==3){
    document.all["d1"].style.display="none";
    document.all["d2"].style.display="none";
    document.all["d3"].style.display="block";
    }
   }
   
$(function(){
   $('input[name=item]').on('change', function(){

      $('input[name=item]').each(function(index){

         if($(this).is(':checked')){
            $('form.sform').eq(index).css('display', 'block');
         }else{
            $('form.sform').eq(index).css('display', 'none');
         }
         
      });
   });
});

//로그인 제한/가능 라이디 체크가 변경되었을 때 실행되는 함수
function changeLogin(element){
   //선택한 radio의 name 속성의 이름에서 userid 분리 추출함
   var userid = element.name.substring(8);
   console.log("changeLogin : " + userid);
   if(element.checked == true && element.value == "N"){
      //로그인 제한을 체크했다면
      console.log("로그인 제한 체크함");
      location.href = "${ pageContext.servletContext.contextPath }/loginok.do?userid=" + userid + "&loginok=N";
   }else{
      console.log("로그인 제한 해제함");
      location.href = "${ pageContext.servletContext.contextPath }/loginok.do?userid=" + userid + "&loginok=Y";
   }
} 
</script>
</head>
<body>
<c:import url="/WEB-INF/views/common/nav.jsp" />
<h1 align="center">회원 관리 페이지</h1>
<h2 align="center">현재 회원수 : ${ listCount } 명</h2>
<div  align="center">
   <button onclick="javascript:location.href='${ pageContext.servletContext.contextPath }/mmlist.do';">전체 보기</button>
   <br><br>
    <div align="center"  >
         <select id="test" onchange="Change()" style="width: 8rem; height:3rem; border:3px solid  white;position:relative; top:48px;text-align:center; right:317px;">
      <option value="1">회원 아이디</option>
      <option value="2">로그인 제한</option>
      <option value="3">이메일</option>
         </select>

      <div id="d1" style="display: block">
         <form action="msearchId.do" method="get" >
            <input type="search" name="keyword"  style="width: 25rem;height:3rem; border:3px solid #f8f9fa;border-radius:20px;">
            <input type="submit" value="검색"  style="width: 6rem;height:3rem;border:none; background-color:#F95E25; cursor:pointer;border-radius:20px" class="btn">
         </form>
      </div>
      <div id="d2" style="display: none">
      <form action="msearchLogin.do" method="get">   
           <input type="radio" name="keyword" value="Y"  border:3px solid #f8f9fa;">회원 활성 &nbsp; &nbsp;
           <input type="radio" name="keyword" value="N"  border:3px solid #f8f9fa;">회원 비활성 &nbsp; &nbsp; &nbsp; &nbsp;
           <input type="submit" value="검색"  style="width: 6rem;height:3rem;border:none; background-color:#F95E25; cursor:pointer;border-radius:20px" class="btn">
         </form>
      </div>
      <div id="d3" style="display: none">
         <form action="msearchEmail.do" method="get"  >
            <input type="search" name="keyword"  style="width: 25rem;height:3rem; border:3px solid #f8f9fa;border-radius:20px;">
            <input type="submit" value="검색"  style="width: 6rem;height:3rem;border:none; background-color:#F95E25; cursor:pointer;border-radius:20px;" class="btn">
         </form>
      </div>
 </div>
<br><br>
<!-- 조회해 온 회원 리스트 정보 출력 처리 -->
<table align="center"  cellspacing="0" cellpadding="3" style="margin:0 auto; border-collapse: collapse; border-top:3px solid #f8f9fa;">
   <tr >
      <th>아이디</th>
      <th>이메일</th>
      <th>로그인 제한여부</th>
      <th>정보 수정</th>
   </tr>
   <c:forEach items="${ requestScope.list }" var="m">
   <tr>
      <td>${ m.userid }</td>
      <td>${ m.email }</td>
      <td>
         <c:if test="${ m.loginok eq 'Y' }">
            <input type="radio" name="loginok_${ m.userid }" value="Y" checked onchange="changeLogin(this);"> 가능 &nbsp;
            <input type="radio" name="loginok_${ m.userid }" value="N" onchange="changeLogin(this);"> 제한 &nbsp;
         </c:if>
         <c:if test="${ m.loginok eq 'N' }">
            <input type="radio" name="loginok_${ m.userid }" value="Y" onchange="changeLogin(this);"> 가능 &nbsp;
            <input type="radio" name="loginok_${ m.userid }" value="N" checked onchange="changeLogin(this);"> 제한 &nbsp;
         </c:if>
      </td>
      <td>
   <c:url var="amoveup" value="/amoveup.do">
            <c:param name="userid" value="${ m.userid }"/>
         </c:url>
         <a href="${ amoveup }" style="color:blue;">수정</a> &nbsp; 
      </td> 
   </tr>
   </c:forEach>
</table>
<br>



<c:if test="${ empty action }">
<!-- 전체목록 페이징 처리 -->
<div style="text-align:center;"> <!-- 페이지 표시 영역 -->
   <!-- 1페이지로 이동 처리 -->
   <c:if test="${ currentPage eq 1 }">
      << &nbsp;
   </c:if>
   <c:if test="${ currentPage > 1 }">
      <c:url var="m" value="/mmlist.do">
         <c:param name="page" value="1" />
      </c:url>
      <a href="${ m }"><<</a> &nbsp;
   </c:if>
   <!-- 이전 페이지그룹으로 이동 처리 -->
   <c:if test="${ (currentPage - 10) < startPage and (currentPage - 10) > 1 }">
      <c:url var="m2" value="/mmlist.do">
         <c:param name="page" value="${ startPage - 10 }" />
      </c:url>
      <a href="${ m2 }"><</a> &nbsp;
   </c:if>
   <c:if test="${ !((currentPage - 10) < startPage and (currentPage - 10) > 1) }">
      < &nbsp;
   </c:if>
   <!-- 현재 페이지가 속한 페이지 그룹 페이지 숫자 출력 -->
   <c:forEach var="p" begin="${ startPage }" end="${ endPage }" step="1">
      <c:if test="${ p eq currentPage }">
         <font size="8px" color="red"><b>[${ p }]</b></font>
      </c:if>
      <c:if test="${ p ne currentPage }">
         <c:url var="m3" value="/mmlist.do">
         <c:param name="page" value="${ p }" />
      </c:url>
      <a href="${ m3 }">${ p }</a> 
      </c:if>
   </c:forEach>
   <!-- 다음 페이지그룹으로 이동 처리 -->
   <c:if test="${ (currentPage + 10) > endPage and (currentPage + 10) < maxPage }">
      <c:url var="m4" value="/mmlist.do">
         <c:param name="page" value="${ endPage + 10 }" />
      </c:url>
      <a href="${ m4 }">></a> &nbsp;
   </c:if>
   <c:if test="${ !((currentPage + 10) > endPage and (currentPage + 10) < maxPage) }">
      > &nbsp;
   </c:if>
   <!-- 끝페이지로 이동 처리 -->
   <c:if test="${ currentPage eq maxPage }">
      >> &nbsp; 
   </c:if>
   <c:if test="${ currentPage < maxPage }">
      <c:url var="m5" value="/mmlist.do">
         <c:param name="page" value="${ maxPage }" />
      </c:url>
      <a href="${ m5 }">>></a> &nbsp;
   </c:if>
</div>
</c:if>

<c:if test="${ !empty action }">

<!-- 검색 목록 페이징 처리 -->
<div style="text-align:center;"> <!-- 페이지 표시 영역 -->
   <!-- 1페이지로 이동 처리 -->
   <c:if test="${ currentPage eq 1 }">
       << &nbsp;
   </c:if>
   <c:if test="${ currentPage > 1 }">
         <c:if test="${ action eq 'userid' }">
            <c:url var="nsl" value="msearchId.do">
               <c:param name="keyword" value="${ keyword }" />
               <c:param name="page" value="1" />
            </c:url>
         </c:if>
      
         <c:if test="${ action eq 'login' }">
            <c:url var="nsl" value="msearchLogin.do">
               <c:param name="keyword" value="${ keyword }" />
               <c:param name="page" value="1" />
            </c:url>
         </c:if>
      
         <c:if test="${ action eq 'email' }">
            <c:url var="nsl" value="msearchEmail.do">
               <c:param name="keyword" value="${ keyword }" />
               <c:param name="page" value="${ startPage - 10 }" />
            </c:url>
         </c:if>
      <a href="${ nsl }"><<</a> &nbsp;
   </c:if>
   <!-- 이전 페이지그룹으로 이동 처리 -->
   <c:if test="${ (currentPage - 10) < startPage and (currentPage - 10) > 1 }">
      <c:if test="${ action eq 'userid' }">
            <c:url var="nsl" value="msearchId.do">
               <c:param name="keyword" value="${ keyword }" />
               <c:param name="page" value="${ startPage - 10 }" />
            </c:url>
         </c:if>
      
         <c:if test="${ action eq 'login' }">
            <c:url var="nsl" value="msearchLogin.do">
               <c:param name="keyword" value="${ keyword }" />
               <c:param name="page" value="${ startPage - 10 }" />
            </c:url>
         </c:if>
      
         <c:if test="${ action eq 'email' }">
            <c:url var="nsl" value="msearchEmail.do">
               <c:param name="keyword" value="${ keyword }" />
               <c:param name="page" value="${ startPage - 10 }" />
            </c:url>
         </c:if>
      <a href="${ nsl }"><</a> &nbsp;
   </c:if>
   <c:if test="${ !((currentPage - 10) < startPage and (currentPage - 10) > 1) }">
      < &nbsp;
   </c:if>
   <!-- 현재 페이지가 속한 페이지 그룹 페이지 숫자 출력 -->
   <c:forEach var="p" begin="${ startPage }" end="${ endPage }" step="1">
      <c:if test="${ p eq currentPage }">
         <font size="4" color="red"><b>[${ p }]</b></font>
      </c:if>
      <c:if test="${ p ne currentPage }">
         <c:if test="${ action eq 'userid' }">
            <c:url var="nsl" value="msearchId.do">
               <c:param name="keyword" value="${ keyword }" />
               <c:param name="page" value="${ p }" />
            </c:url>
         </c:if>
      
         <c:if test="${ action eq 'login' }">
            <c:url var="nsl" value="msearchLogin.do">
               <c:param name="keyword" value="${ keyword }" />
               <c:param name="page" value="${ p }" />
            </c:url>
         </c:if>
      
         <c:if test="${ action eq 'email' }">
            <c:url var="nsl" value="msearchEmail.do">
               <c:param name="keyword" value="${ keyword }" />
               <c:param name="page" value="${ startPage - 10 }" />
            </c:url>
         </c:if>
         <a href="${ nsl }">${ p }</a> 
      </c:if>
   </c:forEach>
   <!-- 다음 페이지그룹으로 이동 처리 -->
   <c:if test="${ (currentPage + 10) > endPage and (currentPage + 10) < maxPage }">
      <c:if test="${ action eq 'userid' }">
            <c:url var="nsl" value="msearchId.do">
               <c:param name="keyword" value="${ keyword }" />
               <c:param name="page" value="${ endPage + 10 }" />
            </c:url>
         </c:if>
      
         <c:if test="${ action eq 'login' }">
            <c:url var="nsl" value="msearchLogin.do">
               <c:param name="keyword" value="${ keyword }" />
               <c:param name="page" value="${ endPage + 10 }" />
            </c:url>
         </c:if>
      
         <c:if test="${ action eq 'email' }">
            <c:url var="nsl" value="msearchEmail.do">
            <c:param name="keyword" value="${ keyword }" />
               <c:param name="page" value="${ startPage - 10 }" />
            </c:url>
         </c:if>
      <a href="${ nsl }">></a> &nbsp;
   </c:if>
   <c:if test="${ !((currentPage + 10) > endPage and (currentPage + 10) < maxPage) }">
      > &nbsp;
   </c:if>
   <!-- 끝페이지로 이동 처리 -->
   <c:if test="${ currentPage eq maxPage }">
      >> &nbsp; 
   </c:if>
   <c:if test="${ currentPage < maxPage }">
      <c:if test="${ action eq 'userid' }">
            <c:url var="nsl" value="msearchId.do">
               <c:param name="keyword" value="${ keyword }" />
               <c:param name="page" value="${ maxPage }" />
            </c:url>
         </c:if>
      
         <c:if test="${ action eq 'login' }">
            <c:url var="nsl" value="msearchLogin.do">
               <c:param name="keyword" value="${ keyword }" />
               <c:param name="page" value="${ maxPage }" />
            </c:url>
         </c:if>
      
         <c:if test="${ action eq 'email' }">
            <c:url var="nsl" value="msearchEmail.do">
         <c:param name="keyword" value="${ keyword }" />
               <c:param name="page" value="${ startPage - 10 }" />
            </c:url>
         </c:if>
      <a href="${ nsl }">>></a> &nbsp;
   </c:if>
</div>
</c:if>
</body>
</html>

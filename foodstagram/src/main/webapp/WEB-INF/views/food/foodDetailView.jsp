<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>푸드스타그램</title>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" rel="stylesheet"> 
<style>
	 i {color:red;}
	 i:hover {color:green}
	 
	 .food-wrap {
		  display: flex;
		  justify-content: center;
		  align-items: center
	   	  }
     .food {
		  position: relative; 
  		  width: 300px; height: 300px;  
		  }
	 .food img{

		  }
	  .food .info {
	 	  padding: 15px 20px;
	      border-radius: 5px;
	      font-weight: 1000;
	      color: #fff;
  		  position: absolute; top: 50%; left: 10%;
  		  background: rgba(0,0,0,0.5);
  		  background-color: #000000;
  		  margin: auto;
	      text-align: left;
	      opacity: 0;
		  }
	  .food:hover .info {
 		  opacity: 0.5;
		  }
		  
	  .food .info h3 {
		  font-size: 20px;
		  padding-bottom: 0.4em;
		  overflow:hidden;
		  text-overflow: ellipsis;
		  white-space: nowrap;
		  text-transform: uppercase;
		  }
	  .food .info p {
		  font-size: 20px;
		  text-overflow: ellipsis;
		  white-space: nowrap;
		  }  
</style>
</head>
<body>
<!-- <span><a href="foodStagram.do"><i class="fa-solid fa-house fa-3x"></i></a>&nbsp;</span>
<span style="font-size: 20pt; font-weight:bold; color:#814485">푸드스타그램</span> -->
<p></p>
<hr>
<p></p>
<p></p>
<br>
<div class="food-wrap">
	<div class="food">
		<!-- <div class="img">
			<img src="resources/food_upfiles/pasta_alio_olio.jpg" alt="Hover Effect"></div> -->
		<div class="info" style="line-height:160%">
		<!-- <script type="text/javascript" src="//openapi.foodsafetykorea.go.kr/api/266fe9be05ba49068142/I2790/xml/1/5"></script> -->
			<h2>${ food.fname }</h2>
			<c:choose> 
				<c:when test="${ food.fname eq '마르게리따피자'}">
					<c:if test = "${ food.fsize ne null }">1조각 당</c:if>
					<c:if test = "${ food.fsize eq null }">1조각 (${ food.fsize }g)</c:if><br>
				</c:when>
				<c:when test="${ food.fname eq '마카롱'}">
					<c:if test = "${ food.fsize ne null }">1개 당</c:if>
					<c:if test = "${ food.fsize eq null }">1개 (${ food.fsize }g)</c:if><br>
				</c:when>
				<c:otherwise>
					<c:if test = "${ food.fsize eq null }">1인분 당</c:if>
					<c:if test = "${ food.fsize ne null }">1인분 (${ food.fsize }g)</c:if><br>
				</c:otherwise>
			</c:choose>	
			칼로리 : ${ food.kcal }kcal<br>
			탄수화물 : ${ food.carb }g<br>
			단백질 : ${ food.protein }g<br>
			지방 : ${ food.fat }g
		</div>
	</div>			
</div>

<script src="https://kit.fontawesome.com/6478f529f2.js" crossorigin="anonymous"></script> 
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Select Write Form(Take a pictures or upload images)</title>
    <link href="resources/css/reset.css" rel="stylesheet">
    <link href="resources/css/style.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" rel="stylesheet">
    
    <style>
        section {
            /* box-sizing: border-box; */
            text-align: center;
            margin: 0 auto;
            width: 900px;
            background-color: white;
            border-radius: 20px;
            box-shadow: 2px 2px 10px grey;
        }

         section ul li:nth-child(1) {
            padding: 15px 0;
            font-weight: bold;
            font-size: 16px;
            border-bottom: #F0F0F0 2px solid;
        }

        section ul li:last-child {
            position: relative;
            bottom: 43px;
            left: 430px;
        }

        .uploadPic, .takePic  {
            width: 150px;
            height: 40px;
            font-weight: bold;
            border: none;
            border-radius: 10px;
            transition: 0.5s ease-in-out;
            box-shadow: 2px 2px 5px gray;
            color: #333;
            background-color: #E5E5E5;
            margin-left: 10px;
        }

        .uploadPic:hover, .takePic:hover {
            color: white;
            background-color: #F95E25;
        }

         .uploadPic a, .takePic a {
            display: block;
        }

        section {
            margin-top: 30px;
        }

        .btn {
            padding: 300px 0;
        } 

        .closeBtn {position: relative;top: -35px;}
    </style>

</head>
<c:import url="/WEB-INF/views/common/nav.jsp" />

<body>

 <section>
        <ul>
            <li>새 게시물 만들기</li>
            <li class="closeBtn"><a href="${ pageContext.servletContext.contextPath }/main.do"><i class="fa-solid fa-x"></i></a></li>
        </ul>
        <div class="btn">
            <button class="uploadPic"><a href="${ pageContext.servletContext.contextPath }/bwform.do">컴퓨터에서 선택</a></button>
            <button class="takePic"><a href="${ pageContext.servletContext.contextPath }/bwtakepic.do">사진 찍기</a></button>
            
        </div>
    </section>

    <script src="https://kit.fontawesome.com/6478f529f2.js" crossorigin="anonymous"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%
	String  strTitle= "dTb Company";
	String  main01Msg= "Introduce";
	String sub01Msg = "gives you a chance to succeed.";
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./resources/css/main02.css">
</head>
<body>
     <div class="main2">
        <h1>Latest Music</h1>
        <div class="slide_wrapp">
          <ul class="slides">
            <li><img src="./resources/img/album1.png" alt="조회수 1등 앨범" width="200" height="200">
              <span><a href="#">mollo</a></span></li>
            <li><img src="./resources/img/album2.png" alt="조회수 2등 앨범" width="200" height="200">
              <a href="#"></a></li>
            <li><img src="./resources/img/album3.png" alt="조회수 3등 앨범" width="200" height="200">
              <a href="#"></a></li>
            <li><img src="./resources/img/album4.png" alt="조회수 4등 앨범" width="200" height="200">
              <a href="#"></a></li>
            <li><img src="./resources/img/album5.png" alt="조회수 5등 앨범" width="200" height="200">
              <a href="#"></a></li>
            <li><img src="./resources/img/album6.png" alt="조회수 6등 앨범" width="200" height="200">
            	<a href="#"></a></li>
            <li><img src="./resources/img/album7.png" alt="조회수 7등 앨범" width="200" height="200">
            	<a href="#"></a></li>
            <li><img src="./resources/img/album8.png" alt="조회수 8등 앨범" width="200" height="200">
            	<a href="#"></a></li>
            <li><img src="./resources/img/album9.png" alt="조회수 9등 앨범" width="200" height="200">
            	<a href="#"></a></li>
            <li><img src="./resources/img/album10.png" alt="조회수 10등 앨범" width="200" height="200">
            	<a href="#"></a></li>
          </ul>
          <p class="controls">
            <span class="prev">prev</span>
            <span class="next">next</span>
          </p>
        </div>
      </div>
</body>
</html>
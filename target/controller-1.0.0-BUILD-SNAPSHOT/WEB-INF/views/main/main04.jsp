<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%
	String  strTitle= "dTb";
	String  mainSay= "dTb Upload";
	String subSay = "Upload your work.";
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=strTitle%></title>
<link rel="stylesheet" type="text/css" href="./resources/css/main04.css">
</head>
<body>
	<div class="main04">
		<div class="main04_txt01">
           	<h1><%=mainSay%></h1>
        	<p><%=subSay %></p>
		<button class="butt"><a href="./board/list">UPLOAD</a></button>
		</div>
	</div>      
</body>
</html>
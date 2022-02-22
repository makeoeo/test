<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%
   String strTitle = "dTb";
   String mainSay = "Communication";
   String subSay = "Communicate with many people.";
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><%=strTitle%></title>
<link rel="stylesheet" type="text/css" href="./resources/css/main05.css">
</head>
<body>
	<div class="main05">
		<div class="main05_txt01">
			<h1><%=strTitle%></h1>
           	<h1><%=mainSay%></h1>
        	<p><%=subSay %></p>
		<button class="butt" onclick="location.href='./free/list'">Free</button>
		<button class="butt" style="margin-left: 10px;" onclick="location.href='./qna/list'"> QnA</button>
		</div>
	</div>        
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%
	String strTitle= "dTb Company";
	String main01Msg= "Introduce";
	String sub01Msg = "gives you a chance to succeed.";
%> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=strTitle%></title>
<link rel="stylesheet" type="text/css" href="./resources/css/main01.css">
</head>
<body>
      <div class="main1">
         <div class="section_tx01">
            <h1><%=strTitle %></h1>
            <h2><%=main01Msg %></h2>
            <p> <%=sub01Msg %></p>
            <button class="butt" onclick="location.href='/main/company'">INTRODUCE</button>
          </div>
      </div>
</body>
</html>
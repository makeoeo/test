<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%
   String strTitle = "dTb Home";
   String mainSay = "Welcome.";
   String subSay = "This is a place where artists and distributors can communicate.";
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><%=strTitle%></title>
<link rel="stylesheet" type="text/css" href="./resources/css/welcome.css">
</head>
<body>
<div class="welcome_box">
        <div class="welcome_txt01">
          <h1><%=mainSay%><br></h1>
          <p><%=subSay %></p>
        </div>
</div>        
</body>
</html>
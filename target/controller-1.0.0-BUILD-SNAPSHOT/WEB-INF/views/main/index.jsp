<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%
	String strTitle = "dTb Home";
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=strTitle%></title>
<link rel="stylesheet" type="text/css" href="./resources/css/index.css">
</head>
<body>
<!-- 상단 부분 -->
    <jsp:include page="header.jsp"/>
    <jsp:include page="welcome.jsp"/>
<!-- 몸통 부분 -->
     <jsp:include page="main01.jsp"/>
     <jsp:include page="main04.jsp"/>
     <jsp:include page="main02.jsp"/>
     <jsp:include page="main03.jsp"/>
     <jsp:include page="main05.jsp"/>
<!-- 하단 부분 -->
     <jsp:include page="footer.jsp"/>
<!-- javascript 부분 -->
<script type="text/javascript" src="./resources/js/main03.js"></script>
</body>
</html>
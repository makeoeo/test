<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String strTitle = "dTb Home";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="./resources/css/header.css">
<title><%=strTitle%></title>
</head>

<body>
	<div class="header">
		<div class="header_box">
				<div class="header_logo">
					<img src="./resources/img/lo.png" style="width: 100px; height: auto;" alt="logo"><a href="#">dTb</a>
				</div>
			<c:if test="${member eq '' || member == null}">
				<div class="header_menu">
					<ul>
						<li><button class="butt" onclick="location.href='./member/login'" >Sign In</button></li>
						<li><button class="butt" onclick="location.href='./member/termsForm'" >Create Account</button></li>
					</ul>
				</div>
			</c:if>
			<c:if test="${member != null }">
				<div class="header_logo"></div>
				<div class="header_menu">
					<ul>
						<li class="login_id">${member.userId} welcome.</li>
						<li><button class="butt" id= "updateBtn" onclick="location.href='./member/memberUpdateView'">My Info</button></li>
						<li><button class="butt" onclick="location.href='./member/logout'">Logout</button></li>
					</ul>
				</div>
			</c:if>
		</div>
	</div>
</body>

</html>
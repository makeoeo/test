<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>dtbLogin</title>
	<link rel="stylesheet" type="text/css" href="../resources/css/login.css">
</head>
<script type="text/javascript">
	$(document).ready(function(){
		$("#logoutBtn").on("click", function(){
			location.href="member/logout";
		})
		$("#registerBtn").on("click", function(){
			location.href="member/register";
		})
		
		$("#memberUpdateBtn").on("click", function(){
			location.href="member/memberUpdateView";
		})
		
	})
</script>
<body>
	<form name='homeForm' method="post" action="/member/login" >
		<div class="login">
			<p class="sign">Login</p>
			<c:if test="${member == null}">
				<div class="idpw">
					<input class="un" type="text" id="userId" name="userId" align="center" placeholder="Userid">
				</div>
				<div class="idpw">
					<input class="pass" type="password" id="userPass" name="userPass" align="center" placeholder="Password">
				</div>
				<div class="sign">
                  <button type="button" class="butt" onclick="location.href='/'" style="margin-left: 10px;">HOME</button>
				  <button class="butt" type="submit">Sign in</button>
				</div>
			</c:if>
		<c:if test="${member != null }">
			<div>
				<p>${member.userId}님 환영 합니다.</p>
				<button id="memberUpdateBtn" type="button">회원정보수정</button>
				<button id="logoutBtn" type="button">로그아웃</button>
				<a href="<c:url value='/member/memberDeleteView'/>">회원탈퇴</a>
			</div>
		</c:if>
		<c:if test="${msg == false}">
			<p style="color: red;">로그인 실패! 아이디와 비밀번호 확인해주세요.</p>
		</c:if>
		</div>
	</form>
</body>
</html>
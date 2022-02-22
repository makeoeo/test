<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" type="text/css" href="../resources/css/nav.css">
<style type="text/css">
	li {list-style: none; display:inline; padding: 6px;}
</style>
<ul>
	<li><button class="butt" onclick="location.href='/qna/list.do'">LIST</button></li>
	<li><button class="butt" onclick="location.href='/qna/writeView'">WRITE</button></li>
	<li><button class="butt" onclick="location.href='/'">HOME</button></li>
	<li>
		<c:if test="${member != null}">
			<p>${member.userId} Welcome.</p>
		</c:if>
	</li>
</ul>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<link rel="stylesheet" type="text/css" href="../resources/css/reply.css">
	 	<title>게시판</title>
	</head>
	<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='updateForm']");
			
			$(".cancel_btn").on("click", function(){
				location.href = "/qna/readView?bno=${replyDelete.bno}"
					   + "&page=${scri.page}"
					   + "&perPageNum=${scri.perPageNum}"
					   + "&searchType=${scri.searchType}"
					   + "&keyword=${scri.keyword}";
			})
			
		})
		
	</script>
	<body>
	
		<div id="root">
			         <div class = "header_board">   
            <div class="header_logo">
                  <img src="../resources/img/lo.png" style="width: 180px; height: auto;" alt="logo">
                  <a href="/">QnA Board</a>
            </div>
            
          </div>
			<div class ="move_box">
					<button class="butt2" onclick="location.href='/free/list.do'">LIST</button>
					<button style="margin-left: 10px;" class="butt2" onclick="location.href='/'">HOME</button>
					
			</div>
			
			<section id="container">
				<form name="updateForm" role="form" method="post" action="/qna/replyDelete">
					<input type="hidden" name="bno" value="${replyDelete.bno}" readonly="readonly"/>
					<input type="hidden" id="rno" name="rno" value="${replyDelete.rno}" />
					<input type="hidden" id="page" name="page" value="${scri.page}"> 
					<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
					<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
					<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
					<div class="p_box">
						<p style="width: 70% auto; font-size: 30px;">Do you want to delete it?</p>
					</div>
						
					<div class="move_box1">
							<button style="width: 50px auto; margin-right: 5px; " type="submit" class="delete_btn butt">YES</button>
							<button style="width: 50px auto;" type="button" class="cancel_btn butt">NO</button>
						
					</div>
				</form>
			</section>
		</div>
	</body>
</html>
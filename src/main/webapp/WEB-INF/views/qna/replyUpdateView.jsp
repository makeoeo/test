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
				location.href = "/qna/readView?bno=${replyUpdate.bno}"
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
				<form name="updateForm" role="form" method="post" action="/qna/replyUpdate">
					<input type="hidden" name="bno" value="${replyUpdate.bno}" readonly="readonly"/>
					<input type="hidden" id="rno" name="rno" value="${replyUpdate.rno}" />
					<input type="hidden" id="page" name="page" value="${scri.page}"> 
					<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
					<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
					<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
					<table>
						<tbody>
							<tr>
								<td>
									<label for="content">Comment content</label>
									<input style="width:100%; height: 300px;" type="text" id="content" name="content" value="${replyUpdate.content}"/>
								</td>
							</tr>	
							
						</tbody>			
					</table>
					<div class ="move_box1" >
						<button style="width: 120px;" type="submit" class="update_btn butt">COMPLETE</button>
						<button type="button" class="cancel_btn butt">CANCLE</button>
					</div>
				</form>
			</section>
		</div>
	</body>
</html>
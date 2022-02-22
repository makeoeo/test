<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	 	
	 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	 	<link rel="stylesheet" type="text/css" href="../resources/css/writeView.css">
	 	<title>게시판</title>
	</head>
	<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='writeForm']");
			$(".write_btn").on("click", function(){
				if(fn_valiChk()){
					return false;
				}
				formObj.attr("action", "/free/write");
				formObj.attr("method", "post");
				formObj.submit();
			});
			fn_addFile();
		})
		function fn_valiChk(){
			var regForm = $("form[name='writeForm'] .chk").length;
			for(var i = 0; i<regForm; i++){
				if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
					alert($(".chk").eq(i).attr("title"));
					return true;
				}
			}
		}
		
	</script>
	<body>
	
			<div class = "header_board">	
				<div class="header_logo">
		  			 <img src="../resources/img/lo.png" style="width: 180px; height: auto;" alt="logo">
		  			 <a href="#">Free Board</a>
				</div>
				
			 </div>
			<div class ="move_box">
					<button class="butt2" onclick="location.href='/free/list.do'">LIST</button>
					<button style="margin-left: 10px;" class="butt2" onclick="location.href='/free/writeView'">WRITE</button>
					<button style="margin-left: 10px;" class="butt2" onclick="location.href='/'">HOME</button>
					
			</div>
					<div class ="fs">
						<c:if test="${member != null}">
							<p>${member.userId} welcome.</p>
						</c:if>
					</div>
			<section id="container">
				<form name="writeForm" method="post" action="/free/write" enctype="multipart/form-data">
					<table>
						<tbody>
							<c:if test="${member.userId != null}">
								<tr>
									<td>
										<label for="title">TITLE</label><input type="text" id="title" name="title" class="chk" title="Enter the title."/>
									</td>
								</tr>	
								<tr>
									<td>
										<label for="content">CONT</label><textarea id="content" name="content" class="chk" title="Enter the content."></textarea>
									</td>
								</tr>
								<tr>
									<td>
										<label for="writer">WRITER</label><input type="text" id="writer" name="writer" class="chk" title="Enter the writer." value="${member.userId}" readonly="readonly"/>
									</td>
								</tr>
								<tr>
								<tr>
									<td id="fileIndex">
									</td>
								</tr>
								<tr>
									<td>						
										<button style="width: 120px;" class="butt" type="submit" >COMPLETE</button>	
									</td>
								</tr>	
							</c:if>
							<c:if test="${member.userId == null}">
								<p style="color: #fff; font-size: 25px;">You can fill it out after logging in.</p>
							</c:if>
							
						</tbody>			
					</table>
				</form>
				
			</section>
			<hr />
	</body>
</html>
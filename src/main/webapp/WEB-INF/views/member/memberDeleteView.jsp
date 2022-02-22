<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	 	
	 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<link rel="stylesheet" type="text/css" href="../resources/css/memberDelete.css">
		<title>Withdrawal</title>
	</head>
	<script type="text/javascript">
		$(document).ready(function(){
			// 취소
			$(".butt1").on("click", function(){
				
				location.href = "/";
						    
			})
		
			$("#submit").on("click", function(){
				if($("#userPass").val()==""){
					alert("Please enter a password.");
					$("#userPass").focus();
					return false;
				}
				$.ajax({
					url : "/member/passChk",
					type : "POST",
					dateType : "json",
					data : $("#delForm").serializeArray(),
					success: function(data){
						
						if(data==true){
							if(confirm("Do you want to cancel membership?")){
								$("#delForm").submit();
							}
						}else{
							alert("password is wrong.");
							return;
						}
					}
				})
				
			});
			
				
			
		})
	</script>
	<body>
			<form id="updateForm" action="/member/memberDelete"  method="post" id="delForm">
				<div class ="wrap">
					<img src="../resources/img/lo.png" style="width: 100px;">
					<p class="sign">Withdrawal</p>
					
				<dl style="margin-top: 20px;">
					<dt><label  for="userId">ID</label></dt>
					 <dd><input class="un" type="text" id="userId" name="userId" value="${member.userId}" readonly="readonly"/>
					</dd>
				</dl>
            	<hr>
				<dl>
					<dt><label class="control-label" for="userName">Name</label></dt>
					<dd><input class="pass" type="text" id="userName" name="userName" value="${member.userName}" readonly="readonly" /></dd>
				</dl>
            	<hr>
				<dl>
					<dt><label  for="userPass">Password</label></dt>
					<dd>
						<input class="pass" type="password" id="userPass" name="userPass" />
					</dd>
				</dl>
				<div class="move_box">
					<button class="butt" id="submit">Complet</button>
					<button class="butt1" type="button">Cancle</button>
				</div>
				</div>
			</form>
	</body>
	
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>dtb약관동의</title>
    <link rel="stylesheet" type="text/css" href="../resources/css/termsForm.css">
    <script type="text/javascript" src="/js/jquery-3.6.0.js"></script>
</head>
<body>
<div class="header" style="color: #fff; text-align: center;font-size: 25px; font-weight: 700; align-items: center;">
  	<img alt="logo" src="../resources/img/lo.png" style="width: 120px; "><h1 class="title">dTb 회원약관</h1>
	<br>
 </div>	
   	<form action="/member/register" id="joinForm">
   		<div class="checkbox_group">
			 <ul class="clearfix">
			 	<li class="checkBtn">
 					<input type="checkbox" id="check_all" >
  					<label for="check_all">전체 동의</label>
  					<br>
  				</li>
  			</ul>
  			 <ul class="clearfix">
  			 	<li class="checkBtn">
 					<input type="checkbox" id="check_1" class="normal" >
					<label for="check_1">개인정보 처리방침 동의<h3 style="color: red;" class="es">(필수)</h3></label>
					<br>
				</li>
			</ul>
					<textarea name="" id="">123
					</textarea>  
			  
			<ul class="clearfix">
				<li class="checkBtn">
					<input type="checkbox" id="check_2" class="normal" >
					<label for="check_2">서비스 이용약관 동의<h3 style="color: red;" class="es">(필수)</h3> </label>
					<br>
				</li>
			</ul>
					<textarea name="" id="">123
					</textarea>  
			<ul class="clearfix">
				<li class="checkBtn">
					<input type="checkbox" id="check_3" class="normal" >
					<label for="check_3">마케팅 수신 동의<h3 style="color: blue;" class="sel">(선택)</h3></label> 
					
				</li>
			</ul>
					<textarea name="" id="">123
					</textarea>  
		</div>
		   <ul class="footBtwrap clearfix">
            <li><button class="butt" type="button" id="nextBtn_1" onclick="location.href='/'">비동의</button></li>
            <li><button class="butt" id="nextBtn" type="button">동의</button></li>
        	<br>
        	<br>
        </ul>
	</form>	

    <script type="text/javascript" src="../js/termsForm.js"></script>
    
  	<script type="text/javascript">
        $(document).ready(function(){
    
            $("#nextBtn").click(function(){    
                if($("#check_1").is(":checked") == false){
                    alert("모든 약관에 동의 하셔야 다음 단계로 진행 가능합니다.");
                    return;
                }else if($("#check_2").is(":checked") == false){
                    alert("모든 약관에 동의 하셔야 다음 단계로 진행 가능합니다..");
                    return;
                }else{
                    $("#joinForm").submit();
                }
            });    
        });
    </script>
</body>
</html>
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
	 	
	 		<link rel="stylesheet" type="text/css" href="../resources/css/memberUpdate.css">
		<title>회원정보수정</title>
	</head>
	<script type="text/javascript">
		$(document).ready(function(){
			// 취소
			$(".cancle").on("click", function(){
				
				location.href = "/";
						    
			})
		
			$("#submit").on("click", function(){
				if($("#userPass").val()==""){
					alert("Please enter your password.");
					$("#userPass").focus();
					return false;
				}
				if($("#userName").val()==""){
					alert("Please enter your Name.");
					$("#userName").focus();
					return false;
				}
				if($("#userRegi").val()==""){
					alert("Please enter your resident registration number.");
					$("#userRegi").focus();
					return false;
				}
				if($("#userPhone").val()==""){
					alert("Please enter your phone number.");
					$("#userPhone").focus();
					return false;
				}
				if($("#userEmail").val()==""){
					alert("Please enter your email.");
					$("#userEmail").focus();
					return false;
				}
				if($("#useradd1").val()==""){
					alert("Please enter your zipcode.");
					$("#useradd1").focus();
					return false;
				}
				if($("#useradd2").val()==""){
					alert("Please enter your address.");
					$("#useradd1").focus();
					return false;
				}
				if($("#useradd3").val()==""){
					alert("Please enter your address.");
					$("#useradd3").focus();
					return false;
				}
				if($("#useradd4").val()==""){
					alert("Please enter your address.");
					$("#useradd4").focus();
					return false;
				}
				
				
				
				
				$.ajax({
					url : "/member/passChk",
					type : "POST",
					dateType : "json",
					data : $("#updateForm").serializeArray(),
					success: function(data){
						
						if(data==true){
							if(confirm("Do you want to change your info?")){
								$("#updateForm").submit();
							}
							
						}else{
							alert("The password is wrong.");
							return;
							
						}
					}
				})
			});
		})
	</script>
	<body>
		<form id="updateForm" action="/member/memberUpdate" method="post">
					<div class ="wrap">
					<img src="../resources/img/lo.png" style="width: 100px; "><br> <h1>Correction of information</h1>
					
				<dl style="margin-top: 20px;">
					<dt><label  for="userId">ID</label></dt>
					 <dd><input class="form-control" type="text" id="userId" name="userId" value="${member.userId}" readonly="readonly"/>
					</dd>
				</dl>
            	<hr>
				<dl>
					<dt><label class="control-label" for="userName">NAME</label></dt>
					<dd><input class="form-control" type="text" id="userName" name="userName" value="${update.userName}" /></dd>
				</dl>
            	<hr>
				<dl>
					<dt><label class="control-label" for="userRegi">SSN(Registration)</label></dt>
					<dd><input class="form-control" type="text" id="userRegi" name="userRegi" value="${update.userRegi}"/></dd>
				</dl>
            	<hr>
				<dl>
					<dt><label class="control-label" for="userPhone">PHONE</label></dt>
					<dd><input class="form-control" type="text" id="userPhone" name="userPhone"value="${update.userPhone}" /></dd>
				</dl>
            	<hr>
				<dl>
					<dt><label class="control-label" for="userEmail">EMAIL</label></dt>
					<dd><input class="form-control" type="text" id="userEmail" name="userEmail"value="${update.userEmail}" /></dd>
				</dl>
            	<hr>
				<dl>
					<dt><label for="agency">Address</label></dt>
					<dd style="color: #000;">	
						<input type="text" id="useradd1" placeholder="Zipcode" name="useradd1"value="${update.useradd1}" readonly="readonly">
						<button  class="butt zipbtn" type="button" onclick="sample6_execDaumPostcode()" style="width: 160px;">Finding a zip code</button><br>
						<input type="text" id="useradd2" placeholder="Add" name="useradd2" value="${update.useradd2}" readonly="readonly"><br>
						<input type="text" id="useradd3" placeholder="Detail Add" name="useradd3" value="${update.useradd3}" readonly="readonly">
						<input type="text" id="useradd4" placeholder="Reference Add" name="useradd4" value="${update.useradd4}" readonly="readonly">
					</dd>
				</dl>
				<hr>
				<br>
				<dl>
					<dt><label  for="userPass">Check your password</label></dt>
					<dd>
						<input class="form-control" type="password" id="userPass" name="userPass" />
					</dd>
				</dl>
				</div>
				<div class="move_box">
					<button class="butt" id="submit" style="width: 200px;">Complet</button>
					<button class="butt" type="button" id="button" onclick="location.href='/member/memberDeleteView'" style="width: 170px;">Withdrawal</button>
					<button class="butt1" type="button" onclick="location.href='/'">Cancel</button>
				</div>
			</form>
	</body>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("useradd4").value = extraAddr;
                
                } else {
                    document.getElementById("useradd4").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('useradd1').value = data.zonecode;
                document.getElementById("useradd2").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("useradd3").focus();
            }
        }).open();
    }
</script>
</html>
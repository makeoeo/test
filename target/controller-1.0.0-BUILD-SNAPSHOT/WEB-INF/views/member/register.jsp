<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<!-- 합쳐지고 최소화된 최신 CSS 
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">-->
		<!-- 부가적인 테마 -->
		<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"> -->
	 	<!-- 외부 css -->
	 	<link rel="stylesheet" type="text/css" href="../resources/css/register.css">
	 	
	 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<title>회원가입</title>
		
	</head>
	<script type="text/javascript">
		$(document).ready(function(){
			// 취소
			$("#cancle").on("click", function(){
				location.href = "/";
			})
			$("#register").on("click", function(){
				if($("#userId").val()==""){
					alert("아이디를 입력해주세요.");
					$("#userId").focus();
					return false;
				}
				if($("#userPass").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#userPass").focus();
					return false;
				}
				if($("#userName").val()==""){
					alert("성명을 입력해주세요.");
					$("#userName").focus();
					return false;
				}
				var idChkVal = $("#idChk").val();
				if(idChkVal == "N"){
					alert("중복확인 버튼을 눌러주세요.");
				}else if(idChkVal == "Y"){
					$("#regForm").submit();
				}
			});
				
		})
		
		function fn_idChk(){
			$.ajax({
				url : "/member/idChk",
				type : "post",
				dataType : "json",
				data : {"userId" : $("#userId").val()},
				success : function(data){
					if(data == 1){
						alert("중복된 아이디입니다.");
						$("#idChk").text("사용중");
						$("#idChk").css("color","red");
					}else if(data == 0){
						$("#idChk").attr("value", "Y");
						alert("사용가능한 아이디입니다.");
						$("#idChk").text("사용가능");
						$("#idChk").css("color","writh");
					}
				}
			});
		}
	</script>

	<body>
		<form action="/member/register" method="post" id="regForm">
				<div class ="wrap">
					<img src="../resources/img/lo.png" style="width: 100px; "> <h1>dTb 회원가입</h1>
				<dl>
					<dt><label  for="userId">아이디</label></dt>
					 <dd><input class="form-control" type="text" id="userId" name="userId" />
						<button class="butt" type="button" id="idChk" onclick="fn_idChk();" value="N">중복확인</button>
					</dd>
				</dl>
				<br>
           		<hr>
				<dl>
					<dt><label  for="userPass">패스워드</label></dt>
					<dd>
						<input class="form-control" type="password" id="userPass" name="userPass" />
					</dd>
				</dl>
				<br>
            	<hr>
            	<dl>
					<dt><label for="userPass2">패스워드 확인</label><dt>
					<dd>
						<input class="form-control" type="password" id="userPass2" name="userPass2" />
					</dd>
				</dl>
				<br>
            	<hr>
				<dl>
					<dt><label class="control-label" for="userName">성명</label></dt>
					<dd><input class="form-control" type="text" id="userName" name="userName" /></dd>
				</dl>
				<br>
            	<hr>
				<dl>
					<dt><label class="control-label" for="userRegi">주민번호</label></dt>
					<dd><input class="form-control" type="text" id="userRegi" name="userRegi" /></dd>
				</dl>
				<br>
            	<hr>
				<dl>
					<dt><label class="control-label" for="userPhone">연락처</label></dt>
					<dd><input class="form-control" type="text" id="userPhone" name="userPhone" /></dd>
				</dl>
				<br>
            	<hr>
				<dl>
					<dt><label class="control-label" for="userEmail">이메일</label></dt>
					<dd><input class="form-control" type="text" id="userEmail" name="userEmail" /></dd>
				</dl>
				<br>
            	<hr>
				<dl>
					<dt><label for="agency">주소</label></dt>
					<dd>	
						<input type="text" id="useradd1" placeholder="우편번호" name="useradd1">
						<button  class="butt" type="button" onclick="sample6_execDaumPostcode()" style="width: 160px;">우편번호찾기</button><br>
						<input type="text" id="useradd2" placeholder="주소" name="useradd2"><br>
						<input type="text" id="useradd3" placeholder="상세주소" name="useradd3">
						<input type="text" id="useradd4" placeholder="참고항목" name="useradd4">
					</dd>
				</dl>
				
				<div class="form-group has-feedback">
					<button class="butt" type="button" id= "register">회원가입</button>
					<button class="butt" type="button" id= "cancle">취소</button>
				</div>
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
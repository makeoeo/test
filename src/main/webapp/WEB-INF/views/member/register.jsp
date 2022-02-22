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
       function Validation(){
           var idpw = /^[0-9a-zA-Z]{4,12}$/; //id와 pwassword 유효성 검사 정규식         
           var name = /^[가-힣a-zA-Z]{2,15}$/; //이름 유효성검사 정규식           
           var email = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/; //이메일 유효성검사
           var reg = /\d{6}\-[1-4]\d{6}/; //주민번호 정규식
           var phone = /^\d{2,3}-\d{3,4}-\d{4}$/; //전화번호 정규식
           
           var objId = document.getElementById("userId"); //아이디
           var objPwd = document.getElementById("userPass"); //비밀번호
           var objPwd2 = document.getElementById("userPass2"); //비밀번호확인
           var objEmail = document.getElementById("userEmail");//메일
           var objName = document.getElementById("userName"); //이름
           var objReg = document.getElementById("userRegi"); //주민번호
           var objPhone = document.getElementById("userPhone"); //전화번호
       
           
           // ================ ID 유효성검사 ================ //
           
           if(objId.value==''){
               alert("Please enter your ID.");
               return false;
           }
           if(!idpw.test(objId.value)){ //아이디 유효성검사
               alert("Please enter the ID with 4 to 12 letters, uppercase and lowercase letters and numbers only.");        
               return false;
           }
           
           // ================ PASSWORD 유효성검사 ===============//
           if(objPwd.value==''){ // 비밀번호 입력여부 검사
               alert("Please enter your password.");
               return false;
           }
           if(!idpw.test(objPwd.value)){ //패스워드 유효성검사
               alert("Please enter a password of 4 to 12 characters in uppercase and lowercase letters and numbers.");
               return false;
           }
           
           if(objPwd2.value!=objPwd.value){ //비밀번호와 비밀번호확인이 동일한지 검사
               alert("The password is wrong. Please check again and enter.");
               return false;
           }
           
           
           // ================ 이름 유효성검사 ================ //        
           if(objName.value ==''){
               alert("Please enter your name.");
               return false;
           }
           if(!name.test(objName.value)){
               alert("Special characters cannot be used.");
               return false;
           }
           
           // ================ 주민등록번호 유효성검사 ================ //
           if(objReg.value == ''){ // 주민번호입력 형식이 알맞은지 검사 
               alert("Please enter your social security number.");                
               return false;
           }
           if(!reg.test(objReg.value)){
               alert("The format of the social security number is incorrect.");
               return false;
           }
           
           // ================ 연락처 유효성검사 ================ //
           if(objPhone.value == ''){
              alert("Please enter your Phone Number.");
              return false;
           }
           if(!phone.test(objPhone.value   )){
              alert("Contact format is incorrect.");
              return false;
           }
           // ================ email 유효성검사 ================ //
           if(objEmail.value == ''){ // 이메일 입력여부 검사
               alert("Please enter your e-mail.");
               return false;
           }
           
           if(!email.test(objEmail.value)){ //이메일 유효성 검사
               alert("Invalid email format.");
               return false;
           }
           
           if($("#useradd1").val()=='' || $("#useradd2").val()=='' || $("#useradd3").val()==''){
              alert("Please enter your address.");
               return false;
           }
   
           
         var idChkVal = $("#idChk").val();
         if(idChkVal == "N"){
            alert("Please click the check button.");
         }else if(idChkVal == "Y"){
            $("#regForm").submit();
         }
       }
      
      function fn_idChk(){
         $.ajax({
            url : "/member/idChk",
            type : "post",
            dataType : "json",
            data : {"userId" : $("#userId").val()},
            success : function(data){
               if(data == 1){
                  alert("Duplicate ID.");
                  $("#idChk").text("id in use");
                  $("#idChk").css("color","red");
               }else if(data == 0){
                  $("#idChk").attr("value", "Y");
                  alert("Username is available.");
                  $("#idChk").text("Available");
                  $("#idChk").css("color","white");
               }
            }
         });
      }
   </script>

   <body>
      <form action="/member/register" method="post" id="regForm" onsubmit="return Validation();">
            <div class ="wrap">
               <img src="../resources/img/lo.png" style="width: 100px; "> <h1>dTb Sign up</h1>
            <dl>
               <dt><label  for="userId">ID</label></dt>
                <dd><input class="form-control" type="text" id="userId" name="userId" />
                  <button class="butt" type="button" id="idChk" onclick="fn_idChk();" value="N">Check</button><br>
                  Please enter the ID with 4 to 12 letters, uppercase and lowercase letters and numbers only.
               </dd>            
            </dl>
            <br>
                 <hr>
            <dl>
               <dt><label for="userPass">Password</label></dt>
               <dd><input class="form-control" type="password" id="userPass" name="userPass" /><br>
                  Please enter the PW only with 4 to 12 letters, uppercase and lowercase letters and numbers.
               </dd>
            </dl>
            <br>
               	<hr>
			<dl>
				<dt><label for="userPass2">Password Check</label></dt>
				<dd><input class="form-control" type="password" id="userPass2" name="userPass2"></dd>
			</dl>          
            <br>
               <hr>
            <dl>
               <dt><label class="control-label" for="userName">Name</label></dt>
               <dd><input class="form-control" type="text" id="userName" name="userName" />
                  	Special characters cannot be used.
               </dd>
            </dl>
            <br>
               <hr>
            <dl>
               <dt><label class="control-label" for="userRegi">SSN(Regist)</label></dt>
               <dd><input class="form-control" type="text" id="userRegi" name="userRegi" maxlength="14"/>
                  ex) 981212-1234567
               </dd>
            </dl>
            <br>
               <hr>
            <dl>
               <dt><label class="control-label" for="userPhone">Phone</label></dt>
               <dd><input class="form-control" type="text" id="userPhone" name="userPhone" maxlength="13"/>
                  ex) 123-4567-8901 or 123-456-7890
               </dd>
            </dl>
            <br>
               <hr>
            <dl>
               <dt><label class="control-label" for="userEmail">Email</label></dt>
               <dd><input class="form-control" type="text" id="userEmail" name="userEmail" />
                  ex) email@naver.com
               </dd>
            </dl>
            <br>
               <hr>
            <dl>
               <dt><label for="agency">Address</label></dt>
               <dd>   
                  <input type="text" id="useradd1" placeholder="zipcode" name="useradd1" readonly="readonly">
                  <button  class="butt" type="button" onclick="sample6_execDaumPostcode()" style="width: 160px;">Find postal code</button><br>
                  <input type="text" id="useradd2" placeholder="Address" name="useradd2" readonly="readonly"><br>
                  <input type="text" id="useradd3" placeholder="Detailed Address" name="useradd3">
                  <input type="text" id="useradd4" placeholder="References" name="useradd4" readonly="readonly">
               </dd>
            </dl>
            
            <div class="form-group has-feedback">
               <button class="butt" type="submit" id= "register">Complet</button>
               <button class="butt" type="button" id= "cancle" onclick="location.href='/'">Cancle</button>
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
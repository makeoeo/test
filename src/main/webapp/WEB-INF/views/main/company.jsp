<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link rel="stylesheet" href="../resources/css/company.css">
    <title>dTb회사소개</title>
</head>
<body>
 <div class ="allbox" >
     <div class= "company_header">
       <a class="logobox" href="#">
          <img alt="logo" src="../resources/img/lo.png" style="width: 150px; height: auto;">
       </a>
          <h1 class="mainbox">Company Introduce</h1>
    </div>
    <div class ="company_firstbox">
          <span class="box">
             <img alt="introduce_image1" src="../resources/img/introduce1.png" style="width: 240px; height: auto;">
             <p class="company_txt01">Can play a variety of sounds.</p>       
          </span>
         
    </div>
    <div class ="company_secondbox">
          <span class="box">
             <img alt="introduce_image2" src="../resources/img/introduce2.png" style="width: 240px; height: auto;">
             <p class="company_txt01">The company may try to <br>contact you.</p>     
          </span>
            
    </div>
    <div class ="company_thirdbox">
          <span class="box">
             <img alt="introduce_image3" src="../resources/img/introduce3.png" style="width: 240px; height: auto;">
             <p class="company_txt01">You can reach a variety <br> of people</p>
          </span>
    </div>
      <button class="butt" onclick="location.href='/'">HOME</button>
 </div>
    <!-- 하단 부분 -->
     <jsp:include page="footer.jsp"/>
</body>
</html>
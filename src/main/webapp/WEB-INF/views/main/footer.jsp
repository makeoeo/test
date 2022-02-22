<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%
	String  foot_Company_regi= "사업자 등록 번호 : 123-12-12345";
	String  foot_Company_agent= "dTb company 대표 이사 : 정시민";
	String  foot_Company_tel= "Tel : 02)1234-1234";
	String  foot_Company_fax= "fax : 000-123-456";
	String  foot_Company_add= "서울특별시 관악구 (서울특별시 관악구)";
	String  foot_Company_corp= "ⓒ 2021 dTb Entertainment Corp.";
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../resources/css/footer.css">
</head>
<body>
<div class="footer_allbox">
      <ul class="footer_txt01">
        <li><%=foot_Company_regi%></li>
        <li><%=foot_Company_agent%></li>
        <li><%=foot_Company_tel%></li>
        <li><%=foot_Company_fax%></li><br/>
        <li><%=foot_Company_add%></li>
        <li><%=foot_Company_corp%></li>
      </ul>
</div>
</body>
</html>
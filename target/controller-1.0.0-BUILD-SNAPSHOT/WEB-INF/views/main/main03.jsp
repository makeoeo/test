<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<% request.setCharacterEncoding("utf-8"); %>
<%	
	String  strTitle= "dTb";
	String  main03Msg= "Search what you want.";
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=strTitle%></title>
<link rel="stylesheet" type="text/css" href="./resources/css/main03.css">
</head>
<body>
<div class="main3">
        <div class="main3_tx01">
          <h1>Search what you want.</h1>
        </div>
        <%--<form action="" accept="" id="" name=""> --%>
        <form action="/search/result" method="get">
        <div class="main3_but">
       	 <input type="text" class="main3_tx_search" placeholder="    Artist, distributor, album search" name="keyword" id="keywordInput" value="${scri.keyword}" style="height: 35px; margin-right: 6px;" >
       	 <%-- <input type="submit" class="main3_submit" value="search">--%>
       	 		<button class="main3_submit"id="searchBtn" type="button"><a href="./search/list">search</a></button>
       	</div>
						<c:forEach items="${rs}" var = "list">
							<tr>
								<td><c:out value="${rs.bno}" />
								<a href="/search/readView?bno=${rs.bno}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}"></a></td>
				
								<td>
									<c:out value="${rs.artist}" />

								</td>
								<td>
									<c:out value="${rs.distributor}" />
								</td>						
								<td>
									<c:out value="${rs.album}" />
								</td>
							</tr>
						</c:forEach>
						
						<script>
							 $(function(){
								 $('#searchBtn').click(function() {
									 self.location = "list" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
								 });
							 });   
						</script>
       	</form>
</div>
</body>
</html>
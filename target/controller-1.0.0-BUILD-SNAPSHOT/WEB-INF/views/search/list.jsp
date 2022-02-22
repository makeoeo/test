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
		  <link rel="stylesheet" type="text/css" href="../resources/css/boardList.css">
	 
	 	<title>Search Board</title>
	</head>
	<body>
		<div class="container">
			<div class = "header_board">	
				<div class="header_logo">
		  			 <img src="../resources/img/lo.png" style="width: 180px; height: auto;" alt="logo">
		  			 <a style="margin-left: 10px;" href="/">Search Board</a>
				</div>
				
			 </div>
			 
			<div class=include_box>
				<%@include file="nav.jsp" %>
			</div>
			
			<section id="container">
				<form role="form" method="get" action="/main/main03">

				<table class="table">
				<thead>
					<tr>
						<th>NO</th>
						<th>ARTIST</th>
						<th>DISTRIBUTOR</th>
						<th>ALBUM</th>
					</tr>
				</thead>
						
						<c:forEach items="${list}" var = "list">
							<tr>
								<td><c:out value="${list.bno}" />
									<a href="/search/readView?bno=${list.bno}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}"></a>
								</td>
									<td>
										<c:out value="${list.artist}" />
									</td>
									<td>
										<c:out value="${list.distributor}" />
									</td>						
									<td>
										<c:out value="${list.album}" />
									</td>
							</tr>
						</c:forEach>
						
					</table>
					<div class="search row">
						<div class="col-xs-2 col-sm-2">
							<select name="searchType" class="form-control">
								<option value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
								<option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>ARTIST</option>
								<option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>DISTRIBUTOR</option>
								<option value="w"<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>ALBUM</option>
							</select>
						</div>
						 
						<div >
							<div class="search">
								<input type="text" name="keyword" id="keywordInput" value="${scri.keyword}" style="height: 35px; margin-right: 6px;"  />
									<button id="searchBtn" type="button" class="butt">Search</button> 	
							</div>
						</div>
					</div>
						 
						<script>
							 $(function(){
								 $('#searchBtn').click(function() {
									 self.location = "list" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
								 });
							 });   
						</script>
					<div class="col-md-offset-3">
						<ul class="pagination">
							<c:if test="${pageMaker.prev}">
								<li><a href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}">PREV</a></li>
							</c:if> 
							
							<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
								<li <c:out value="${pageMaker.cri.page == idx ? 'class=info' : ''}" />>
								<a href="list${pageMaker.makeSearch(idx)}">${idx}</a></li>
							</c:forEach>
							
							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}">NEXT</a></li>
							</c:if> 
						</ul>
					</div>
				</form>
			</section>
		
		</div>
	</body>
</html>
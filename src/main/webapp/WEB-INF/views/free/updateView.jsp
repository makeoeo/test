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
	 	<link rel="stylesheet" type="text/css" href="../resources/css/updateView.css">
	 	
	 	<title>Free Board</title>
	 	
	 	
	</head>
	<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='updateForm']");
			
			$(document).on("click","#fileDel", function(){
				$(this).parent().remove();
			})
			
			fn_addFile();
			
			$(".cancel_btn").on("click", function(){
				event.preventDefault();
				location.href = "/free/readView?bno=${update.bno}"
					   + "&page=${scri.page}"
					   + "&perPageNum=${scri.perPageNum}"
					   + "&searchType=${scri.searchType}"
					   + "&keyword=${scri.keyword}";
			})
			
			$(".update_btn").on("click", function(){
				if(fn_valiChk()){
					return false;
				}
				formObj.attr("action", "/free/update");
				formObj.attr("method", "post");
				formObj.submit();
			})
		})
			
		function fn_valiChk(){
			var updateForm = $("form[name='updateForm'] .chk").length;
			for(var i = 0; i<updateForm; i++){
				if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
					alert($(".chk").eq(i).attr("title"));
					return true;
				}
			}
		}
 		function fn_addFile(){
			var fileIndex = 1;
			//$("#fileIndex").append("<div><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"<button type='button' style='float:right;' id='fileAddBtn'>"+"추가"+"</button></div>");
			$(".fileAdd_btn").on("click", function(){
				$("#fileIndex").append("<div><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"</button>"+"<button type='button' style='float:right;' id='fileDelBtn'>"+"삭제"+"</button></div>");
			});
			$(document).on("click","#fileDelBtn", function(){
				$(this).parent().remove();
				
			});
		}
 		var fileNoArry = new Array();
 		var fileNameArry = new Array();
 		function fn_del(value, name){
 			
 			fileNoArry.push(value);
 			fileNameArry.push(name);
 			$("#fileNoDel").attr("value", fileNoArry);
 			$("#fileNameDel").attr("value", fileNameArry);
 		}
	</script>
	<body>
	
					<div class = "header_board">	
				<div class="header_logo">
		  			 <img src="../resources/img/lo.png" style="width: 180px; height: auto;" alt="logo">
		  			 <a href="/">Free Board</a>
				</div>
			</div>
			<div class ="move_box">
				<button class="butt2" onclick="location.href='/free/list.do'">LIST</button>
				<button style="margin-left: 10px;" class="butt2" onclick="location.href='/'">HOME</button>
					
			</div>
			<div class ="fs">
				<c:if test="${member != null}">
				<p>${member.userId} welcome.</p>
				</c:if>
			</div>
			
			<section id="container">
				<form name="updateForm" role="form" method="post" action="/free/update" enctype="multipart/form-data">
					<input type="hidden" name="bno" value="${update.bno}" readonly="readonly"/>
					<input type="hidden" id="page" name="page" value="${scri.page}"> 
					<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
					<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
					<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
					<input type="hidden" id="fileNoDel" name="fileNoDel[]" value=""> 
					<input type="hidden" id="fileNameDel" name="fileNameDel[]" value=""> 
					<table>
						<tbody>
							<tr>
								<td>
									<label style="color: #fff;" for="title"><legend for="title">TITLE</legend></label></br>
									<input type="text" id="title" name="title" value="${update.title}" class="chk" />
								</td>
							</tr>	
							<tr>
								<td>
									<label style="color: #fff;" for="content"  ><legend for="content">CONTENT</legend></label></br>
									<textarea style="resize:none;" rows="10" id="content" name="content" class="chk" "><c:out value="${update.content}" /></textarea>
								</td>
							</tr>
							<tr>
								<td>
									<label style="color: #fff;" for="writer"><legend for="writer">ID</legend></label></br>
									<input type="text" id="writer" name="writer" value="${update.writer}" readonly="readonly"/>
								</td>
							</tr>
							<tr>
								<td style="color: #fff; font-size: 20px;">
								</br></br>
									<label  for="regdate">WRITE DATE</label>
									<fmt:formatDate value="${update.regdate}" pattern="yyyy-MM-dd"/>					
								</td>
							</tr>
						</tbody>			
					</table>
					<div class="btn_box">
						<button style="margin-right: 15px; width: 120px;" type="button" class="update_btn butt">COMPLETE</button>
						<button type="button" class="cancel_btn butt">CANCLE</button>
						<button style="margin-left: 15px; width: 110px;" type="button" class="fileAdd_btn butt">ADD FILE</button>
					</div>
				</form>
			</section>
		</div>
	</body>
</html>
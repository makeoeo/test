<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<html>
   <head>
      <!-- 합쳐지고 최소화된 최신 CSS -->
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
      <!-- 부가적인 테마 -->
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
       
       <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
       <link rel="stylesheet" type="text/css" href="../resources/css/writeView.css">
       <title>File Board</title>
       

   </head>
   <script type="text/javascript">
      $(document).ready(function(){
         var formObj = $("form[name='writeForm']");
         $(".butt").on("click", function(){
            if(fn_valiChk()){
               return false;
            }
            formObj.attr("action", "/board/write");
            formObj.attr("method", "post");
            formObj.submit();
         });
         fn_addFile();
      })
      function fn_valiChk(){
         var regForm = $("form[name='writeForm'] .chk").length;
         for(var i = 0; i<regForm; i++){
            if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
               alert($(".chk").eq(i).attr("title"));
               return true;
            }
         }
      }
      function fn_addFile(){
         var fileIndex = 1;
         //$("#fileIndex").append("<div><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"<button type='button' style='float:right;' id='fileAddBtn'>"+"추가"+"</button></div>");
         $(".butt1").on("click", function(){
            $("#fileIndex").append("<div><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"</button>"+"<button type='button' style='float:right;' id='fileDelBtn'>"+"삭제"+"</button></div>");
         });
         $(document).on("click","#fileDelBtn", function(){
            $(this).parent().remove();
            
         });
      }
   </script>
   <body>
   
         <div class = "header_board">   
            <div class="header_logo">
                  <img src="../resources/img/lo.png" style="width: 180px; height: auto;" alt="logo">
                  <a href="/">File Board</a>
            </div>
            
          </div>
             <c:if test="${member.userId == null}">
               <div class ="move_box">
                  <button class="butt2" onclick="location.href='/board/list'">LIST</button>
                  <button class="butt2" onclick="location.href='/'" style="margin-left: 10px;">HOME</button>
                  <button class="butt3" onclick="location.href='../member/login'" style="margin-left: 10px;">Login</button>         
               </div>
            </c:if>
            <c:if test="${member != null}">
               <div class ="move_box">
                  <button class="butt2" onclick="location.href='/board/list'">LIST</button>
                  <button style="margin-left: 10px;" class="butt2" onclick="location.href='/'">HOME</button>
               </div>
               <div class ="fs">
                  <p>${member.userId} welcome.</p>         
               </div>
            </c:if>
         <section id="container">
            <form name="writeForm" method="post" action="/board/write" enctype="multipart/form-data">
               <table>
                  <tbody>
                     <c:if test="${member.userId != null}">
                        <tr>
                           <td>
                              <legend for="title">TITLE</legend><input type="text" id="title" name="title" class="chk" title="Enter the title."/>
                           </td>
                        </tr>   
                        <tr>
                           <td>
                              <legend for="content">CONTENT</legend>
                              <textarea id="content" name="content"  class="chk" title="Enter the content." style="resize:none; width: 700px;" rows="20" ></textarea>
                           </td>
                        </tr>
                        <tr>
                           <td>
                              <legend for="writer">WRITER</legend><input type="text" id="writer" name="writer" class="chk" title="Enter the writer." value="${member.userId}" readonly="readonly"/>
                           </td>
                        </tr>
                        <tr>
                        <tr>
                           <td id="fileIndex">
                           </td>
                        </tr>
                        <tr>
                           <td>                  
                              <button style="width: 120px;" class="butt" type="submit">COMPLETE</button>   
                              <button style="width: 140px; margin-left: 10px;"class="butt1" type="button" onclick="fn_addFile()">FILE UPLOAD</button>   
                           </td>
                        </tr>   
                     </c:if>
                     <c:if test="${member.userId == null}">
                        <div class="notwrite">
                           <p  style=" text-align: center; color: #fff; font-size: 25px;">You can fill it out after logging in.</p>
                        </div>
                     </c:if>
                  </tbody>         
               </table>
            </form>
         </section>
   </body>
</html>
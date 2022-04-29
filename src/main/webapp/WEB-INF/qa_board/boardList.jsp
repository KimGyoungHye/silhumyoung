<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/member/top.jsp" %>
<br><br>
<style>
   .table{
      width:70%
   }
   .table table-hover{
      width:70%
   }
   a {
        text-decoration: none;
        color:black;
   }
</style>

<script>
   function category_search(){
      var index=document.myform.category.selectedIndex;
      var text=document.myform.category.options[index].text;
      //alert(text);   
      
      document.myform.submit();
   }
</script>
<center>

<form name="myform" action="list.qa" method="get">
      <table class="table">
         <tr>
            <td>
               <select name="category" onchange="category_search()" class="form-select form-select" style="width: 140px;">
                  <option value="전체목록" <c:if test="${category=='전체목록' }">selected</c:if>>전체목록
                  <option value="보험질문" <c:if test="${category=='보험질문' }">selected</c:if>>보험질문
                  <option value="고객의소리"  <c:if test="${category=='고객의소리' }">selected</c:if>>고객의소리
               </select>
            </td>
            <td align="right">
               <input type="button" value="글쓰기" onclick="location.href='insert.qa'" class="btn btn-success">
            </td>
         </tr>
      </table>
</form>   
</center>   
<center>   
      <table class="table table-hover">
         <tr class="table-secondary">
            <td align="center">번호</td>
            <td align="center">제목</td>
            <td align="center">고객아이디</td>
            <td align="center">보험사</td>
            <td align="center">작성일</td>
            <td align="center">조회</td>
         </tr>
         <c:set var="number" value="${number+1 }" /> 

         <c:forEach var="article" items="${boardList }">
            <tr>
               <td align="center">
                  <c:set var="number" value="${number-1 }" /> ${number }
               </td>
               <td><c:if test="${article.re_level > 0 }">
                     <c:set var="wid" value="${article.re_level*20 }" />
                     <img
                        src="<%=request.getContextPath() %>/resources/qa_board/images/level.gif"
                        width="${wid }" height="15">
                     <img src="<%=request.getContextPath()%>/resources/qa_board/images/re.gif">
                  </c:if> <a
                  href="content.qa?no=${article.no}&pageNumber=${pageInfo.pageNumber}">[${article.category}]${article.title }</a>

                </td>
               <td align="center">${article.writer}</td>
               <td align="center">${article.company}</td>
               <td align="center">
                  <fmt:parseDate var="parseDateDay" value="${article.reg_date }" pattern="yyyy-MM-dd"/>
                  <fmt:formatDate var="formatDateDay" value="${parseDateDay }" pattern="yyyy-MM-dd"/>
                  ${formatDateDay }
               </td>
               <td align="center">${article.readcount}</td>
            <tr>
         </c:forEach>

      </table>

      <br> ${pageInfo.pagingHtml}

</center>      
<%@include file="/WEB-INF/member/bottom.jsp" %>
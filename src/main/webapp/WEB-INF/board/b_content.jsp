<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/member/top.jsp" %>
<br><br>
<style>
   .table{
      width:70%;
   }
</style>

<center>
<table class="table table-bordered">
   <tr>
      <td align="center" class="table-light">글번호</td>
      <td align="center">${boardBean.bnum }</td>
      <td align="center" class="table-light">조회수</td>
      <td align="center">${ boardBean.breadcount }</td>
      <td align="center" class="table-light">작성일</td>
      <td align="center">
         <fmt:parseDate var="parseDateDay" value="${boardBean.bdate }" pattern="yyyy-MM-dd"/>
         <fmt:formatDate var="formatDateDay" value="${parseDateDay }" pattern="yyyy-MM-dd"/>
         ${ formatDateDay }
      </td>
   </tr>
   <tr>
      <td align="center" class="table-light">글제목</td>
      <td align="center" colspan="5">${ boardBean.btitle }</td>
   </tr>
   <tr height="150">
      <td align="center" class="table-light">글내용</td>
      <td align="center" colspan="5">${ boardBean.bcontents }</td>
   </tr>
   <tr height="50">
      <td align="center" class="table-light">첨부파일</td>
      <td align="center" colspan="5">
         <c:if test="${boardBean.bimage==null }">
            첨부파일 없음
         </c:if>
         <a href="<%=request.getContextPath()%>/resources/board/${boardBean.bimage}">${boardBean.bimage}</a>
      </td>
   </tr>
   <tr align="center" height="30">
   <td class="table-light"></td>
      <td colspan="5" class="table-light">
   <c:if test="${userState=='관리자' }">   
      <input type="button" value="글수정" class="btn btn-success"
      onclick="location.href='update.bd?bnum=${boardBean.bnum }&pageNumber=${ pageNumber}'">
      <input type="button" value="글삭제" class="btn btn-success"
      onClick="location.href='delete.bd?bnum=${boardBean.bnum}&pageNumber=${ pageNumber}&bimage=${boardBean.bimage }'">
   </c:if>   
      <input type="button" value="글목록" class="btn btn-success"
      onClick="location.href='list.bd?pageNumber=${ pageNumber}'">
      </td>
   </tr>
</table>
</center>
<%@include file="/WEB-INF/member/bottom.jsp" %>
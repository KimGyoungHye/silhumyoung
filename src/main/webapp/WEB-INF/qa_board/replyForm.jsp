<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/member/top.jsp" %>
<br><br>
<style>
   .table{
      width:80%;
   }
  
   .err{
      color:red;
   }   
</style>

<%    String[] categoryArr = {"보험질문","고객의소리"};
%>
<c:set value="<%=categoryArr %>" var="categoryArr"/>


<center>
<div class="container">
<form:form method="post" commandName="QA_BoardBean" action="reply.qa" enctype="multipart/form-data">
<input type="hidden" name="ref" value="${ref }" />
<input type="hidden" name="re_step" value="${re_step }" />
<input type="hidden" name="re_level" value="${re_level }" />
<input type="hidden" name="pageNumber" value="${pageNumber}">

<input type="hidden" name="company" value="${company}">
<input type="hidden" name="writer" value="${writer}">
<input type="hidden" name="category" value="${category}">

<table class="table table-bordered">
   <tr>
      <td align="center" class="table-light">제목</td>
      <td>
         <input type="text" name="title" class="form-control" value="${QA_BoardBean.title }">
         <form:errors path="title" cssClass="err" />
      </td>
   </tr>
   <tr>
      <td align="center" class="table-light">내용</td>
      <td>
         <textarea name="content" class="form-control"  rows="10" cols="40" style="resize:none">${QA_BoardBean.content }</textarea>
         <form:errors path="content" cssClass="err" />
      </td>
   </tr>      
   <tr>
      <td align="center" class="table-light">첨부파일</td>
      <td>
         <input type="file" name="upload" class="form-control">
      </td>
   </tr>
   <tr>
      <td align="center" class="table-light">비밀번호</td>
      <td>
         <input type="password" name="password" class="form-control" value="${QA_BoardBean.password }">
         <form:errors path="password" cssClass="err" />
      </td>
   </tr>
   <tr>
   <td class="table-light"></td>
      <td align="center" class="table-light" >
         <input type="submit" value="글쓰기" class="btn btn-success"> 
         <input type="reset"value="다시작성" class="btn btn-success"> 
         <input type="button" value="글목록" class="btn btn-success" onClick="location.href='list.qa?pageNumber=${pageNumber}'"></td>
   </tr>
</table>
</form:form>
</div>
</center>
<%@include file="/WEB-INF/member/bottom.jsp" %>
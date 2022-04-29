<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/member/top.jsp" %>
<br>
<style>
   .table{
      width:70%;
   }
   .err{
      color:red;
   }   
</style>

<center>
<form:form method="post" action="insert.bd" enctype="multipart/form-data" commandName="boardBean"> 
<table class="table table-bordered">
   <tr>
      <td align="center" class="table-light">제목</td>
      <td>
         <input type="text" name="btitle" class="form-control">
         <form:errors path="btitle" cssClass="err" />
      </td>
   </tr>
   <tr>
      <td align="center" class="table-light">내용</td>
      <td>
         <textarea name="bcontents" class="form-control" rows="10" cols="40" style="resize:none">${ boardBean.bcontents }</textarea>
         <form:errors path="bcontents" cssClass="err" />
      </td>                  
   </tr>
   <tr>
      <td align="center" class="table-light">첨부파일</td>
      <td>
         <input type="file" name="upload" class="form-control">
         <form:errors path="upload" cssClass="err" />
      </td>
   </tr>
   <tr>
      <td align="center" class="table-light">상단 고정</td>
      <td>
              <input class="form-check-input" type="radio" name="fix" id="flexRadioDefault1" value="0">
              <label class="form-check-label" for="flexRadioDefault1">
             해제
              </label>
              <input class="form-check-input" type="radio" name="fix" id="flexRadioDefault2" value="1">
              <label class="form-check-label" for="flexRadioDefault2">
             설정
              </label>         
              <form:errors path="fix" cssClass="err" />      
      </td>
   </tr>
   <tr>
   	<td class="table-light"></td>
      <td align="center" class="table-light">
         <input type="submit" value="글쓰기" class="btn btn-success"> 
         <input type="reset" value="다시작성" class="btn btn-success"> 
         <input type="button" value="글목록" class="btn btn-success" onClick="location.href='list.bd'">
      </td>
   </tr>
</table>   
</form:form>
</center>

<%@include file="/WEB-INF/member/bottom.jsp" %>
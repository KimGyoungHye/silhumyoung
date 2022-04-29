<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/member/top.jsp" %>
<br><br>
<style>
   .table{
      width:20%
   }
</style>

<center>
<div class="container">
<form method="post" action="delete.qa?">
   <input type="hidden" name="pageNumber" value="${pageNumber }">
   <input type="hidden" name="no" value="${no}">
   <input type="hidden" name="image" value="${image}">
   
   <table class="table table-bordered">
      <tr>
         <td align="center" class="table-light">비밀번호를 입력하세요</td>
      </tr>
      <tr>
         <td align="center"><input type="password" name="password"></td>
      </tr>
      <tr>
         <td align="center" class="table-light">
            <input type="submit" value="글삭제" class="btn btn-success">
            <input type="button" value="글목록" onclick="location.href='list.qa?pageNumber=${pageNumber}'" class="btn btn-success">
         </td>
      </tr>
   </table>
</form>
</div>
</center>
<%@include file="/WEB-INF/member/bottom.jsp" %>
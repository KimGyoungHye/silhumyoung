<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/member/top.jsp"%>     
<br><br>
<form:form action="insert.ic" method="post" commandName="insuCateBean">
<table>
	<tr>
		<td>보험 카테고리명</td>
		<td></td>
	</tr>
	<tr>
		<td><input type="text" name="category"></td>
		<td><form:errors path="category" cssClass="err"/></td>
	</tr>
	<tr>
		<td colspan="3">
			<input type="submit" value="등록">
			<input type="reset" value="다시 작성">
		</td>
	</tr>
</table>
</form:form>
<br><br><br>
<%@include file="/WEB-INF/member/bottom.jsp"%>   

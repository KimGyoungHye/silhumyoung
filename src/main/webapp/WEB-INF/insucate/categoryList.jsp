<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/member/top.jsp"%>     
<br><br>   
<table>
	<tr>
		<td>등록번호</td>
		<td>카테고리명</td>
		<td>수정</td>
		<td>삭제</td>
	</tr>
<c:forEach var="insuCate" items="${insuCateList }">
	<tr>
		<td>${insuCate.num }</td>
		<td>${insuCate.category }</td>
		<td>
			<a href="update.ic?num=${insuCate.num }">수정</a>
		</td>
		<td>
			<a href="delete.ic?num=${insuCate.num }">삭제</a>
		</td>
	</tr>
</c:forEach>
</table>
<input type="button" value="카테고리 등록" onclick="location.href='insert.ic'">

<br><br><br>
<%@include file="/WEB-INF/member/bottom.jsp"%>   


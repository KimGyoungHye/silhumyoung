<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>        

<a href="start.jsp">시작페이지</a>
<br><br>

<center>
<h2>회원 리스트(관리자 로그인) 
<br>
${totalCount}명</h2>

<form action="adminLogin.mem" method="get">
	<select name="whatColumn">
		<option value="all">전체검색</option>
		<option value="id">id</option>
		<option value="userState">userState</option>
	</select>
<input type="text" name="keyword">
<input type="submit" value="검색">
<br><br>
<table border="1" align="center">
	<tr>
		<th>회원구분(userState)</th>
		<th>이름</th>
		<th>ID</th>
		<th>PW</th>
		<th>주민번호</th>
		<th>연락처</th>
		<th>email</th>
<!-- 		<th>수정</th>
		<th>삭제</th> -->
	</tr>
<c:forEach var="list" items="${list }">
	<tr>
		<td>${list.userState }</td>
		<td>${list.name }</td>
		<td>
			<a href="update.mem?id=${list.id}&pageNumber=${pageInfo.pageNumber}">${list.id }</a>
		</td>
		<td>${list.password }</td>
		<td>${list.regi_number1}-${list.regi_number2 }</td>
		<td>${list.phone1}-${list.phone2}-${list.phone3}</td>
		<td>${list.email1}@${list.email2}</td>
<%-- 		<td><a href="update.mem?id={list.id}&pageNumber=${pageNumber }">수정</a></td>
		<td><a href="delete.mem?id={list.id}&pageNumber=${pageNumber }">삭제</a></td> --%>
	</tr>
</c:forEach>	
</table>
</form>
</center>
<br>
<center>
	${pageInfo.pagingHtml }
</center>

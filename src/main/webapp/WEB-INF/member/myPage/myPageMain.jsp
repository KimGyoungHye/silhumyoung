<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%@ include file="/WEB-INF/member/top.jsp"%>
<br><br>
<style>
	table{
		width:70%;
		height:50%;
	}
</style>
<center>
<div class="container" style="align-content: center; margin: auto;">
	<c:if test="${myDetailNum!=null }">
		<table>
		<c:if test="${loginInfo.userState=='일반' }">
		<tr>
		<td align="center">
         	<a href="bohumChoochun.bh">
         	<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="#6692BA" class="bi bi-search-heart-fill" viewBox="0 0 16 16">
  			<path d="M6.5 13a6.474 6.474 0 0 0 3.845-1.258h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.008 1.008 0 0 0-.115-.1A6.471 6.471 0 0 0 13 6.5 6.502 6.502 0 0 0 6.5 0a6.5 6.5 0 1 0 0 13Zm0-8.518c1.664-1.673 5.825 1.254 0 5.018-5.825-3.764-1.664-6.69 0-5.018Z"/>
			</svg>
					<br>
         	<font size="2" color="black">내 개인 보험 추천</font></a>
					</td>
			<td align="center">
				<a href="update.md">
					<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="#6692BA" class="bi bi-pencil-square" viewBox="0 0 16 16">
  						<path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
  						<path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
					</svg>
					<br>
					<font size="2" color="black">내 상세 정보 수정</font></a>	
					<!-- <a class="btn btn-primary" href="insert.md">내 상세 정보 추가</a> -->
				</td>
				<td align="center">
					<a href="delete.md">
					<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="#6692BA" class="bi bi-eraser" viewBox="0 0 16 16">
  						<path d="M8.086 2.207a2 2 0 0 1 2.828 0l3.879 3.879a2 2 0 0 1 0 2.828l-5.5 5.5A2 2 0 0 1 7.879 15H5.12a2 2 0 0 1-1.414-.586l-2.5-2.5a2 2 0 0 1 0-2.828l6.879-6.879zm2.121.707a1 1 0 0 0-1.414 0L4.16 7.547l5.293 5.293 4.633-4.633a1 1 0 0 0 0-1.414l-3.879-3.879zM8.746 13.547 3.453 8.254 1.914 9.793a1 1 0 0 0 0 1.414l2.5 2.5a1 1 0 0 0 .707.293H7.88a1 1 0 0 0 .707-.293l.16-.16z"/>
					</svg>
					<br>
					<font size="2" color="black">내 상세 정보 삭제</font></a>	
					<!-- <a class="btn btn-primary" href="insert.md">내 상세 정보 추가</a> -->
				</td>
				</tr>
			</c:if>
			<tr>
			<td align="center">
				<a href="memberUpdateConfirm.mem">
					<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="#6692BA" class="bi bi-person-lines-fill" viewBox="0 0 16 16">
 				 		<path d="M6 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm-5 6s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zM11 3.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5zm.5 2.5a.5.5 0 0 0 0 1h4a.5.5 0 0 0 0-1h-4zm2 3a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1h-2zm0 3a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1h-2z"/>
					</svg>
					<br>
					<font size="2" color="black">내 계정 수정하기</font>	
					<!-- <a href="memberUpdateConfirm.mem">내 계정 수정하기</a> -->
				</td>	
				<td align="center">
					<a href="memberDeleteForm.mem">
					<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="#6692BA" class="bi bi-person-x" viewBox="0 0 16 16">
 						<path d="M6 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H1s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C9.516 10.68 8.289 10 6 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"/>
  						<path fill-rule="evenodd" d="M12.146 5.146a.5.5 0 0 1 .708 0L14 6.293l1.146-1.147a.5.5 0 0 1 .708.708L14.707 7l1.147 1.146a.5.5 0 0 1-.708.708L14 7.707l-1.146 1.147a.5.5 0 0 1-.708-.708L13.293 7l-1.147-1.146a.5.5 0 0 1 0-.708z"/>
					</svg>
					<br>
					<font size="2" color="black">내 계정 탈퇴하기</font>	
					<!-- <a class="btn btn-primary" href="memberDeleteForm.mem">내 계정 탈퇴하기</a> -->
				</td>
			</tr>
			</table>
	</c:if>
	<c:if test="${myDetailNum==null }">
		<table>
			<tr>
		<c:if test="${loginInfo.userState=='일반' }">
				<td align="center">
					<a href="insert.md">
					<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="#6692BA" class="bi bi-pencil-fill" viewBox="0 0 16 16">
 						 <path d="M12.854.146a.5.5 0 0 0-.707 0L10.5 1.793 14.207 5.5l1.647-1.646a.5.5 0 0 0 0-.708l-3-3zm.646 6.061L9.793 2.5 3.293 9H3.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.207l6.5-6.5zm-7.468 7.468A.5.5 0 0 1 6 13.5V13h-.5a.5.5 0 0 1-.5-.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.5-.5V10h-.5a.499.499 0 0 1-.175-.032l-.179.178a.5.5 0 0 0-.11.168l-2 5a.5.5 0 0 0 .65.65l5-2a.5.5 0 0 0 .168-.11l.178-.178z"/>
					</svg>
					<br>
					<font size="2" color="black">내 상세 정보 추가</font></a>	
					<!-- <a class="btn btn-primary" href="insert.md">내 상세 정보 추가</a> -->
				</td>
		 </c:if>	
				<td align="center">
					<a href="memberUpdateConfirm.mem">
					<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="#6692BA" class="bi bi-person-lines-fill" viewBox="0 0 16 16">
 				 		<path d="M6 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm-5 6s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zM11 3.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5zm.5 2.5a.5.5 0 0 0 0 1h4a.5.5 0 0 0 0-1h-4zm2 3a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1h-2zm0 3a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1h-2z"/>
					</svg>
					<br>
					<font size="2" color="black">내 계정 수정하기</font>	
					<!-- <a href="memberUpdateConfirm.mem">내 계정 수정하기</a> -->
				</td>	
				<td align="center">
					<a href="memberDeleteForm.mem">
					<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="#6692BA" class="bi bi-person-x" viewBox="0 0 16 16">
 						<path d="M6 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H1s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C9.516 10.68 8.289 10 6 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"/>
  						<path fill-rule="evenodd" d="M12.146 5.146a.5.5 0 0 1 .708 0L14 6.293l1.146-1.147a.5.5 0 0 1 .708.708L14.707 7l1.147 1.146a.5.5 0 0 1-.708.708L14 7.707l-1.146 1.147a.5.5 0 0 1-.708-.708L13.293 7l-1.147-1.146a.5.5 0 0 1 0-.708z"/>
					</svg>
					<br>
					<font size="2" color="black">내 계정 탈퇴하기</font>	
					<!-- <a class="btn btn-primary" href="memberDeleteForm.mem">내 계정 탈퇴하기</a> -->
				</td>
			</tr>
		</table>
	</c:if>
</div>
</center>
<br><br><br>
<%@ include file="/WEB-INF/member/bottom.jsp"%>


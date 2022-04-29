<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/homeAdmin/top.jsp"%>

<style>
	#form1 {
	display:flex; 
	align-items:center;
	 }
</style>

<% 
	String[] userStateArr = {"일반","회사","관리자"};
	String[] whatColumnArr = {"전체 검색","아이디","유저타입","보험사"};
	String[] whatColumnValArr = {"all","id","userState","cname"};
%>

<script>
function companyCheck(memberID) {
	//alert(memberID);
	var p1 = document.getElementById("cregiP"+memberID);
	var uState = $('select[id=userState'+memberID+']').val();
    if(uState=="회사"){
	    if(p1.style.display=='none'){
	       p1.style.display = 'block';
	    }
	    	
	}else{
    	p1.style.display = 'none'
    }
	    
}

function searchCname(memberID){
    $.ajax({
       url : "search_corp_num.cp",
       data : ({
    	   cregi_num : $('input[id=cregi_num'+memberID+']').val()
       }),
       type : "post",
       
       success : function(data){
    	   	$('input[name=cname]').val(data);
          }
    })
 }
</script>

<c:set value="<%=userStateArr%>" var="userStateArr" />
<c:set value="<%=whatColumnArr%>" var="whatColumnArr" />
<c:set value="<%=whatColumnValArr%>" var="whatColumnValArr" />

<br>

	<div class="col-md-offset-1 col-md-3 checkContainer" style="width: 45%; float:right; margin:0 auto">
		<form action="memberList.ha" method="post" id="form1">
			<div class="col-md-2 checkContainer">
				<select name="whatColumn" class="form-control">
					<c:forEach var="i" begin="0" end="${fn:length(whatColumnArr)-1}" step="1">
						<option value="${whatColumnValArr[i] }" 
						<c:if test="${whatColumn==whatColumnValArr[i] }">
							selected
						</c:if>
						>${whatColumnArr[i] }
					</c:forEach>
				</select>
			</div>
			<div class="col-md-5 checkContainer">
				<input name="keyword" value="${keyword }" class="form-control">
			</div>
			<div class="col-md-2 checkContainer">
				<input type="submit" value="검색" class="btn btn-success">
			</div>
		</form>	

</div>
<center>

		<table class="table table-hover" style="width:75%">
			<tr>
				<td><h5>유저 관리 게시판</h5></td>
			</tr>
		</table>
		<table class="table table-hover" style="width:75%">
			<tr class="table-secondary" align="center">
				<th scope="col">유저타입</th>
				<th scope="col">아이디</th>
				<th scope="col">이름</th>
				<th scope="col">보험사</th>
				<th scope="col">블랙</th>
			</tr>
			<c:set var="totalCount" value="${totalCount+1 }" />
			<!-- 4=>5 -->

			<c:forEach var="member" items="${memberList }">
				<tr align="center">
					<td align="center">${member.userState }</td>
					<td align="center">${member.id }</td>
					<td align="center">${member.name }</td>
					<td align="center">
						<a href="companyUpdate.cp?cname=${member.cname }">
							${member.cname }
						</a>
					</td>
					<td align="center">
						<button class="btn btn-success" data-toggle="modal" data-target="#myModal${member.id}">
						사용자 정보 변경하기  
						</button>
<%@include file="/WEB-INF/homeAdmin/member/memberUserStateUpdate.jsp"%>
					</td>
				<tr>
			</c:forEach>
		</table>
		
		<br> ${pageInfo.pagingHtml}

		</center>







<%@include file="/WEB-INF/homeAdmin/bottom.jsp"%>
    
    
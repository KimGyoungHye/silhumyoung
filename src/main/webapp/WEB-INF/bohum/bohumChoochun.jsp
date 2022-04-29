<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/member/top.jsp"%>
<%@include file="/WEB-INF/common/common.jsp"%>
<br>
<style>
   #form1 {
   display:flex; 
   align-items:center;
    }
</style>


<%
	String[] whatColumnArr = { "전체 검색", "회사이름", "보험이름", "특약정보" };
String[] whatColumnValArr = { "all", "cmpyNm", "prdNm", "mog" };
%>
<br>
<c:set value="<%=whatColumnArr%>" var="whatColumnArr" />
<c:set value="<%=whatColumnValArr%>" var="whatColumnValArr" />
<div class="container">
<div class="col-md-offset-1 col-md-3 checkContainer" style="width: 45%; float:right; margin:0 auto"> 
         <form action="bohumChoochun.bh" method="post" id="form1">
            <div class="col-md-2 checkContainer">
               <select name="whatColumn" class="form-control">
                  <c:forEach var="i" begin="0" end="${fn:length(whatColumnArr)-2}"
                     step="1">
                     <option value="${whatColumnValArr[i] }"
                        <c:if test="${whatColumn==whatColumnValArr[i] }">
                     selected
                  </c:if>>${whatColumnArr[i] }
                  </c:forEach>
               </select>
            </div>
            <div class="col-md-5 checkContainer">
               <input name="keyword" value="${keyword }" class="form-control">
            </div>
            <div class="col-md-2 checkContainer">
               <input type="submit" value="검색"
                  class="form-control btn btn-success">
            </div>
         </form>
      </div>
</div> 
<br><br><br>

   <table class="table table-hover" align="center" style="width:75%">
      <tr align="center">
         <th>회사 코드</th>
         <th>회사 이름</th>
         <th>보험 종류</th>
         <th>보험 이름</th>
         <th>보험료</th>
         <th>특약 갯수</th>
      </tr>
		<c:if test="${fn:length(bohumTestInfoArr)==0 }">
			<tr>
				<td colspan="6">DB정보가 없거나 나에게 맞는 보험이 없습니다.</td>
			</tr>
		</c:if>
		<c:forEach items="${bohumTestInfoArr }" varStatus="status" var="test">
			<tr align="center">
				<td>${test.cmpyCd }</td>
				<td>${test.cmpyNm }</td>
				<td>${test.ptrn }</td>
				<td><a
					href="bohumDataDetail.bh?cmpyNm=${test.cmpyNm }&ptrn=${test.ptrn }&prdNm=${test.prdNm }&age=${test.age }">
						${test.prdNm } </a></td>
				<td><fmt:formatNumber value="${test.priceSum }"
						groupingUsed="true" />원</td>
				<td>${test.mogCount }</td>
			</tr>
		</c:forEach>
	</table>
	<br> ${pageInfo.pagingHtml}

<%@ include file="/WEB-INF/member/bottom.jsp"%>

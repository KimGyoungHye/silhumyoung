<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%-- <%@include file="/WEB-INF/top_bottom/main_top.jsp"%> --%>
<%@include file="/WEB-INF/homeAdmin/top.jsp"%>
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

<c:set value="<%=whatColumnArr%>" var="whatColumnArr" />
<c:set value="<%=whatColumnValArr%>" var="whatColumnValArr" />
<br>
<div class="col-md-offset-1 col-md-5 checkContainer" style="width: 40%; float:right; margin:0 auto">
         <form action="bohumJujang.ha" method="get" id="form1">
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
                  class="btn btn-success">
            </div>
         </form>
         </div>
      <center>
      <table class="table table-hover"  style="width:75%">
         <tr>
            <td><h5>보험저장 리스트</h5></td>
         </tr>
      </table>
      <table class="table table-hover" style="width:75%">
         <tr class="table-secondary" align="center">
            <th scope="col">회사코드</th>
            <th scope="col">회사이름</th>
            <th scope="col">카테고리</th>
            <th scope="col">나이</th>
            <th scope="col">보험이름</th>
         </tr>
         <c:forEach items="${bohumJujangInfoArr }" varStatus="status"
            var="jujang">
            <tr align="center">
               <td>${jujang.cmpyCd }</td>
               <td>${jujang.cmpyNm }</td>
               <td>${jujang.ptrn }</td>
               <td>${jujang.age }</td>
               <%-- <td>${jujang.prdNm }</td> --%>
               <td>
                  <a href="bohumDataDetail.bh?cmpyNm=${jujang.cmpyNm }&ptrn=${jujang.ptrn }&prdNm=${jujang.prdNm }&age=${jujang.age }">
                     ${jujang.prdNm }
                  </a>
               </td>
            </tr>
         </c:forEach>
      </table>
      </center>
      <br>
   <div class="row" style="align-content : center;">
       ${pageInfo.pagingHtml}
   </div>
</div>
<%-- <%@include file="/WEB-INF/top_bottom/main_bottom.jsp"%> --%>
<%@include file="/WEB-INF/homeAdmin/bottom.jsp"%>
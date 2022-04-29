<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/homeAdmin/top.jsp"%>
<!-- company/company_listForm.jsp -->

<script>
function delRight() { 
   //alert($('input[name="cnum"]').val());
   var a=confirm("보험사를 삭제 하시겠습니까?");
   if (a == true){    //확인
      location.href="companyDelete.cp?cnum="+$('input[name="cnum"]').val();
      return true;
   }else{   //취소<td><a href="companyDelete.cp?cnum=${company.cnum }">삭제</a></td>

       return false;

   }
   }
</script>

<center>
<br><br>
<div class="container">
      <form action="companyList.cp" method="get">
         <input type="submit" class="btn btn-success "  style="float: right;" value="회사명 검색">
         <input type="text" name="s_company" style=" width:300px; float: right;" class="form-control">                  
      </form>
   
   <br><br>
   
      <table class="table table-hover">   
         <tr>
            <td><h5>등록된 보험사 리스트</h5></td>
            <td align="right"><a href="companyInsert.cp">보험사 추가</a></td>
         </tr>
      </table>
      
      <table class="table table-hover">
         <thead>
            <tr align="center">         
               <th scope="col">no</th>
               <th scope="col">로고</th>
               <th scope="col">회사명</th>
               <th scope="col">삭제</th>
            </tr>
         </thead>
         
         <tbody align="center">
         <c:forEach var="company" items="${ list}">
            <tr align="center">
               <td>${company.cnum }</td>
               <td><a href="companydetail.cp?cnum=${company.cnum }">
               <img src="<%=request.getContextPath() %>/resources/company/${company.cimage}" width="100" height="100">
               </a></td>
               <td>${company.cname }</td>
               <input type="hidden" name="cnum" value="${company.cnum }" readOnly>
               <td><a class="btn btn-sm"  onclick="delRight()">삭제</a></td>
            </tr>
         </c:forEach>
         </tbody>
      </table>
      <br>${pageInfo.pagingHtml}
</div>   
</center>   

<%@include file="/WEB-INF/homeAdmin/bottom.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="top.jsp"%>
<br><br><br>
 <div class="container">
 <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
	<c:forEach items="${clist }" var="cl">
	<input type="hidden" value="${cl.cname }" name="cname">
      
        <div class="col">    
          <div class="card shadow-sm">
         
            <svg class="bd-placeholder-img card-img-top" width="100%" height="50"  xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false" >
            	   <%  
     				 String imgPath = request.getContextPath()+"/resources/company/";
      				%>
            	<img src="<%=imgPath %>${cl.cimage}" style="height: 180px;">      	
            </svg>
              
            <div class="card-body">     
              <p class="card-text">
              	${cl.cname }
              </p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-outline-success"><a href="getInsuCompany.lm?cname=${cl.cname }" style="color: gray;">보험상품 보기</a></button>
                </div>
                <small class="text-muted">
					<a href="${cl.clink }" style="color: gray;">보험사 페이지 이동</a>
				</small>
              </div>
            </div>
          </div>  
        </div>
   </c:forEach>  
    </div>
      
  </div>


<%@include file="bottom.jsp"%>
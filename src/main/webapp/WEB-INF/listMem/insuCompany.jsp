<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="top.jsp"%>
<br><br>

<center>
<body class="bg-light">
<br>
<div class="container">
<form action="getInsuCompany.lm" method="get">
	<input type="submit" class="btn btn-outline-success" value="검색" style="float: right; height: 30px;">
	<input type="text" class="form-control" name="keyword" style="width:200px; height: 30px; float: right">
	<select class="form-select form-select-sm" aria-label=".form-select-sm example" name="whatColumn" style="width: 105px; float: right">
		<option value="all">전체 검색</option>
		<option value="bname">보험명</option>
		<option value="bcate">카테고리</option>
	</select>
</form>
<br><br>
<table class="table table-hover">
<caption>${cname } : 총 ${total2}건</caption>
  <thead>
    <tr align="center">
      <th scope="col">번호</th>
      <th scope="col">보험명</th>
      <th scope="col">카테고리</th>
      <th scope="col">보험 타입</th>
      <th scope="col">보험료</th>
      <th scope="col">가입 나이</th>
      <th scope="col">보험 기간</th>
      <th scope="col">납입 기간</th>
      <th scope="col">납입 주기</th>
      <th scope="col">특약 가입</th>
    </tr>
  </thead>
  <tbody align="center">
<c:forEach var="gl" items="${getList }">
    <tr align="center">
      <th scope="row">${gl.insu }</th>
      <td><a href="http://${gl.link }">${gl.insuname }</a></td>
      <td>${gl.category }</td>
      <td>${gl.insutype }</td>
      <%
      String imgPath = request.getContextPath()+"/resources/insuprice/";
      %>
      <td><img src="<%=imgPath %>${gl.insuprice }" width="200" height="100"></td>
      <td>${gl.insuage }</td>
      <td>${gl.insuper }</td>
      <td>${gl.payper }</td>
      <td>${gl.paycyc }</td>
      <td>${gl.spccont }</td>
    </tr>
</c:forEach>
  </tbody>
</table>
${pageInfo2.pagingHtml }
</div>
</center>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>
 <br><br><br><br>


<%@include file="bottom.jsp"%>
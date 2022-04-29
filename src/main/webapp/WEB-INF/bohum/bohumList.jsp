<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/common.jsp" %>   
<%@ include file="top.jsp"%>

<script>
function delRight(myBohumNum) { 
   var a=confirm("보험 상품을 삭제 하시겠습니까?");
   if (a == true){    //확인
      location.href="bohumDelete.bh?insu="+myBohumNum;
   }else{   //취소<td><a href="companyDelete.cp?cnum=${company.cnum }">삭제</a></td>

       return false;

   }
   }
</script>

<html>
<head>
<meta charset="UTF-8">
<title>Select your 보험(회사 페이지)</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <!-- Custom styles for this template -->
    <link href="form-validation.css" rel="stylesheet">
</head>
<br><br><br>
<center>
<body class="bg-light">
<br>
<div class="container">
<form action="list.bh" method="get">
	<input type="submit" class="btn btn-success" value="검색" style="float: right;">
	<input type="text" class="form-control" name="keyword" style="width:200px; float: right">
	<select class="form-select form-select" aria-label=".form-select-sm example" name="whatColumn" style="width: 150px; float: right">
		<option value="all">전체 검색</option>
		<option value="bname">보험명</option>
		<option value="bcate">카테고리</option>
	</select>

<br><br>
<table class="table table-hover">
<caption>${loginCompany }: 총 ${total2}건</caption>
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
      <th scope="col">수정</th>
      <th scope="col">삭제</th>
    </tr>
  </thead>
  <tbody align="center">
<c:forEach var="bh" items="${getList }">
    <tr align="center">
      <th scope="row">${bh.insu }</th>
      <td><a href="http://${bh.link }">${bh.insuname }</a></td>
      <td>${bh.category }</td>
      <td>${bh.insutype }</td>
      <%
      String imgPath = request.getContextPath()+"/resources/insuprice/";
      %>
      <td><img src="<%=imgPath %>${bh.insuprice }" width="200" height="100"></td>
      <td>${bh.insuage }</td>
      <td>${bh.insuper }</td>
      <td>${bh.payper }</td>
      <td>${bh.paycyc }</td>
      <td>${bh.spccont }</td>
      <td><a class="btn btn-sm" href="bohumUpdate.bh?insu=${bh.insu}">수정</a></td>
      <input type="hidden" name="cnum" value="${company.cnum }" readOnly>
      <td><a class="btn btn-sm" href="javascript:delRight('${bh.insu}')">삭제</a></td>
    </tr>
</c:forEach>
  </tbody>
</table>
${pageInfo2.pagingHtml }
</div>
</form>
</center>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>
 <br><br><br><br>
    
<%@ include file="bottom.jsp"%>
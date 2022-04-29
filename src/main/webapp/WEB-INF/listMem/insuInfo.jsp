<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="top.jsp"%>
<br><br>
<script type="text/javascript">
	function allCheck(){

		//alert(1);
		var ac=document.getElementById('allcheck');			
		ac2=ac.checked;
		//alert(ac2);
			
		var rc=document.getElementsByName('rowcheck');
			
		if(ac2==true){
			for(i=0; i<rc.length; i++){
				rc[i].checked=true;
			}
		}
		else{
			for(i=0; i<rc.length; i++){
				rc[i].checked=false;
			}
		}	
	}//allCheck
	
	function add() {
		//alert(2);
		var rc=document.getElementsByName('rowcheck');
		//alert(3);
		var cnt=0;
		for(i=0; i<rc.length; i++){
			if(rc[i].checked==true)cnt++;
		}
		if(cnt==0){
			//alert(1);
			return false;
		}
	}

</script>  
      
<center>
<body class="bg-light">
<div class="container">
<form action="insuInfo.lm" method="get">
	<input type="submit" class="btn btn-success" value="검색" style="float: right;">
	<input type="text" class="form-control" name="keyword" style="width:200px; float: right"> 
	<select class="form-select form-select" aria-label=".form-select-sm example" name="whatColumn" style="width: 125px; float: right">
      <option value="all">전체 검색</option>
      <option value="bname">보험명</option> 
      <option value="bcate">카테고리</option>
   	</select> 
	
</form>
<form action="add.ht" onSubmit="return add()">
	 <button type="submit" class="btn btn-danger" style="float: left;" >
         <svg xmlns="http://www.w3.org/2000/svg" width="16" height="25" fill="currentColor" class="bi bi-suit-heart-fill" viewBox="0 0 16 16">
  			<path d="M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1z"/>
		</svg>     
            찜하기
      </button> 

<br><br>

<table class="table table-hover">
<caption>총 ${total}건</caption>
  <thead>
    <tr align="center">
    <th><input type="checkbox" id="allcheck" onClick="allCheck()"></th>
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
<c:forEach var="bh" items="${lists }" >
    <tr align="center">
     <td><input type="checkbox" name="rowcheck" value="${bh.insu }"></td>
      <td scope="row">${bh.insu }</td>
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
    </tr>
</c:forEach>
  </tbody>
</table>
</form>
</div>

</center>

 ${pageInfo.pagingHtml}


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
 <br><br><br><br>



<%@include file="bottom.jsp"%>
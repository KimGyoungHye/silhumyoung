<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/member/top.jsp"%> 
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
	
	function multiDelete(){
		var rowcheck=document.getElementsByName('rowcheck');	
		flag=false;
		for(var i=0; i<rowcheck.length; i++){
			if(rowcheck[i].checked==true){
				//alert(rowcheck[i].value);
				flag=true;
			}
		}
		if(flag==false){
			alert('삭제할 보험을 선택하세요');
			return false;
		}
		document.forms[0].submit();
	}
</script>

<body class="bg-light">
<div class="container">
<form action="delete.ht" method="post">
<input type="button" class="btn btn-success" value="삭제" onClick="multiDelete()" style="float: right; margin:20px;" />
<table class="table table-hover">
 	<thead>
	<tr align="center">
		<th><input type="checkbox" id="allcheck" onClick="allCheck()"></th>
		<td align="left">보험명</td>
		<td>카테고리</td>
		<td>보험사</td>
		<td>삭제</td>
	</tr>
	</thead>
	
<tbody align="center">	
<c:forEach var="heart" items="${heartList }">
	<tr>
		<td><input type="checkbox" name="rowcheck" value="${heart.insu }"></td>
		<td align="left">
		      <a href="http://${heart.link }">${heart.insuname }</a>
		</td>
		<td>${heart.category }</td>
		<td>${heart.insucompany }</td>
		<td>
			<a href="delete.ht?insu=${heart.insu }">삭제</a>
		</td>
	</tr>
</c:forEach>	


 </tbody>
</table>
</form>
</div>
</body>
${pageInfo.pagingHtml}


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
 
<br><br><br>
<%@include file="/WEB-INF/member/bottom.jsp"%>
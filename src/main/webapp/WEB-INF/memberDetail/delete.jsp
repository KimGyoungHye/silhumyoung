<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/WEB-INF/member/top.jsp"%>
<%@include file="/WEB-INF/common/common_memberDetail_value.jsp" %>
<br><br>

<script>
function right() { 
	
	var a=confirm("상세정보를 삭제 하시겠습니까?");
	if (a == true){    //확인

		return true;
	}else{   //취소

	    return false;

	}
	}//writeSave
</script>


	<div class="container" style="float:padding 50px;">
		<div class="col-md-offset-1 col-md-10 checkContainer">
		<form:form role="form" method="post" commandName="memberBean"
			action="delete.md" class="form-horizontal"  onSubmit="return right()">
			<input type="hidden" name="num" value="${loginInfo.userDetail }">
			<div class="form-group">
				<label for="password" class="col-md-3 control-label"> 비밀번호 : </label>
				<div class="col-md-6">
					<input type="password" name="password" 
					class="form-control" placeholder="비밀번호 입력">
				</div>
				<div class="col-md-2">
					<form:errors path="password" cssClass="error"/>	
				</div>
			</div>
			<br>
			<div class="form-group">
				<div class=" col-md-offset-3 col-md-6 ">
					<button type="submit" class="form-control btn btn-success">내 정보 삭제</button>
				</div>
			</div>
		</form:form>
		</div>
</div>

<br><br><br>
 <%@ include file="/WEB-INF/member/bottom.jsp"%>
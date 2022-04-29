
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/member/top.jsp"%>
<%@include file="./../common/common.jsp"%>

<style type="text/css">
.err {
	font-size: 9pt;
	color: red;
	font-weight: bold;
}
.form-control {
    width: 95% !important;
}
</style>

<script type="text/javascript">
function reback(){
	location.href="myPage.mem";
}
</script>

<div class="container" style="align-content: center; margin: auto;">
		<h2 align="center">회원정보 수정</h2>

<form:form class="form-horizontal" commandName="member" method="post" action="memberUpdateConfirm.mem">
	<input type="hidden" name="id" value="${MemberBean.id }" readOnly>
	<input type="hidden" name="name" value="${MemberBean.name }" readOnly>
 	<fieldset id="myfield" >

	
	<div class="col-md-6 mb-3 w-25">
      <label for="id">아이디</label><br>
       <div class="controls">
        <input type="text" class="form-control" id="id" name="id" value="${MemberBean.id}" disabled="disabled"> 
      </div>
 	</div>
	<div class="form-row">
    <div class="col-md-6 mb-3 w-25">
      <label for="name">이름</label>
      <input type="text" class="form-control" id="name" name="name"  value="${MemberBean.name }" disabled="disabled">
    </div>
</div>
	
   <div class="form-row">
    <div class="col-md-4 mb-3 w-30">
      <label for="password">비밀번호</label>
      <div class="controls">
        <input type="password" class="form-control" id="password" name="password" required>
      </div>
    </div>
 </div>
 

	<div class="control-group">
      <!-- Button -->
      <div class="controls">
        <button type="submit" class="btn btn-success">확인</button>
    
        <button type="button" class="btn btn-success" onClick="reback()">취소</button>
      </div>
    </div>
	</fieldset>
</form:form>
</div>


<%@ include file="/WEB-INF/member/bottom.jsp"%>
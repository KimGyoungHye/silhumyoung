<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>

updateForm.jsp<br>
<style type="text/css">
.err {
	font-size: 9pt;
	color: red;
	font-weight: bold;
}
</style>

<script>
	function deleteId(id,pageNumber) {
		//alert(1);
		location.href="delete.mem?id="+id+"&pageNumber="+pageNumber;
		//location.href="update.tv?num="+num+"&pageNumber="+pageNumber;
	}

</script>

<h2>회원정보 수정/탈퇴 화면 </h2>
(id: ${member.id})<br>
pageNumber: ${pageNumber}

<br><br>
사업자 정보 입력
<hr>

<form method="post" action="search_corp_num.cp">
	<div>
		<p>
			<label for="cregi_num">사업자등록번호</label> 
			<input type="text" name="cregi_num" id="cregi_num" value="" size="10"> 
			<input type="submit" value="조회">
		</p>
	</div>
</form>


<form:form commandName="member" method="post" action="update.mem">
	<input type="hidden" name="userState" id="userState" value="${member.userState }">
	<input type="hidden" name="id" value="${member.id }">
    <input type="hidden" name="pageNumber" value="${pageNumber}">


	<div>
		<p>
			<label for="name">회사명</label> 
			<input type="text" name="company" id="company" value="">
			<!-- 조회하면 회사명 자동으로 뜨게?하는거 값을 세션으로 넣어야지 페이지 에러나도 그대로 나올 것 같아요..! 
			대신 회원 가입 후에는 지정해서 지워주는 걸로..! -->
		</p>
	</div>
	<hr>
	<p>
		<label for="name">담당자 이름 : </label> 
			${member.name }
		
	</p>

	<p>
		<label for="id">아이디 : </label> 
		${member.id }
	</p>
	<p>
		<label for="password">비밀번호</label> 
		<input type="text" name="password" id="password" value="${member.password }">
		<form:errors cssClass="err" path="password" />
	</p>
	<p>
		<label for="regi_number1">주민번호</label> 
		<input type="text" name="regi_number1" id="regi_number1" value="${member.regi_number1 }"> 
		- <input type="text" name="regi_number2" id="regi_number2" value="${member.regi_number2 }">
		<form:errors cssClass="err" path="regi_number1" />
		<form:errors cssClass="err" path="regi_number2" />
	</p>

	<p>
		<label for="phone1">연락처</label> 
		<input type="text" name="phone1" id="phone1" value="${member.phone1 }" size="3"> 
		- <input type="text" name="phone2" id="phone2" value="${member.phone2 }"size="4"> 
		- <input type="text" name="phone3" id="phone3" value="${member.phone3 }"size="4">
		<form:errors cssClass="err" path="phone1" />
	</p>
	<p>
		<label for="email1">이메일</label> 
		<input type="text" name="email1" id="email1" size="10" value="${member.email1 }">@<input type="text" name="email2" id="email2" value="${member.email2 }">
		<form:errors cssClass="err" path="email1" />
	</p>

	<p>
		<input type="submit" value="수정하기">
	</p>
	
	<p>
		<input type="button" value="탈퇴하기" onClick="deleteId('${member.id}','${pageNumber }')">
	</p> 									
</form:form>
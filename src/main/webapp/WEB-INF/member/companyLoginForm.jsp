<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp"%>
<%@include file="/WEB-INF/common/common_kakaoLog.jsp"%>

<!-- Custom styles for this template -->
    <link href="signin.css" rel="stylesheet">
<br><br><br>

<script>
	function register() { //회원가입 클릭시 보험사 회원가입 이동
		location.href="companyRegister.mem"; //MemberRegisterController로 이동
	}
	function go_toFind_id() {
		location.href="findid.mem";
	}
	function go_toFind_pw() {
		location.href="findpw.mem";
	}
</script>    

<div class="container">
<main class="form-signin">
<center>
    <span class="border border-primary"><h2>보험사 로그인 화면</h2></span>
<br><br><br>
  <form method="post" action="companyLogin.mem">
      <input class="d-grid gap-2 col-6 mx-auto" type="text" class="form-control" id="id" placeholder="id" name="id" style="width: 350px; height: 50px">
     <br>
      <input class="d-grid gap-2 col-6 mx-auto" type="password" class="form-control" id="password" placeholder="password" name="password" style="width: 350px; height: 50px">
<br><br>
	  <button class="btn btn-primary" type="submit" style="width: 350px">로그인</button>
  </form>
	 	<form method="post" action="kakaoLogin.mem" id="myForm">
		  	<a id="custom-login-btn" href="javascript:kakaoLogin()">
				<img src="https://www.gb.go.kr/Main/Images/ko/member/certi_kakao_login.png" width="222" height="" alt="카카오 로그인 버튼"/>
			</a><br>
			<input type="hidden" id="userinfo" name="userinfo" /> <!-- 유저정보를 저장할 input 엘리먼트 -->
			<input type="hidden" id="email1" name="email1" />
			<input type="hidden" id="email2" name="email2"  />
		</form>
 
<br><br>
<span class="border-end border-start" onClick="register()">&nbsp;&nbsp;회원 가입&nbsp;&nbsp;</span>
<span class="border-end border-start" onClick="go_toFind_id()">&nbsp;&nbsp;ID/PW 찾기&nbsp;&nbsp;</span>
<span class="border-end border-start" onclick="location.href='loginForm.mem';">&nbsp;&nbsp;일반회원 로그인&nbsp;&nbsp;</span>

</center>
</main>
</div>
</html>
<br><br><br><br>
<%@include file="bottom.jsp"%>
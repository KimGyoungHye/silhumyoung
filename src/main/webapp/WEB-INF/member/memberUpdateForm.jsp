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

<script>
	
	function pwcheck(){
		if($('input[name="password"]').val()!=""){
		//document.getElementsByName("password");
		var pw = document.forms[0].password.value; // abcd
		
		var regexp = /^[a-z0-9]{3,8}$/; // *2df@
		if(pw.search(regexp) == -1){ // test
			alert("비번 형식이 틀립니다.");
		} 
		
		var chk_num = pw.search(/[0-9]/);
		var chk_eng = pw.search(/[a-z]/);
		if(chk_num < 0 || chk_eng < 0){
			alert("비번은 영문자와 숫자를 조합해 주세요.");
			$('input[name="password"]').focus();
			$('#password').val('');
			return false;
		}
		}
	}
	
	function repwcheck(){
		if($('input[name="password"]').val()!=""){
			if($('input[name="password"]').val()== $('input[name="repassword"]').val() ){
				$('#pwmessage').html("<font color=red>비번일치</font>");
			}
			else{
				$('#pwmessage').html("<font color=red>비번 불일치</font>");
				$('#repassword').val('');
			}
		}
	}
	
	function sendSms(){
		//alert(1);
		var p1 = document.getElementById("pi1");
		var p2 = document.getElementById("pi2");
		if(p1.style.display=='none' && p2.style.display=='none'){
			p1.style.display = 'block';
			p2.style.display = 'block';
		};

		$.ajax({
			url : "sendSms.mem",
			data : ({
				phone : $('input[name=phone1]').val()+$('input[name=phone2]').val()+$('input[name=phone3]').val()
			}),
			type : "post",
			
			success : function(data){
					if($.trim(data) == 'false'){
						alert("인증번호 전송 실패");
					}
					else{
						alert("인증번호 전송");
						$("#phone1").attr("readonly",true);
						$("#phone2").attr("readonly",true);
						$("#phone3").attr("readonly",true);
						code = data;
					}
				}
		})
		
	}
	
	function codeCk(){
		//alert(1);
		if($('input[name=pi1]').val().length == 0){
			alert('인증 번호를 발급받으세요.');
			return false;
		}
		else if($('input[name=pi1]').val() == $.trim(code)){
			alert('인증 완료');
		}
		else{
			alert('인증 번호가 일치하지 않습니다.');
			return false;
		}
	}
	function reback(){
		location.href="myPage.mem";
	}

</script>


<div class="container" style="align-content: center;">
<h2 align="center">회원정보 수정 화면 </h2>

<form:form class="form-horizontal" commandName="member" method="post" action="memberUpdateForm.mem">
	<fieldset id="myfield" >	
	<input type="hidden" name="userState" id="userState" value="${MemberBean.userState }">
<fmt:formatNumber var="formatPhone1" value="${MemberBean.phone1}" pattern="000"/>
<fmt:formatNumber var="formatPhone2" value="${MemberBean.phone2}" pattern="0000"/>
<fmt:formatNumber var="formatPhone3" value="${MemberBean.phone3}" pattern="0000"/>
	<div class="col-md-6 mb-3 w-25">
      <label for="id">아이디</label><br>
       	<div class="controls">
        	<input type="text" class="form-control" id="id" name="id" value="${MemberBean.id}" readonly="readonly"> 
      	</div>
 	</div>
	<div class="form-row">
    	<div class="col-md-6 mb-3 w-25">
      		<label for="name">이름</label>
      		<input type="text" class="form-control" id="name" name="name"  value="${MemberBean.name }" readonly> 
   	 	</div>
	</div>
	
	
	 <div class="form-row">
    	<div class="col-md-4 mb-3 w-30">
      		<label for="password">비밀번호</label>
      		<div class="controls">
        		<input type="password" class="form-control" id="password" name="password" onBlur="pwcheck()" value="${member.password }">
        		<span class="help-block"> *비밀번호는 영문자와 숫자 조합 3~8자로 입력해 주세요.</span>
      		</div>
    	</div>
 	</div>
 	<div class="form-row">
    	<div class="col-md-4 mb-3 w-30">
      		<label for="password">비밀번호 확인</label>
      		<div class="controls">
        		<input type="password" class="form-control" id="repassword" name="repassword"  onBlur="repwcheck()">
       			<span id="pwmessage"></span>
      		</div>
    	</div>
	</div>
	
	
	<div class="input-group">
   	<div class="col-md-3 mb-4 w-25">
      		<label for="regi_number1">주민등록번호</label>
      		<input type="text" class="form-control" id="regi_number1" name="regi_number1" value="${MemberBean.regi_number1 }" readonly> 
   			<form:errors cssClass="err" path="regi_number1" />
    	</div>

 	   	<div class="col-md-3 mb-4 w-25">
      		<label for="regi_number2">&nbsp</label>
      		<input type="password" class="form-control" id="regi_number2" name="regi_number2" value="${MemberBean.regi_number2 }" readonly> 
  			<form:errors cssClass="err" path="regi_number2" />
    	</div>
  	</div>

	<div class="input-group">
    <div class="col-md-2 mb-4 w-10">
      <label for="phone1">연락처</label>
      <input type="text" class="form-control" id="phone1" name="phone1" placeholder="" required value="${formatPhone1}">
   		<form:errors cssClass="err" path="phone1" />
    </div>
   
    <div class="col-md-2 mb-4 w-10">
      <label for="phone2">&nbsp</label>
      <input type="text" class="form-control" id="phone2" name="phone2" placeholder="" required value="${formatPhone2}">
       	<form:errors cssClass="err" path="phone2" />
    </div>
    <div class="col-md-2 mb-4 w-10">
      <label for="phone3">&nbsp</label>
      <input type="text" class="form-control" id="phone3" name="phone3" placeholder="" required value="${formatPhone3}" >
           <form:errors cssClass="err" path="phone3" />
    </div>
 
	<div class="col-md-1">
		 <label for="" class="form-label"> &nbsp;&nbsp;</label>
	<input type="button" name="phoneck" onClick="sendSms()" value="인증번호 전송"><br>
			<input type="text" id="pi1" name="pi1" placeholder="인증번호 입력" style="display: none;">
			<input type="button" id="pi2" name="pi2" value="인증" style="display: none;" onClick="codeCk()">
      </div>
    </div>
	
	<div class="input-group">
    <div class="col-md-3 mb-4 w-25">
      <label for="email1">이메일</label>
      <input type="text" class="form-control" id="email1" name="email1" placeholder="" required value="${MemberBean.email1}">
    </div>

    <div class="col-md-3 mb-4 w-25">
      <label for="email2">&nbsp</label>
      <input type="text" class="form-control" id="email2" name="email2" placeholder="" required value="${MemberBean.email2}">
    </div>
  </div>

	<div class="control-group">
      <!-- Button -->
      <div class="controls">
        <button type="submit" class="btn btn-success">수정하기</button>
    
        <button type="button" class="btn btn-success" onClick="reback()">취소</button>
      </div>
    </div>
    </fieldset>
</form:form>
</div>
<%@ include file="/WEB-INF/member/bottom.jsp"%>
<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="top.jsp"%>	
<%@ include file="../common/common.jsp"%>


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

<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery.js"></script>
<script>

var use = "impossible2"; //중복체크 안하면 
var flag = false;
var isCheck = false;

$(function() {
	$('input[name=id]').keydown(function() {
		//alert(1);
		use = "impossible2";
		$('#idmessage').css('display','none'); //사용중인 아이디 -> none -> 사용할 수 있습니다
		
	});
});

function writeSave() { //register.jsp에서 가입하기 클릭시 함수호출
	//alert(1);
	isCheck = true; //중복체크를 클릭함
	if($('input[name="id"]').val()==""){
		alert("id가 누락됐습니다.");
		$('input[name="id"]').focus();
		return false;
	}
	
	if(use == "impossible"){ //아래 변수하나 설정, 사용중 아이디는 못넘어가게
		alert("이미 사용중인 아이디 입니다.");
		return false;
	}
	
	if(use == "impossible2"){ //중복체크 안하면 
		alert("중복체크를 안했습니다.");
		return false;
	}
	
	if($("input[name='yak']").is(":checked")==true){ // if 시작
	      var yak_no = $("input[name='yak']:checked").val();
	      if(yak_no=='yak_no'){
	        alert('개인정보 수집 및 이용 미동의 시 가입 불가합니다.');
	        return false;
	      }
	    
	  }else{ //else 시작
	      alert('개인정보 수집 및 이용 동의 시 가입 가능합니다.');
	      return false;
	  }
	}//writeSave

function duplicates() {
    $.ajax({
        url : "id_check.mem",
       data : ({
    	   userid : $('input[name=id]').val()
       }), 
       
       success : function(data) {
         // alert('downLoad!');
          if($.trim(data)=='0'){
				$('#idmessage').html("<font color=red>사용할 수 있습니다.</font>");
				$('#idmessage').show();
				use = "possible";
			}
			else{
				$('#idmessage').html("<font color=red>이미 사용중인 아이디 입니다.</font>");
				$('#idmessage').show();
				use = "impossible";
			}
          
       },//success
       error : function(data) {
           //alert(data);
           alert('error!');
        }//success
    });//ajax
   // alert(4);
 }
function pwcheck(){	
	//document.getElementsByName("password");
	var pw = document.forms[0].password.value; // abcd
	
	var regexp = /^[a-z0-9]{3,8}$/; // *2df@
	if(pw.search(regexp) == -1){ // test
		alert("비번 형식이 틀립니다.");
	}
	
	var chk_num = pw.search(/[0-9]/);
	var chk_eng = pw.search(/[a-z]/);
	if(chk_num < 0 || chk_eng < 0){
		alert("비번은 영문자와 숫자 조합 3~8자로 입력해 주세요.");
		return false;
	}
	}//pwcheck

function repwcheck(){
	if($('input[name="password"]').val()== $('input[name="repassword"]').val() ){
		$('#pwmessage').html("<font color=red>패스워드 일치</font>");
	}
	else{
		$('#pwmessage').html("<font color=red>패스워드 불일치</font>");
		 $('#repassword').val('');
	}
}//repwcheck

//사업자 등록번호 api 불러오기
function removeCname(){
    //alert(1);
    var p1 = document.getElementById("cname1");
    if(p1.style.display=='none'){
       p1.style.display = 'block';
    }
   
    var myData = {
  	    b_no: $('input[id="cregi_num"]').val(),//사업자 등록번호 10자리
  	    b_name: $('input[id="com_name"]').val(),//대표자 성명
  	    start_dt: $('input[id="start_dt"]').val()//개업일자
  		};
    
     $.ajax({
  	  url: "companyNumber01.mem",
  	  traditional: true,
  	  type: "POST",
  	  data: JSON.stringify(myData),
  	  dataType: "JSON",
  	  contentType: "application/json",
  	  accept: "application/json",
  	  success: function(result) {
  	      console.log("result : "+result);
  	  },
  	  error: function(result) {
  	      console.log(result.responseText); //responseText의 에러메세지 확인
  	  }
  	});
 }
</script>
<br>
<div class="container" style="align-content: center;"> 
<div id="legend">
      <legend class="" >보험사 회원가입</legend>
</div>
<form>
<div class="form-row">
    <div class="col-md-6 mb-3 w-25">
      <label class="control-label" for="cregi_num">사업자등록번호</label>
         <input type="text" class="form-control" name="cregi_num" id="cregi_num" placeholder="- 없이 숫자만 입력"> 
      <label class="control-label" for="com_name">대표자 성명</label>
         <input type="text" class="form-control" name="com_name" id="com_name"> 
      <label class="control-label" for="start_dt">개업일자</label>
         <input type="text" class="form-control" name="start_dt" id="start_dt" placeholder="YYYYMMDD"> 
         <input type="button" class="btn btn-outline-secondary" value="조회" onClick="removeCname()" id="cregi_num2">
    </div>
</div>
</form>
<hr>
 <div class="form-row">
    <div class="col-md-6 mb-3">
     <div id="cname1" style="display:none;">   
         <label class="control-label" for="cname">회사명</label>
         <input type="text" name="cname" value="" readonly="readonly">
      </div>
    </div>
</div>

	<form:form class="form-horizontal" commandName="member" method="post" action="companyRegister.mem" onSubmit="return writeSave()">
	<input type="hidden" name="userState" id="userState" value="회사">
	<input type="hidden" name="cname" value="${cname }">
	
 <div class="form-row">
    <div class="col-md-6 mb-3 w-25">
      <label for="name">이름</label>
      <input type="text" class="form-control" id="name" name="name" placeholder="" value="${member.name }" required>
    </div>
</div>

 <div class="control-group" >
    <div class="col-md-6 mb-3 w-25">
      <label for="id">아이디</label>
       <div class="controls">
        <input type="text" class="form-control" id="id" name="id" value="${member.id}"> 
	<input type="button" class="btn btn-outline-secondary" id="id_check" value="중복체크" onClick="duplicates()"><br>
	<span id="idmessage"></span>
	<form:errors cssClass="err" path="id" />    
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
      <input type="text" class="form-control" id="regi_number1" name="regi_number1" placeholder="6자리 입력" required value="${member.regi_number1}">
   		<form:errors cssClass="err" path="regi_number1" />
    </div>
    
<span class="input-group-btn input-space"></span>

    <div class="col-md-3 mb-4 w-25">
      <label for="regi_number2">&nbsp</label>
      <input type="text" class="form-control" id="regi_number2" name="regi_number2" placeholder="7자리 입력" required value="${member.regi_number2}">
   		<form:errors cssClass="err" path="regi_number2" />
    </div>
  </div>

<div class="input-group">
    <div class="col-md-2 mb-4 w-30">
      <label for="phone1">연락처</label>
      <input type="text" class="form-control" id="phone1" name="phone1" placeholder="" required value="${member.phone1}">
   		<form:errors cssClass="err" path="phone1" />
    </div>
   
    <div class="col-md-2 mb-4 w-30">
      <label for="phone2">&nbsp</label>
      <input type="text" class="form-control" id="phone2" name="phone2" placeholder="" required value="${member.phone2}">
       		<form:errors cssClass="err" path="phone2" />
    </div>
    <div class="col-md-2 mb-4 w-30">
      <label for="phone3">&nbsp</label>
      <input type="text" class="form-control" id="phone3" name="phone3" placeholder="" required value="${member.phone3}">
           		<form:errors cssClass="err" path="phone3" />
    </div>
  </div>
	
<div class="input-group">
    <div class="col-md-3 mb-4 w-25">
      <label for="email1">이메일</label>
      <input type="text" class="form-control" id="email1" name="email1" placeholder="" required value="${member.email1}">
    </div>

    <div class="col-md-3 mb-4 w-25">
      <label for="email2">&nbsp</label>
      <input type="text" class="form-control" id="email2" name="email2" placeholder="" required value="${member.email2}">
    </div>
  </div>
      
<div class="form-check">
  <input class="form-check-input" type="radio" name="yak" id="yak" checked>
  <label class="form-check-label" for="yak">
    개인정보 수집 및 이용에 동의합니다.
  </label>
</div>

<div class="form-check">
  <input class="form-check-input" type="radio" name="yak" id="yak_no">
  <label class="form-check-label" for="yak_no">
    개인정보 수집 및 이용 동의하지 않습니다.
  </label>
</div>


<br>
<div class="control-group">
      <!-- Button -->
      <div class="controls">
        <button class="btn btn-success">회원가입</button>
      </div>
    </div>
 
</form:form>
</div>


<br><br><br><br>
<%@include file="bottom.jsp"%> --%>
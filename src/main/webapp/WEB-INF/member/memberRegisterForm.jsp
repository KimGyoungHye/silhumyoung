<%@page import="member.model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="top.jsp"%>
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

<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery.js"></script>

<script>

var use = "impossible2"; //중복체크 안하면 
var flag = false;
var isCheck = false;
var codeCheck = false;
$(function() {
   realRegiValid();
   $('input[name=id]').keydown(function() {
      //alert(1);
      use = "impossible2";
      $('#idmessage').css('display','none'); //사용중인 아이디 -> none -> 사용할 수 있습니다
      
   });
});

function realRegiValid() {
      var regiFlag = "${realRegi}";
      if(regiFlag=='wrong'){
         alert('유효하지 않은 주민번호입니다');
         codeCheck = true;
      }
   }

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
   
   if(codeCheck == false){
      alert('인증번호를 올바르게 입력하세요.');
      return false;
      } 
   }//writeSave

function duplicates() {
    //alert(3);
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
           alert(data);
           alert('error!');
        }//success
    });//ajax
    //alert(4);
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
      $('#password').val('');
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
         codeCheck = false;
      }
      else if($('input[name=pi1]').val() == $.trim(code)){
         alert('인증 완료');
         codeCheck = true;
      }
      else{
         alert('인증 번호가 일치하지 않습니다.');
         codeCheck = false;
      }
   }
   
    function flag_check(ff) {
      alert("flag_check");
      alert(ff);
      if(use == "impossible"){ //아래 변수하나 설정, 사용중 아이디는 못넘어가게
         alert("이미 사용중인 아이디 입니다.");
         return false;
      }
      if(use == "impossible"){ //아래 변수하나 설정, 사용중 아이디는 못넘어가게
         alert("이미 사용중인 아이디 입니다.");
         return false;
      }
   } 
</script>

<br>
<br>

<div class="container" style="align-content: center;">

<form:form class="form-horizontal" commandName="member" method="post" 
action="register.mem" onSubmit="return writeSave()"> 
<fmt:formatNumber var="formatPhone1" value="${member.phone1}" pattern="000"/>
<fmt:formatNumber var="formatPhone2" value="${member.phone2}" pattern="0000"/>
<fmt:formatNumber var="formatPhone3" value="${member.phone3}" pattern="0000"/>
<input type="hidden" name="userState" id="userState" value="일반">
  <fieldset id="myfield" >
    <div id="legend">
      <legend class="" >회원가입</legend>
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
    <div class="col-md-6 mb-3 w-25">
      <label for="name">이름</label>
      <input type="text" class="form-control" id="name" name="name" placeholder="" value="${member.name }" required>
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
      <input type="password" class="form-control" id="regi_number2" name="regi_number2" placeholder="7자리 입력" required value="${member.regi_number2}">
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
      <input type="text" class="form-control" id="phone3" name="phone3" placeholder="" required value="${formatPhone3}">
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
      <input type="text" class="form-control" id="email1" name="email1" placeholder="" required value="${member.email1}">
    </div>

    <div class="col-md-3 mb-4 w-25">
      <label for="email2">&nbsp</label>
      <input type="text" class="form-control" id="email2" name="email2" placeholder="" required value="${member.email2}">
    </div>
  </div>
    <br>
<div class="form-check">
  <input class="form-check-input" type="radio" name="yak" id="yak" value="yak" checked>
  <label class="form-check-label" for="yak">
    개인정보 수집 및 이용에 동의합니다.
  </label>
</div>

<div class="form-check">
  <input class="form-check-input" type="radio" name="yak" id="yak_no" value="yak_no">
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

<br>
<br>
<br>
<br>
<%@include file="bottom.jsp"%>
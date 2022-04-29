<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   
<%@ include file="/WEB-INF/member/top.jsp"%>
<%@include file="/WEB-INF/common/common_memberDetail_value.jsp"%>
<br><br>

<script type="text/javascript">
$(function(){ // 혹시 j쿼리 없으 실 수 있음 
    $("#diseaseElse").toggle();
    $("#family_historyElse").toggle();

    $("input[name='disease2']").click(function() { 
       var ac_d=document.getElementById('ac_disease');
       ac_d.checked=false;
        $("#diseaseElse").toggle();
    });
    
    $("input[name='family_history2']").click(function() { 
       var ac_d=document.getElementById('ac_fh');
       ac_d.checked=false;
        $("#family_historyElse").toggle();
    });
 }); 
  
 function allCheck(){
    // 질병여부 전체체크
    var ac_d=document.getElementById('ac_disease');         
    ac_d2=ac_d.checked;
    var disease=document.getElementsByName('disease');
    if(ac_d2){
       for(i=0; i<disease.length; i++){
          disease[i].checked=false;
       }
      var d2=document.myDform.disease2;
      //alert(d2.value);
      if(d2.checked){
         $("#diseaseElse").toggle();
      }
      d2.checked=false; 
      ac_d.checked=true;
    }
    // 가족력 전체체크
    var ac_fh=document.getElementById('ac_fh');         
    ac_fh2 = ac_fh.checked;
    //alert("11"+ac_fh2);
    var fh=document.getElementsByName('family_history');
    if(ac_fh2==true){
       for(i=0; i<fh.length; i++){
          fh[i].checked=false;
       }
       var f2=document.myDform.family_history2;
       if(f2.checked){
          $("#family_historyElse").toggle();
       }
       f2.checked=false; 
       ac_fh.checked=true;
    }
 }//allCheck
 
 function remove_ac(){
    //질병여부 하나라도 클릭시 전체체크 해제
    //alert("remove_ac");
    var ac_d=document.getElementById('ac_disease');
    var disease=document.getElementsByName('disease');
    
    for(i=0; i<disease.length; i++){
       if(disease[i].checked==false){
          ac_d.checked=false;
       }
    }
 }//remove_ac
  
 function remove(){
      //가족력 하나라도 클릭시 전체체크 해제
      // alert('remove');
       var ac_fh=document.getElementById('ac_fh');   
       var fh=document.getElementsByName('family_history');
       
       for(i=0; i<fh.length; i++){
          if(fh[i].checked==false){
             ac_fh.checked=false;
          }
       }
    }//remove
     

</script>


<div class="container" style="float:padding 50px;">

      <div class=""><h1>내 추천 정보 추가하기</h1></div>
   <div class="col-10">
      <form:form role="form" method="post" commandName="memberDetailBean"
         action="insert.md" class="form-horizontal" name="myDform">

         <input type="hidden" name="num" value="${loginInfo.userDetail }">
         <div class="form-group">
            <label for="age " class="col-md-3 control-label"> 나이 : </label>
            <div class="col-md-6">
               <input name="age" value="${memberAge }" class="form-control"
                  placeholder="만 나이입력" readonly>
            </div>

            <div class="col-md-2">
               <form:errors path="age" cssClass="error" />
            </div>
         </div>
         <div class="form-group">
            <label for="gender" class="col-md-3 control-label"> 성별 : </label>
            <div class="col-md-6">
               <c:forEach var="gender" items="${genderArr }" varStatus="status">
                  <label class="radio-inline"> <input type="radio"
                     name="gender" value="${gender}" readonly 
                     <c:if test="${gender==memberGender}">checked</c:if>>${gender}&nbsp&nbsp</label>
               </c:forEach>
            </div>
            <div class="col-md-2">
               <form:errors path="gender" cssClass="error" />
            </div>
         </div>

         <div class="form-group">
            <label for="job" class="col-md-3 control-label"> 직업 : </label>
            <div class="col-md-6">
               <select name="job" class="form-control">
                  <c:forEach var="job" items="${jobArr }" varStatus="status">
                     <option value="${job }"
                        <c:if test="${job==memberDetailBean.job }">
                        selected
                        </c:if>>${job }</option>
                  </c:forEach>
               </select>
            </div>
            <div class="col-md-2">
               <form:errors path="job" cssClass="error" />
            </div>
         </div>
         <div class="form-group">
            <label for="salary" class="col-md-3 control-label"> 연봉 : </label>
            <div class="col-md-6">
               <input name="salary" value="${memberDetailBean.salary }"
                  class="form-control" placeholder="연봉 입력">
            </div>
            <div class="col-md-2">
               <form:errors path="salary" cssClass="error" />
            </div>
         </div>
         <div class="form-group">
            <label for="marriage" class="col-md-3 control-label"> 결혼 유무
               : </label>
            <div class="col-md-6">
               <c:forEach var="marriage" items="${marriageArr }"
                  varStatus="status">
                  <label class="radio-inline"> <input type="radio"
                     name="marriage" value="${marriage}"
                     <c:if test="${marriage==memberDetailBean.marriage}">
                     checked
                  </c:if>>
                     ${marriage }&nbsp&nbsp
                  </label>
               </c:forEach>
            </div>
            <div class="col-md-2">
               <form:errors path="marriage" cssClass="error" />
            </div>
         </div>
         <div class="form-group">
            <label for="height" class="col-md-3 control-label"> 키 : </label>
            <div class="col-md-6">
               <input name="height" value="${memberDetailBean.height }"
                  class="form-control" placeholder="키">
            </div>
            <div class="col-md-2">
               <form:errors path="height" cssClass="error" />
            </div>
         </div>
         <div class="form-group">
            <label for="weight" class="col-md-3 control-label"> 몸무게 : </label>
            <div class="col-md-6">
               <input name="weight" value="${memberDetailBean.weight }"
                  class="form-control" placeholder="몸무게 입력">
            </div>
            <div class="col-md-2">
               <form:errors path="weight" cssClass="error" />
            </div>
         </div>
         <div class="form-group"  style="margin-top: 15px;">
            <label for="disease" class="col-md-3 control-label"> 질병여부 :
            </label>
            <div class="col-md-6">
            <label class="form-check-label">
               <input type="checkbox" class="form-check-input" id="ac_disease" name="disease" value="없음"
                  onclick="allCheck()"
                  <c:if test="${fn:contains(memberDetailBean.disease,'없음') }">
               checked
            </c:if>>없음</label>
               <c:forEach var="disease" items="${diseaseArr }" varStatus="status">
                  <label class="checkbox-inline"> <input type="checkbox" class="form-check-input" 
                     name="disease" value="${disease}"
                     <c:if test="${fn:contains(memberDetailBean.disease,disease) }">
                     checked
                  </c:if>
                     onclick="remove_ac()"> ${disease }&nbsp&nbsp
                  </label>
               </c:forEach>
               <br> <input type="checkbox"  class="form-check-input"   name="disease2"
                  onClick="checkDisable(this.form)"> 기타 &nbsp
               <div class="checkbox-inline" id="diseaseElse">
                  * 기타를 선택하신 분들은 병명을 적어주세요 &nbsp <input type="text"  class="form-control"  name="disease">
               </div>
            </div>
            <div class="col-md-2">
               <form:errors path="disease" cssClass="error" />
            </div>
         </div>
         
         <div class="form-group">
            <label for="family_history" class="col-md-3 control-label">
               가족력 : </label>
            <div class="col-md-6">
            <label class="form-check-label">
               <input type="checkbox" class="form-check-input" id="ac_fh" name="family_history" value="없음"
                  onclick="allCheck()"
                  <c:if test="${fn:contains(memberDetailBean.family_history,'없음') }">
               checked
            </c:if>>없음</label>
               <c:forEach var="family_history" items="${family_historyArr }"
                  varStatus="status">
                  <label class="checkbox-inline"> <input type="checkbox" class="form-check-input"
                     name="family_history" value="${family_history}"
                     <c:if test="${fn:contains(memberDetailBean.family_history,family_history) }">
                     checked
                  </c:if>
                     onclick="remove()"> ${family_history }&nbsp&nbsp
                  </label>
               </c:forEach>
               <br> <input type="checkbox" class="form-check-input" name="family_history2" onClick="checkDisable(this.form)">
               기타 &nbsp
               <div class="checkbox-inline" id="family_historyElse">
                  * 기타를 선택하신 분들은 가족력을 적어주세요 &nbsp <input type="text" class="form-control"
                     name="family_history">
               </div>
            </div>
            <div class="col-md-2">
               <form:errors path="family_history" cssClass="error" />
            </div>
         </div>
         <div class="form-group">
            <div class=" col-md-offset-3 col-md-6 ">
               <button type="submit" class="form-control btn btn-primary">내
                  정보 추가</button>
            </div>
         </div>
      </form:form>
   </div>
</div>
</div>
<br><br><br>
<%@ include file="/WEB-INF/member/bottom.jsp"%>
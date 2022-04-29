<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!-- js -->
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery.js"></script>
    
   
<!-- 카카오 로그인 --> 
<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.min.js" charset="utf-8"></script> 
<script type="text/javascript"> 
//초기화 시키기. 
$(document).ready(function(){ 
	//alert('kakao');
	Kakao.init('4ac3a4a5abf7720a50b28b3ffeb6b566'); 
	Kakao.isInitialized(); 
	kakaoLogout();
}); </script>

<script type="text/javascript"> 
function kakaoLogin() {
    //로그인하고
    //alert(1);
    Kakao.Auth.login({
      success: function (response) {
        //사용자 정보 가져오기
        Kakao.API.request({
          url: '/v2/user/me', //계정 정보를 가져오는 request url
          success: function (response) {
            let user = response.kakao_account //카카오 계정 정보
            //console.log(user)
            user.host = 'kakao' //다른 로그인 서비스와 구분하기 위해서 개인적으로 추가했음
            // 해당 페이지에서 객체를 만들고 곧바로 user 정보를 사용할 수 도 있고,
            // input 엘리먼트에 json으로 저장해뒀다가 나중에 사용할 수도 있음. 여기서는 input에 저장
            const userinfo = document.querySelector('#userinfo')
            if (userinfo) userinfo.value = JSON.stringify(user) 
            //user를 json문자열로 변환해서 저장해두기
            var json = userinfo.value;
			obj = JSON.parse(json);
            //myFormSubmit();
            //alert(obj.email_needs_agreement);
            if(obj.email_needs_agreement==false){
            	//alert('true');
            	//alert(obj.email);
            	const emails = obj.email.split('@');
            	//alert(emails[0]);
            	//alert(emails[1]);
            	document.getElementById("email1").value = emails[0];
            	document.getElementById("email2").value = emails[1];

            	myFormSubmit();
            }else{
            	//alert('false');
            	kakaoLogout();
            }
          },
          fail: function (error) {
            console.log(error)
          },
        })
      },
      fail: function (error) {
        console.log(error)
      },
    })
  }
  
function kakaoLogout() {
    if (Kakao.Auth.getAccessToken()) {
      //토큰이 있으면
      Kakao.API.request({
        //로그아웃하고
        url: '/v1/user/unlink',
        success: function (response) {
          //console.log(response)
        },
        fail: function (error) {
          console.log(error)
        },
      })
      //토큰도 삭제
      Kakao.Auth.setAccessToken(undefined)
      //유저정보도 삭제
      const userinfoElem = document.querySelector('#userinfo') 
      if(userinfoElem) userinfoElem.value = ''
    }
  }
  function myFormSubmit() {
		document.getElementById('myForm').submit();
	}
</script>

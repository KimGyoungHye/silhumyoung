<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/common/common.jsp" %>
  
<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, 그리고 Bootstrap 기여자들">
    <meta name="generator" content="Hugo 0.88.1">
    <title>Select your 보험</title>

<link rel="canonical" href="https://getbootstrap.kr/docs/5.1/examples/blog/">

<%--   <!-- Bootstrap -->
<link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/bootstrap/css/kfonts2.css" rel="stylesheet">
   --%>   
<!--     Bootstrap core CSS-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
   
<!-- Favicons -->
<link rel="apple-touch-icon" href="/docs/5.1/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/5.1/assets/img/favicons/manifest.json">
<link rel="mask-icon" href="/docs/5.1/assets/img/favicons/safari-pinned-tab.svg" color="#7952b3">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon.ico">
<meta name="theme-color" content="#7952b3">

    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
      
      <!--modal-->
      .fadeM {
		opacity: 0;
		-webkit-transition: opacity .15s linear;
		-o-transition: opacity .15s linear;
		transition: opacity .15s linear
	}
	
	.mainBack{
 		background-image: url("<%=request.getContextPath() %>/resources/cinfo/${bohumDataDetailInfoArr[0].cimage}");
 	    background-size: contain;
	    background-repeat: no-repeat;
	    background-position: center;
      }
      
	a {
	        text-decoration: none;
	        color:black;
	   }  
	   

    </style>
    
    <script type="text/javascript">
		function main(){
			location.href="main.mem";
		}
		function login(){
			location.href="loginForm.mem";
		}
		function logOut(){
			location.href="logout.jsp";
		}
		function mine(){
			location.href="myPage.mem";
		}
		function homeAdmin(){
			location.href="main.ha";
		}
		
	</script>
	
    <!-- Custom styles for this template -->
    <link href="https://fonts.googleapis.com/css?family=Playfair&#43;Display:700,900&amp;display=swap" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="blog.css" rel="stylesheet">
     <!-- Custom styles for this template -->
    <link href="signin.css" rel="stylesheet">
  </head>
  <body>
  
<div class="container">
  <header class="blog-header py-3">
    <div class="row flex-nowrap justify-content-between align-items-center">
      <div class="col-4 pt-1">
      <!-- 로그인 하면 회원 이름 뜨도록 하기, 클릭하면 마이 페이지로 이동 -->
        <a class="link-secondary" href="">${loginInfo.id}님</a>
      </div>
      <div class="col-4 text-center">
        <h1 class="header-logo" onclick="main()"><img src="<%=request.getContextPath() %>/resources/후보2.png" style="width: 300;height: 170">
		</h1>
      </div>
      <div class="col-4 d-flex justify-content-end align-items-center">
      <!-- 검색 아이콘 클릭하면 보험 검색하는 페이지로 -->
        <!-- 로그인 버튼 누르면 로그인폼으로 -->
      	<c:if test="${loginInfo.id==null }">
        <a class="link-secondary" aria-label="Search" href="insuInfo.lm">
          <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="mx-3" role="img" viewBox="0 0 24 24"><title>Search</title><circle cx="10.5" cy="10.5" r="7.5"/><path d="M21 21l-5.2-5.2"/></svg>
        </a>
        <a class="btn btn-sm btn-outline-secondary" controls autoplay muted onclick="login()">Login</a>
	  	 </c:if>
	  	 <c:if test="${loginInfo.id!=null }">
			<c:if test="${loginInfo.userState=='관리자' }">
		  	    <a class="btn btn-sm btn-outline-secondary" controls autoplay muted onclick="homeAdmin()">관리자 페이지</a>
		  	 </c:if>
        <a class="btn btn-sm btn-outline-secondary" controls autoplay muted onclick="logOut()">LogOut</a>
	  	 </c:if>
      </div>
    </div>
  </header>
<hr>
  <div class="nav-scroller py-1 mb-2">
    <nav class="nav d-flex justify-content-between">
      <a class="p-2 link-secondary" href="bohumJujang.ha">보험 데이터 저장 및 불러오기(api)</a>
      <a class="p-2 link-secondary" href="memberList.ha">유저 리스트 관리</a>
      <a class="p-2 link-secondary" href="list.bd">공지사항</a>
      <a class="p-2 link-secondary" href="companyList.cp">보험사 관리</a>/
      <a class="p-2 link-secondary" href="insuInfo.lm">홈페이지 메인으로 가기</a>
    </nav>
  </div>
</div>
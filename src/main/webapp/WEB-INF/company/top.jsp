<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../common/common.jsp" %>
    <!-- company/top.jsp -->
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

    

    <!-- Bootstrap core CSS -->
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
      
      a {
	        text-decoration: none;
	        color:black;
	   }
	   
    </style>
    <script type="text/javascript">
	function main(){
		location.href="main.bh";
	}
	function logOut(){
		location.href="logout.jsp";
	}
	function mine(){
		location.href="companyUpdate.cp"
	}
	</script>
	
    <!-- Custom styles for this template -->
    <link href="https://fonts.googleapis.com/css?family=Playfair&#43;Display:700,900&amp;display=swap" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="blog.css" rel="stylesheet">
  </head>
  <body>
  
<div class="container">
  <header class="blog-header py-3">
    <div class="row flex-nowrap justify-content-between align-items-center">
      <div class="col-4 pt-1">
      <!-- 로그인 하면 회원 이름 뜨도록 하기, 클릭하면 마이 페이지로 이동 -->
        <a class="link-secondary" href="myPage.mem">${loginCompany } : ${loginInfo.id} 님</a>
      </div>
      <div class="col-4 text-center">
         <h1 class="header-logo" onclick="main()"><img src="<%=request.getContextPath() %>/resources/후보2.png" style="width: 300;height: 170">
		</h1>
      </div>
      <div class="col-4 d-flex justify-content-end align-items-center">
        <!-- 로그인 버튼 누르면 로그인폼으로 -->
      	<c:if test="${loginInfo.id==null }">
        <a class="btn btn-sm btn-outline-secondary" controls autoplay muted onclick="login()">Login</a>
	  	 </c:if>
	  	 <c:if test="${loginInfo.id!=null }">
        <a class="btn btn-sm btn-outline-secondary" controls autoplay muted onclick="mine()">회사 페이지</a>
        <a class="btn btn-sm btn-outline-secondary" controls autoplay muted onclick="logOut()">LogOut</a>
	  	 </c:if>
      </div>
    </div>
  </header>
<hr>
  <div class="nav-scroller py-1 mb-2">
    <nav class="nav d-flex justify-content-between">
      <a class="p-2 link-secondary" href="insert.bh">보험 추가</a>
      <a class="p-2 link-secondary" href="list.bh">보험 목록</a>
      <a class="p-2 link-secondary" href="list.hm?loginCompany=${loginCompany }">관심회원 목록</a>
      <a class="p-2 link-secondary" href="list.qa">고객센터</a>
      <a class="p-2 link-secondary" href="main.mem">회원 페이지</a>
    </nav>
  </div>
</div>
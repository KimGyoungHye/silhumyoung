<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp"%>

<!-- company/comapny_infoUpdateForm.jsp -->

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
    
    .err{
		color:red;
		font-size:10px;
	}  
    </style>

    <link href="form-validation.css" rel="stylesheet">
  </head>
  <body class="bg-light">
<br>
<div class="container">
  <main>
      <div class="col-md-7 col-lg-8">
      <br><br>
<h3 class="mb-3">회사 정보</h3>


	<input type="hidden" name="cnum" value="${bean.cnum }"><br>
	
	<div class="col-sm-6">
   	 	<div class="col-sm-6">
			<label for="firstName" class="form-label">회사명 </label><br>
			${bean.cname }<br>
      	</div>
		<br><br>
		   	
		   	<div class="col-sm-6">
				<label for="firstName" class="form-label">회사 URL</label>
				<a href="${bean.clink }">${bean.clink }</a><br>
      		</div>
			<br><br>
		<div class="col-md-5">
			<label for="country" class="form-label">회사 로고</label>
			<img src="<%=request.getContextPath() %>/resources/company/${bean.cimage}" width="100" height="100"> <!-- 기존이미지 --><br>
		</div><br><br>
			
		<div class="row g-3">
			<label for="zip" class="form-label">사업자 등록 번호</label>
			${bean.cregi_num1}&nbsp&nbsp-&nbsp&nbsp
			${bean.cregi_num2}&nbsp&nbsp-&nbsp&nbsp
			${bean.cregi_num3}<br>
			<input type="hidden" name="cregi_num" value="${bean.cregi_num }">

        </div>
        </div>
        <br><br>
		
		<div class="col-md-3">
			<label for="zip" class="form-label">관리자 아이디</label>
			<input type="text" class="form-control"  name="cadmin" value="${bean.cadmin }" disabled>
			<input type="hidden" class="form-control"  name="cadmin" value="${bean.cadmin }"><br>
			<div class="invalid-feedback">
                Zip code required.
              </div>
            </div>
          </div>
          <br>

      </div>
    </div>
   </div>
  </main>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
      <script src="form-validation.js"></script>
  </body>
</html>
 <br><br><br><br>
    
<%@ include file="bottom.jsp"%>
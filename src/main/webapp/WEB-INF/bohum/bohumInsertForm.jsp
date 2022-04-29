<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="top.jsp"%>

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
    </style>

    
    <!-- Custom styles for this template -->
    <link href="form-validation.css" rel="stylesheet">
  </head>
  <body class="bg-light">
<br>
<div class="container">
  <main>
      <div class="col-md-7 col-lg-8">
      <br><br>
        <h4 class="mb-3">*보험 상품 추가</h4><br>
        <form class="needs-validation" action="insert.bh" method="post" enctype="multipart/form-data">
          <div class="row g-3">
            <div class="col-sm-6">
              <label for="firstName" class="form-label">보험 회사</label>
              <input type="text" class="form-control" id="firstName" name="insucompany" placeholder="${loginCompany }" readonly="readonly" value="${loginCompany }">
              <div class="invalid-feedback">
                Valid insucompany is required.
              </div>
            </div>

            <div class="col-md-5">
              <label for="country" class="form-label">보험 상품명</label>
              <input type="text" class="form-control" id="insuname" name="insuname">
              <div class="invalid-feedback">
                Please select a valid country.
              </div>
            </div>

            <div class="col-md-5">
              <label for="state" class="form-label">연결할 URL</label>
              <input type="text" class="form-control" id="link" name="link">
              <div class="invalid-feedback">
                Please provide a valid state.
              </div>
            </div>
			<br><br>

            <div class="col-12">
              <label for="email" class="form-label">보험 카테고리</label>
             <select class="form-select" id="insucate" name="category">
                <option value="">선택하세요</option>
<c:forEach var="ic" items="${icate }">
                <option value="${ic.category }">${ic.category }</option>
</c:forEach>
              </select>
              <div class="invalid-feedback">
                Please select a valid insucate.
              </div>
            </div><br>

            <div class="col-12">
              <label for="address" class="form-label">보험 타입</label><br>
              <input type="radio" name=insutype value="갱신">&nbsp;갱신&nbsp;&nbsp;
              <input type="radio" name=insutype value="비갱신">&nbsp;비갱신
              <input type="radio" name=insutype value="기타">&nbsp;기타
              <div class="invalid-feedback">
                Please enter your shipping insutype.
              </div>
            </div><br>

            <div class="col-12">
              <label for="address2" class="form-label">보험료</label>
              <input type="file" class="form-control" id="image" name="image" value="파일 선택">
            </div><br><br>

            <div class="col-md-5">
              <label for="country" class="form-label">가입 나이</label>
              <input type="text" class="form-control" id="insuage" name="insuage" placeholder="1세~99세">
              <div class="invalid-feedback">
                Please select a valid country.
              </div>
            </div>

            <div class="col-md-5">
              <label for="state" class="form-label">보험 기간</label>
              <input type="text" class="form-control" id="insuper" name="insuper">
              <div class="invalid-feedback">
                Please provide a valid state.
              </div>
            </div>
			<br><br>
            <div class="col-md-3">
              <label for="zip" class="form-label">납입 기간</label>
               <input type="text" class="form-control" id="payper" name="payper">
              <div class="invalid-feedback">
                Zip code required.
              </div>
            </div>
          </div>
          <br>
           <div class="col-md-3">
              <label for="zip" class="form-label">납입 주기</label>
               <input type="text" class="form-control" id="paycyc" name="paycyc">
              <div class="invalid-feedback">
                Zip code required.
              </div>
            </div>
          </div>
          <br>
           <div class="col-md-3">
              <label for="zip" class="form-label">주계약 내용</label>
              <textarea name="maincont" rows="10" cols="50" style="resize: none"></textarea>
              <div class="invalid-feedback">
                Zip code required.
              </div>
            </div>
          <br>
          <div class="col-md-3"">
              <label for="address" class="form-label">특약 가입</label><br>
              <input type="radio" name=spccont value="가입">&nbsp;가입&nbsp;&nbsp;
              <input type="radio" name=spccont value="거부">&nbsp;거부
              <div class="invalid-feedback">
                Please enter your shipping insutype.
              </div>
            </div>

          <hr class="my-4">
          <button class="w-100 btn btn-success btn-lg" type="submit" value="보험 상품 추가">보험 상품 추가</button>
        </form>
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
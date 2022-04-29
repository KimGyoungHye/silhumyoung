<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp"%>
<style>
/* effect */
.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 3.5s;
  animation-name: fade;
  animation-duration: 4.5s;
}

@-webkit-keyframes fade {
  from {opacity: 1} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: 1} 
  to {opacity: 1}
}

/* Next & previous buttons */
.prev, .next {
  cursor: pointer;
  position: absolute;
  top: 50%;   
  width: auto;
  padding: 16px;
  margin-top: -22px;
  color: white;
  font-weight: bold;
  font-size: 18px;
  transition: 1.s ease;
  border-radius: 0 3px 3px 0;
}

/* Position the "next button" to the right */
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
  background-color: rgba(0,0,0,0.8);
}

</style>
<script type="text/javascript">
$(document).ready(function () {
   $(".mySlideDiv").not(".active").hide(); //화면 로딩 후 첫번째 div를 제외한 나머지 숨김   
   setInterval(nextSlide, 4000); //4초(4000)마다 다음 슬라이드로 넘어감
});

//이전 슬라이드
function prevSlide() {
   $(".mySlideDiv").hide(); //모든 div 숨김
   var allSlide = $(".mySlideDiv"); //모든 div 객체를 변수에 저장
   var currentIndex = 0; //현재 나타난 슬라이드의 인덱스 변수
   
   //반복문으로 현재 active클래스를 가진 div를 찾아 index 저장
   $(".mySlideDiv").each(function(index,item){ 
      if($(this).hasClass("active")) {
         currentIndex = index;
      }
        
   });
   
   //새롭게 나타낼 div의 index
   var newIndex = 0;
    
   if(currentIndex <= 0) {
      //현재 슬라이드의 index가 0인 경우 마지막 슬라이드로 보냄(무한반복)
      newIndex = allSlide.length-1;
   } else {
      //현재 슬라이드의 index에서 한 칸 만큼 뒤로 간 index 지정
      newIndex = currentIndex-1;
   }

   //모든 div에서 active 클래스 제거
   $(".mySlideDiv").removeClass("active");
    
   //새롭게 지정한 index번째 슬라이드에 active 클래스 부여 후 show()
   $(".mySlideDiv").eq(newIndex).addClass("active");
   $(".mySlideDiv").eq(newIndex).show();

}

//다음 슬라이드
function nextSlide() {
   $(".mySlideDiv").hide();
   var allSlide = $(".mySlideDiv");
   var currentIndex = 0;
   
   $(".mySlideDiv").each(function(index,item){
      if($(this).hasClass("active")) {
         currentIndex = index;
      }
        
   });
   
   var newIndex = 0;
   
   if(currentIndex >= allSlide.length-1) {
      //현재 슬라이드 index가 마지막 순서면 0번째로 보냄(무한반복)
      newIndex = 0;
   } else {
      //현재 슬라이드의 index에서 한 칸 만큼 앞으로 간 index 지정
      newIndex = currentIndex+1;
   }

   $(".mySlideDiv").removeClass("active");
   $(".mySlideDiv").eq(newIndex).addClass("active");
   $(".mySlideDiv").eq(newIndex).show();
   
}

</script>



<main class="container">
<div class="slideshow-container">
     <div class="mySlideDiv fade active">
        <img src="<%=request.getContextPath() %>/resources/main1.jpg" class="img-fluid" >
     </div>
            
     <div class="mySlideDiv fade">
         <img src="<%=request.getContextPath() %>/resources/main2.png" class="img-fluid" >
     </div>
            
     <div class="mySlideDiv fade">
         <img src="<%=request.getContextPath() %>/resources/main3.png" class="img-fluid" >
     </div>      
</div>

      
  <div class="row mb-2">
    <div class="col-md-6">
      <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
        <div class="col p-4 d-flex flex-column position-static">
          <strong class="d-inline-block mb-2 text-primary">공지 사항</strong>
          <h3 class="mb-0">[공지]회원가입 안내</h3>
          <div class="mb-1 text-muted">2022-04-06</div>
          <p class="card-text mb-auto">회원 가입이 일시 중단 되었습니다. 가입을 원하시는 분은...</p>
          <a href="list.bd" class="stretched-link">더보기</a>
        </div>
      </div>
    </div>
    <div class="col-md-6">
      <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
        <div class="col p-4 d-flex flex-column position-static">
          <strong class="d-inline-block mb-2 text-success">Q & A</strong>
          <h3 class="mb-0">실비보험 가입 팁</h3>
          <div class="mb-1 text-muted">2022-04-01</div>
          <p class="mb-auto">입원/통원 의료비 보장에서 비급여 진료항목은 제외되므로 ...</p>
          <a href="list.qa" class="stretched-link">더보기</a>
        </div>
      </div>
    </div>
  </div>

  <div class="row g-5">
    <div class="col-md-8">
      <h3 class="pb-4 mb-4 border-bottom">
        보험 상품 전체보기
      </h3>
      
      <article class="blog-post">
		<div class="table-responsive">
		  <table class="table align-middle">
		    <thead>
		      <tr align="center">
		        <th>번호</th>
		        <th>보험명</th>
		        <th>카테고리</th>  
		        <th>타입</th>
		        <th>보험료</th> 
		        <th>가입 나이</th>  
		        <th>보험 기간</th>
		        <th>납입 기간</th>
		        <th>납입 주기</th>
		      </tr>
		    </thead>  
		    <tbody>
				<c:forEach var="bh" items="${lists }">
				    <tr align="center">
				      <td scope="row">${bh.insu }</td>
				      <td><a href="http://${bh.link }">${bh.insuname }</a></td>
				      <td>${bh.category }</td>
				      <td>${bh.insutype }</td>
				      <%
				      String imgPath = request.getContextPath()+"/resources/insuprice/";
				      %>
				      <td><img src="<%=imgPath %>${bh.insuprice }" width="200" height="100"></td>
				      <td>${bh.insuage }</td>
				      <td>${bh.insuper }</td>
				      <td>${bh.payper }</td>
				      <td>${bh.paycyc }</td>
				      <td>${bh.spccont }</td>
				    </tr>
				</c:forEach>
		    </tbody>
		  </table>
		</div>
	</article>
	
 <div class="col-md-4">
      <div class="position-sticky" style="top: 2rem;">
      </div>
    </div>
  </div>

 <div class="col-md-4">
      <div class="position-sticky" style="top: 2rem;">
        <div class="p-4 mb-3 bg-light rounded">
          <h4 class="fst">About</h4>
          <p class="mb-0">[select your 보험]에서는 각 보험 회사 상품에 대한 비교 정보만을 제공하며, 보험 계약을 체결하기 전에 상품 설명서 및 약관을 반드시 읽어보시기 바랍니다.</p>
        </div>

        <div class="p-4">
          <h4 class="fst">바로 가기</h4>
          <ol class="list-unstyled mb-0">
            <li><a href="bohumChoochun.bh">맞춤 추천 보험</a></li>
            <li><a href="list.ht">내 관심보험 보기</a></li>
            <li><a href="list.qa">보험 가입 팁</a></li>
            <li><a href="#">위로 가기</a></li>
          </ol>
        </div>

        <div class="p-4">
          <h4 class="fst">더 알아보기</h4>
          <ol class="list-unstyled">
            <li><a href="https://www.youtube.com">YouTube</a></li>
            <li><a href="https://www.twitter.com">Twitter</a></li>
            <li><a href="https://www.facebook.com">Facebook</a></li>
          </ol>
        </div>
      </div>
    </div>
  </div>


</main>

<div class="b-example-divider"></div>

<%@include file="bottom.jsp"%>
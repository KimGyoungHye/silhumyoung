<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="top.jsp"%>
<%@include file="/WEB-INF/common/common_kakaoLog.jsp"%>

<!-- Custom styles for this template -->
<link href="signin.css" rel="stylesheet">
<br>
<br>
<br>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>

<script type="text/javascript">

	function findId() {
		alert('findId');
		var inputName_1 = document.getElementById("inputName_1").value;
		var regi_number1 = document.getElementById("regi_number1").value;
		var regi_number2 = document.getElementById("regi_number2").value;
		//alert(inputName_1);
		//alert(regi_number1);
		//alert(regi_number2);
		document.myform1.submit();
		//location.href ='foundid.mem?inputName_1='+inputName_1+'&regi_number1='+regi_number1+'&regi_number2='+regi_number2';
		//location.href="foundid.mem?inputName_1="+inputName_1+"&regi_number1="+regi_number1+"&regi_number2="+regi_number2;
		//location.href="update.mv?num="+num+"&pageNumber="+pageNumber;

	}
	
	function findPw() {
		var id = document.getElementById("id").value;
		var inputName_2 = document.getElementById("inputName_2").value;
		var regi_number3 = document.getElementById("regi_number3").value;
		var regi_number4 = document.getElementById("regi_number4").value;
		//alert(inputName_2);
		//alert(regi_number3);
		//alert(regi_number4);
		document.myform2.submit();
		//location.href="findpw2.mem?inputName_2="+inputName_2+"&regi_number3="+regi_number3+"&regi_number4="+regi_number4;
	}


	//체크 버튼에 따라 아이디/비밀번호 기능이 달라진다
	function search_check(num) {
		if (num == '1') {
			document.getElementById("searchP").style.display = "none";
			document.getElementById("searchI").style.display = "";	
		} else {
			document.getElementById("searchI").style.display = "none";
			document.getElementById("searchP").style.display = "";
		}
	}
	
</script>


<div id="searchI">
	<div class="container">
		<div class="row d-flex justify-content-center mt-5 mb-5">
			<div class="col-md-6">
				<div class="card p-4">
					<div class="text-left">
						<h3>아이디/비밀번호 찾기</h3>
						<span>인증된 정보로만 찾기가 가능합니다.</span>
					</div>
					<div class="mt-3 d-flex flex-row gap-2">
						<label class="radio"> <input type="radio" id="search_1" name="search_total" onclick="search_check(1)" checked="checked"> <span><i
								class="fa fa-openid" for="search_1"></i> ID찾기 </span>
						</label> <label class="radio"> <input type="radio" id="search_2" name="search_total" onclick="search_check(2)"> <span><i
								class="fa fa-folder-open" for="search_2"></i> PW찾기 </span>
						</label>
					</div>
					<form id="myform1" action="foundid.mem">
					<div class="mt-2">
						<div class="form">
							<label for="inputName_1">이름</label> <input type="text" id="inputName_1" name="name" class="form-control">

						</div>
					</div>

					<div class="mt-2">
						<div class="form">
							<label >주민등록번호</label> 
						<div class="input-group inputbox"> <input type="text" class="form-control" placeholder="주민번호 앞자리" class="form-control" id="regi_number1" name="regi_number1"> <input type="text" class="form-control" placeholder="주민번호 뒷자리 " id="regi_number2" name="regi_number2" class="form-control"> </div>
						</div>
					</div>

					<div class="mt-3">
						<button id="searchBtn"
							class="button btn btn-primary w-100 d-flex justify-content-center align-items-center" onClick="findId()">
							<span>확인</span><i class="fa fa-long-arrow-right ms-2"></i>
						</button>
					</div>
				</form>
				</div>
			</div>
		</div>
	</div>
</div>

<div id="searchP" style="display: none;">
	<div class="container">
		<div class="row d-flex justify-content-center mt-5 mb-5">
			<div class="col-md-6">
				<div class="card p-4">
					<div class="text-left">
						<h3>아이디/비밀번호 찾기</h3>
							<span>인증된 정보로만 찾기가 가능합니다.</span>
					</div>
					<div class="mt-3 d-flex flex-row gap-2">
						<label class="radio"> <input type="radio" id="search_1" name="search_total" onclick="search_check(1)" checked="checked"> <span><i
								class="fa fa-openid" for="search_1"></i> ID찾기 </span>
						</label> <label class="radio"> <input type="radio" id="search_2" name="search_total" onclick="search_check(2)"> <span><i
								class="fa fa-folder-open" for="search_2"></i> PW찾기 </span>
						</label>
					</div>
					
					<form id="myform2" action="findpw2.mem">
					<div class="mt-2">
						<div class="form">
						<label for="inputName_2">이름</label> <input type="text" id="inputName_2" name="name" class="form-control">
						</div>
					</div>
					<div class="mt-2">
						<div class="form">
							<label>아이디</label> <input type="text" name="id" class="form-control">
						</div>
					</div>	

					<div class="mt-2">
						<div class="form">
							<label>주민등록번호</label> 
						<div class="input-group inputbox"> <input type="text" class="form-control" placeholder="주민번호 앞자리" class="form-control" name="regi_number1"> <input type="password" class="form-control" placeholder="주민번호 뒷자리 " name="regi_number2" class="form-control"> </div>
						</div>
					</div>
		

					<div class="mt-3">
						<button id="searchBtn2"
							class="button btn btn-primary w-100 d-flex justify-content-center align-items-center" onClick="findPw()">
							확인<i class="fa fa-long-arrow-right ms-2"></i>
						</button>
					</div>
				</form>
				</div>
			</div>
		</div>
	</div>
	
</div>


<br>
<br>
<br>
<br>
<%@include file="bottom.jsp"%>
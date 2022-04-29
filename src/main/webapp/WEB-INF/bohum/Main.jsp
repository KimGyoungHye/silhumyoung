<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="top.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.5.1/dist/chart.min.js"></script>

<div class="container">
	<div>
		<div class="card xl-3">

			<div class="card-header" style="width: 100%;">
				<b>관심 회원 수</b> 
			</div>
			<div class="card-body">
				<div class="graphBox1">
					<canvas id="myChart1" height="80"></canvas>
					<script type="text/javascript">
					//alert(1);
					//alert("X_list"+'${X_list}');
					//alert("Y_list"+'${Y_list}');
						
						var today = new Date();
						var yesterday1 = today.getDate()-1;
						var yesterday2 = today.getDate()-2;
						var yesterday3 = today.getDate()-3;
						var yesterday4 = today.getDate()-4;
						var yesterday5 = today.getDate()-5;
						var yesterday6 = today.getDate()-6;
						//alert("today"+today.getDate());
						//alert("yesterday1 : "+yesterday1);
						//alert("yesterday2 : "+yesterday2);
						
						var a=0,b=0,c=0,d=0,e=0,f=0,g=0;
						var xlist = '${X_list}';
						var ylist = '${Y_list}';
						//alert(typeof(xlist));
						//alert("ylist : "+typeof(ylist));
						var xlistArr = xlist.split(',');
						//alert("xlistArr : "+xlistArr);
						//alert("xlistsub : "+ xlistArr[0].substring(9,11));
						//alert("xlistsub : "+ xlistArr[1].substring(9,11));
						
						/* for(var i=0; i< xlistArr.length ; i++){
							xlistsub += xlistArr[i].substring(8,11);
						} */
						
						var ylistArr = ylist.split(',');
						//alert("ylistArr : "+ylistArr);
						//alert("ylistArr0 : "+ylistArr[0]);
						//alert("ylistArr2 : "+ylistArr[2]);
						//alert("xlistArrArrlength0 : "+xlistArr[0].indexOf(today.getDate()));
						//alert("xlistArrtArrlength1 : "+xlistArr[1].indexOf(today.getDate()));
						//alert("xlistArrArrlength2 : "+xlistArr[2].indexOf(today.getDate()));
						//alert("xlistArrArrlength3 : "+xlistArr[3].indexOf(today.getDate()));
						//alert("xlistArrArrlength : "+ylistArr.length);

						for (var i = 0; i < xlistArr.length; i++) {
							//alert("yesterday1 : "+yesterday1);
							if (xlistArr[i].substring(9, 11) == today.getDate()) {
								if (ylistArr[i] == ylistArr[0]) {
									a = parseInt(ylistArr[0].substring(1));
								} else {
									a = parseInt(ylistArr[i]);
								}
							} else if (xlistArr[i].substring(9, 11) == yesterday1) {
								if (ylistArr[i] == ylistArr[0]) {
									b = parseInt(ylistArr[0].substring(1));
								} else {
									b = parseInt(ylistArr[i]);
								}
							} else if (xlistArr[i].substring(9, 11) == yesterday2) {
								if (ylistArr[i] == ylistArr[0]) {
									c = parseInt(ylistArr[0].substring(1));
								} else {
									c = parseInt(ylistArr[i]);
								}
							} else if (xlistArr[i].substring(9, 11) == yesterday3) {
								if (ylistArr[i] == ylistArr[0]) {
									d = parseInt(ylistArr[0].substring(1));
								} else {
									d = parseInt(ylistArr[i]);
								}
							} else if (xlistArr[i].substring(9, 11) == yesterday4) {
								if (ylistArr[i] == ylistArr[0]) {
									e = parseInt(ylistArr[0].substring(1));
								} else {
									e = parseInt(ylistArr[i]);
								}
							} else if (xlistArr[i].substring(9, 11) == yesterday5) {
								if (ylistArr[i] == ylistArr[0]) {
									f = parseInt(ylistArr[0].substring(1));
								} else {
									f = parseInt(ylistArr[i]);
								}
							} else if (xlistArr[i].substring(9, 11) == yesterday6) {
								if (ylistArr[i] == ylistArr[0]) {
									g = parseInt(ylistArr[0].substring(1));
								} else {
									g = parseInt(ylistArr[i]);
								}
							}
						}
						var context = document.getElementById('myChart1').getContext('2d');
						var myChart1 = new Chart(context, {
							type : 'line', // 차트의 형태
							data : { // 차트에 들어갈 데이터
								//x 축
								labels : 
								[
									yesterday6, yesterday5, yesterday4, yesterday3, yesterday2, yesterday1, today.getDate()
								],
								datasets : [ { //데이터
									label : '관심 회원 수', //차트 제목
									fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
									data : 
										// y 축
										[
										g,f,e,d,c,b,a
										/* 1,2,3,4,5,6,7 */
									],
									backgroundColor : [
									//색상
											'rgba(255, 99, 132, 0.2)',
											'rgba(54, 162, 235, 0.2)',
											'rgba(255, 206, 86, 0.2)',
											'rgba(75, 192, 192, 0.2)',
											'rgba(153, 102, 255, 0.2)',
											'rgba(255, 159, 64, 0.2)',
											'rgba(255, 159, 64, 0.2)' ],
									borderColor : [
									//경계선 색상
											'rgba(255, 99, 132, 1)',
											'rgba(54, 162, 235, 1)',
											'rgba(255, 206, 86, 1)',
											'rgba(75, 192, 192, 1)',
											'rgba(153, 102, 255, 1)',
											'rgba(153, 102, 255, 1)',
											'rgba(255, 159, 64, 1)' ],
									borderWidth : 1
								//경계선 굵기
								}
								                      /* {
								                            label: 'test2',
								                            fill: false,
								                            data: [
								                                8, 34, 12, 24
								                            ],
								                            backgroundColor: 'rgb(157, 109, 12)',
								                            borderColor: 'rgb(157, 109, 12)'
								                        } */
								]
							},
							options : {
								scales : {
									yAxes : [ {
										ticks : {
											beginAtZero : true
										}
									} ]
								}
							}
						});
					</script>
				</div>
			</div>

			<div class="card-header" style="width: 100%;">
				<b>보험별 순위</b>
			</div>
			<div class="card-body">
				<div class="graphBox2">
					<canvas id="myChart2" height="100"></canvas>
					<script type="text/javascript">
					var backColorArr = [
						'rgba(255, 99, 132, 0.2)',
						'rgba(54, 162, 235, 0.2)',
						'rgba(255, 206, 86, 0.2)',
						'rgba(75, 192, 192, 0.2)',
						'rgba(153, 102, 255, 0.2)',
						'rgba(255, 159, 64, 0.2)',
						'rgba(255, 159, 64, 0.2)' ];
					var borderColorArr = [
						'rgba(255, 99, 132, 1)',
						'rgba(54, 162, 235, 1)',
						'rgba(255, 206, 86, 1)',
						'rgba(75, 192, 192, 1)',
						'rgba(153, 102, 255, 1)',
						'rgba(153, 102, 255, 1)',
						'rgba(255, 159, 64, 1)' ];
					
						var heartInsuName = '${heartInsuName}';
						var heartInsuPersonx = '${heartInsuPersonx}';
						var heartInsuPersony = '${heartInsuPersony}';
						//alert("heartInsuName : "+heartInsuName);
						//alert("heartInsuPersonx : "+heartInsuPersonx);
						//alert("heartInsuPersony : "+heartInsuPersony);
						heartInsuName = heartInsuName.substring(5);
						heartInsuNameArr = heartInsuName.split(',');
						
						//색상 x축에 맞춰서 내보내기
						backColorA = new Array();
						borderColorA = new Array();
						for(var i=0; i<heartInsuNameArr.length; i++){
							backColorA[i] = backColorArr[i];
						}
						for(var i=0; i<heartInsuNameArr.length; i++){
							borderColorA[i] = borderColorArr[i];
						}

						heartInsuPersonx = heartInsuPersonx.substring(5);
						heartInsuPersony = heartInsuPersony.substring(5);
						heartInsuPersonxArr = heartInsuPersonx.split(',');
						heartInsuPersonyArr = heartInsuPersony.split(',');
						//alert('heartInsuPersonxArr : '+heartInsuPersonxArr.length);
						//alert('heartInsuPersonyArr : '+heartInsuPersonyArr.length);
						var heartInsuPersonArr = "";
						for (var i = 0; i < heartInsuPersonxArr.length; i++) {
							heartInsuPersonArr += parseInt(heartInsuPersonyArr[i])
									+ ",";
						}

						heartInsuPersonArr2 = heartInsuPersonArr.split(',');
						//alert('heartInsuPersonArr2 : '+heartInsuPersonArr2);
						var context = document.getElementById('myChart2')
								.getContext('2d');
						var myChart2 = new Chart(context, {
							type : 'bar', // 차트의 형태
							data : { // 차트에 들어갈 데이터
								labels :
								//x 축
								heartInsuNameArr,
								datasets : [ { //데이터
									label : '보험별 순위', //차트 제목
									data : 
									heartInsuPersonArr2,
									//색상
									backgroundColor : 
										backColorA
										,
									//경계선 색상
									borderColor : 
										borderColorA
										,
									borderWidth : 1
								//경계선 굵기
								} ]
							},
							options : {
								indexAxis : "y",
								scales : {
									yAxes : [ {
										ticks : {
											beginAtZero : true
										}
									} ]
								}
							}
						});
					</script>
				</div>

			</div>
		</div>
	</div>
<br><br>
<table class="table table-hover">
<caption>${loginCompany }</caption>
  <thead>
    <tr align="center">
      <th scope="col">번호</th>
      <th scope="col">보험명</th>
      <th scope="col">카테고리</th>
      <th scope="col">보험 타입</th>
      <th scope="col">보험료</th>
      <th scope="col">가입 나이</th>
      <th scope="col">보험 기간</th>
      <th scope="col">납입 기간</th>
      <th scope="col">납입 주기</th>
      <th scope="col">특약 가입</th>
      <th scope="col">수정</th>
      <th scope="col">삭제</th>
    </tr>
  </thead>
  <tbody align="center">
<c:forEach var="bh" items="${getList }">
    <tr align="center">
      <th scope="row">${bh.insu }</th>
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
      <td><a href="bohumUpdate.bh?insu=${bh.insu}">수정</a></td>
      <td><a href="bohumDelete.bh?insu=${bh.insu}">삭제</a></td>
    </tr>
</c:forEach>
  </tbody>
</table>
</div>
</form>
</center>
    
    
<%@ include file="bottom.jsp"%>
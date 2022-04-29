<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/bohum/top.jsp"%>
<br>
<br>
<br>
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.5.1/dist/chart.min.js"></script>

<div class="container">
	<div>
		<div class="card xl-3">

			<div class="card-header" style="width: 100%;">
				<b>관심 회원 수</b>
			</div>
			<div class="card-body">
				<div class="graphBox1">
					<canvas id="myChart1" height="100"></canvas>
					<script type="text/javascript">

						var today = new Date();
						var yesterday1 = today.getDate() - 1;
						var yesterday2 = today.getDate() - 2;
						var yesterday3 = today.getDate() - 3;
						var yesterday4 = today.getDate() - 4;
						var yesterday5 = today.getDate() - 5;
						var yesterday6 = today.getDate() - 6;

						var a = 0, b = 0, c = 0, d = 0, e = 0, f = 0, g = 0;
						var xlist = '${X_list}';
						var ylist = '${Y_list}';
						var xlistArr = xlist.split(',');
						var ylistArr = ylist.split(',');
						for (var i = 0; i < xlistArr.length; i++) {
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
						var context = document.getElementById('myChart1')
								.getContext('2d');
						var myChart1 = new Chart(context, {
							type : 'line', // 차트의 형태
							data : { // 차트에 들어갈 데이터
								//x 축
								labels : [ yesterday6, yesterday5, yesterday4,
										yesterday3, yesterday2, yesterday1,
										today.getDate() ],
								datasets : [ { //데이터
									label : '관심 회원 수', //차트 제목
									fill : false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
									data :
									// y 축
									[ g, f, e, d, c, b, a
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
					<canvas id="myChart2" height="160"></canvas>
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
						heartInsuName = heartInsuName.substring(5);
						heartInsuNameArr = heartInsuName.split(',');
						
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
						var heartInsuPersonArr = "";
						for (var i = 0; i < heartInsuPersonxArr.length; i++) {
							heartInsuPersonArr += parseInt(heartInsuPersonyArr[i])
									+ ",";
						}
						heartInsuPersonArr2 = heartInsuPersonArr.split(',');
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
	<br>
	<br>
	<br>
	<div class="card mb-6">
		<div class="card-header">
			<b>관심회원 목록</b>
		</div>
		<div class="card-body">
			<table class="table table-striped table-sm">
				<thead>
					<tr align="center">
						<th>보험 상품명</th>
						<th>회원 아이디</th>
						<th>회원 이름</th>
						<th>핸드폰 번호</th>
						<th>이메일</th>
					</tr>
				</thead>

				<tbody>
					<c:forEach var="heartMember" items="${heartMemberList }">
						<tr style="height: 45px;" align="center">
							<td>${heartMember.insuname }</td>
							<td>${heartMember.mid }</td>
							<td>${heartMember.name }</td>
							<td>${heartMember.phone1 }${heartMember.phone2 }${heartMember.phone3 }</td>
							<td>${heartMember.email1 }@${heartMember.email2 }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
<br>
<br>
<br>
<%@include file="/WEB-INF/bohum/bottom.jsp"%>
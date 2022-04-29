<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	function removePieGraph(myDiv) {
//		alert('removePieGraph');
		var reDiv = "#"+myDiv;
		$(reDiv).html("<div style='position: relative; width:500px; height:500px; '><canvas id='pie-chart-"+myDiv+"'></canvas></div>");
//		alert('removeEnd');
	}
	
	
	
	function drawPieGraph(myDiv,myLabels,myLabel,myData,myText) {
//		alert('drawPieGraph');
		removePieGraph(myDiv);
		new Chart(document.getElementById("pie-chart-"+myDiv), {
		    type: 'pie',
		    data: {
		      labels: myLabels,
		      datasets: [
		        {
		          label: myLabel,
		          backgroundColor: myColors,
		          data: myData
		        }
		      ]
		    },
		    options: {
		      legend: { display: false },
		      title: {
		        display: true,
		        text: myText
		      },
		      scales: {
					yAxes: [{
						ticks: {
							beginAtZero: true
						}
					}]
				},
		    }
		});
	}
	function getPieData(myDiv,myUrl,myLabel,myText) {
//		alert(1);
		$.ajax({
			url : myUrl,
		    dataType : "json", //서버에서 html타입을 반환받는다.
		    contentType: "application/json; charset=utf-8",
		    success : function(data) {
		    	$.each(data, function(index, item) { // 데이터 =item
//					alert('in');
					myLabels = item.myLabels;
					myData = item.myData;
//					alert('last');
					myColorsArr(myLabels);
					drawPieGraph(myDiv,myLabels, myLabel, myData,myText);
				});
//				alert('out');
				
		    },//success
			error : function(data) {
				alert('error! : ' + data.value);
			}//success
		});
	}
	
</script>


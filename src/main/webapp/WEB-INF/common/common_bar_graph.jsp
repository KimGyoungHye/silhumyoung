<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
 -->
 <script src="https://cdn.jsdelivr.net/npm/chart.js@3.5.1/dist/chart.min.js"></script>
 
<script type="text/javascript">
	
	var backgroundColorArr = [
        //색상
        'rgba(54, 162, 235, 1)',
		'rgba(255, 99, 132, 1)',
        'rgba(255, 206, 86, 1)',
        'rgba(75, 192, 192, 1)',
        'rgba(153, 102, 255, 1)',
        'rgba(255, 159, 64, 1)' ];
	
	var myColors = new Array(); 

	function myColorsArr(myLabels) {
		myColors = new Array(); 
		for(var i=0;i<myLabels.length;i++){
			myColors[i] = backgroundColorArr[i%(backgroundColorArr.length)];
		}
	}
	
	function removeBarGraph(myDiv) {
//		alert('removeBarGraph');
		var reDiv = "#"+myDiv;
		$(reDiv).html("<div style='position: relative; width:800px; height:500px;'><canvas id='bar-chart-"+myDiv+"' class='form-control' ></canvas></div>");
//		alert('removeEnd');
	}
	
	function drawBarGraph(myDiv,myLabels,myLabel,myData,myText) {
//	/alert('drawBarGraph');
		removeBarGraph(myDiv);
		new Chart(document.getElementById("bar-chart-"+myDiv), {
		    type: 'bar',
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

	function getBarData(myDiv,myUrl,myLabel,myText) {
//		alert(1);
		$.ajax({
			url : myUrl,
		    dataType : "json", // json타입을 반환받는다.
		    contentType: "application/json; charset=utf-8",
		    success : function(data) {		    	
		    	$.each(data, function(index, item) { // 데이터 =item
					myLabels = item.myLabels;
					myData = item.myData;
//					alert('last');
					myColorsArr(myLabels);
					drawBarGraph(myDiv,myLabels, myLabel, myData,myText);
				});
//				alert('out');
				
		    },//success
			error : function(data) {
				alert('error! : ' + data.value);
			}//success
		});
	}
	
</script>


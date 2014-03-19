
<%@page import="model.*, java.util.*"%>


<!DOCTYPE html>
<html>
<%@include file="common/header.jsp"%>

<style type="text/css">
.btn {
	width: 50;
}
</style>

<!-- Google graph javascript -->
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript">
	google.load("visualization", "1", {
		packages : [ "corechart" ]
	});
	google.setOnLoadCallback(drawChart);
	function drawChart() {
		var data = google.visualization.arrayToDataTable([
				[ 'Year', 'Winning', 'Loss' ], 
				[ '2014', 100, 1000 ],
				[ '2013', 1030, 540 ],
				[ '2012', 660, 1120 ],
				[ '2011', 1170, 460 ], 
				[ '2010', 1000, 400 ]									
				]);

		var options = {
			hAxis : {
				title : "Years",
				direction : -1,
				slantedText : true,
				slantedTextAngle : 90
			},
			vAxis : {
				title : "Amount",
				direction : 1,
				slantedText : true,
				slantedTextAngle : 90
			},
			'backgroundColor': {
    	        'fill': '#F4F4F4',
    	        'opacity': 100
    	     }
		}

		var chart = new google.visualization.LineChart(document
				.getElementById('chart_div'));
		chart.draw(data, options);
	}
</script>

<body>
	<div class="container-fluid">
		<div class="row-fluid">
			<h2 align="center">4D Dashboard</h2>  
		</div>
			<div class="span12" align="center">
			 <div class="btn-group">
				 <button class="btn btn-default" onclick="window.location='/Dashboard-betHistoryPage.jsp';">Bet History</button>
				 <button class="btn btn-default btn-danger">Analysis</button>
				 <button class="btn btn-default" onclick="window.location='/Dashboard-top10.jsp';">Top 10 Number</button>
			 </div>
			</div>


		<div class="row-fluid">
			<br>
			<br>
			<div id="chart_div" style="width: 100%; height: 300px;"></div>
		</div>

	</div>


</body>

</html>
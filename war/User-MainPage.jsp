	<%@page import="model.*, java.util.*"%>
<%
	
	String errorMsg = request.getParameter("errMsg");
	if(errorMsg == null){
		errorMsg = "";
	}

	user normalUser = (user)session.getAttribute("authenticated");
		
	if (normalUser == null) {
			response.sendRedirect("mainPage.jsp");
			return;
	}	
	String userName = normalUser.getFullname();	
	userName = Character.toUpperCase(userName.charAt(0)) + userName.substring(1); 
%>

<!DOCTYPE html>
<html>
<%@include file="common/header.jsp"%>

 <script type="text/javascript" src="https://www.google.com/jsapi"></script>
   <script type="text/javascript">
      google.load("visualization", "1", {packages:["corechart"]});
      google.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Element', 'SGD$', { role: 'style' }, { role: 'annotation' } ],
          
          ['Total Winnings($)', 200, 'gold', 'Total Winnings($)' ],
      	  ['Total Expenditures($)', 1000, 'color: #e5e4e2', 'Total Expenditures($)' ]
          
        ]);

        var options = {
        	hAxis : {
    			title : "Amount",
    		},
    		'backgroundColor': {
    	        'fill': '#F4F4F4',
    	        'opacity': 100
    	     },
        };

        var chart = new google.visualization.BarChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
      $(document).ready(function () {
    	    $(window).resize(function(){
    	        drawChart();
    	    });
    	});
    </script>

  

<body>
<div class="container-fluid">
  <div class="row-fluid">
  	<div id="header-container">
	    <header class="wrapper clearfix">
	    	<table>
	    		<tr>
	    			<td><img src="image/Rosanne.png" alt="" align="left"  width="80" height="80" /></td>
	    			<td><h3>Welcome,<br> <%=userName %>!</h3></td>
	    		</tr>
	    	</table>	        
	    </header>
	</div>
	
<div class="span10">
    <div id="chart_div" style="width: 100%; height: 10%;"></div>
</div> 
<h4 align="right"><u><a href="Dashboard-Odds.jsp">More Information</a></u><span style="padding: 0 10px">&nbsp;</span></h4>
<button type="button" style=" width: 100%; height: 8%;" class="btn btn-default btn-success btn-lg" onclick="window.location='/LuckyScratch-CameraView.jsp';">
  <span>4D Number generator</span>
</button>
  <button type="button" style=" width: 100%; height: 8%;" class="btn btn-default btn-warning btn-lg" onclick="window.location='/Bet-enter4DDetails.jsp';">
   <span>4D Betting</span>
</button>
  <button type="button" style=" width: 100%; height: 8%;" class="btn btn-default btn-danger btn-lg" onclick="window.location='/Result-mainPage.jsp';">
  4D Results
</button>
  <button type="button" style=" width: 100%; height: 8%;" class="btn btn-default btn-info btn-lg" onclick="window.location='/User-Settings.jsp';">
   Account Settings
</button>
    


	</div>
</div>
</body>

</html>
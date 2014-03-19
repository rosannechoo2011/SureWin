<%@page import="model.*, java.util.*"%>


<!DOCTYPE html>
<html>
<%@include file="common/header.jsp"%>

<style type="text/css">
.btn {width:55;}
</style>

<body>

<div class="container-fluid">
  <div class="row-fluid">
   <h2 align="center">4D Dashboard</h2>  
  </div>
  	<div class="span12" align="center">
		<div class="btn-group">
		<button class="btn btn-default" onclick="window.location='/Dashboard-betHistoryPage.jsp';">Bet History</button>
		<button class="btn btn-default" onclick="window.location='/Dashboard-Odds.jsp';">Analysis</button>
	  	<button class="btn btn-default btn-danger">Top 10 Number</button>
		</div>
	 
	</div>


<div class="span11">
<br>
  <table class="table table-bordered">
  	<tr>
  		<th width="20%">Ranking</th><th width="40%">Number</th><th width="40%">Purchase counter</th>
  	</tr>
  	<tr>
  		<td>1</td><td>1234</td><td>100</td>
  	</tr>
  	<tr>
  		<td>2</td><td>2234</td><td>97</td>
  	</tr>
  	<tr>
  		<td>3</td><td>7545</td><td>66</td>
  	</tr>
  	<tr>
  		<td>4</td><td>6564</td><td>56</td>
  	</tr>
  	<tr>
  		<td>5</td><td>5456</td><td>50</td>
  	</tr>
  	<tr>
  		<td>6</td><td>3466</td><td>44</td>
  	</tr>
  	<tr>
  		<td>7</td><td>0878</td><td>43</td>
  	</tr>
  	<tr>
  		<td>8</td><td>1808</td><td>20</td>
  	</tr>
  	<tr>
  		<td>9</td><td>6425</td><td>19</td>
  	</tr>
  	<tr>
  		<td>10</td><td>7975</td><td>16</td>
  	</tr>
  </table>
</div>

</div>



</body>

</html>
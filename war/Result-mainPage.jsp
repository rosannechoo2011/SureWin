<!DOCTYPE html>
<html>
<%@include file="common/header.jsp"%>
<link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">
<script>	
	$(function() {
		$("#datepicker").datepicker( { 
			dateFormat: 'dd/mm/yy',
		    beforeShowDay: function(date) {
		        var day = date.getDay();
		        return [(day != 1 && day != 2 && day != 4 && day != 5), ''];
		    }
		 });		
	});
</script>
<body>
<div class="container-fluid">
  <div class="row-fluid">
   <h2 align="center">4D Results</h2>
  </div>
  
	
<div align="right">
	<form action="Result-drawDate.jsp" method="get">
		<input name="drawDate" type="text" class="input-small" id="datepicker" placeholder="Find A Particular Draw">
		<input type="submit" value="Find">
	</form>
</div>
<BR>  
 <table class="table table-bordered">
  <tr>
  	<th align="center">Draw No.</th><th align="center">Draw Date</th>
  </tr>
  <tr>
	  <td><a href="/Result-drawDate.jsp?drawNo=0001&drawDay=Wed&drawDate=29/01/2014">0001</a></td><td>Wed 29/01/2014</td>
  </tr>
   <tr>
 	  <td><a href="/Result-drawDate.jsp?drawNo=0002&drawDay=Sat&drawDate=01/02/2014">0002</a></td><td>Sat 01/02/2014</td>
  </tr>
   <tr>
  	  <td><a href="/Result-drawDate.jsp?drawNo=0003&drawDay=Sun&drawDate=02/02/2014">0003</a></td><td>Sun 02/02/2014</td>
  </tr>
</table> 
  
</div>

	
	
</body>

</html>

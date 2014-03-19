<!DOCTYPE html>
<html>
<%@include file="common/header.jsp"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Random"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.Comparator"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%
	String drawNo = request.getParameter("drawNo");
	if (drawNo == null) {
		drawNo = "0004";
	}
	
	String drawDate = request.getParameter("drawDate");
	
	String drawDay = request.getParameter("drawDay");
	if (drawDay == null) {
		SimpleDateFormat format1=new SimpleDateFormat("dd/MM/yyyy");
		Date dt1=format1.parse(drawDate);
		DateFormat format2=new SimpleDateFormat("EEE"); 
		drawDay=format2.format(dt1);
	}
		
	String order = request.getParameter("order");
	
	ArrayList<String> topThree = new ArrayList<String>();
	topThree.add("7602");
	topThree.add("5163");
	topThree.add("4638");
	
	ArrayList<String> starterPrizes = new ArrayList<String>();
	starterPrizes.add("7309");
	starterPrizes.add("1648");
	starterPrizes.add("5943");
	starterPrizes.add("4859");
	starterPrizes.add("9483");
	starterPrizes.add("1435");
	starterPrizes.add("4028");
	starterPrizes.add("5873");
	starterPrizes.add("2935");
	starterPrizes.add("0908");
		
	ArrayList<String> consolationPrizes = new ArrayList<String>();
	consolationPrizes.add("4647");
	consolationPrizes.add("1947");
	consolationPrizes.add("5637");
	consolationPrizes.add("1546");
	consolationPrizes.add("9436");
	consolationPrizes.add("0184");
	consolationPrizes.add("3956");
	consolationPrizes.add("9485");
	consolationPrizes.add("1536");
	consolationPrizes.add("7346");
	
	if (order != null) {
		if (order.equals("asc")) {
			Collections.sort(starterPrizes);
			Collections.sort(consolationPrizes);
		}
		
		else if (order.equals("desc")) {
			Comparator comparator1 = Collections.reverseOrder();
			Collections.sort(starterPrizes, comparator1);
			
			//Comparator comparator2 = Collections.reverseOrder();
			Collections.sort(consolationPrizes, comparator1);
		}
	}
%>
<body>
<div class="container">
	<div class="row">
		<h2><CENTER>4D Results</CENTER></h2>
		<p><B>Draw No:</B> <%= drawNo %></p>
		<p><B>Draw Date:</B> <%= drawDay + " " + drawDate %></p>
	</div>
	
	<div class="table">
		<table class="table table-bordered">
			<tr>
				<th>1st Prize</th><td><%= topThree.get(0) %></td>
			</tr>
			<tr>
				<th>2nd Prize</th><td><%= topThree.get(1) %></td>
			</tr>
			<tr>
				<th>3rd Prize</th><td><%= topThree.get(2) %></td>
			</tr>
		</table>
	</div>
	
	<div class="row">
		<p><b>Sort by:</b> <a href="/Result-drawDate.jsp?order=asc&drawNo=<%= drawNo %>&drawDay=<%= drawDay %>&drawDate=<%= drawDate %>">Ascending</a> | <a href="/Result-drawDate.jsp?order=desc&drawNo=<%= drawNo %>&drawDay=<%= drawDay %>&drawDate=<%= drawDate %>">Descending</a></p>
	</div>
	
	<div class="span12">
		<div style="float:left; width:50%;">
			<table class="table table-bordered">
			  <tr>
				  <th colspan = "2" align="center"><CENTER>Starter Prizes</CENTER></th>
			  </tr>
			  <tr>
			 	  <td align="center"><%= starterPrizes.get(0) %></td><td align="center"><%= starterPrizes.get(1) %></td>
			  </tr>
			  <tr>
			  	  <td align="center"><%= starterPrizes.get(2) %></td><td align="center"><%= starterPrizes.get(3) %></td>
			  </tr>
			  <tr>
			 	  <td align="center"><%= starterPrizes.get(4) %></td><td align="center"><%= starterPrizes.get(5) %></td>
			  </tr>
			  <tr>
			  	  <td align="center"><%= starterPrizes.get(6) %></td><td align="center"><%= starterPrizes.get(7) %></td>
			  </tr>
			  <tr>
			 	  <td align="center"><%= starterPrizes.get(8) %></td><td align="center"><%= starterPrizes.get(9) %></td>
			  </tr>
			</table>
		</div>
	
		<div style="float:left; width:50%;">
			<table class="table table-bordered">
			  <tr>
				  <th colspan = "2"><CENTER>Consolation Prizes</CENTER></th>
			  </tr>
			  <tr>
			 	  <td align="center"><%= consolationPrizes.get(0) %></td><td align="center"><%= consolationPrizes.get(1) %></td>
			  </tr>
			  <tr>
			  	  <td align="center"><%= consolationPrizes.get(2) %></td><td align="center"><%= consolationPrizes.get(3) %></td>
			  </tr>
			  <tr>
			 	  <td align="center"><%= consolationPrizes.get(4) %></td><td align="center"><%= consolationPrizes.get(5) %></td>
			  </tr>
			  <tr>
			  	  <td align="center"><%= consolationPrizes.get(6) %></td><td align="center"><%= consolationPrizes.get(7) %></td>
			  </tr>
			  <tr>
			 	  <td align="center"><%= consolationPrizes.get(8) %></td><td align="center"><%= consolationPrizes.get(9) %></td>
			  </tr>
			</table> 
		</div>
	</div>
	<div class="span10" align="center">
	<button type="button" class="btn btn-default btn-success btn-lg" onclick="window.location='/Result-mainPage.jsp';">Back</button>
	</div>
	
</div>

</body>

</html>

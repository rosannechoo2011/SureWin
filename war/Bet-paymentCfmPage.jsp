<%@page import="java.util.Date, java.text.SimpleDateFormat"%>
<%@page import="org.json.simple.JSONValue, org.json.simple.JSONArray, org.json.simple.JSONObject"%>
<%

String betCart = (String)session.getAttribute("betCart");
if(betCart == null || betCart.equals("")){
	betCart = "";
}
session.removeAttribute("betCart");	

Date date = new Date();
SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
//System.out.println(sdf.format(date));
%>
<html>
<%@include file="common/header.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Payment Confirmation</title>
</head>
<body>
<div class="container-fluid">
	<div class="row-fluid">
		<h3 align="center">Payment Confirmation</h3>
		<h4 align="center">You have successfully placed your bet</h4>
		<h4 align="center">on the following: </h4>
		<h4 align="center">Purchase Date: <u><%=sdf.format(date) %></u></h4>
		
		<table class="table">
			<tr>
				<th>Date</th><th>Number</th><th>Information</th>
			
			<!--  
				<th width="30%">Date</th>
				<th width="15%">Big</th>
				<th width="15%">Small</th>
				<th width="20%">Type</th>
				<th width="30%">Bet Number</th>
				-->
			</tr>
			<%	
			Object obj = JSONValue.parse(betCart);
			JSONObject reqObj = (JSONObject) obj;		
			JSONArray allItem = (JSONArray) reqObj.get("item"); 
			
			int numberOfLoop = allItem.size();
			for(int i=0;i<numberOfLoop;i++){ 
				JSONObject test = (JSONObject)allItem.get(i);
			%>
			
			<tr>
				<td><%=(String)test.get("drawDate")%></td>
				<td><%=(String)test.get("betNumber")%></td>		
					
				<td>$<%=(String)test.get("betBig")%> big,
				$<%=(String)test.get("betSmall")%> sml,
				<%=(String)test.get("type")%></td>
					
			</tr>
			<%}%>		
		</table>
		
		<table align="center">
			<tr>					
				<td align="left">
				<a href="Bet-enter4DDetails.jsp"><button type="button" class="btn btn-default btn-success">Back to Betting</button></a>	
				</td>		
				<td align="right">
				<a href="Dashboard-betHistoryPage.jsp"><button type="button" class="btn btn-default btn-warning">View bet history</button></a>		
				</td>			
			</tr>
		</table>			
	</div>
</div>


</body>

</html>
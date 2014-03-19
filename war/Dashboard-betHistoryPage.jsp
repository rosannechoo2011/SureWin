<%@page import="model.*, java.util.*, java.text.SimpleDateFormat,java.text.DateFormat"%>

<%

user normalUser = (user)session.getAttribute("authenticated");

betHistoryDataManager bhm = new betHistoryDataManager();
List<betHistory> bhs = bhm.retrieveAllUserbetHistory(normalUser.getId());

List<betHistory> bhsSorted = new ArrayList<betHistory>();
if(bhs == null || bhs.size()==0){

}else{
	//not null 
	Map<Date, Long> yourMap = new HashMap<Date, Long>();
	for(betHistory bh: bhs){
		Date date = new SimpleDateFormat("dd/MM/yyyy").parse(bh.getDrawDate());
		yourMap.put(date,bh.getId());
	}
	//sorted map of the date and id
	Map<Date, Long> sortedMap = new TreeMap<Date, Long>(yourMap).descendingMap();
	Iterator it = sortedMap.entrySet().iterator();
	while (it.hasNext()) {
		Map.Entry pairs = (Map.Entry)it.next();
		for(betHistory bh: bhs){
			DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
			String reportDate = df.format(pairs.getKey());
			if(reportDate.equals(bh.getDrawDate())){
				bhsSorted.add(bh);
			}
		}
			 
	}
}

String number = request.getParameter("limit");
int numberToShow = 10;
if(number== null){
	
}else{
	numberToShow = numberToShow + Integer.parseInt(number);
}
boolean maxReached=false;
//check that the max size must not be more than the limit
if(numberToShow >= bhsSorted.size() || numberToShow < 10){
	numberToShow = bhsSorted.size();
	maxReached=true;
}


/*
String string = "12/04/1989";
Date date1 = new SimpleDateFormat("dd/MM/yyyy").parse(string);
string = "10/03/1989";
Date date2 = new SimpleDateFormat("dd/MM/yyyy").parse(string);
string = "12/05/1989";
Date date3 = new SimpleDateFormat("dd/MM/yyyy").parse(string);

Map<Date, String> yourMap = new HashMap<Date, String>();
yourMap.put(date1,"1");
yourMap.put(date2,"2");
yourMap.put(date3,"3");
Map<Date, String> sortedMap = new TreeMap<Date, String>(yourMap).descendingMap();
*/

%>
<!DOCTYPE html>
<html>
<%@include file="common/header.jsp"%>

<style type="text/css">
.btn {width:55;}
</style>

<body>

<div class="container-fluid">
  <div class="row-fluid">
   <h2 align="center">4D Bet History</h2>  
  </div>
 	<div class="span12" align="center">
	 <div class="btn-group">
	  <button class="btn btn-default btn-danger">Bet History</button>
	  <button class="btn btn-default" onclick="window.location='/Dashboard-Odds.jsp';">Analysis</button>
	  <button class="btn btn-default" onclick="window.location='/Dashboard-top10.jsp';">Top 10 Number</button>
	 </div>
	</div>
	<div class="row-fluid">
	<br>
		<%if(bhs.size()==0){ %>
		 <font size="4" color="red">You had not made any purchases</font>
		<%}else{ %>
			<table class="table">
				<tr>
					<th>Draw date</th><th>BIG</th><th>SML</th><th>Type</th><th>Number</th>
				</tr>
				<%
				for(int i=0;i<numberToShow;i++){
				//for(betHistory bh: bhsSorted){ 
				%>
					<tr>
						<td><%=bhsSorted.get(i).getDrawDate() %></td>
						<td>$<%=bhsSorted.get(i).getBetBig()%></td>
						<td>$<%=bhsSorted.get(i).getBetSmall() %></td>
						<td><%=bhsSorted.get(i).getType() %></td>
						<td><%=bhsSorted.get(i).getBetNumber()%></td>
					</tr>				
				<%} %>
			</table>
			<%if(maxReached == false){ %>
			<p align="center"><a href="?limit=<%=numberToShow %>">More</a></p>		
			<%} %>
		<%} %>
	</div>
	
</div>

</body>

</html>
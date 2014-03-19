<%@page import="model.*, java.util.*"%>
<%@page import="org.json.simple.JSONValue, org.json.simple.JSONArray, org.json.simple.JSONObject"%>
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
	
int[] betPrice = {0,1,2,3,4,5,10,20,30,50,100};	
int[] betNumber = {0,1,2,3,4,5,6,7,8,9};	

//get all the information of the session
String matchCart = (String)session.getAttribute("matchCart");
if(matchCart == null){
	matchCart = "";
}
%>

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
		<font size="4" color="red"><%=errorMsg %></font>
		
		<table class="table">			
			
			<%
			if(!matchCart.equals("")){%>
				<tr>
					<th>draw date</th><th>Bet BIG</th><th>Bet SMALL</th><th>Type</th><th>Number</th><th></th>
				</tr>	
			<%	
			Object obj = JSONValue.parse(matchCart);
			JSONObject reqObj = (JSONObject) obj;		
			JSONArray allItem = (JSONArray) reqObj.get("item"); 
			
			int numberOfLoop = allItem.size();
			for(int i=0;i<numberOfLoop;i++){ 
				JSONObject test = (JSONObject)allItem.get(i);
			%>
			
			<tr>
				<td><%=(String)test.get("drawDate")%></td>
				<td><%=(String)test.get("betBig")%></td>
				<td><%=(String)test.get("betSmall")%></td>
				<td><%=(String)test.get("type")%></td>
				<td><%=(String)test.get("betNumber")%></td>
				<td><a href="processRemoveNumberFromMatchCart.do?itemRow=<%=(String)test.get("id")%>"><span class="glyphicon glyphicon-remove-sign"></span></a></td>
			</tr>
			<%} 
			}
			%>
		</table>		
		
		<form action="processAddNumberToMatchCart.do" method="get">
		<table>
				<tr><br></br><th width="40%"><th width="60%"></th></tr>
				<tr>
					<td><input name="drawDate" type="text" class="input-small" id="datepicker" placeholder="Date" readonly="readonly" style="width:100px;"></td>
					<td>Type
						<select name="betType">
							<option value="normal">Normal</option>
							<option value="ibet">IBet</option>
						</select>
					</td>					
				</tr>
				<tr>
					<td>BIG
						<select name="betBig">
							<%for(int i:betPrice){ %>
							<option value="<%=i%>">$<%=i%></option>
							<%} %>	
						</select>
					</td>
					<td>	
						SMALL
						<select name="betSmall">
							<%for(int i:betPrice){ %>
							<option value="<%=i%>">$<%=i%></option>
							<%} %>	
						</select>
					</td>						
				</tr>	
				<tr>
					<td>Selected Digit:</td>
					<td>
						<select name="betNumber1">
							<%for(int i:betNumber){ %>
							<option value="<%=i%>"><%=i%></option>
							<%} %>	
						</select>
						<select name="betNumber2">
							<%for(int i:betNumber){ %>
							<option value="<%=i%>"><%=i%></option>
							<%} %>	
						</select>
						<select name="betNumber3">
							<%for(int i:betNumber){ %>
							<option value="<%=i%>"><%=i%></option>
							<%} %>	
						</select>
						<select name="betNumber4">
							<%for(int i:betNumber){ %>
							<option value="<%=i%>"><%=i%></option>
							<%} %>	
						</select>
					</td>			
				</tr>
				<tr><td><span style="padding: 0 10px">&nbsp;</span></td></tr>
				
				<tr>
					<td>
						<button type="submit" style="width: 100px;" class="btn btn-default btn-warning">Add</button>							
					</td>
				
					<td align="right">
						<a href="processSaveMatchCart.do"><button type="button"  style="width: 100px;" class="btn btn-default btn-success">Save</button></a>			
					</td>
				</tr>
		
			</table>
		</form>
		
		
	</div>
</div>

 

</body>


</html>
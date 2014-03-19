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
%>

<!DOCTYPE html>
<html>
<%@include file="common/header.jsp"%>

<body>
	<div class="container">
		<div class="row-fluid">
			<div class="table">
				<table>
					<tr>
						<td><img src="image/shoe.jpg" alt="" align="left"  width="100" height="100" /></td>
						<td>
							<h4>You had found a</h4>
							<h2>pair of shoes</h2>
						</td>
					</tr>					
				</table>
			</div>
		</div>
				
		<div class="span10" align="center">
			<h2>Lucky rating: <%=new Random().nextInt(100) %>%</h2>
		</div>
		<br>
		<br>
		<div class="span10" align="center">
			<h4>Random number generated</h4>
			<img src="image/randomNumber.png" alt="" align="center"  width="200" height="100" />
			
		</div>
		<br>
		
		<div class="span10" align="center">		
			<button type="button" class="btn btn-default btn-lg" onclick="window.location='/Bet-enter4DDetails.jsp';">Purchase</button>
		</div>
		
	</div>




</body>

</html>
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
<head>




</head>
<!DOCTYPE html>
<html>
<%@include file="common/header.jsp"%>

 
<body>
	<div class="container" align="center">
		<div class="row-fluid">
			<div class="table">
				<Label><h2>Snapshot</h2></Label>
				<table>
					<tr>
						<td>Ticket No :</td><td>128-55556803-095908</td>
					</tr>
					<tr>
						<td>Draw date :</td><td>SAT 01/02/14</td>
					</tr>
					<tr>
						<td></td><td>SUN 02/02/14</td>
					</tr>
				</table>	
				<br>
				<table>
					<tr>
						<td width="10">1)</td><td width="100">2000</td><td width="50">BIG $2</td><td width="50">SML $0</td>
					</tr>
					<tr>
						<td colspan="4">Type: 4 permutations</td>
					</tr>
					<tr>
						<td>2)</td><td>0276</td><td>BIG $4</td><td>SML $0</td>
					</tr>
					<tr>
						<td colspan="4">Type: 24 permutations</td>
					</tr>
				</table>		
				<br>		
				<button type="button" class="btn btn-default btn-danger btn-lg" onclick="window.location='/Match-capturePicture.jsp';">Recapture</button>
				<button type="button" class="btn btn-default btn-success btn-lg" onclick="window.location='/Dashboard-betHistoryPage.jsp?notification=win';">Store</button>
			</div>
		</div>	
	</div>
	

</body>

</html>
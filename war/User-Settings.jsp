<%@page import="model.*, java.util.*"%>
<%
	
	String errorMsg = request.getParameter("errMsg");
	if(errorMsg == null){
		errorMsg = "";
	}

	user normalUser = (user)session.getAttribute("authenticated");
	
	userDataManager udm = new userDataManager();
	user modifiedUser = udm.retrieve(normalUser.getId());
	if (normalUser == null || modifiedUser ==null) {
			response.sendRedirect("mainPage.jsp");
			return;
	}	
%>

<!DOCTYPE html>
<html>
<%@include file="common/header.jsp"%>
<body>

<div class="container" align="center">
	<table align="center">
	</br> </br> </br>
	
	<tr>
		<td width="5%"></td><td width="45%"></td>
		<td align ="right" width="50%">
			<div class="control-group">
				<button type="button"  style=" width: 100px; height: 10%;" class="btn btn-default btn-success btn-lg" onclick="window.location='/User-editAccountSettings.jsp';">
		  			<span>Edit</span>
		  		</button>
			</div>
		<br>
		</td>
	</tr>
	<tr>
		<td width="5%"></td>
		<td align="right" width="45%"><h4><strong>Name : </strong></h4></td><td width="50%"><h4><%=modifiedUser.getFullname()%></h4></td>
		
	</tr>
	<tr>
		<td width="5%"></td>
		<td align="right" width="45%"><h4><strong>Password : </strong></h4></td><td width="50%"><h4>******</h4></td>
		
	</tr>
	<tr>
		<td width="5%"></td>
		<td align="right" width="45%"><h4><strong>Date Of Birth : </strong></h4></td><td width="50%"><h4><%=modifiedUser.getDateOfBirth()%></h4></td>
		
	</tr>
	<tr>
		<td width="5%"></td>
		<td align="right" width="45%"><h4><strong>Contact No : </strong></h4></td><td width="50%"><h4><%=modifiedUser.getMobileNo()%></h4></td>
		
	</tr>
	<tr>
		<td width="5%"></td>
		<td align="right" width="45%"><h4><strong>Bet Limit : </strong></h4></td><td width="40%"><h4> $<%=modifiedUser.getBetLimit()%></h4></td>
		
	</tr>		
	</table>		
</div>
	
</body>

</html>
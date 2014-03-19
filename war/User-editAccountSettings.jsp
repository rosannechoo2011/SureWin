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

<link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">
<script>

	$(function() {
	    $( "#datepicker" ).datepicker({ dateFormat: "dd/mm/yy" });
	});
	
</script>
		
<body>
	<div class="container" align="center">
	<p></p>
		<form name="formname" action="processEditUserSetting.do" method="get">
			<table>
				<tr>
					<td align="right"><h5><strong>Name : </strong></h5></td><td><h5><input name="name" type="text" value = "<%=modifiedUser.getFullname()%>"/></h5></td>
				</tr>
				<tr>
					<td align="right"><h5><strong>Password : </strong></h5></td><td><h5><input name="password" type="password" value = "<%=modifiedUser.getPassword()%>"/></h5></td>
				</tr>
				<tr>
					<td align="right"><h5><strong>Date Of Birth : </strong></h5></td><td><h5><input name="dateOfBirth" type="text" id="datepicker" value = "<%=modifiedUser.getDateOfBirth()%>" placeholder="Date"> </h5></td>
				</tr>	
				<tr>
					<td align="right"><h5><strong>Contact No : </strong></h5></td><td><h5><input name="hp"type="number" value = "<%=modifiedUser.getMobileNo()%>"/></h5></td>
				</tr>
				<tr>
					<td align="right"><h5><strong>Bet Limit : </strong></h5></td><td><h5><input name="limit" type="number" value = "<%=modifiedUser.getBetLimit()%>"/></h5></td>
				</tr>
				
				<tr>
					<td>
					<div class="control-group">
						<button type="button"  style=" width: 100px; height: 10%;" class="btn btn-default btn-danger btn-lg" onclick="window.location='/User-Settings.jsp';">
		  				<span>Cancel</span></button>
  					</div>				
					</td>					
					<td align="right">
					<div class="control-group">
						<button type="button"  style=" width: 100px; height: 10%;" class="btn btn-default btn-success btn-lg" onclick="document.formname.submit()">
		  				<span>Change</span></button>
  					</div>
					</td>
				</tr>
			</table>
		</form>	
	</div>
	
</body>
</html>
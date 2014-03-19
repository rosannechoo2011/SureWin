
<!DOCTYPE html> 
<html lang="en">
  <head>
    <meta charset="utf-8">
    
    <title>Signup for SureWin today!</title>
    
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
</head>

<%
	
	String errorMsg = request.getParameter("errMsg");
	if(errorMsg == null){
		errorMsg = "";
	}

%>

<%@include file="common/headerWithoutAuthentication.jsp"%>

<body>	  
	
	<div class="container">
		<div class="row">
			<h3>Join SureWin today!</h3>
			<font size="4" color="red"><%=errorMsg %></font>
			<br>
			<form id="signup" class="form-horizontal" method="post" action="processAddUser.do">
      		<div class="table" align="center">
				<table>
					<tr>
						<td>Full Name:</td>
						<td><input type="text" style=" width: 150px; height: 28px;" class="input-xlarge" id="fname" name="fname" placeholder="Full Name"></td>
					</tr>
					<tr>
						<td>E-mail:</td>
						<td><input type="text" style=" width: 150px; height: 28px;" class="input-xlarge" id="email" name="email" placeholder="Email"></td>
					</tr>
					<tr>
						<td>Mobile No:</td>
						<td><input type="text" style=" width: 150px; height: 28px;" class="input-xlarge" id="mobileNo" name="mobileNo" placeholder="Mobile No"></td>
					</tr>
					<tr>
						<td>Date of Birth:</td>
						<td><input type="text" style=" width: 150px; height: 28px;" class="input-xlarge" id="fname" name="dob" placeholder="DD/MM/YYYY"></td>
					</tr>
					<tr>
						<td>Username:</td>
						<td><input type="text" style=" width: 150px; height: 28px;" class="input-xlarge" id="username" name="username" placeholder="Username"></td>
					</tr>
					<tr>
						<td>Password:</td>
						<td><input type="password" style=" width: 150px; height: 28px;" class="input-xlarge" id="password" name="password" placeholder="Password"></td>
					</tr>				
					
				</table>
			</div>
			<div class="span10" align="center">
				<button type="button" class="btn btn-danger" onclick="window.location='/mainPage.jsp';">Cancel</button>
				<button type="submit" class="btn btn-success" rel="tooltip" title="first tooltip">Create</button>     
			</div>
			</form>
			
		<div>	
 	</div>    


   </div>
</div>
   
  </body>
</html>


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
<div class="container-fluid">
  <div class="row-fluid">
   
    
<br>
    <br><br>
    <br>
<br><br><center>
<h1>4D Match</h1>
<br><br>
    <br><br>
    <br>
    <br>
    <button type="button" style=" width: 50%; height: 20%;" class="btn btn-default btn-success btn-lg" onclick="window.location='/Match-enter4DDetails.jsp';">
  <span>Enter 4D Details</span>
</button>
<br><br><br><br><br><br>
    <br><br>
    <br>
  <button type="button" style=" width: 50%; height: 20%;" class="btn btn-default btn-warning btn-lg" onclick="window.location='/Match-capturePicture.jsp';">
   <span>Capture 4D Slip</span>
</button>
 </center>


	</div>
</div>
</body>

</html>
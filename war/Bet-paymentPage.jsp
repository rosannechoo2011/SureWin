<%
String betCart = (String)session.getAttribute("betCart");
if(betCart == null || betCart.equals("")){
	response.sendRedirect("Bet-enter4DDetails.jsp?errMsg=You did not add any number to bet");
}
%>
<html>
<%@include file="common/header.jsp"%>


<body>
<h1 align="center">Payment</h1>
<p align="center">
<img src="image/visa.JPG" width="40" height="30" />
<img src="image/mastercard.JPG" width="40" height="30" />
</p>
<form action="processSaveBetCart.do" method="post">
	<div class="table" align="center">
		<table>
    <tr>
      <td>Cardholder Name:</td>
      <td><input name="cName" class="form-control" type="text" id="cName" maxlength="50" /></td>
    </tr>
    <tr>
      <td>Card Number:</td>
      <td><input name="cNo" class="form-control" type="text" id="cNo" maxlength="50" /></td>
    </tr>
    <tr>
     <td>Expiry Date:</td>
      <td><input name="cExpire" class="form-control" type="text" id="cExpire" maxlength="10" /></td>
    </tr>
    <tr>
    <td>CVC2/CVV2:</td>
      <td><input name="cCVV" class="form-control" type="text" id="cCVV" maxlength="10" /></td>
    </tr>
    <!-- create a empty row -->
    <tr><td><br></td></tr>
 	<tr>	
		<td width="50%" align="left">
			<a href="Bet-enter4DDetails.jsp"><button type="button"  style="width: 100px;" class="btn btn-default btn-success">Back</button></a>	
							
		</td>
		<td width="50%" align="right">
			<button type="submit" style="width: 100px;" class="btn btn-default btn-warning">Pay</button>				
		</td>
	</tr>
		

  </table>
	</div>
  	
</form>


</html>
<%@page import="model.*, java.util.*, java.text.SimpleDateFormat,java.text.DateFormat"%>
<%@ page language="java" contentType="text/html; charset=US-ASCII"
    pageEncoding="US-ASCII"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Insert title here</title>
</head>

<%
betHistoryDataManager bhdm = new betHistoryDataManager();
List<betHistory> allBet = bhdm.retrieveAll();


%>
<body>
	<table>
		<tr>
			<th>ID</th>
			<th>user ID</th>
			<th>Bet Number</th>
			
		</tr>
		<%for(betHistory bh : allBet){ %>
		<tr>
			<td><%=bh.getId()%></td>
			<td><%=bh.getUserId() %></td>
			<td><%=bh.getBetNumber()%></td>

		</tr>
		<%} %>
	</table>

</body>
</html>
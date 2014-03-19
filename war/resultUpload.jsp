	<%@page import="model.*, java.util.*"%>
<%
	
	String errorMsg = request.getParameter("errMsg");
	if(errorMsg == null){
		errorMsg = "";
	}

%>


<%@ page language="java" contentType="text/html; charset=US-ASCII"
    pageEncoding="US-ASCII"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Insert title here</title>
</head>
<body>
 <font size="4" color="red"><%=errorMsg %></font>
<p>this is to upload a CSV file that contains all the 4d digits</p>
<form action="processFile.do" method="post" enctype="multipart/form-data" >
  			  <input type="file" name="result" /><br />
 			  <button type="submit" class="btn btn-primary" data-loading-text="Loading...">Upload</button>
	</form>
	
	main 3
	<%
	String mainConcat="";
	for(int i=0;i<=2;i++){ 
	String randomNum = Integer.toString(1000 + (int)(Math.random()*9000)); 
	mainConcat = mainConcat.concat("=").concat(randomNum);
	} %>
	<%=mainConcat %>
	
	<br>
	start 10
	<%
	String mainConcat1="";
	for(int i=0;i<=9;i++){ 
	String randomNum = Integer.toString(1000 + (int)(Math.random()*9000)); 
	mainConcat1 = mainConcat1.concat("=").concat(randomNum);
	} %>
	<%=mainConcat1 %>
	
	<br>
	con 10
	<%
	String mainConcat2="";
	for(int i=0;i<=9;i++){ 
	String randomNum = Integer.toString(1000 + (int)(Math.random()*9000)); 
	mainConcat2 = mainConcat2.concat("=").concat(randomNum);
	} %>
	<%=mainConcat2%>
	
</body>
</html>
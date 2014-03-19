	<%@page import="model.*, java.util.*"%>
<%
	
	String errorMsg = request.getParameter("errMsg");
	if(errorMsg == null){
		errorMsg = "";
	}

	user normalUser = (user)session.getAttribute("authenticated");
		
	if (normalUser != null) {
			response.sendRedirect("User-MainPage.jsp");
			return;
	}	
%>

<!DOCTYPE html>
<html>
        <meta charset="utf-8">
        <title>SureWin Login</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">

        <!-- CSS -->
        <link rel='stylesheet' href='http://fonts.googleapis.com/css?family=PT+Sans:400,700'>
        <link rel="stylesheet" href="bootstrap/css/reset.css">
        <link rel="stylesheet" href="bootstrap/css/supersized.css">
        <link rel="stylesheet" href="bootstrap/css/loginstyle.css">
<head>
</head>


<body>
        <div class="page-container">
        	<img src="/image/SureWinLogo.png" alt="">
            <h1>Login</h1>
            <font size="4" color="red"><%=errorMsg %></font>
            <form action="login.do" method="post">
                <input type="text" name="username" class="username" placeholder="Username">
                <input type="password" name="password" class="password" placeholder="Password">
                <button type="submit">Sign me in</button>
                <a href="User-Signup.jsp"><button type="button">Register</button></a>
                <div class="error"><span>+</span></div>
            </form>
        </div>
</body>
</html>
<%-- 
    Document   : LoginPage
    Created on : Nov 7, 2017, 7:53:47 PM
    Author     : Annisa Muzdalifa
--%>

<%-- 
    Document   : LoginPage
    Created on : Nov 8, 2017, 10:31:24 AM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../styles/login.css">
        <title>Login Page</title>
    </head>
    <body>
        <div class="foundation">
		<div class="boxdummy">
			<div class="line"><hr></div>
			<div class="title">LOGIN</div>
			<div class="line"><hr></div>
		</div>
		<form method="POST" id="login" action="LoginServlet">
			<div class="formBox">
				<label class="formAttribute">Username</label>	
				<input type="text" name="username" class="formFill">
			</div>
			<div class="formBox">
				<label class="formAttribute">Password</label>
				<input type="password" name="password" class="formFill">
			</div>
		</form>
		<div class="choice">
			<a href="signup.php" id="link">Don't have an account?</a>
			<button type="submit" class="button" value="Go" form="login">GO!</button>
		</div>
	</div>
    </body>
</html>

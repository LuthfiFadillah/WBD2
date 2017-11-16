<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link rel="stylesheet" type="text/css" href="../styles/login.css">
    <title>Signup</title>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script type="text/javascript" src="/js/signup.js"></script>
</head>
<body>
<div class="foundation">
		<div class="boxdummy">
			<div class="line"><hr></div>
			<div class="title">SIGNUP</div>
			<div class="line"><hr></div>
		</div>
		<form method="post" action="/SignupServlet" id="signup">
			<div class="formBox">
				<label class="formAttribute2">Your Name</label>	
				<input type="text" name="yourname" class="formFill" id="yourname" required>
			</div>
			<div class="formBox">
				<label class="formAttribute2">Username</label>	
                                <input type="text" name="username" class="formFillCheck" id="username" minlength="8" required>
			</div>
			<div class="formBox">
				<label class="formAttribute2">Email</label>	
				<input type="email" name="email" class="formFillCheck" id="email" required>
			</div>
			<div class="formBox">
				<label class="formAttribute2">Password</label>	
                                <input type="password" name="password" class="formFill" id="password" minlength="8" required>
			</div>
			<div class="formBox">
				<label class="formAttribute2">Confirm Password</label>	
                                <input type="password" name="confirmpass" class="formFill" id="confirmpass" minlength="8" required>
			</div>
			<div class="formBox">
				<label class="formAttribute2">Phone Number</label>	
                                <input type="tel" name="phonenumber" class="formFill" id="phonenumber" required>
			</div>
			<div class="formBox">
                            <input type="checkbox" name="checkbox" class="formCheck" id="checkbox" value="driver">
				<label class="formAttribute2">Also sign me up as a driver!</label>	
			</div>
		<div class="other">
			<a href="login.php" id="link1">Already have an account?</a>
                        <input type="submit" name="submit" form="signup" class="button" value="REGISTER" id='signup' onclick="sendJSON()"></button>
		</div>
		</form>
	</div>
</body>
</html>
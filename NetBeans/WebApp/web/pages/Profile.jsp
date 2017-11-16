<%-- 
    Document   : Profile
    Created on : Nov 7, 2017, 7:54:12 PM
    Author     : Annisa Muzdalifa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% String id = "123";%>
<% String username = "amuz"; %>
<% String fullname = "Annisa Muzdalifa";%>
<% String email = "a.muzdalifa";%>	
<% String no_hp = "jfanfd";%>	
<% Boolean is_driver = true; %>
<% Integer avg_rating = 4;%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Profile Page</title>
<link rel="stylesheet" type="text/css" href="../styles/Profile.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
</head>
<body>
<div class="flex-container">
			<div id="container" class="flex-container container"> 
				<div id="header" class="header">
					<div class="projekcontainer">
						<div class="projek">
							<h2>
								<span style="color: rgb(2,112,44)">PR</span><span style="color: black">-</span><span style="color: rgb(213,0,39)">OJEK</span>
							</h2>
						</div>
						<div class="slogan">wushh... wushh... ngeeeeeenggg</div>
					</div>
					<div class="projekcontainer">
						<div class="username">Hi, <%= username%></div>
						<div class="logout">
							<a href="../handlers/logout-handler.php">Logout</a></div>
					</div>
				</div>
				<div class="tab">
					<div class="tabitem1"><a href="OrderOjek.jsp?id_active=<%= id%>">ORDER</a></div>
					<div class="tabitem2"><a href="HistoryOrder.jsp?id_active=<%= id%>">HISTORY</a></div>
					<div class="tabitem3"><a href="Profile.jsp?id_active=<%= id%>">MY PROFILE</a></div>
				</div>
				<div class="menu-container">
					<div class="menu-title">MY PROFILE</div>
					<div class="menu-profile-edit-icon" ><img src="../assets/icon-pencil.png" id="icon-edit-profile" height="40px" width="40px" id="icon-edit-profile"></div>
				</div>
				<div class="content-container">
					<div class="content-foto"><img class = "img-circle" src="<?php echo $url_photo ?>" height="100px" width="100px"></div>
					<div class="content-username"><b>@<%= username%></b></div>
					<div class="content-fullname"><%= fullname%></div>
					<div class="content-container2">
						<div class="content-isdriver">
							<%
								if (is_driver==false) {
									out.println("User");
								} else {
									out.println("Driver");
								};
							%>
							</div>
						<div class="content-rating">
							<%if (is_driver) { %>
								<i class="material-icons">star_border</i>
								<%= avg_rating%>
							<%}%>
					</div>
					</div>
					<div class="content-email"><%= email %></div>
					<div class="content-hp"><%= no_hp %></div>
				</div>
				<%
					if(is_driver) {
						out.write("<div class=\"pref-container\" style=\"display: flex; flex-direction: column;\">");
							out.write("<div class=\"menu-container\" style=\"display: flex\">");
							out.write("<div class=\"menu-title\" style=\"font-size: 28px\">PREFERRED LOCATION</div>");
							out.write("<div class=\"menu-profile-edit-icon\"><img src=\"../assets/icon-pencil.png\" height=\"40px\" width=\"40px\" id=\"icon-edit-location\">");
							out.write("</div>");
						out.write("</div>");
						out.write("<div class=\"loc-list-container\" style=\"display: flex;\">");
							int i= 0;
							while (i<=3) {
								out.write("<ul>");
								out.write("<ul><li> location1 </li></ul><br>");
								out.write("<ul>");
								i++;
							}
						out.write("</div>");
						out.write("</div>");	
					}
				%>
								</div>
			</div>
		</div>
	</body>
<script type="text/javascript">
	document.getElementById("icon-edit-profile").onclick = function () {
  	location.href = "editprofile.php?id_active=" + id;
  	}
  	if(is_driver==true) {
  		document.getElementById("icon-edit-location").onclick = function () {
  		location.href = "editlocation.php?id_active=" + id;
  	}
}
</script>
</html>
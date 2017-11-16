<%-- 
    Document   : EditProfile
    Created on : Nov 7, 2017, 7:52:56 PM
    Author     : Annisa Muzdalifa
--%>

<% String id = "123";%>
<% String username = "amuz"; %>
<% String fullname = "Annisa Muzdalifa";%>
<% String email = "a.muzdalifa";%>	
<% String no_hp = "jfanfd";%>	
<% Boolean is_driver = true; %>
<% Integer avg_rating = 4;%>
<% String url_photo = "url"; %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Profile</title>
<link rel="stylesheet" type="text/css" href="../styles/Profile.css">
</head>
<body>
	<div class="flex-container">
		<div id="container" class="flex-container container"> 
			<div class="menu-title-edit">EDIT PROFILE INFORMATION</div>
			<div class="content-container">
				<form action="../handlers/profile_handler.php" method="POST" enctype="multipart/form-data">
					<input type="hidden" name="user_id" value="<%= id%>">
					<div class = "edit-image-container">
						<div class="edit-image"><img class = "img-square" src="<%= url_photo%>" height="140px" width="140	px"></div>
						<div class="edit-image-browse">
							<input id="uploadFile" class ="url-placeholder" placeholder="Choose File" name="photo_name" type="text">
							<input id = "uploadButton" type="file" class="button-upload" name="photo" accept="image/*">
						</div>
					</div>
   					<div class="button-container">
      						 <label for="name">Your Name</label>
      						 <input type="text" id="name" name="user_fullname" value="<%= fullname %>">
 						</div>
  						 <div class="button-container" style="margin-top: -15px">
       					<label for="phone">Phone</label>
       					<input type="phone" id="phone" name="user_phone" value="<%= no_hp %>">
  						</div>
  						<label for="isdriver" style="width: 420px">Status Driver</label>
  						<div class="switch">
  							<% if (is_driver) { %>
  								<input id="cmn-toggle-1" class="cmn-toggle cmn-toggle-round" type="checkbox" name="is_driver" checked="true" />
  							<%} else { %>
  								<input id="cmn-toggle-1" class="cmn-toggle cmn-toggle-round" type="checkbox" name="is_driver" checked="false" />
  							<%} %>
 							
 							<label for="cmn-toggle-1"></label>
					</div>
					<div class="button-container"></div>
					<div class="button-container">
						<div class="button-back">
							<button id="back">BACK</button>
						</div>
						<div class="button-save">
							<button name="update" type = "submit" >SAVE</button>
						</div>
						
					</div>
							
					</div>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	document.getElementById("uploadButton").onchange = function () {
   	document.getElementById("uploadFile").value = this.value;
	}

</script>
</body>
</html>

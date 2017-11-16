<%-- 
    Document   : EditLocation
    Created on : Nov 7, 2017, 7:52:38 PM
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
<% String url_photo = "url"; %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Preferred Location</title>
<link rel="stylesheet" type="text/css" href="../styles/Profile.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">

</head>
<body>
	<div class="flex-container">
		<div id="container" class="flex-container container"> 
			<div class="menu-title-edit">EDIT PREFERRED LOCATION</div>
				<div class="table-container">
					<table id="table-loc">
						<tr>
							<th>No</th>
							<th>Location</th>
							<th>Action</th>
						</tr>
						<% 
							int no =1;
							int total =1;
							while(total < 3) {
								out.print("<tr>
												<td>" , no , "</td>
												<td> <input type='text' value='location' disabled></td>
												<td>
													<row style='display: flex; flex-direction: row; justify-content: center;'>
														<div id='edit-icon-'", no, "class='edit-icon' ><i class='material-icons orange' onclick='editloc(this)'>create</i></div>
														<div id='delete-icon-'", no,  "class='delete-icon' ><i class='material-icons red' onclick ='deleteloc(this)''>clear</i></div>
													</row>
												</td>
											</tr>");
										no++;
							}
						%>
						
					</table>
					
				</div>
			<div class="add-loc-container">
				<div class="menu-title" style="font-size: 28px; margin-bottom: 20px">ADD NEW LOCATION</div>
				<div class="edit-location-add">
					<form action="" method="POST" style="display: flex; flex-direction: row; height: 50px; justify-content: space-between;">
							<input type="text" name="location" class="location-placeholder">
							<button type="submit" name="add" class="button-add">ADD</button>
					</form>
				</div>
				<button class="button-back" id="back">BACK</button>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	document.getElementById("back").onclick = function() {
		location.href = "profile.php?id_active=" +id;
	}
	function editloc(elmt) {
		var row = elmt.parentElement.parentElement.parentElement.parentElement;
		var text = row.children[1].children[0].value;
		row.children[1].children[0].disabled = false;
		row.children[2].children[0].children[0].children[0].innerHTML = "save";
		row.children[2].children[0].children[0].children[0].onclick = function(){saveloc(elmt, text)};
		console.log(row.children[1]);
		console.log(text);
		console.log(row.children[1].value);
		console.log(id);
	}

	function saveloc(elmt, locbefore) {
		var row = elmt.parentElement.parentElement.parentElement.parentElement;
		row.children[1].children[0].disabled = true;
		row.children[2].children[0].children[0].children[0].innerHTML = "create";
		row.children[2].children[0].children[0].children[0].onclick = function(){editloc(elmt, text)};
		var loc = encodeURI(row.children[1].children[0].value);
		locbefore = encodeURI(locbefore);

		var xhttp = new XMLHttpRequest();

		if (!xhttp) {
			return;
		}

		var url = "../handlers/location_handler.php?id_active=" + id + "&updateloc=" + loc + "&location=" + locbefore;
		xhttp.open("GET", url, true);
		xhttp.send();
		location.reload();

	}

	function deleteloc(elmt) {
		var result = confirm("Are you sure you want to delete this location?");
			if (result) {
   				 //Logic to delete the item

			var row = elmt.parentElement.parentElement.parentElement.parentElement;
			var loc = row.children[1].children[0].value;
			loc = encodeURI(loc);

			var xhttp = new XMLHttpRequest();

			if(!xhttp) {
				return;
			}

			var url = "../handlers/location_handler.php?id_active=" + id + "&deleteloc=" + loc;
			xhttp.open("GET", url, true);
			xhttp.send();
		}
	}
   
</script>
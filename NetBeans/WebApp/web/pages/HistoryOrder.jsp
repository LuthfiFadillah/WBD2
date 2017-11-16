<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>History</title>
<link rel="stylesheet" type="text/css" href="../assets/styles/history.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script type="text/javascript" src="../assets/js/history.js"></script>
</head>
<body>
	<div class="flex-container">
		<div id="container" class="flex-container container"> 
			<div id="header" class="header">
				<div class="projekcontainer">
					<div class="projek">
						<h2>
							<span style="color: green">PR</span><span style="color: black">-</span><span style="color: red">OJEK</span>
						</h2>
					</div>
					<div class="slogan">wushh... wushh... ngeeeeeenggg</div>
				</div>
				<div class="projekcontainer">
					<div class="username">Hi, <?php echo $username; ?></div>
					<div class="logout">
						<a href="../handlers/logout-handler.php">Logout</a></div>
				</div>
			</div>
			<div class="tab">
				<div class="tabitem1"><a href="order-ojek.php?id_active=<?php echo $id ?>">ORDER</a></div>
				<div class="tabitem2"><a href="history-order.php?id_active=<?php echo $id ?>">HISTORY</a></div>
				<div class="tabitem3"><a href="profile.php?id_active=<?php echo $id ?>">MY PROFILE</a></div>
			</div>
			<div class="menu-container">
				<div class="menu-title">TRANSACTION HISTORY</div>
			</div>
			<div class="tab">
				<div class="tabitem4"><a href="history-order.php?id_active=<?php echo $id ?>">MY PREVIOUS ORDER</a></div>
				<div class="tabitem5"><a href="history-driver.php?id_active=<?php echo $id ?>">DRIVER HISTORY</a></div>
			</div>
			<div class="container" id="box1">
				<img class="image" src="<?php echo $url_photo ?>">
				<div class="konten">
				<%
                    URL url = new URL ("http://localhost:8085/OjekService/HistoryService?wsdl");
                    QName qname = new QName("http://historyservice/","HistoryService");
                    QName qname_port = new QName("http://historyservice/","HistoryServicePort");
                    Service service = Service.create(url, qname);
                    HistoryService history = service.getPort(qname_port, HistoryService.class);
                    Connection conn = DriverManager.getConnection(URL);

                    //	HttpSession session = request.getSession();

                    int id = 1; //dummy

                    ArrayList<HistoryService> list = new ArrayList<HistoryService>();
                    list = history.getHistoryOrder(id);
                    
                    out.println("<div class='container' id='box1'>");
                    out.println("<img class='image' src='.$url_photo.'>");
                    out.println("<div class='konten'>");
                    int index = 0;
                   
					if (history.size() > 0) {
                        while (index < history.size()) {
                        	out.println("<div class='date'>" + history.indexOf(index).getDate() + "</div>");
							out.println("<div class='name'>" + history.indexOf(index).getNama() + "</div>");
							out.println("<div class='path'>" + history.indexOf(index).getPLocation() + "-" + history.indexOf(index).getDestination() + "</div>");
							out.println("<button class='button' onclick='hideContainer'(" + index + ") >HIDE</button>");
							out.println("<div class='rating'>You rated:");
							for(int x = 0; x < history.indexOf(index).getRating(); x++) {
								out.println("<i class='material-icons'>star_border</i>");
							} 
							out.println("</div>");
							out.println("<div class='comment'>You commented: " + history.indexOf(index).getComments() + "</div>");
							index++;
                        }
					}
					out.println("</div>");
					out.println("</div>");
                %>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
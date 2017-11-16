<%-- 
    Document   : HistoryDriver
    Created on : Nov 7, 2017, 7:53:26 PM
    Author     : Iftitakhul Zakiyah
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="javax.xml.ws.Service"%>
<%@page import="javax.xml.namespace.QName"%>
<%@page import="java.net.URL"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%--<%@page import="java.beans.Statement"%>--%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="ojekservice.HistoryService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>History</title>
<link rel="stylesheet" type="text/css" href="../styles/profile.css">
<link rel="stylesheet" type="text/css" href="../styles/history.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script type="text/javascript" src="../js/history.js"></script>
<style type="text/css">
	.tabitem3 {
		background-color: white;
	}
</style>
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
					<div class="tabitem5"><a href="history-order.php?id_active=<?php echo $id ?>">MY PREVIOUS ORDER</a></div>
					<div class="tabitem4"><a href="history-driver.php?id_active=<?php echo $id ?>">DRIVER HISTORY</a></div>
				</div>
				<%
                    URL url = new URL ("http://localhost:8085/OjekService/HistoryService?wsdl");
                    QName qname = new QName("http://historyservice/","HistoryService");
                    QName qname_port = new QName("http://historyservice/","HistoryServicePort");
                    Service service = Service.create(url, qname);
                    HistoryService history = service.getPort(qname_port, HistoryService.class);
                    Connection conn = DriverManager.getConnection(url);

                    //	HttpSession session = request.getSession();

                    int id = 1; //dummy

                    ArrayList<HistoryService> list = new ArrayList<HistoryService>();
                    list = history.getHistoryDriver(id);
                    
                    out.println("<div class='container' id='box1'>");
                    out.println("<img class='image' src='.$url_photo.'>");
                    out.println("<div class='konten'>");
                    int index = 0;
              
					if (history.size() > 0) {
                        while (index < history.size()) {
                        	out.println("<div class='date'>" + history.indexOf(index).getDate() + " </div>");
							out.println("<div class='name'>" + history.indexOf(index).getNama() + "</div>");
							out.println("<div class='path'>" + history.indexOf(index).getDate() + "-" + history.indexOf(index).getDestination()+"</div>");
							out.println("<button class='button' onclick='hideContainer("+ index +")'>HIDE</button>");
							out.println("<div class='rating'>gave " + rs.getInt('rating_num') + " stars for this order</div>");
							out.println("<div class='comment'>and left comment: " + rs.getString('comments') + "</div>");
							index++;
                        }
					} else {
						out.println("Bukan driver");
                    }
					out.println("</div>");
					out.println("</div>");
                %>
			</div>
		</div>
	</body>
</html>
    </body>
</html>

<%-- 
    Document   : SelectDriver
    Created on : Nov 7, 2017, 7:54:28 PM
    Author     : Iftitakhul Zakiyah
--%>

<%@page import="java.util.Properties"%>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>
            Select a Driver
	</title>
	<link rel="stylesheet" type="text/css" href="../styles/SelectDriver.css">
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
                        <div class="username">Hi, <% session.getAttribute("username"); %></div>
			<div class="logout">Logout</div>
                    </div>
		</div>
		<div class="tab">
                    <div class="tabitem1"><a href="http://localhost:8085/WebApp/pages/OrderOjek.jsp">ORDER</a></div>
                    <div class="tabitem2"><a href="http://localhost:8085/WebApp/pages/HistoryOrder.jsp">HISTORY</a></div>
                    <div class="tabitem3"><a href="http://localhost:8085/WebApp/pages/Profile.jsp">MY PROFILE</a></div>
                </div>
                <div class="menu-container">
                    <div class="menu-title">MAKE AN ORDER</div>
		</div>
		<div class="content-container">
                    <div class="tab-order">
                        <div class="select-dest">
                            <div class="number">1</div>	
                            <a href="http://localhost:8085/WebApp/pages/OrderOjek.jsp">Select Destination</a>
			</div>
			<div class="padding-tab"></div>
			<div class="select-driver">
                            <div class="number">2</div>
                            <a href="http://localhost:8085/WebApp/pages/SelectDriver.jsp">Select a Driver</a>
                        </div>
			<div class="padding-tab"></div>
                        <div class="complete">
                            <div class="number">3</div>
                            <a href="http://localhost:8085/WebApp/pages/CompleteOrder.jsp">Complete your order</a>
                        </div>
                    </div>
                    <div class="pref-drivers">
                        <div class="text-pref-drivers">PREFERRED DRIVERS</div>
                        <div class="pref">
                            <% 
                                Statement stmt1 = null;
                                Statement stmt2 = null;
                                String URL1 = "jdbc:msql://sql12.freemysqlhosting.net:3306/sql12203267";
                                String user1 = "sql12203267";
                                String pass1 = "7hzG8BMyYV";
                                String URL2 = "jdbc:msql://sql12.freemysqlhosting.net:3306/sql12203261";
                                String user2 = "sql12203261";
                                String pass2 = "Hq5tyJRtPn";
                                Properties connectionProps = new Properties();
                                connectionProps.put("user", user1);
                                connectionProps.put("password", pass1);
                                Connection conn1 = DriverManager.getConnection(URL1, connectionProps);
                                stmt1 = conn1.createStatement();
                                
                                if(session.getAttribute("pref-driver")==""){
                                    out.write("<span class='no-drivers'><div class='no-drivers'>Nothing to display :(</div></span>");
                                }
                                else{
                                    connectionProps.put("user", user2);
                                    connectionProps.put("password", pass2);
                                    Connection conn2 = DriverManager.getConnection(URL1, connectionProps);
                                    String SQL = "SELECT * FROM identity-signup WHERE nama_lengkap="+session.getAttribute("pref-driver")+"AND isDriver=0";    
                                    ResultSet res = stmt1.executeQuery(SQL);
                                    stmt2 = conn2.createStatement();
                                    String avg = "SELECT user_id, AVG(rating_num) AS rating_avg FROM rating WHERE user_id = $id_pref_driver GROUP BY user_id";
                                    String cnt = "SELECT user_id, COUNT(rating_num) AS rating_count FROM rating WHERE user_id = $id_pref_driver GROUP BY user_id";
                                    ResultSet resavg = stmt2.executeQuery(avg);
                                    ResultSet rescnt = stmt2.executeQuery(cnt);
                                    if(res.next()){
                                        out.write("<span class='content-foto'>");
                                        out.write("<div class='content-foto'>");
                                        out.write("<img class = 'img-circle' src=" + " height='100px' width='100px'>");
                                        out.write("<span class='content-desc'>");
                                        out.write("<div class='content-desc'>");
                                        out.write("<span class='fullname'>");
                                        out.write("<div class='fullname'>" + res.getString("name") + "</div></span><span class='rating'><div class='rating'><span class='star'><div class='star'><img class = 'img-star' src='../assets/icon/star-fill.png' height='10px' width='10px'></div></span><span class='rating-avg'><div class='rating-avg'>");
                                        out.write(resavg.getInt("rating_avg"));
                                        out.write(" (");
                                        out.write(rescnt.getInt("rating_count"));
                                        out.write(" voters)");
                                        out.write("</div></span></div></span><span class='button-choose'><div class='button-choose'><button class='button' onClick='choose()'>I Choose You!</button></div></span></div></span></div></span>");
                                    }
                                    else{
                                        out.write("<span class='no-drivers'><div class='no-drivers'>Nothing to display :(</div></span>");
                                    }
                                conn1.close();
                                conn2.close();
                                }
                            %>
                        </div>
                    </div>
                    <div class="list-drivers">
                        <div class="text-list-drivers">OTHER DRIVERS</div>
                        <div class="list">
                            <% 
                                stmt1 = null;
                                stmt2 = null;
                                URL1 = "jdbc:msql://sql12.freemysqlhosting.net:3306/sql12203267";
                                user1 = "sql12203267";
                                pass1 = "7hzG8BMyYV";
                                URL2 = "jdbc:msql://sql12.freemysqlhosting.net:3306/sql12203261";
                                user2 = "sql12203261";
                                pass2 = "Hq5tyJRtPn";
                                connectionProps = new Properties();
                                connectionProps.put("user", user1);
                                connectionProps.put("password", pass1);
                                conn1 = DriverManager.getConnection(URL1, connectionProps);
                                stmt1 = conn1.createStatement();
                                
                                if(session.getAttribute("pref-driver")==""){
                                    out.write("<span class='no-drivers'><div class='no-drivers'>Nothing to display :(</div></span>");
                                }
                                else{
                                    connectionProps.put("user", user2);
                                    connectionProps.put("password", pass2);
                                    Connection conn2 = DriverManager.getConnection(URL1, connectionProps);
                                    String SQL = "SELECT * FROM identity-signup WHERE isDriver=0";    
                                    ResultSet res = stmt1.executeQuery(SQL);
                                    stmt2 = conn2.createStatement();
                                    String avg = "SELECT user_id, AVG(rating_num) AS rating_avg FROM rating GROUP BY user_id";
                                    String cnt = "SELECT user_id, COUNT(rating_num) AS rating_count FROM rating GROUP BY user_id";
                                    ResultSet resavg = stmt2.executeQuery(avg);
                                    ResultSet rescnt = stmt2.executeQuery(cnt);
                                    boolean chk = false;
                                    while(res.next()){
                                        chk = true;
                                        out.write("<span class='content-foto'>");
                                        out.write("<div class='content-foto'>");
                                        out.write("<img class = 'img-circle' src=" + " height='100px' width='100px'>");
                                        out.write("<span class='content-desc'>");
                                        out.write("<div class='content-desc'>");
                                        out.write("<span class='fullname'>");
                                        out.write("<div class='fullname'>" + res.getString("name") + "</div></span><span class='rating'><div class='rating'><span class='star'><div class='star'><img class = 'img-star' src='../assets/icon/star-fill.png' height='10px' width='10px'></div></span><span class='rating-avg'><div class='rating-avg'>");
                                        out.write(resavg.getInt("rating_avg"));
                                        out.write(" (");
                                        out.write(rescnt.getInt("rating_count"));
                                        out.write(" voters)");
                                        out.write("</div></span></div></span><span class='button-choose'><div class='button-choose'><button class='button' onClick='choose()'>I Choose You!</button></div></span></div></span></div></span>");
                                    }
                                    if(!chk){
                                        out.write("<span class='no-drivers'><div class='no-drivers'>Nothing to display :(</div></span>");
                                    }
                                conn1.close();
                                conn2.close();
                                }
                            %>
                        </div>
                    </div>
		</div>
            </div>
	</div>
	<script>
            function choose() {
                document.location.href = "complete-order.php?id_active=<?php echo $id ?>&id_driver=<?php echo $id_driver ?>&pick=<?php echo $pick ?>&dest=<?php echo $dest ?>";
            }
	</script>
    </body>
</html>

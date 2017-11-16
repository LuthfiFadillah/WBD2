<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <title>
            Order Ojek
	</title>
	<link rel="stylesheet" type="text/css" href="../styles/OrderOjek.css">
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
                    <form method="post" id="select-driver" action="http://localhost:8085/WebApp/pages/SelectDriver.jsp">
                        <div class="formBox">
                            <label class="formAttribute">Picking point</label>
                            <input type="text" name="picking-point" class="formFill" id="picking-point" required>
			</div>
			<div class="formBox">
                            <label class="formAttribute">Destination</label>
                            <input type="text" name="destination" class="formFill" id="destination" required>
			</div>
			<div class="formBox">
                            <label class="formAttribute">Preferred Driver</label>
                            <input type="text" name="pref-driver" class="formFill" placeholder="(optional)" id="pref-driver">
			</div>		
                    </form>
                    <div class="button-next">
                        <% 
                            String pp = request.getParameter("picking-point");
                            String dest = request.getParameter("destination");
                            String pref = request.getParameter("pref-driver");
                            session.setAttribute("picking-point", pp);
                            session.setAttribute("destination", dest);
                            session.setAttribute("pref-driver", pref);
                        %>
                        <button form="select-driver" type="submit" class="next" value="next">NEXT</button>
                    </div>
		</div>
            </div>
        </div>
    </body>
</html>

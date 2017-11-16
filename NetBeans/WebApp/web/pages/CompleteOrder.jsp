<%-- 
    Document   : CompleteOrder
    Created on : Nov 7, 2017, 7:51:55 PM
    Author     : Iftitakhul Zakiyah
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <title>
            Complete Order
	</title>
	<link rel="stylesheet" type="text/css" href="../styles/CompleteOrder.css">
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
                    <div class="head-content">HOW WAS IT?</div>
                    <div class="content">
                        <div class="content-foto">
                            <img class = "img-circle" src="" height="100px" width="100px">
			</div>
			<div class="content-username"></div>
			<div class="content-fullname"></div>
			<div class="content-rating">
                            <div class="star-unfill">
                                <img class = "img-star" id="img1" onclick="rating1()" src="../assets/icon/star-unfill.png">
                            </div>
                            <div class="star-unfill">
                                <img class = "img-star" id="img2" onclick="rating2()" src="../assets/icon/star-unfill.png">
                            </div>					
                            <div class="star-unfill">
                                <img class = "img-star" id="img3" onclick="rating3()" src="../assets/icon/star-unfill.png">
                            </div>					
                            <div class="star-unfill">
                                <img class = "img-star" id="img4" onclick="rating4()" src="../assets/icon/star-unfill.png">
                            </div>					
                            <div class="star-unfill">
                                <img class = "img-star" id="img5" onclick="rating5()" src="../assets/icon/star-unfill.png">
                            </div>					
			</div>
                    </div>
                    <form method="post" class="content-comment" id="content-comment" action="complete-handler">
                        <textarea name="comment" id="comment" class="comment" placeholder="Your comment..."></textarea>
                    </form>
                    <div class="button-complete">
                        <button type="submit" class="but-complete" form="content-comment">Complete Order</button>
                    </div>					
		</div>
            </div>
	</div>
    </body>
    <script type="text/javascript">
        function rating1() {
            document.getElementById("img1").src = "../assets/icon/star-fill.png";
            document.getElementById("img2").src = "../assets/icon/star-unfill.png";
            document.getElementById("img3").src = "../assets/icon/star-unfill.png";
            document.getElementById("img4").src = "../assets/icon/star-unfill.png";
            document.getElementById("img5").src = "../assets/icon/star-unfill.png";
            document.getElementById("content-comment").action = "../handlers/complete-handler.php?rating=1&driver_id=<?php echo $id_driver?>&user_id=<?php echo $id_user?>";
	}

	function rating2() {
            document.getElementById("img1").src = "../assets/icon/star-fill.png";
            document.getElementById("img2").src = "../assets/icon/star-fill.png";
            document.getElementById("img3").src = "../assets/icon/star-unfill.png";
            document.getElementById("img4").src = "../assets/icon/star-unfill.png";
            document.getElementById("img5").src = "../assets/icon/star-unfill.png";
            document.getElementById("content-comment").action = "../handlers/complete-handler.php?rating=2&driver_id=<?php echo $id_driver?>&user_id=<?php echo $id_user?>";			
	}

	function rating3() {
            document.getElementById("img1").src = "../assets/icon/star-fill.png";
            document.getElementById("img2").src = "../assets/icon/star-fill.png";
            document.getElementById("img3").src = "../assets/icon/star-fill.png";
            document.getElementById("img4").src = "../assets/icon/star-unfill.png";
            document.getElementById("img5").src = "../assets/icon/star-unfill.png";
            document.getElementById("content-comment").action = "../handlers/complete-handler.php?rating=3&driver_id=<?php echo $id_driver?>&user_id=<?php echo $id_user?>";			
	}

    	function rating4() {
            document.getElementById("img1").src = "../assets/icon/star-fill.png";
            document.getElementById("img2").src = "../assets/icon/star-fill.png";
            document.getElementById("img3").src = "../assets/icon/star-fill.png";
            document.getElementById("img4").src = "../assets/icon/star-fill.png";
            document.getElementById("img5").src = "../assets/icon/star-unfill.png";
            document.getElementById("content-comment").action = "../handlers/complete-handler.php?rating=4&driver_id=<?php echo $id_driver?>&user_id=<?php echo $id_user?>";			
	}

	function rating5() {
            document.getElementById("img1").src = "../assets/icon/star-fill.png";
            document.getElementById("img2").src = "../assets/icon/star-fill.png";
            document.getElementById("img3").src = "../assets/icon/star-fill.png";
            document.getElementById("img4").src = "../assets/icon/star-fill.png";
            document.getElementById("img5").src = "../assets/icon/star-fill.png";
            document.getElementById("content-comment").action = "../handlers/complete-handler.php?rating=5&driver_id=<?php echo $id_driver?>&user_id=<?php echo $id_user?>";			
	}
    </script>
</html>

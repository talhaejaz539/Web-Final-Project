<%@ page import="java.util.*" %>
<%@ page import="MyPack.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Reservation Form</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <%@ include file="/rsession.jsp" %>
    <div>
        <h1 style="text-align: center;"> HOTEL MANAGEMENT SYSTEM </h1>
    </div>
    <div>
        <h3 style="text-align: left;"> Welcome, <%= session.getAttribute("name") %>  </h3>
        <div>
            <form action="Controller" method="post">
                <input type="submit" name="action" value="Logout">
            </form>
        </div>
    </div>
    <div>
        <h2 style="text-align: center; margin-top: 12%;"> Add Reservation Form </h1>
    </div>
    <br>
    <div style="display: flex; justify-content: center">
        <form name="signup" action="Controller" method="post">
                <div> 
                    <label>Customer Name:</label>
                    <input type="text" placeholder="Customer Name" name="customername" required>
                </div> 
                <br>
                <div>
                    <label>ID Proof:</label>
                    <input type="text" placeholder="CNIC" name="idproof" required>
                </div>
                <br>
                <div>
                    <label>Contact No:</label>
                    <input type="text" placeholder="Contact Number" name="contactno" required>
                </div>
                <br>
                <div>
                    <label>Room Type:</label>
                    <% 
                        RoomDAO roomDAO = new RoomDAO(); 
                        String type[] = roomDAO.roomtype();
                    %>
                    <select name="type" required>
                        <option value=""></option>
                        <% for(int i=0; i<type.length; i++) { %>		
                            <option value=<%= type[i] %>><%= type[i] %></option>
                        <% } %>
                    </select>
                </div>
                <br>
                <div>
                    <label>Beds in Room:</label>
                    <%
                        int rooms[] = roomDAO.bedsinroom();
                    %>
                    <select name="bedsinroom" required>
                        <option value=""></option>
                        <% for(int i=0; i<rooms.length; i++) { %>		
                            <option value=<%= rooms[i] %>><%= rooms[i] %></option>
                        <% } %>
                    </select>
                </div>
                <br>
                <div>
                    <input type="submit" name="action" value="AddReservation">
                </div>
        </form>
    </div>
    <br>
    <div class="last">
        Go Back? <a href="rrerservation.jsp">Reservation Menu</a>
    </div>
    <% 
        String resemsg = (String)session.getAttribute("resemsg");
        if(resemsg != null  && !resemsg.isEmpty()) { 
            out.print("<script>");
            out.print("alert('Message: "+ resemsg+"')");
            out.print("</script>");
            session.removeAttribute("resemsg");
        } 
    %>
</body>
</html>
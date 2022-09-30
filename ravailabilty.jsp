<%@ page import="java.util.*" %>
<%@ page import="MyPack.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Room Availabilty</title>
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
            <form action="receptionist.jsp" method="post">
                <input type="submit" value="DashBoard">
            </form>
            <br>
            <form action="Controller" method="post">
                <input type="submit" name="action" value="Logout">
            </form>
        </div>
    </div>
    <div>
        <h2 style="text-align: center; margin-top: 12%;"> Availabilty Details </h1>
    </div>

    <% RoomDAO roomDAO = new RoomDAO(); 
        ArrayList<RoomInfo> rooms = roomDAO.roomAvailable(); %>

    <% if (rooms != null) { %>
        <h4 style="text-align: center;">All Rooms</h4>
        <table border="1" style="margin-bottom: 5%;">
        <thead><tr>
            <th>Room Type</th>
            <th>Beds in Room</th>
            <th>Room Number</th>
        </tr></thead>
            <tbody>
                <% for (RoomInfo room : rooms) { %>
                    <tr>
                        <td><%= room.getType() %></td>
                        <td><%= room.getNoofbeds() %></td>
                        <td><%= room.getNumber() %></td>
                    </tr>
                <% } %>
            </tbody></table>
        <% } else { %>
            <h4> No Rooms Available!</h4>
    <% } %>
    
    
</body>
</html>
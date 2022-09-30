<%@ page import="java.util.*" %>
<%@ page import="MyPack.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Room Details</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <%@ include file="/asession.jsp" %>
    <div>
        <h1 style="text-align: center;"> HOTEL MANAGEMENT SYSTEM </h1>
    </div>
    <div>
        <h3 style="text-align: left;"> Welcome, <%= session.getAttribute("name") %>  </h3>
        <div>
            <form action="aroom.jsp" method="post">
                <input type="submit" value="Room DashBoard">
            </form>
            <br>
            <form action="Controller" method="post">
                <input type="submit" name="action" value="Logout">
            </form>
        </div>
    </div>

    <% RoomDAO roomDAO = new RoomDAO(); 
        ArrayList<RoomInfo> rooms = roomDAO.showAllRooms(); %>
    
    
    <% if (rooms != null) { %>
        <h4 style="text-align: center;">All Rooms</h4>
        <table border="1" style="margin-bottom: 5%;">
        <thead><tr>
            <th>Room Type</th>
            <th>Beds in Room</th>
            <th>Room Number</th>  
            <th>Status</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr></thead>
            <tbody>
                <% for (RoomInfo room : rooms) { %>
                    <tr>
                        <td><%= room.getType() %></td>
                        <td><%= room.getNoofbeds() %></td>
                        <td><%= room.getNumber() %></td>
                        <td><%= room.getStatus() %></td>
                        <form action="Controller" method="post">
                            <td>
                                <input type="hidden" name="id" value=<%= room.getId() %>>
                                <label>Room Type:</label>
                                <input type="text" name="type" value=<%= room.getType() %>>
                                <label>Beds in Room:</label>
                                <input type="number" name="noofbeds" value=<%= room.getNoofbeds() %>>
                                <label>Room Number:</label>
                                <input type="number" name="number" value=<%= room.getNumber() %>>
                                <label>Status:</label>
                                <select name="status">
                                    <option value=<%= room.getStatus() %>></option>		
                                    <option value="Block">Block</option>
                                    <option value="Active">Active</option>
                                </select><br>
                                <input type="submit" name="action" value="EditRoom">
                            </td>
                            <td>
                                <input type="hidden" name="id" value=<%= room.getId() %>>
                                <input type="submit" name="action" value="DeleteRoom">
                            </td>
                        </form>
                    </tr>
                <% } %>
            </tbody></table>
        <% } else { %>
            <h4> No room registered!</h4>
    <% } %>
    <% 
        String umsg = (String)session.getAttribute("umsg");
        if(umsg != null  && !umsg.isEmpty()) { 
            out.print("<script>");
            out.print("alert('Message: "+ umsg +"')");
            out.print("</script>");
            session.removeAttribute("umsg");
        } 
    %>
    <% 
        String rsmsgs = (String)session.getAttribute("rsmsgs");
        if(rsmsgs != null  && !rsmsgs.isEmpty()) { 
            out.print("<script>");
            out.print("alert('Message: "+ rsmsgs +"')");
            out.print("</script>");
            session.removeAttribute("rsmsgs");
        } 
    %>
</body>
</html>
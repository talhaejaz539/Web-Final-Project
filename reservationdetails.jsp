<%@ page import="java.util.*" %>
<%@ page import="MyPack.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reservation Details</title>
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
            <form action="rrerservation.jsp" method="post">
                <input type="submit" value="Reservation DashBoard">
            </form>
            <br>
            <form action="Controller" method="post">
                <input type="submit" name="action" value="Logout">
            </form>
        </div>
    </div>

    <% ReservationDAO reservationDAO = new ReservationDAO(); 
        ArrayList<ReservationInfo> reservations = reservationDAO.showAllReservations(); %>
    
    
    <% if (reservations != null) { %>
        <h4 style="text-align: center;">All Reservations</h4>
        <table border="1" style="margin-bottom: 5%;">
        <thead><tr>
            <th>Customer Name</th>
            <th>ID Proof</th>
            <th>Conatct No</th> 
            <th>Status</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr></thead>
            <tbody>
                <% for (ReservationInfo reservation : reservations) { %>
                    <tr>
                        <td><%= reservation.getCustomerName() %></td>
                        <td><%= reservation.getIdProof() %></td>
                        <td><%= reservation.getContactno() %></td>
                        <td><%= reservation.getStatus() %></td>
                        <form action="Controller" method="post">
                            <td>
                                <input type="hidden" name="id" value=<%= reservation.getId() %>>
                                <label>Customer Name:</label>
                                <input type="text" name="customername" value=<%= reservation.getCustomerName() %>><br><br>
                                <label>ID Proof:</label>
                                <input type="text" name="idproof" value=<%= reservation.getIdProof() %>><br><br>
                                <label>Conatct Number:</label>
                                <input type="text" name="contactno" value=<%= reservation.getContactno() %>><br><br>
                                <input type="submit" name="action" value="EditReserve">
                                <td>
                                    <input type="hidden" name="id" value=<%= reservation.getId() %>>
                                    <input type="submit" name="action" value="DeleteReservation">
                                </td>
                            </td>
                        </form>
                    </tr>
                <% } %>
            </tbody></table>
        <% } else { %>
            <h4> No reservation</h4>
    <% } %>
    <% 
        String rserveupdatemsgs = (String)session.getAttribute("rserveupdatemsgs");
        if(rserveupdatemsgs != null  && !rserveupdatemsgs.isEmpty()) { 
            out.print("<script>");
            out.print("alert('Message: "+ rserveupdatemsgs +"')");
            out.print("</script>");
            session.removeAttribute("rserveupdatemsgs");
        } 
    %>
    <% 
        String deletenmsgssssrser = (String)session.getAttribute("deletenmsgssssrser");
        if(deletenmsgssssrser != null  && !deletenmsgssssrser.isEmpty()) { 
            out.print("<script>");
            out.print("alert('Message: "+ deletenmsgssssrser +"')");
            out.print("</script>");
            session.removeAttribute("deletenmsgssssrser");
        } 
    %>
</body>
</html>
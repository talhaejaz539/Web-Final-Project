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
    <%@ include file="/asession.jsp" %>
    <div>
        <h1 style="text-align: center;"> HOTEL MANAGEMENT SYSTEM </h1>
    </div>
    <div>
        <h3 style="text-align: left;"> Welcome, <%= session.getAttribute("name") %>  </h3>
        <div>
            <form action="admin.jsp" method="post">
                <input type="submit" value="DashBoard">
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
                                <input type="submit" name="action" value="BlockReserve">
                            </td>
                            <td>
                                <input type="hidden" name="id" value=<%= reservation.getId() %>>
                                <input type="submit" name="action" value="DeleteReserve">
                            </td>
                        </form>
                    </tr>
                <% } %>
            </tbody></table>
        <% } else { %>
            <h4> No reservation</h4>
    <% } %>
    <% 
        String blockmsgss = (String)session.getAttribute("blockmsgss");
        if(blockmsgss != null  && !blockmsgss.isEmpty()) { 
            out.print("<script>");
            out.print("alert('Message: "+ blockmsgss +"')");
            out.print("</script>");
            session.removeAttribute("blockmsgss");
        } 
    %>
    <% 
        String deletenmsgssss = (String)session.getAttribute("deletenmsgssss");
        if(deletenmsgssss != null  && !deletenmsgssss.isEmpty()) { 
            out.print("<script>");
            out.print("alert('Message: "+ deletenmsgssss +"')");
            out.print("</script>");
            session.removeAttribute("deletenmsgssss");
        } 
    %>
</body>
</html>
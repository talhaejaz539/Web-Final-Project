<%@ page import="java.util.*" %>
<%@ page import="MyPack.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Details</title>
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
            <form action="aperson.jsp" method="post">
                <input type="submit" value="Person DashBoard">
            </form>
            <br>
            <form action="Controller" method="post">
                <input type="submit" name="action" value="Logout">
            </form>
        </div>
    </div>

    <% PersonDAO personDAO = new PersonDAO(); 
        ArrayList<PersonInfo> persons = personDAO.showAllPerson(); %>
    
    
    <% if (persons != null) { %>
        <h4 style="text-align: center;">All Users</h4>
        <table border="1" style="margin-bottom: 5%;">
        <thead><tr>
            <th>Name</th>
            <th>Email</th>
            <th>Username</th>
            <th>Usertype</th>    
            <th>Status</th>
            <th>Block / Unblock</th>
            <th>Delete</th>
        </tr></thead>
            <tbody>
                <% for (PersonInfo person : persons) { %>
                    <tr>
                        <td><%= person.getName() %></td>
                        <td><%= person.getEmail() %></td>
                        <td><%= person.getUsername() %></td>
                        <td><%= person.getUsertype() %></td>
                        <td><%= person.getStatus() %></td>
                        <form action="Controller" method="post">
                            <td>
                                <input type="hidden" name="email" value=<%= person.getEmail() %>>
                                <input type="submit" name="action" value="Block">
                            </td>
                            <td>
                                <input type="hidden" name="email" value=<%= person.getEmail() %>>
                                <input type="submit" name="action" value="Delete">
                            </td>
                        </form>
                    </tr>
                <% } %>
            </tbody></table>
        <% } else { %>
            <h4> No user registered!</h4>
    <% } %>
    <% 
        String msg = (String)session.getAttribute("msg");
        if(msg != null  && !msg.isEmpty()) { 
            out.print("<script>");
            out.print("alert('Message: "+ msg +"')");
            out.print("</script>");
            session.removeAttribute("msg");
        } 
    %>
    <% 
        String msgs = (String)session.getAttribute("msgs");
        if(msgs != null  && !msgs.isEmpty()) { 
            out.print("<script>");
            out.print("alert('Message: "+ msgs +"')");
            out.print("</script>");
            session.removeAttribute("msgs");
        } 
    %>
</body>
</html>
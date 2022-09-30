<%@page session="true" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin DashBoard</title>
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
            <form action="Controller" method="post">
                <input type="submit" name="action" value="Logout">
            </form>
        </div>
    </div>

    <h3 style="margin-top: 15%; text-align: center; font-size: 22px;"> Admin Menu</h3>
    <br>
    <header>
        <div style="display: flex; justify-content: center">
                <a href="aperson.jsp">
                    Person        
                </a>
                
                <a href="aroom.jsp">
                    Room
                </a>

                <a href="areservation.jsp">
                    Reservation
                </a>
        </div>
    </header>
</body>
</html>
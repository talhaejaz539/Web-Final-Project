<%@page session="true" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Receptionist DashBoard</title>
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
    <h3 style="margin-top: 15%; text-align: center; font-size: 22px;"> Receptionist Menu </h3>
    <br>
    <header>
        <div style="display: flex; justify-content: center">
                <a href="rrerservation.jsp">
                    Reservation        
                </a>
                
                <a href="ravailabilty.jsp">
                    Check_Room_Availabilty
                </a>
        </div>
    </header>
</body>
</html>
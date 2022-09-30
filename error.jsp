<%@page isErrorPage="true" %> 
<%@page import = "java.sql.SQLException" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error</title>
</head>
<body>
    <div>
        <h1 style="text-align: center;"> HOTEL MANAGEMENT SYSTEM </h1>
    </div>
    <div style="margin-top: 15%; display: flex; justify-content: center">
        <header>
            <h1>404 Error Page</h3>
            <h3>
                <% if (exception instanceof SQLException) { %>
                    SQL Exception Occur
                <% } else if (exception instanceof ClassNotFoundException) { %>
                    Class Not Found Exception Occur
                <% } else %>
                    Exception occur while connecting with the database
                <% } %>
            </h3>

            <h3>The Error Message was <%= exception.getMessage() %> </h3>
            <h3 > Please Try Again! </h3>
            
            <h3> <a href="Controller?action=Login" > Login </a> </h3>

        </header>
    </div>
</body>
</html>
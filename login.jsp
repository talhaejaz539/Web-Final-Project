<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <%
        if(session.getAttribute("name") != null && (int)session.getAttribute("usertype") == 0) {
            response.sendRedirect("admin.jsp");
        }
        else if(session.getAttribute("name") != null && (int)session.getAttribute("usertype") == 1) {
            response.sendRedirect("receptionist.jsp");
        }
    %>
    <div>
        <h1 style="text-align: center;"> HOTEL MANAGEMENT SYSTEM </h1>
    </div>
    <div>
        <h2 style="text-align: center; margin-top: 12%;"> Login Form </h1>
    </div>
    <div style="display: flex; justify-content: center;">
        <form action="Controller" method="post">
                <div>
                    <label>Username:</label>
                    <input type="text" placeholder="Username" name="username" required>
                </div>
                <br>
                <div>
                    <label>Password:</label>
                    <input type="password" placeholder="Password" name="password" required>
                </div>
                <br>
                <div>
                    <label>Login As:</label>
                    <select name="usertype" required>
                        <option value=""></option>		
                        <option value="Admin">Admin</option>
                        <option value="Receptionist">Receptionist</option>
                    </select>
                </div>
                <br>
                <div style="display: flex; text-align: center;">
                    <input type="submit" name="action" value="Login">
                </div>
        </form>
    </div>
    <br>
    <div class="last">
        Go Back? <a href="index.jsp">Home</a>
    </div>
    <% 
        String errMessage = (String)session.getAttribute("errMessage");
        if(errMessage!=null  && !errMessage.isEmpty()) { 
            out.print("<script>");
            out.print("alert('Message: "+ errMessage+"')");
            out.print("</script>");
            session.removeAttribute("errMessage");
        } 
    %>
</body>
</html>
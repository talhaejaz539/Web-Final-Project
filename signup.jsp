<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SignUp Form</title>
    <link rel="stylesheet" href="styles.css">
    <script language="JavaScript" type="text/javaScript">
        function validate() {
            var flag = 1;

            if(document.signup.password.value != document.signup.confirm_password.value)	{
			
                document.getElementById('confirm_password').innerHTML = "Password and Confirm Password doesn't match!";
                document.signup.confirm_password.focus();
                flag = -1
	        }

            else {
                document.getElementById('confirm_password').innerHTML = "";
            }

            if (flag==1) 
		        return true
	        else
		        return false
        }
    </script>
</head>
<body>
    <%@ include file="/asession.jsp" %>
    <div>
        <h1 style="text-align: center;"> HOTEL MANAGEMENT SYSTEM </h1>
    </div>
    <div>
        <h2 style="text-align: center; margin-top: 12%;"> SignUp Form </h1>
    </div>
    <br>
    <div style="display: flex; justify-content: center">
        <form name="signup" action="Controller" method="post">
                <div> 
                    <label>Name:</label>
                    <input type="text" placeholder="Name" name="name" required>
                </div> 
                <br>
                <div>
                    <label>Email:</label>
                    <input type="email" placeholder="Email" name="email" required>
                </div>
                <br>
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
                    <label>Confirm Password:</label>
                    <input type="password" placeholder="Password" name="confirm_password" onfocusout="return validate()" required>
                    <div id="confirm_password" style="color: red; float:right;"></div>
                </div>
                <br>
                <div>
                    <label>Registered As:</label>
                    <select name="usertype" required>
                        <option value=""></option>		
                        <option value="Admin">Admin</option>
                        <option value="Receptionist">Receptionist</option>
                    </select>
                </div>
                <br>
                <div>
                    <input type="submit" name="action" value="SignUp">
                </div>
        </form>
    </div>
    <br>
    <div class="last">
        Go Back? <a href="aperson.jsp">Person Menu</a>
    </div>
    <% 
        String Message = (String)session.getAttribute("Message");
        if(Message != null  && !Message.isEmpty()) { 
            out.print("<script>");
            out.print("alert('Message: "+ Message+"')");
            out.print("</script>");
            session.removeAttribute("Message");
        } 
    %>
</body>
</html>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Room Form</title>
    <link rel="stylesheet" href="styles.css">
    <!-- <script language="JavaScript" type="text/javaScript">
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
    </script> -->
</head>
<body>
    <%@ include file="/asession.jsp" %>
    <div>
        <h1 style="text-align: center;"> HOTEL MANAGEMENT SYSTEM </h1>
    </div>
    <div>
        <h2 style="text-align: center; margin-top: 12%;"> Add Room Form </h1>
    </div>
    <br>
    <div style="display: flex; justify-content: center">
        <form name="signup" action="Controller" method="post">
                <div> 
                    <label>Room Type:</label>
                    <input type="text" placeholder="Room Type" name="type" required>
                </div> 
                <br>
                <div>
                    <label>Beds in Room:</label>
                    <input type="number" placeholder="Beds" name="noofbeds" required>
                </div>
                <br>
                <div>
                    <label>Room Number:</label>
                    <input type="number" placeholder="Room Number" name="number" required>
                </div>
                <br>
                <!-- <div>
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
                <br> -->
                <div>
                    <input type="submit" name="action" value="AddRoom">
                </div>
        </form>
    </div>
    <br>
    <div class="last">
        Go Back? <a href="aroom.jsp">Room Menu</a>
    </div>
    <% 
        String rmsg = (String)session.getAttribute("rmsg");
        if(rmsg != null  && !rmsg.isEmpty()) { 
            out.print("<script>");
            out.print("alert('Message: "+ rmsg +"')");
            out.print("</script>");
            session.removeAttribute("rmsg");
        } 
    %>
</body>
</html>
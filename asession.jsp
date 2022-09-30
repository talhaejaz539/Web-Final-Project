<% 
    if(session.getAttribute("name") == null) {
        String message="Please login first!";
        request.getSession().setAttribute("errMessage", message);
        response.sendRedirect("login.jsp");
    }
    else if((int)session.getAttribute("usertype") != 0) {
        String message="You cannot access this page!";
        request.getSession().setAttribute("errMessage", message);
        response.sendRedirect("login.jsp");
    }
    if(session.getAttribute("errMessage") != null) {
        out.print("<script>");
        out.print("alert('Message: "+ session.getAttribute("message")+"')");
        out.print("</script>");
        session.removeAttribute("message");
    }
%>
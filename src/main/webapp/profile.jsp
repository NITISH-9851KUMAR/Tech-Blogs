<%--
  Created by IntelliJ IDEA.
  User: Nitish Kumar
  Date: 18-11-2025
  Time: 14:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="entities.User" %>
<%@ page errorPage="error-page.jsp" %>
<%
    User user= (User) session.getAttribute("CurrentUser");
    if (user == null) {
        response.sendRedirect("login-page.jsp");
    }
%>
<html>
<head>
    <title>Profile Page</title>
</head>
<body>

<%= user.getUser_name() %> <br>
<%= user.getPassword() %> <br>
<%= user.getBlog_date() %>

</body>
</html>

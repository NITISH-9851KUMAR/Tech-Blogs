<%--
  Created by IntelliJ IDEA.
  User: Nitish
  Date: 10-10-2025
  Time: 16:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="entities.Message" %>
<html>
<head>
    <title>Login Page</title>
    <%@include file="all_css_js.jsp" %>
</head>
<body>

<%--include navbar--%>
<%@include file="navbar.jsp" %>
<%
    // It will execute when New user Register, email and password will show in login input filed
    // In First Time it will not shows
    String user_email = (String) session.getAttribute("email");
    String user_pass = (String) session.getAttribute("pass");
%>

<main class="d-flex align-items-center primary-background" style="height: 100vh">
    <div class="container">

        <div class="row">
            <div class="col-md-4 offset-md-4">
                <div class="card">
                    <div class="card-header text-center">
                        <span class="fa fa-user-circle-o fa-3x"></span>
                        <h3>Login here</h3>
                    </div>

                    <!-- Java Code -->
                    <%
                        Message message = (Message) session.getAttribute("message");
                        if (message != null) {
                    %>
                    <div class="alert alert-danger" role="alert">
                        <%= message.getMessage() %>
                    </div>
                    <%
                            session.removeAttribute("message");
                        }
                    %>

                    <div class="card-body">
                        <form action="login-servlet" method="post" >
                            <div class="form-group">
                                <label for="exampleInputUserName">Email Address</label>
                                <input name="email" placeholder="Enter Email Address" type="email" required
                                       value="<%=(user_email!= null ? user_email : "")%>"
                                       class="form-control" Id="exampleInputUserName" aria-describedby="emailHelp">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Password</label>
                                <input name="password" type="password" placeholder="Enter Password" required
                                       value="<%= (user_pass!=null ?user_pass : "") %>"
                                       class="form-control" Id="exampleInputPassword1">
                            </div>

                            <!-- If user refresh site then it will be removed -->
                            <%
                                session.removeAttribute("email");
                                session.removeAttribute("pass");
                            %>

                            <div class="container text-center">
                                <button type="submit" class="btn btn-primary align-items-center">Login</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

    </div><!-- Container Div -->
</main>

</body>
</html>

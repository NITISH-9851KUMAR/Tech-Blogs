<%--
  Created by IntelliJ IDEA.
  User: Nitish
  Date: 10-10-2025
  Time: 16:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login Page</title>
    <%@include file="all_css_js.jsp" %>
</head>
<body>

<%--include navbar--%>
<%@include file="navbar.jsp"%>

<main class="d-flex align-items-center primary-background" style="height: 80vh">
    <div class="container">
        <div class="row">
            <div class="col-md-4 offset-md-4">

                <div class="card">

                    <div class="card-header text-center">
                        <span class="fa fa-user-circle-o fa-3x"></span>
                        <h3>Login here</h3>
                    </div>

                    <div class="card-body">
                        <form method="post" action="login">
                            <div class="form-group">
                                <label for="exampleInputUserName">User Name</label>
                                <input name="email" placeholder="Enter User Name" type="text" required class="form-control" id="exampleInputUserName" aria-describedby="emailHelp">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Password</label>
                                <input name="password" type="password" placeholder="Enter Password" required  class="form-control" id="exampleInputPassword1">
                            </div>
                            <button type="submit" class="btn btn-primary align-items-center">Login</button>
                        </form>
                    </div>
                </div>

            </div>
        </div>
    </div>
</main>

</body>
</html>

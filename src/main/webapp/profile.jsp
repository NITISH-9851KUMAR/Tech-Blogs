<%--
  Created by IntelliJ IDEA.
  User: Nitish Kumar
  Date: 18-11-2025
  Time: 14:45
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="all_css_js.jsp" %>
<%@ page import="entities.User" %>
<%@ page isErrorPage="true" %>

<%
    User user = (User) session.getAttribute("CurrentUser");
    if (user == null) {
        response.sendRedirect("login-page.jsp");
        return;
    }
%>

<html>
<head>
    <title>Profile Page</title>

    <!-- Bootstrap 4 CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
          integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
          crossorigin="anonymous">

</head>
<body>

<!-- Navbar Code -->
<nav class="navbar navbar-expand-lg navbar-dark primary-background">
    <a class="navbar-brand" href="index.jsp">
        <span class="fa fa-snowflake-o"></span> TechBlog
    </a>

    <button class="navbar-toggler" type="button" data-toggle="collapse"
            data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false"
            aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">

        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="#">
                    <span class="fa fa-star"></span> Home
                </a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="#">
                    <span class="fa fa-universal-access"></span> Link
                </a>
            </li>

            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
                   role="button" data-toggle="dropdown">
                    <span class="fa fa-bomb"></span> Categories
                </a>

                <div class="dropdown-menu">
                    <a class="dropdown-item" href="#">C Programming</a>
                    <a class="dropdown-item" href="#">Java Programming</a>
                    <a class="dropdown-item" href="#">Python Programming</a>
                </div>
            </li>

            <li class="nav-item">
                <a class="nav-link Enable" href="#">
                    <span class="fa fa-address-book"></span> Contact Us
                </a>
            </li>
        </ul>

        <ul class="navbar-nav mr-right">

            <!-- Profile Name -->
            <li class="nav-item">
                <a class="btn text-white da" data-toggle="modal" data-target="#profile-model">
                    <span class="fa fa-user-circle"></span>
                    <%= user.getUser_name() %>
                </a>
            </li>
            <!-- Logout -->
            <li class="nav-item">
                <a href="logout-servlet" class="btn text-white">
                    <span class="fa fa-sign-out"></span> Logout
                </a>
            </li>

        </ul>

    </div>
</nav>
<!-- Navbar End -->

<!-- Modal Code -->
<!-- Button trigger modal -->

<!-- Modal -->
<div class="modal fade" id="profile-model" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header primary-background text-white text-center">
                <h5 class="modal-title" id="exampleModalLabel">TechBlog</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="container text-center">
                    <img src="img/pics.jpg" alt="" style="height: 100px; width: 100px">
                    <h5><%= user.getUser_name() %></h5>

                    <table class="table">
                        <tbody>
                        <tr>
                            <th scope="row">Email Id</th>
                            <td> <%= user.getEmail()%></td>
                        </tr>
                        <tr>
                            <th scope="row">Registration Date</th>
                            <td><%=user.getBlog_date()%></td>
                        </tr>
                        <tr>
                            <th scope="row">Gender</th>
                            <td><%=user.getGender()%></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Edit Profile</button>
            </div>
        </div>
    </div>
</div>
<!-- Modal End -->

<!-- Bootstrap + jQuery -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
        crossorigin="anonymous"></script>

</body>
</html>

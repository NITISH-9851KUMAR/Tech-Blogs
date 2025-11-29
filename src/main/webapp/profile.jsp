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
<%@ page import="java.sql.*" %>
<%@ page import="helper.ConnectionProvider" %>
<%@ page import="entities.Message" %>

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
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


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
                    <img src="<%=request.getContextPath() %>/img/<%=user.getImage() %>"
                         width="150" height="150"
                         style="object-fit: cover; border-radius: 50%;">


                    <h5><%= user.getUser_name()%>
                    </h5>

                    <!-- Table under the div -->
                    <div id="profile-details">
                        <table class="table">
                            <tbody>
                            <tr>
                                <% // Get user id from the table directly
                                    Connection connection = ConnectionProvider.getConnection();
                                    Statement statement = connection.createStatement();
                                    String email = user.getEmail();
                                    String sql = String.format("SELECT id FROM user_details WHERE email= '%s'", email);
                                    ResultSet rSet = statement.executeQuery(sql);
                                    int user_id = 0;
                                    if (rSet.next()) {
                                        user_id = rSet.getInt("id");
                                    }
                                    user.setId(user_id);
                                %>

                                <th scope="row">ID</th>
                                <td><%= user_id%>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">Email Id</th>
                                <td><%= user.getEmail()%>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">Registration Date</th>
                                <td><%=user.getBlog_date()%>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">Gender</th>
                                <td><%=user.getGender().toUpperCase()%>
                                </td>
                            </tr>

                            </tbody>
                        </table>
                    </div>

                    <!-- Profile Edit Div -->
                    <div id="profile-edit" style="display: none">
                        <h4 class="mt-2 " style="color: red;">Please Edit Carefully</h4>
                        <!-- Edit table Details -->
                        <form action="edit-servlet" method="post" enctype="multipart/form-data">
                            <!-- Write Code from There Now we will edit -->
                            <!-- enctype tells the form it contains multi type data like text, email, password, image -->
                            <input type="hidden" name="u_id" value="<%=user_id%>">

                            <table class="table">

                                <th scope="row">ID</th>
                                <td><%= user_id %>
                                </td>
                                </tr>

                                <tr>
                                    <th scope="row">Name</th>
                                    <td><input class="form-control" type="text" name="u_name"
                                               value="<%= user.getUser_name()%>">
                                    </td>
                                </tr>

                                <tr>
                                    <th scope="row">Email Id</th>
                                    <td><input class="form-control" type="email" name="u_email"
                                               value="<%= user.getEmail()%>">
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">Registration Date</th> <!-- Non editable -->
                                    <td><%=user.getBlog_date()%>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">Gender</th>
                                    <td><input class="form-control" type="text" name="u_gender"
                                               value="<%=user.getGender().toUpperCase()%>">
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">Password</th>
                                    <td><input class="form-control" type="password" name="u_password"
                                               value="<%=user.getPassword()%>">
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">Profile Pic</th>
                                    <td><input class="form-control" type="file" name="u_pic"></td>
                                </tr>
                            </table>

                            <!-- Submit Button -->
                            <div class="container">
                                <button type="submit" class="btn btn-outline-primary">Save</button>
                            </div>

                        </form>
                    </div>

                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button id="edit-profile-button" type="button" class="btn btn-primary">Edit Profile</button>
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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


<script>
    document.addEventListener("DOMContentLoaded", () => {
        let editStatus = false;
        $('#edit-profile-button').click(function () {
            if (editStatus == false) {
                $("#profile-details").hide();
                $("#profile-edit").show();
                editStatus = true;
                $(this).text("Back");
            } else {
                $("#profile-details").show();
                $("#profile-edit").hide();
                editStatus = false;
                $(this).text("Edit");
            }

        });

    });
</script>

</body>
</html>

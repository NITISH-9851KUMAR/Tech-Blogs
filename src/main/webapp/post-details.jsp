<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page errorPage="error-page.jsp" %>

<%@ page import="entities.User" %>
<%@ page import="entities.Post" %>
<%@ page import="dao.PostDao" %>
<%@ page import="dao.CategoryDao" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="entities.Category" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="dao.LikeDao" %>
<%@include file="all_css_js.jsp" %>
<%
    User user = (User) session.getAttribute("CurrentUser");
    if (user == null) {
        response.sendRedirect("login-page.jsp");
        return;
    }
    int pId = Integer.parseInt(request.getParameter("post_id"));
    Post post = PostDao.allPostByPostId(pId);
%>
<html>
<head>
    <title><%=post.getpTitle()%>
    </title>
    <style>
        body{
            background: url("img/images.jpg");
            background-size: cover;
            background-attachment: fixed;
        }
    </style>

</head>
<body>
<!-- Navbar code -->
<nav class="navbar navbar-expand-lg navbar-dark primary-background">
    <a class="navbar-brand" href="index.jsp"> <span class="  fa fa-snowflake-o"></span>TechBlog</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" Id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="profile.jsp"> <span class="fa fa-star"></span> Home <span
                        class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#"> <span class="fa fa-universal-access"></span> Link</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" Id="navbarDropdown" role="button" data-toggle="dropdown"
                   aria-haspopup="true" aria-expanded="false">
                    <span class="fa fa-bomb"></span> Categories
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="#">C Programming</a>
                    <a class="dropdown-item" href="#">Java Programming</a>
                    <a class="dropdown-item" href="#">Python Programming</a>

                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link Enable" href="#"> <span class="fa fa-address-book"></span> Contact Us</a>
            </li>
            <li class="nav-item mr-3">
                <a href="#" class="btn text-white" data-toggle="modal"
                   data-target="#add-post"><span class="fa fa-paper-plane"></span> Do Post</a>
            </li>

            <!-- PUSH NEXT ITEMS TO RIGHT -->
            <li class="ml-auto"></li>

            <li class="nav-item ml-3">
                <% // Java Code Fetching User Name
                    User user1 = (User) session.getAttribute("CurrentUser");
                    String name = user1.getUser_name();
                %>
                <a href="#" class="btn text-white form-control ml-3" data-toggle="modal"
                   data-target="#profile-model"><span class="fa fa-user"></span> <%=name%>
                </a>
            </li>

            <li class="nav-item ml-3">
                <a href="logout-servlet" class="btn text-white form-control my-2 my-sm-0">
                    <span class="fa fa-sign-out"></span> Logout</a>
            </li>

        </ul>

    </div>
</nav>

<%--    Show post Details--%>
<div class="container">
    <div class="row my-2">
        <div class="col-md-6 offset-md-4">

            <div class="card">

                <div class="card-header">
                    <h4><%=post.getpTitle()%>
                    </h4>
                </div>

                <div class="card-body">
                    <img class="card-img-top" src="img/<%=post.getpPic()%>" alt="">
                    <div class=" my-3 container row">
                        <div><%=post.getpDate()%>
                        </div>
                    </div>
                    <p><%=post.getpContent()%>
                    </p>
                    <pre><%=post.getpCode()%></pre>
                </div>

                <div class="card-footer primary-background">
                    <!-- Like Button -->
                    <a href="#" onclick="doLike(<%=post.getpId()%>, <%=user.getUserId()%>)"
                       class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"></i><span class="like-counter"> <%=LikeDao.countLikeOnPost(post.getpId())%></span></a>
                    <!-- Comment Button -->
                    <a href="#" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"></i><span> 20</span></a>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<!-- Profile-View Model Start-->
<div class="modal fade" Id="profile-model" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header primary-background text-white text-center">
                <h5 class="modal-title">TechBlog</h5>
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
                    <div userId="profile-details"> <!-- It will execute when we click on userName in profile page -->
                        <table class="table">
                            <tbody>
                            <tr>

                                <th scope="row">ID</th>
                                <td><%= user.getUserId()%>
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
                    <div Id="profile-edit" style="display: none">
                        <h4 class="mt-2 " style="color: red;">Please Edit Carefully</h4>
                        <!-- Edit table Details -->
                        <form action="edit-servlet" method="post" enctype="multipart/form-data">
                            <!-- Write Code from There Now we will edit -->
                            <!-- enctype tells the form it contains multi type data like text, email, password, image -->
                            <input type="hidden" name="u_id" value="<%=user.getUserId()%>">

                            <table class="table">

                                <th scope="row">ID</th>
                                <td><%= user.getUserId() %>
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
                <button Id="edit-profile-button" type="button" class="btn btn-primary">Edit Profile</button>
            </div>
        </div>
    </div>
</div>
<!-- Profile-View Model End -->

<!-- Do Post Modal Code Starts -->
<div class="modal fade" Id="add-post" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">

            <div class="modal-header">
                <h5 class="modal-title" Id="exampleModalLabel">Post Information</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form Id="add-post-form" action="doPostServlet" method="post" enctype="multipart/form-data">
                <!-- do post form -->
                <div class="modal-body">

                    <div class="form-group">
                        <select required class="form-control" name="cid">
                            <option selected disabled>---Select Categories--</option>
                            <%
                                CategoryDao categoryDao = new CategoryDao();
                                ArrayList<Category> list = categoryDao.getAllCategories();
                                for (Category category : list) {
                            %>
                            <option value="<%=category.getId()%>"><%= category.getName()%>
                            </option>
                            <%
                                }
                            %>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="post-title">Post Title</label>
                        <input name="postTitle" Id="post-title" type="text" required placeholder="Enter Post Title"
                               class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="post-content">Post Content</label>
                        <textarea name="postContent" class="form-control" Id="post-content"
                                  required placeholder="Enter Post Content"></textarea>
                    </div>
                    <div class="form-group">
                        <label for="post-code">Post Code</label>
                        <textarea name="postCode" class="form-control" Id="post-code"
                                  required placeholder="Enter Post Code( if any )"></textarea>
                    </div>
                    <div class="form-group">
                        <label for="post-pic">Post Pic</label>
                        <input required name="postPic" Id="post-pic" type="file" class="form-control">
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Post</button>
                </div>
            </form>
        </div>
    </div>
</div>
<%-- Do Post Modal End--%>

<!-- Java Script File -->
<!-- Add doLike js file It is used in line number 119 -->
<script src="js/doLike.js">
</script>
<script> <!-- Javascript file for add Post -->
document.getElementById("add-post-form").addEventListener("submit", function (e) {
    e.preventDefault();

    let form = new FormData(this); // It collects all form data

    fetch("doPostServlet", { // fetch method send data to the servlet url like "doPostServlet"
        method: "POST",
        body: form // It sends all form data to the doPostServlet
    })
        .then(response => { // if servlet send error message then it will execute
            // Check if servlet returned success or error status
            if (!response.ok) {
                return response.text().then(msg => {
                    throw new Error(msg);
                });
            }
            return response.text();
        })
        .then(data => {
            // SUCCESS SweetAlert
            Swal.fire({
                title: "Post Done Successfully",
                text: data,
                icon: "success"
            })
            //     .then(() => {
            //     window.location.href = "login-page.jsp"; // Redirect to login page
            // });
        })
        .catch(error => {
            // ERROR SweetAlert
            Swal.fire({
                icon: "error",
                title: "Post Failed",
                text: "Something went wrong. Please try again!"
            });
            console.error("Error:", error);
        });
});
</script>
</html>
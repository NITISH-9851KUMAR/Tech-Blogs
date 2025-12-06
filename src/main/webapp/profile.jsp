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
<%@ page import="dao.CategoryDao" %>
<%@ page import="dao.PostDao" %>
<%@ page import="entities.Post" %>
<%@ page import="java.util.List" %>

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
    <%@include file="all_css_js.jsp" %>
    <style>
        body{
            background: url("img/img.png");
            background-size: cover;
            background-attachment: fixed;
        }
    </style>
</head>
<body>

<!-- Navbar Code and Modal Code-->
<%@include file="profile-modal.jsp" %>
<!-- Navbar and Modal End -->

<!-- Java Code -->
<%
    Message message = (Message) session.getAttribute("message");
    if (message != null) {
%>
<div class="alert alert-danger" role="alert">
    <%= message.getMessage() %>
</div
<%
        session.removeAttribute("message");
    }
%>

<main>

    <div class="container">
        <div class="row mt-4">
            <%--                First Column--%>
            <div class="col-md-4">
                <%--                    categores--%>
                <div class="list-group">
                    <a href="#" onClick="getAllPost(0, this)" class="c-link list-group-item list-group-item-action active" aria-current="true">
                        All Post Category
                    </a>
                    <%
                        CategoryDao cDao = new CategoryDao();
                        ArrayList<Category> l = cDao.getAllCategories();
                        for (Category category : l) {
                    %>
                    <a href="#" onClick="getAllPost(<%=category.getId()%>, this)"
                       class="c-link list-group-item list-group-item-action"><%=category.getName()%>
                    </a>
                    <%
                        }
                    %>
                </div>
            </div>

            <%-- Second Column--%>
            <div class="col-md-8">
                <%-- Show All Post--%>
                    <div class="container text-center" id="loader">
                        <i class="fa fa-refresh fa-2x fa-spin"></i>
                        <h3 class="mt-2">Loading...</h3>
                    </div>

                    <div class="container-fluid" id="post-container">

                    </div>

            </div>
        </div>
    </div>

</main>



<!-- Bootstrap + jQuery -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
        crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


<script> // It will execute when user click on edit button in model
    <%@ include file="js/profileJs.js"%> // This program is store in js file
</script>

<script>

    function getAllPost(catId, reference) {
        $("#loader").show();
        $("#post-container").hide();
        $(".c-link").removeClass('active') // Remove

        fetch("load-post.jsp?jsCid=" + encodeURIComponent(catId))
            .then(response => {
                if (!response.ok) {
                    throw new Error("New");
                }
                return response.text();
            })
            .then(data => {
                console.log(data)
                $("#loader").hide();
                $("#post-container").show();
                $('#post-container').html(data)
                $(reference).addClass('active')
            })
            .catch(error => {
                console.log("Error", error);
            })
    }

    document.addEventListener("DOMContentLoaded", function () {
        let allPost= $('.c-link')[0]
        getAllPost(0, allPost)
    })


</script>

</body>
</html>

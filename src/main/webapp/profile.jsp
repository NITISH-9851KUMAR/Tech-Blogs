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

    <!-- Bootstrap 4 CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
          integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
          crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


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
                    <a href="#" class="list-group-item list-group-item-action active" aria-current="true">
                        All Post Category
                    </a>
                    <%
                        CategoryDao cDao = new CategoryDao();
                        ArrayList<Category> l = cDao.getAllCategories();
                        for (Category c : l) { %>
                    <a href="#" class="list-group-item list-group-item-action"><%=c.getName()%>
                    </a>
                    <%
                        }
                    %>
                </div>
            </div>

            <%-- Second Column--%>
            <div class="col-md-8">
                <%-- Show All Post--%>
                <%
                    PostDao pDao = new PostDao();
                    ArrayList<Post> pList= pDao.allPost();
                    for (Post p : pList) { %>
                    <h5><%=p.getpContent()%></h5>
                <%
                    }
                %>
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

</body>
</html>

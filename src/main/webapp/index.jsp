<%--
  Created by IntelliJ IDEA.
  User: Nitis Kumar
  Date: 09-10-2025
  Time: 18:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home Page</title>
    <%--    css file --%>
    <%@include file="all_css_js.jsp"%>
    <style>
        .banner{
            clip-path: polygon(50% 0%, 100% 0, 100% 91%, 65% 94%, 33% 88%, 0 93%, 0 0);
        }
    </style>
</head>

<body>
<%--Include Navbar into Index.jsp Page--%>
<%@include file="navbar.jsp" %>


<%-- Banner of Index.jsp Page It shows After Navbar--%>
<div class="container-fluid p-0 m-0 banner">
    <div class="jumbotron">
        <div class="container">
            <h3 class="display-3">Welcome To TechBlog</h3>
            <p>Welcome of Technology Blog, World of Technology. A tech blog is a website that features regular updates
                about technology, such as software, hardware, artificial intelligence, and cybersecurity, often written
                n an informal and conversational style. TechCrunch is an example of a well-known tech blog that started
                in 2005 and covers the latest in high-tech and startup companies,
                eventually becoming a global online newspaper.</p>
            <button class="btn btn-primary"><span class="fa fa-address-book"></span> Start here free</button>
            <a href="login-page.jsp" class="btn btn-primary"><span class="fa fa-user-circle-o fa-spin"></span> Login !</a>
        </div>

    </div>
</div>


<%--card--%>
<div class="container">
    <div class="row mb-4"> <!-- First Row -->

        <div class="col-md-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Card title</h5>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the
                        card's content.</p>
                    <a href="#" class="btn btn-primary">Starts Here</a>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Card title</h5>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the
                        card's content.</p>
                    <a href="#" class="btn btn-primary">Starts Here</a>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Card title</h5>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the
                        card's content.</p>
                    <a href="#" class="btn btn-primary">Starts Here</a>
                </div>
            </div>
        </div>
    </div>

    <div class="row"> <!-- Second Row -->
        <div class="col-md-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Card title</h5>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the
                        card's content.</p>
                    <a href="#" class="btn btn-primary">Starts Here</a>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Card title</h5>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the
                        card's content.</p>
                    <a href="#" class="btn btn-primary">Starts Here</a>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Card title</h5>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the
                        card's content.</p>
                    <a href="#" class="btn btn-primary">Starts Here</a>
                </div>
            </div>
        </div>
    </div>

</div> <!-- Terminated Container div -->

</body>


</html>

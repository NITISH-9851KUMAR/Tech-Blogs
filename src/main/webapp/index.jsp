<%@ page import="entities.Post" %>
<%@ page import="dao.PostDao" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.LikeDao" %><%--
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

<%--show all post--%>
<div class="container mt-4">
    <div class="row g-4">

        <%
            List<Post> post = PostDao.allPost();
            if (post.size() == 0) {
        %>
        <h5 class="text-center text-muted">No Posts Are Available in This Category</h5>
        <%
                return;
            }

            for (Post allPost : post) {
        %>

        <div class="col-md-6 col-lg-4">
            <div class="card shadow-sm border-0 rounded-3 post-card" style="overflow: hidden;">

                <img class="card-img-top"
                     src="img/<%=allPost.getpPic()%>"
                     alt="Post Image"
                     style="height: 200px; object-fit: cover;">

                <div class="card-body">
                    <h5 class="card-title fw-bold">
                        <%= allPost.getpTitle() %>
                    </h5>

                    <p class="card-text text-muted" style="max-height: 90px; overflow: hidden;">
                        <%= allPost.getpContent() %>
                    </p>
                </div>

                <div class="card-footer bg-white text-center d-flex justify-content-around py-3">

                    <!-- Read More -->
                    <a href="post-details.jsp?post_id=<%=allPost.getpId()%>"
                       class="btn btn-sm btn-outline-primary">
                        Read More
                    </a>

                    <!-- Like Button -->
                    <a href="#" class="btn btn-sm btn-outline-success">
                        <i class="fa fa-thumbs-o-up"></i>
                        <span class="like-counter">
                            <%= LikeDao.countLikeOnPost(allPost.getpId()) %>
                        </span>
                    </a>

                    <!-- Comments -->
                    <a href="#" class="btn btn-sm btn-outline-secondary">
                        <i class="fa fa-commenting-o"></i>
                        <span>20</span>
                    </a>

                </div>
            </div>
        </div>

        <%
            }
        %>

    </div>
</div>

<%--<div class="container">--%>
<%--    <div class="row">--%>
<%--        <%--%>

<%--            List<Post> post = PostDao.allPost();--%>
<%--            if (post.size() == 0) {--%>
<%--        %>--%>
<%--        <h5 class="text-center">No Post Are Available in this Category</h5>--%>
<%--        <%--%>
<%--                return;--%>
<%--            }--%>

<%--            for (Post allPost : post) {--%>
<%--        %>--%>
<%--        <div class="col-md-6 mt-2">--%>
<%--            <div class="card">--%>
<%--                <img class="card-img-top" src="img/<%=allPost.getpPic()%>" alt="">--%>
<%--                <div class="card-body">--%>
<%--                    <b><%=allPost.getpTitle()%>--%>
<%--                    </b>--%>
<%--                    <p><%=allPost.getpContent()%>--%>
<%--                    </p>--%>
<%--            </div>--%>
<%--                <div class="card-footer bg-primary text-center">--%>
<%--                    <a href="post-details.jsp?post_id=<%=allPost.getpId()%>" class="btn btn-outline-light  btn-sm">Read--%>
<%--                        More...</a>--%>
<%--                    <!-- Like Button -->--%>
<%--                    <a href="#"--%>
<%--                       class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"></i><span--%>
<%--                            class="like-counter"> <%=LikeDao.countLikeOnPost(allPost.getpId())%></span></a>--%>
<%--                    <a href="#" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"></i><span> 20</span></a>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <%--%>
<%--            }--%>
<%--        %>--%>
<%--    </div>--%>
<%--</div>--%>
<!-- Show all Post -->

</body>
</html>


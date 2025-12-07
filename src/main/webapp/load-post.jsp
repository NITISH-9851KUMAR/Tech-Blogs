<%@ page import="dao.PostDao" %>
<%@ page import="entities.Post" %>
<%@ page import="entities.User" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.LikeDao" %>

<div class="row">
    <%
        Thread.sleep(1000);
        // Getting userId
        User user = (User) session.getAttribute("CurrentUser");
        int cat_Id = Integer.parseInt(request.getParameter("jsCid"));
        List<Post> post = null;
        PostDao postDao = new PostDao();
        if (cat_Id == 0) {
            post = postDao.allPost(user.getUserId());
        } else {
            post = postDao.allPostByCatId(cat_Id, user.getUserId());
        }
        if (post.size() == 0) {
    %>
    <h5 class="text-center">No Post Are Available in this Category</h5>
    <%
            return;
        }

        for (Post allPost : post) {
    %>
    <div class="col-md-6 mt-2">
        <div class="card">
            <img class="card-img-top" src="img/<%=allPost.getpPic()%>" alt="">
            <div class="card-body">
                <b><%=allPost.getpTitle()%>
                </b>
                <p><%=allPost.getpContent()%>
                </p>
            </div>
            <div class="card-footer bg-primary text-center">
                <a href="post-details.jsp?post_id=<%=allPost.getpId()%>" class="btn btn-outline-light  btn-sm">Read More...</a>
                <!-- Like Button -->
                <a href="#" onclick="doLike(<%=allPost.getpId()%>, <%=user.getUserId()%>)"
                   class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"></i><span class="like-counter"> <%=LikeDao.countLikeOnPost(allPost.getpId())%></span></a>
                <a href="#" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"></i><span> 20</span></a>
            </div>
        </div>
    </div>
    <%
        }
    %>
</div>

<script src="js/doLike.js"></script>

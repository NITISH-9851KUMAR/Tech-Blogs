<nav class="navbar navbar-expand-lg navbar-dark primary-background">
    <a class="navbar-brand" href="index.jsp"> <span class="  fa fa-snowflake-o"></span>TechBlog</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="#"> <span class="fa fa-star"></span> Home <span
                        class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#"> <span class="fa fa-universal-access"></span> Link</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
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
                   data-target="#add-post"><span class="fa fa-paper-plane" ></span> Do Post</a>
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




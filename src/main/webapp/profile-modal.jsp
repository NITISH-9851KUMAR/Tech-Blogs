<%@ page import="dao.CategoryDao" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="entities.Category" %>


<!-- It is Navbar of profile.jsp File -->
<%@include file="profile-navbar.jsp"%>
<!-- Terminated Navbar of profile.jsp File -->

<!-- Profile-View Model Start-->
<div class="modal fade" id="profile-model" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
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

<!-- Profile-View Model End -->

<!-- Do Post Modal Code Starts -->
<div class="modal fade" id="add-post" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">

            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Post Information</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form id="add-post-form" action="doPostServlet" method="post" enctype="multipart/form-data"> <!-- do post form -->
                <div class="modal-body">

                    <div class="form-group">
                        <select required class="form-control" name="cid">
                            <option selected disabled>---Select Categories--</option>
                            <%
                                CategoryDao categoryDao = new CategoryDao();
                                ArrayList<Category> list = categoryDao.getAllCategories();
                                for (Category category : list) {
                            %>
                            <option value="<%=category.getId()%>" ><%= category.getName()%>
                            </option>
                            <%
                                }
                            %>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="post-title">Post Title</label>
                        <input name="postTitle" id="post-title" type="text" placeholder="Enter Post Title"
                               class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="post-content">Post Content</label>
                        <textarea name="postContent" class="form-control" id="post-content"
                                  placeholder="Enter Post Content"></textarea>
                    </div>
                    <div class="form-group">
                        <label for="post-code">Post Code</label>
                        <textarea name="postCode" class="form-control" id="post-code"
                                  placeholder="Enter Post Code( if any )"></textarea>
                    </div>
                    <div class="form-group">
                        <label for="post-pic">Post Pic</label>
                        <input name="postPic" id="post-pic" type="file" class="form-control">
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

<!-- SweetAlert -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

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
                title: "Registration Failed",
                text: "Something went wrong. Please try again!"
            });
            console.error("Error:", error);
        });
});
</script>
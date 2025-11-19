<%--
  Created by IntelliJ IDEA.
  User: nitis
  Date: 11-10-2025
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Registration Page</title>
    <%@include file="all_css_js.jsp" %>
</head>
<body>

<%@include file="navbar.jsp" %>

<main class="primary-background p-3">
    <div class="container">
        <div class="col-md-5 offset-md-4">

            <div class="card">

                <div class="card-header text-center">
                    <span class="fa fa-user-plus fa-3x"></span> <br>
                    Register here
                </div>

                <div class="card-body">

                    <form id="form-part" method="post" action="signup-servlet">

                        <div class="form-group">
                            <label for="user_name">User Name</label>
                            <input type="text" placeholder="Enter User Name" name="user_name"
                                   class="form-control" id="user_name" required>
                        </div>

                        <div class="form-group">
                            <label for="exampleInputEmail1">Email address</label>
                            <input type="email" placeholder="Enter Email address" name="email"
                                   class="form-control" id="exampleInputEmail1" required>
                        </div>

                        <div class="form-group">
                            <label>Select Gender</label> <br>
                            <input type="radio" required value="male" name="gender"> Male
                            <input type="radio" required value="female" name="gender"> Female
                        </div>

                        <div class="form-group">
                            <label for="exampleInputPassword1">Password</label>
                            <input type="password" placeholder="Enter Your Password" required
                                   name="password" class="form-control" id="exampleInputPassword1">
                        </div>

                        <div class="container text-center">
                            <button type="submit" class="btn btn-primary text-center">Register</button>
                            <button type="reset" class="btn btn-danger ml-2">Reset</button>
                        </div>

                    </form>
                </div>

            </div>

        </div>
    </div>
</main>

<!-- SweetAlert -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script>
    document.getElementById("form-part").addEventListener("submit", function (e) {
        e.preventDefault(); 

        let form = new FormData(this);

        fetch("signup-servlet", {
            method: "POST",
            body: form
        })
            .then(response => {
                // Check if servlet returned success or error status
                if (!response.ok) {
                    return response.text().then(msg => { throw new Error(msg); });
                }
                return response.text();
            })
            .then(data => {
                // SUCCESS SweetAlert
                Swal.fire({
                    title: "Registration Successful",
                    text: data,
                    icon: "success"
                }).then(() => {
                    window.location.href = "login-page.jsp"; // Redirect to login page
                });
            })
            .catch(error => {
                // ERROR SweetAlert
                Swal.fire({
                    icon: "error",
                    title: "Registration Failed",
                    text: error.message
                });
                console.error("Error:", error);
            });
    });
</script>

</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: Nitish Kumar
  Date: 13-10-2025
  Time: 10:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isErrorPage="true" %>
<html>
<head>
    <title>Something Went Wrong</title>
    <%@include file="all_css_js.jsp"%>
</head>
<body>

<div class=" container text-center mt-3" style="width: 400px; height: 400px;">
    <img src="img/Error-Image.png" class="img-fluid" >
</div>

<div class="container text-center" >
    <h5>Sorry ! Something went wrong...</h5>
    <%= exception %> <br>
   <a href="index.jsp" class="btn primary-background btn-lg mt-2 text-white">Home Page</a>
</div>


</body>
</html>

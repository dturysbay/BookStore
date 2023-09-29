<%--
  Created by IntelliJ IDEA.
  User: dinmukhambetturysbay
  Date: 24.09.2023
  Time: 17:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
</head>
<body>
<%@include file="common/navbar.jsp"%>
   <div class="container mt-3">
       <div class="row">
           <div class="col-6 mx-auto">
               <form action="/login" method="post">
                   <div class="row mt-2">
                       <div class="col-12">
                           <label>Email:</label>
                       </div>
                   </div>
                   <div class="row mt-2">
                       <div class="col-12">
                           <input type="email" class="form-control" name="email" required placeholder="Insert Email">
                       </div>
                   </div>

                   <div class="row mt-3">
                       <div class="col-12">
                           <label>Password:</label>
                       </div>
                   </div>
                   <div class="row mt-2">
                       <div class="col-12">
                           <input type="password" class="form-control" name="password" required placeholder="Insert Password">
                       </div>
                   </div>

                   <div class="row mt-3">
                       <div class="col-12">
                           <button class="btn btn-success">Sign In</button>
                       </div>
                   </div>
                    <div ></div>
                   <h6 class="mt-5 text-center">Don`t have an account? <span><a href="/register"> Sign Up</a></span></h6>
               </form>
           </div>
       </div>
   </div>

</body>
</html>

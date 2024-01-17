<%-- 
    Document   : register
    Created on : Sep 25, 2023, 2:57:15 PM
    Author     : Shiv kumar umar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New User</title>

        <%@include  file="components/common_css_js.jsp"%>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>

        <div class="container-fluid">

            <div class="row mt-3">
                <div class="col-md-4 offset-md-4">

                    <div class="card">
                        <%@include file="components/message.jsp" %>
                        <div class="card-body px-5">
                            <h3 class="text-center my-3">Sign up here</h3>
                            <form action="RegisterServlet" method="post">
                                <div class="form-group">
                                    <label for="name">User Name</label>
                                    <input type="name" name="user_name" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter name" required="">
                                </div>
                                <div class="form-group">
                                    <label for="email">User Email</label>
                                    <input type="email" name="user_email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter email"required="" >
                                </div>
                                <div class="form-group">
                                    <label for="password">User Password</label>
                                    <input type="password" name="user_password" class="form-control" id="password" aria-describedby="emailHelp" placeholder="Enter password" required="">
                                </div>
                                <div class="form-group">
                                    <label for="phone">User Phone</label>
                                    <input type="number" name="user_phone" class="form-control" id="phone" aria-describedby="emailHelp" placeholder="Enter phone number" required="">
                                </div>
                                <div class="form-group">
                                    <label for="address">Address</label>
                                    <textarea style="height: 100px" name="user_address" class="form-control" required="" placeholder="Enter address"></textarea>
                                </div>

                                <div class="container text-center">
                                    <button type="submit" class="btn btn-outline-success">Register</button>


                                    <button type="reset" class="btn btn-outline-warning">Reset</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>

<%-- 
    Document   : login
    Created on : Sep 25, 2023, 4:12:47 PM
    Author     : Shiv kumar umar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Login </title>
        <%@include  file="components/common_css_js.jsp"%>
    </head>
    <body>
        <%@include  file="components/navbar.jsp"%>
        <div class="container">
            <div class="row">
                <div class="col-md-6 offset-md-3">
                    <div class="card mt-3">
                        <div class="card-header costome-bg text-white">
                            <h3>Login here</h3>
                        </div>
                        <div class="card-body">
                            <%@include  file="components/message.jsp"%>
                            <form action="LoginServlet" method="post">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input type="email" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                   
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input type="password" name="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                </div>
                               
                                <a href="register.jsp" target="target" class="text-center d-block mb-3">If not register please click here</a>
                                
                                <div class="container text-center">
                                <button type="submit" class="btn btn-primary costome-bg border-0 ">Submit</button>
                                <button type="reset" class="btn btn-warning costome-bg border-0 text-white ">Reset</button>
                                </div>
                            </form>
                        </div>
                       


                    </div>
                </div>
            </div>
        </div>
    </body>
</html>

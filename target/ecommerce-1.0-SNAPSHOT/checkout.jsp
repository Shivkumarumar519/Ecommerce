<%-- 
    Document   : checkout
    Created on : Sep 28, 2023, 12:45:03 PM
    Author     : Shiv kumar umar
--%>

<%
    User user = (User) session.getAttribute("current-user");
    if (user == null) {
        session.setAttribute("message", "You are not logged in !! login first to continue shopping");
        response.sendRedirect("login.jsp");
        return;
    } 
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CheckOut</title>
        <%@include  file="components/common_css_js.jsp"%>
    </head>
    <body>
        <%@include  file="components/navbar.jsp"%>

        <div class="container">
            <div class="row mt-5">
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <h3 class="text-center mb-5">Your selected items</h3>
                            <div class="cart-body">

                            </div> 
                        </div> 
                    </div>

                </div>
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <h3 class="text-center mb-5">Your details for order</h3>
                            <form>
                                <div class="form-group">
                                    <label for="email">Email address</label>
                                    <input value="<%=user.getUserEmail()%>" type="email" name="email" class="form-control" placeholder="Enter your email" id="exampleInputEmail1" aria-describedby="emailHelp">
                                </div>
                                <div class="form-group">
                                    <label for="name">Your name</label>
                                    <input value="<%=user.getUserName()%>" type="text" name="name" class="form-control" placeholder="Enter your name" id="exampleInputEmail1" aria-describedby="emailHelp">
                                </div>
                                <div class="form-group">
                                    <label for="name">Phone number</label>
                                    <input value="<%=user.getUserPhone()%>" type="number" name="phone" class="form-control" placeholder="Enter your number" id="exampleInputEmail1" aria-describedby="emailHelp">
                                </div>
                                <div class="form-group">
                                    <label for="address">Enter Your address</label>
                                    <textarea value="<%=user.getUserName()%>" class="form-control" name="address" placeholder="Enter your address" id="exampleFormControlTextarea1" rows="3"></textarea>
                                </div>
                                <div class="container text-center">
                                     <button class="btn btn-outline-success">Order now</button>
                                    <button class="btn btn-outline-primary">Continue Shopping</button>
                                </div>
                            </form>
                        </div> 
                    </div>


                </div>
            </div>

        </div>

        <%@include  file="components/common_models.jsp"%>
    </body>



</html>

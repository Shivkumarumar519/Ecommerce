<%-- 
    Document   : admin
    Created on : Sep 25, 2023, 5:06:31 PM
    Author     : Shiv kumar umar
--%>

<%@page import="java.util.Map"%>
<%@page import="com.ecommerce.helper.Helper"%>
<%@page import="com.ecommerce.entities.Product"%>
<%@page import="com.ecommerce.dao.ProductDao"%>
<%@page import="java.util.List"%>
<%@page import="com.ecommerce.entities.Category"%>
<%@page import="com.ecommerce.dao.CategoryDao"%>
<%@page import="com.ecommerce.dao.CategoryDao"%>
<%@page import="com.ecommerce.helper.FactoryProvider"%>
<%@page import="com.ecommerce.entities.User"%>
<%
    User user = (User) session.getAttribute("current-user");
    if (user == null) {
        session.setAttribute("message", "You are not logged in !! login first");
        response.sendRedirect("login.jsp");
        return;
    } else {
        if (user.getUserType().equals("normal")) {
            session.setAttribute("message", "You are not Admin !! Do not access this page");
            response.sendRedirect("login.jsp");
        }
    }
%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Penal</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="container px-5 admin">

            <div class="container-fluid mt-3">
                <%@include file="components/message.jsp" %>
            </div>


            <div class="row mt-3">
                <div class="col-md-4">
                    <%    ProductDao dao = new ProductDao(FactoryProvider.getFactory());
                        List<Product> plist = dao.getAllProducts();
                        CategoryDao ctdao = new CategoryDao(FactoryProvider.getFactory());
                        List<Category> ctlist = ctdao.getCategories();
                        

                        Map<String,Long> m =Helper.getCounts(FactoryProvider.getFactory());
                    %>

                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 100px;" class="img-fluid " src="img/man.png" alt="alt"/>
                            </div>
                            <h1><%=m.get("userCount")%></h1>
                            <h1 class="text-uppercase text-center text-muted">User</h1>
                        </div>
                    </div>

                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 100px;" class="img-fluid " src="img/checklist.png" alt="alt"/>
                            </div>
                            <h1><%=ctlist.size()%></h1>
                            <h1 class="text-uppercase text-center text-muted">Categories</h1>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 100px;" class="img-fluid " src="img/product.png" alt="alt"/>
                            </div>
                           <h1><%=plist.size()%> </h1>
                            <h1 class="text-uppercase text-center text-muted">Products</h1>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-md-6">
                    <div class="card" data-toggle="modal" data-target="#add-category-model">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 100px;" class="img-fluid " src="img/keys.png" alt="alt"/>
                            </div>
                            <h4>Click here for add category's</h4>
                            <h1 class="text-uppercase text-center text-muted">Add categoty</h1>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="card" data-toggle="modal" data-target="#add-product-model">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 100px;" class="img-fluid " src="img/plus.png" alt="alt"/>
                            </div>
                            <h4>Click here for add product's</h4>
                            <h1 class="text-uppercase text-center text-muted">add product</h1>
                        </div>
                    </div>
                </div>
            </div>

        </div>

        <!-- Button trigger modal -->


        <!-- Modal -->
        <div class="modal fade" id="add-category-model" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog model-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header costome-bg text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Fill category details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="ProductOperationServlet" method="post">

                            <input type="hidden" name="operation" value="addcategory"/>


                            <div class="form-group">
                                <input type="text" class="form-control" name="catTitle" placeholder="Enter category title" required>
                            </div>
                            <div class="form-group">
                                <textarea style="height: 200px;" class="form-control" name="catDescription" placeholder="Enter Category description" required=""></textarea>
                            </div>
                            <div class="container text-center">
                                <button class="btn btn-outline-success" >Add category</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>

                        </form>
                    </div>

                </div>
            </div>
        </div>








        <!--        //product model-->







        <!-- Modal -->
        <div class="modal fade" id="add-product-model" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog model-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header costome-bg text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Product details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
                            <input type="hidden" name="operation" value="addproduct"/>
                            <div class="form-group">
                                <input type="text" class="form-control" name="pName" placeholder="Enter product title" required>
                            </div>
                            <div class="form-group">
                                <textarea style="height: 200px;" class="form-control" name="pDesc" placeholder="Enter product description" ></textarea>
                            </div>
                            <div class="form-group">
                                <input type="number" class="form-control" name="pPrice" placeholder="Enter product price" required>
                            </div>
                            <div class="form-group">
                                <input type="number" class="form-control" name="pDiscount" placeholder="Enter product discount" required>
                            </div>
                            <div class="form-group">
                                <input type="number" class="form-control" name="pQuantity" placeholder="Enter product quantity" required>
                            </div>

                            <%
                                CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                                List<Category> list = cdao.getCategories();


                            %>



                            <div class="form-group">
                                <select name="catId"class="form-control"  id="" required>
                                    <option disabled selected value>Select Category</option>
                                    <%                                        for (Category c : list) {
                                    %>
                                    <option value="<%=c.getCategoryId()%>"><%=c.getCategoryTitle()%></option>


                                    <%}%>
                                </select>
                            </div>

                            <div class="form-control">
                                <input type="file" name="pPic"  required=""/>

                            </div>
                            <div class="container text-center mt-3">
                                <button class="btn btn-outline-success" >Add product</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>


                        </form>
                    </div>

                </div>
            </div>
        </div>




                                    <%@include file="components/common_models.jsp" %>
    </body>
</html>

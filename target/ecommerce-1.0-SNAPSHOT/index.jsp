<%-- 
    Document   : index
    Created on : Sep 25, 2023, 12:39:19 PM
    Author     : Shiv kumar umar
--%>

<%@page import="com.ecommerce.helper.Helper"%>
<%@page import="com.ecommerce.entities.Category"%>
<%@page import="com.ecommerce.dao.CategoryDao"%>
<%@page import="java.util.List"%>
<%@page import="com.ecommerce.entities.Product"%>
<%@page import="com.ecommerce.dao.ProductDao"%>
<%@page import="com.ecommerce.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>E COMMERCE-HOME</title>
        <%@include  file="components/common_css_js.jsp"%>


    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="container-fluid">
            <div class="row mt-3 mx-2 my-2">
                <%                String cat = request.getParameter("category");

                    ProductDao dao = new ProductDao(FactoryProvider.getFactory());
                    List<Product> list = null;

                    if (cat == null || cat.trim().equals("all")) {
                        list = dao.getAllProducts();
                    } else {

                        int cid = Integer.parseInt(cat.trim());
                        list = dao.getAllProductsById(cid);

                    }

                    CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                    List<Category> clist = cdao.getCategories();
                %>

                
                
                
                
                
                <div class="col-md-2">
                            <div class="list-group mt-4" id="list-tab" role="tablist">
                                 <a href="index.jsp?category=all" class="list-group-item list-group-item-action<%= (cat == null || cat.trim().equals("all")) ? " active" : "" %>">
                                     All Categories
                                </a>

                               <%
                                       for (Category category : clist) {
                                            String categoryParam = String.valueOf(category.getCategoryId());
                                 %>
                                 <a href="index.jsp?category=<%=categoryParam%>" class="list-group-item list-group-item-action<%= (cat != null && cat.equals(categoryParam)) ? " active" : "" %>">
                                      <%=category.getCategoryTitle()%>
                                    </a>
                                     <%
                                             }
                                            %>
                                            </div>
                                           </div>


           


               
                    
                    
                <div class="col-md-10">

                    <div class="row mt-4">
                        <div class="col-md-12">
                            <div class="card-columns">
                                <!--                            traversing poducts-->
                                <%
                                    for (Product p : list) {
                                %>

                                <div class="card product-card">
                                    <div class="container text-center">
                                        <img class="card-img-top m-2" style="max-height: 200px; max-width: 100%; width: auto;" src="img/products/<%=p.getpPhoto()%>" alt="Card image cap">
                                    </div>
                                    <div class="card-body">
                                        <h5 class="card-title"><%=p.getpName()%></h5>
                                        <p class="card-text">
                                            <%=Helper.get10Words(p.getpDesc())%>
                                        </p>
                                    </div>
                                    <div class="card-footer">

                                        <button class=" btn costome-bg text-white" onclick="add_to_cart(<%=p.getpId()%>, '<%=p.getpName()%>',<%=p.getPriceAfterApplyingDiscount()%>)">Add to card</button>
                                        <button class=" btn btn-outline-success ">&#8377;<%=p.getPriceAfterApplyingDiscount()%>/- <span class="text-danger discount-label">&#8377;<%=p.getpPrice()%> , <%=p.getpDiscount()%>% off</span></button>
                                    </div>
                                </div>

                                <%}

                                    if (list.size() == 0) {
                                        out.println("<h3>No Item in this category</h3>");
                                    }

                                %>               
                            </div>
                        </div>

                    </div>

                </div>
            </div>
        </div>
        <%@include file="components/common_models.jsp" %>
    </body>
</html>

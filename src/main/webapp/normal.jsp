<%-- 
    Document   : normal
    Created on : Sep 25, 2023, 5:06:53 PM
    Author     : Shiv kumar umar
--%>
<%@page import="com.ecommerce.entities.User"%>
<%
    User user = (User) session.getAttribute("current-user");
    if (user == null) {
        session.setAttribute("message", "You are not logged in !! login first");
        response.sendRedirect("login.jsp");
        return;
    } else {
        if (user.getUserType().equals("admin")) {
            session.setAttribute("message", "You are not user !! Do not access this page");
            response.sendRedirect("login.jsp");
        }
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User penal</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        
         <%@include file="components/navbar.jsp" %>
        <h1>This is user page</h1>
    </body>
</html>

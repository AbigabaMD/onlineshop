<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.connection.*"%>
<%@ page import="java.sql.*"%>
<%
    //Getting all the inputs from the admin
    int id = Integer.parseInt(request.getParameter("pid"));
    String pname = request.getParameter("pname");
    String price = request.getParameter("price");
   
    //Querying to the database
    int updateProduct = DatabaseConnection.insertUpdateFromSqlQuery("update tblproduct set name='" + pname + "',price='" + price + "'where id='" + id + "'");
    if (updateProduct > 0) {
        response.sendRedirect("admin-view-product.jsp");
    } else {
        response.sendRedirect("admin-view-product.jsp");
    }
%>
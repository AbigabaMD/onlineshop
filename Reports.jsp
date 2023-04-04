<%-- 
    Document   : Reports
    Created on : Aug 10, 2022, 10:23:56 AM
    Author     : call anything
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="jakarta.servlet.ServletException"%>
<%@page import="jakarta.servlet.http.HttpServlet"%>
<%@page import="jakarta.servlet.http.HttpServletRequest"%>
<%@page import="jakarta.servlet.http.HttpServletResponse"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<%@page import="java.util.*,java.sql.*,java.time.*,java.time.format.DateTimeFormatter"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>customer report</title>
          
          
    </head>
    <body>
         

      
        
        <%
            
            Class.forName("com.mysql.jdbc.Driver");//loading the driver
            //out.println("Driver loaded successfully");
            try{
          
            
            Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/shop","root","");
            Statement st = conn.createStatement();
            //String sql="Select *from customer";
            ResultSet rs=st.executeQuery("select *from tblcustomer");
            out.println("<table border=1 width=30% height=30% class='table'>");
            out.println("<tr><th class='table-dark'>CustomerId</th class='table-dark'><th class='table-dark'>Name</th><th class='table-dark'>Password</th><th class='table-dark'>Gender</th><th class='table-dark'>Location</th><th class='table-dark'>TelephoneNumber</th><th class='table-dark'>EMAIL</th><th class='table-dark'>ADDED_Date</th><th class='table-dark'>PIN_CODE</th></tr>");
            
            while(rs.next()){
               int a= rs.getInt("id");
                String b = rs.getString("name");
                String c =rs.getString("password");
                String d =rs.getString("gender");
                String e =rs.getString("address");
                String f =rs.getString("phone");
                String g =rs.getString("email");
                String h =rs.getString("added_date");
                String i =rs.getString("pin_code");
                out.println(" <tr><td>"+a+"</td><td>"+b+"</td><td>"+c+"</td><td>"+d+"</td> <td>"+e+"</td><td>"+f+"</td><td>"+g+"</td><td>"+h+"</td><td>"+i+"</td></tr>");
                             }
            out.println("</table>");
             
             ResultSet Date=st.executeQuery("Select count(*) from tblcustomer where(added_date between '2022-08-09' AND '2022-08-10')");
          
             Date.next();
             out.println(Date.getInt("count(*)")+ " is " + "the number of customers from 2022-08-09 to 2020-08-10");
          
            
             
            }   catch(SQLException e){
                out.println("there is an error"+e.getMessage());
           }
            %>
           
            
    </body>
</html>

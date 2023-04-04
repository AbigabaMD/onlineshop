<%-- 
    Document   : report1.jsp
    Created on : Aug 7, 2022, 4:23:06 PM
    Author     : H4CK3R
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
        <title>REPORTS</title>
           <link href="assets/css/bootstrap.css" rel="stylesheet" />
        <link href="assets/css/font-awesome.css" rel="stylesheet" />
        <link href="assets/css/style.css" rel="stylesheet" />
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
        <script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
        <script src="js/simpleCart.min.js"></script>
        <script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>
        <link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,900,900italic,700italic' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
        <script src="js/jquery.easing.min.js"></script>
        <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
<!--         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">-->
            <link rel="stylesheet" href="css/grid.css"/>
<!--        <link rel="stylesheet" href="bootstrap.min.css">
         <link rel="stylesheet" href="css/grid.css"/>-->
       
<!--        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">-->
    </head>
    <body>
         <%
            //Checking whether admin in session or not
            if (session.getAttribute("uname") != null && session.getAttribute("uname") != "") {
        %>
        <jsp:include page="adminHeader.jsp"></jsp:include>
        
        <h1>CUSTOMERS DETAILS IN I5 BEVERAGE</h1>
         <jsp:include page="Reports.jsp"/>
        
        <h2>PRODUCT DETAILS IN I5 BEVERAGE</h2>
        
        <%
            
            Class.forName("com.mysql.jdbc.Driver");//loading the driver
            //out.println("Driver loaded successfully");
            try{
          
            
            Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/shop","root","");
            Statement st = conn.createStatement();
            //String sql="Select *from customer";
            ResultSet rs=st.executeQuery("select *from tblproduct");
            out.println("<table border=1 width=10cm height=10cm class='table'>");
            out.println("<tr><th class='table-dark'>ProductId</th><th class='table-dark'>Productline</th><th class='table-dark'>Beverage</th><th class='table-dark'>Price</th><th class='table-dark'>likestatus</th></tr>");
            
            while(rs.next()){
               int m= rs.getInt("id");
                String n = rs.getString("product_category");
                String p =rs.getString("name");
                
                //Blob k =rs.getBlob(1);
                //byte barr[]=k.getBytes(1);
                String r =rs.getString("price");
               
//                String y =rs.getString("SalesStatus");
                int q =rs.getInt("likestatus");
               
               
                out.println(" <tr><td>"+m+"</td><td>"+n+"</td><td>"+p+"</td><td>"+r+"</td><td>"+q+"</td> </tr>");
                             }
            out.println("</table>");
             
             ResultSet ret=st.executeQuery("Select count(*) from tblproduct where product_category='longterm'");
           
           
          
          while(ret.next())   {
          out.println("  "+ret.getInt("count(*)")+ " is " + "the number of longTerm products produced");
          out.println(":");
          break;
            }
             ResultSet mid=st.executeQuery("Select count(*) from tblproduct where product_category='midterm'");
              while( mid.next()){
          out.println("  "+mid.getInt("count(*)")+ " is the number of midTerm  products produced");
          out.println("   :  ");

            break;}
             ResultSet shortT=st.executeQuery("Select count(*) from tblproduct where product_category='shortterm'");
                while( shortT.next()){
            out.println("  "+shortT.getInt("count(*)")+ " is the number of shortTerm products produced");
            

            break;
            }           
                         
             
            
            
            
             
            }   catch(SQLException e){
                out.println("there is an error"+e.getMessage());
            }
            %>
            
               <jsp:include page="footer.jsp"></jsp:include>
            <script src="assets/js/jquery-1.10.2.js"></script>
            <script src="assets/js/bootstrap.js"></script>
            <script src="assets/js/custom.js"></script>
        <%
            } else {
                response.sendRedirect("admin-login.jsp");
            }
        %>
    </body>
</html>


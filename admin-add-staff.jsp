<%-- 
    Document   : admin-add-staff
    Created on : Aug 10, 2022, 9:41:05 AM
    Author     : call anything
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.connection.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <title>VIEW_PAGE</title>
        <!-- Importing all ui libs -->
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
        <link href="https://unpkg.com/tailwindcss@^1.0/dist/tailwind.min.css" rel="stylesheet">
    </head>
    <body>
        <%
            //Checking whether admin in session or not
            if (session.getAttribute("uname") != null && session.getAttribute("uname") != "") {
        %>
        <jsp:include page="adminHeader.jsp"></jsp:include>
            <%
        int x=0;
        int i=0;
        int v=0;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/shop","root","");
            
            Statement st= conn.createStatement();
                
                
            ResultSet rs = st.executeQuery("Select * from staff where productLine='Longterm'");
            %>
        <div class="bg-white border-gray-200 dark:border-gray-600 dark:bg-gray-900 py-6 ">
        <div id="mega-menu-full-dropdown" class="mt-1 bg-gray-50 border-gray-200 shadow-sm md:bg-white border-y dark:bg-gray-800 dark:border-gray-600">
            <div class="grid py-5 px-4 mx-auto max-w-screen-xl text-gray-900 dark:text-white sm:grid-cols-2 md:px-6 group block max-w-xs mx-auto rounded-lg p-6 bg-white ring-1 ring-slate-900/5 shadow-lg space-y-3 hover:bg-sky-500 hover:ring-white">
                <ul style="padding-right: 5;">
                    <li>
                        <div class="overflow-x-auto relative sm:rounded-lg py-3">
                            <div class="font-semibold px-6 text-center">LONGTERM PRODUCTLINE STAFF</div>
                            <table class="w-full py-6 px-2 px-6 text-sm text-left text-gray-500 dark:text-gray-700 border-gray-900 hover:bg-gray-300 hover:ring-white group block max-w-screen-xl mx-auto rounded-lg bg-gray border-gray-900 ring-1 shadow-lg hover:bg-gray-300">
                                <thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400 border-b" >
                                    <tr>
                                        <th scope="col" class="py-3 px-6">
                                            Staff ID
                                        </th>
                                        <th scope="col" class="py-3 px-6">
                                            Staff Name
                                        </th>
                                        <th scope="col" class="py-3 px-6">
                                            ProductLine
                                        </th>
                                        <th scope="col" class="py-3 px-6">
                                            Gender
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
            <%
                
                
                while(rs.next()){
                %><tr class="bg-white border-b dark:bg-gray-900 dark:border-gray-700"><%
                    %><th scope="row" class="py-4 px-6 font-medium text-gray-900 whitespace-nowrap dark:text-white"><%
                        out.println(rs.getString("staffID"));
                    %></th><%
                    %><td class="py-4 px-6"><%
                        out.println(rs.getString("staffName"));
                    %></td><%
                    %><td class="py-4 px-6"><%
                        out.println(rs.getString("productLine"));
                    %></td><%
                    %><td class="py-4 px-6"><%out.println(rs.getString("gender"));%></td>
                </tr>

                <%
                    x++;
                }
            %>
            </tbody>
            </table>
            </div>
            </li>
            <%
              //out.println(i);  
        }
        catch(Exception er){
            out.println("Connection Failed" +er.getMessage());
        }
    %>
                        <li>
                        <div class="overflow-x-auto relative sm:rounded-lg py-6">
                            <div class="font-semibold text-center">MIDTERM PRODUCTLINE STAFF</div>
                            <table class="w-full text-sm px-6 px-2 text-left text-gray-500 dark:text-gray-700 border-gray-900 hover:bg-gray-300 hover:ring-white group block max-w-screen-xl mx-auto rounded-lg bg-gray border-gray-900 ring-1 shadow-lg hover:bg-gray-300">
                                <thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400 border-b" >
                                    <tr>
                                        <th scope="col" class="py-3 px-6">
                                            Staff ID
                                        </th>
                                        <th scope="col" class="py-3 px-6">
                                            Staff Name
                                        </th>
                                        <th scope="col" class="py-3 px-6">
                                            ProductLine
                                        </th>
                                        <th scope="col" class="py-3 px-6">
                                            ProductLine
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
            <%
                 try{
            Class.forName("com.mysql.jdbc.Driver");
            
            Connection conn1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/shop","root","");
            
            Statement st1= conn1.createStatement();
                
                
            ResultSet rs1 = st1.executeQuery("Select * from staff where productLine='Midterm'");
                
                
                while(rs1.next()){
                %><tr class="bg-white border-b dark:bg-gray-900 dark:border-gray-700"><%
                    %><th scope="row" class="py-4 px-6 font-medium text-gray-900 whitespace-nowrap dark:text-white"><%
                        out.println(rs1.getString("staffID"));
                    %></th><%
                    %><td class="py-4 px-6"><%
                        out.println(rs1.getString("staffName"));
                    %></td><%
                    %><td class="py-4 px-6"><%
                        out.println(rs1.getString("productLine"));
                    %></td><%
                    %><td class="py-4 px-6"><%out.println(rs1.getString("gender"));%></td>
                </tr>
                <%
                    v++;
                    }%>
            </tbody>
            </table>
            </div>
            </li>
    <%
              //out.println(i);  
        }
        catch(Exception er){
            out.println("Connection Failed" +er.getMessage());
        }
    %>
        <li>
                        <div class="overflow-x-auto relative sm:rounded-lg">
                            <div class="font-semibold text-center">SHORTTERM PRODUCTLINE STAFF</div>
                            <table class="w-full text-sm px-6 px-2 text-left text-gray-500 dark:text-gray-700 border-gray-900 hover:bg-gray-300 hover:ring-white group block max-w-screen-xl mx-auto rounded-lg bg-gray border-gray-900 ring-1 shadow-lg hover:bg-gray-300">
                                <thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400 border-b" >
                                    <tr>
                                        <th scope="col" class="py-3 px-6">
                                            Staff ID
                                        </th>
                                        <th scope="col" class="py-3 px-6">
                                            Staff Name
                                        </th>
                                        <th scope="col" class="py-3 px-6">
                                            ProductLine
                                        </th>
                                        <th scope="col" class="py-3 px-6">
                                            Gender
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
            <%
                 try{
            Class.forName("com.mysql.jdbc.Driver");
            
            Connection conn2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/shop","root","");
            
            Statement st2= conn2.createStatement();
                
                
            ResultSet rs2 = st2.executeQuery("Select * from staff where productLine='Shortterm'");
            
                
                
                while(rs2.next()){
                %><tr class="bg-white border-b dark:bg-gray-900 dark:border-gray-700"><%
                    %><th scope="row" class="py-4 px-6 font-medium text-gray-900 whitespace-nowrap dark:text-white"><%
                        out.println(rs2.getString("staffID"));
                    %></th><%
                    %><td class="py-4 px-6"><%
                        out.println(rs2.getString("staffName"));
                    %></td><%
                    %><td class="py-4 px-6"><%
                        out.println(rs2.getString("productLine"));
                    %></td><%
                    %><td class="py-4 px-6"><%out.println(rs2.getString("gender"));%></td>
                </tr>
        <%i++;
           }%>
            </tbody>
            </table>
            </div>
            </li>
    <%
              //out.println(i);  
        }
        catch(Exception er){
            out.println("Connection Failed" +er.getMessage());
        }
    %>
          </ul>  
              <ul class="px-6">
                    <li>
                        <a href="#" class="block p-3 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700 group block max-w-xl mx-auto rounded-lg p-6 bg-gray border-gray-900 ring-1 ring-slate-900/5 shadow-lg space-y-3 hover:bg-gray-300 hover:ring-sky-500">
                            <div class="font-semibold text-center">STAFF DETAILS</div>
                            <form action="staff" method="POST">
                                <div class="mb-6">
                                  <label for="productID" class="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-300">Staff ID</label>
                                  <input type="number" id="email" name="staffID" class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500 dark:shadow-sm-light" required>
                                </div>
                                <div class="mb-6">
                                  <label for="productName" class="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-300">Staff Name</label>
                                  <input type="text" id="password" name="staffName" class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500 dark:shadow-sm-light" required>
                                </div>
                                <div class="mb-6">
                                    <fieldset name="line">

                                        <legend class="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-300">Select Product Line</legend>
                                      
                                        <div class="flex items-center mb-4" style="padding-left: 20;">
                                          <input id="country-option-1" type="radio" name="line" value="Longterm" class="w-4 h-4 border-gray-300 focus:ring-2 focus:ring-blue-300 dark:focus:ring-blue-600 dark:focus:bg-blue-600 dark:bg-gray-700 dark:border-gray-600" checked>
                                          <label for="country-option-1" class="block ml-2 text-sm font-medium text-gray-900 dark:text-gray-300">
                                            Longterm
                                          </label>
                                        </div>
                                      
                                        <div class="flex items-center mb-4" style="padding-left: 20;">
                                          <input id="country-option-2" type="radio" name="line" value="Midterm" class="w-4 h-4 border-gray-300 focus:ring-2 focus:ring-blue-300 dark:focus:ring-blue-600 dark:focus:bg-blue-600 dark:bg-gray-700 dark:border-gray-600">
                                          <label for="country-option-2" class="block ml-2 text-sm font-medium text-gray-900 dark:text-gray-300">
                                            Midterm
                                          </label>
                                        </div>
                                      
                                        <div class="flex items-center mb-4" style="padding-left: 20;">
                                          <input id="country-option-3" type="radio" name="line" value="Shortterm" class="w-4 h-4 border-gray-300 focus:ring-2 focus:ring-blue-300 dark:focus:ring-blue-600 dark:bg-gray-700 dark:border-gray-600">
                                          <label for="country-option-3" class="block ml-2 text-sm font-medium text-gray-900 dark:text-gray-300">
                                            Shortterm
                                          </label>
                                        </div>
                                      </fieldset>
                                </div>
                                
                                <div class="mb-6">
                                    <fieldset name="gender">

                                        <legend class="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-300">Select Gender</legend>
                                      
                                        <div class="flex items-center mb-4" style="padding-left: 20;">
                                          <input id="country-option-1" type="radio" name="gender" value="female" class="w-4 h-4 border-gray-300 focus:ring-2 focus:ring-blue-300 dark:focus:ring-blue-600 dark:focus:bg-blue-600 dark:bg-gray-700 dark:border-gray-600" checked>
                                          <label for="country-option-1" class="block ml-2 text-sm font-medium text-gray-900 dark:text-gray-300">
                                            Female
                                          </label>
                                        </div>
                                      
                                        <div class="flex items-center mb-4" style="padding-left: 20;">
                                          <input id="country-option-2" type="radio" name="gender" value="male" class="w-4 h-4 border-gray-300 focus:ring-2 focus:ring-blue-300 dark:focus:ring-blue-600 dark:focus:bg-blue-600 dark:bg-gray-700 dark:border-gray-600">
                                          <label for="country-option-2" class="block ml-2 text-sm font-medium text-gray-900 dark:text-gray-300">
                                            Male
                                          </label>
                                        </div>
                                      </fieldset>
                                </div>
                               <button type="submit" class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-200 dark:focus:ring-blue-800" style="align-items: flex-end;">Add staff</button>
                                   
                              </form>
                        </a>
                    </li>
                    <li>
                        <a href="#" class="group block max-w-xs mx-auto rounded-lg p-6 bg-white ring-1 ring-slate-900/5 shadow-lg space-y-3 hover:bg-sky-500 hover:ring-sky-500 py-6">
                        <div class="flex items-center space-x-3">
                        <svg class="h-6 w-6 stroke-sky-500 group-hover:stroke-white" fill="none" viewBox="0 0 24 24"><!-- ... --></svg>
                        <h3 class="text-slate-900 group-hover:text-white text-sm font-semibold">Rellocate Staff</h3>
                        </div>
                        <form action="adminreallocate" method="POST">
                            <button type="submit" class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-200 dark:focus:ring-blue-800" style="align-items: flex-end;">REALLOCATE STAFF</button>
                             
                        </form>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        </div>
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
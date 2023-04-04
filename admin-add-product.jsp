<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Add products</title>
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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <link href="https://unpkg.com/tailwindcss@^1.0/dist/tailwind.min.css" rel="stylesheet">
    </head>
    <body>
        <%
            //Checking whether admin in session or not
            if (session.getAttribute("uname") != null && session.getAttribute("uname") != "") {
        %>
        <jsp:include page="adminHeader.jsp"></jsp:include>
            <div class="content-wrapper">
                <div class="container">
                    <div class="row pad-botm">
                        <div class="col-md-12">
                            <h4 class="header-line">Add Product</h4>
                        </div>
                    </div>
                <%
                    String message = (String) session.getAttribute("message");
                    if (message != null) {
                        session.removeAttribute("message");
                %>
                <div class="alert alert-danger" id="success">Product successfully added!.</div>
                <%
                    }
                %>
                <div class="row">
                    <div class="col-md-12">
                        <div class="panel panel-info">
                            <div class="panel-heading"></div>
                            <div class="panel-body">
                                 <div class="font-semibold">Product Details</div>
                            <form action="AddProducts" method="post">
                                <div class="mb-6">
                                  <label for="productID" class="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-300">Product ID</label>
                                  <input type="number" id="email" name="" class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500 dark:shadow-sm-light" >
                                </div>
                                <div class="mb-6">
                                  <label for="productName" class="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-300">Prduct Name</label>
                                  <input type="text" id="password" name="pname" class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500 dark:shadow-sm-light" required>
                                </div>
                                <div class="mb-6">
                                  <label for="price" class="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-300">Price</label>
                                  <input type="price" id="repeat-password" name="price" class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500 dark:shadow-sm-light" required>
                                </div>
                                <div class="mb-6">
                                    <fieldset name="category">

                                        <legend class="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-300">Select Product Category</legend>
                                      
                                        <div class="flex items-center mb-4" style="padding-left: 20;">
                                          <input id="country-option-1" type="radio" name="category" value="longterm" class="w-4 h-4 border-gray-300 focus:ring-2 focus:ring-blue-300 dark:focus:ring-blue-600 dark:focus:bg-blue-600 dark:bg-gray-700 dark:border-gray-600" checked>
                                          <label for="country-option-1" class="block ml-2 text-sm font-medium text-gray-900 dark:text-gray-300">
                                            Longterm
                                          </label>
                                        </div>
                                      
                                        <div class="flex items-center mb-4" style="padding-left: 20;">
                                          <input id="country-option-2" type="radio" name="category" value="midterm" class="w-4 h-4 border-gray-300 focus:ring-2 focus:ring-blue-300 dark:focus:ring-blue-600 dark:focus:bg-blue-600 dark:bg-gray-700 dark:border-gray-600">
                                          <label for="country-option-2" class="block ml-2 text-sm font-medium text-gray-900 dark:text-gray-300">
                                            Midterm
                                          </label>
                                        </div>
                                      
                                        <div class="flex items-center mb-4" style="padding-left: 20;">
                                          <input id="country-option-3" type="radio" name="category" value="shortterm" class="w-4 h-4 border-gray-300 focus:ring-2 focus:ring-blue-300 dark:focus:ring-blue-600 dark:bg-gray-700 dark:border-gray-600">
                                          <label for="country-option-3" class="block ml-2 text-sm font-medium text-gray-900 dark:text-gray-300">
                                            Shortterm
                                          </label>
                                        </div>
                                      </fieldset>
                                </div>
                                <div class="mb-6">
                                    <label class="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-300" for="user_avatar">Upload image</label>
                                    <input class="block w-full text-sm text-gray-900 bg-gray-50 rounded-lg border border-gray-300 cursor-pointer dark:text-gray-400 focus:outline-none dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400" aria-describedby="user_avatar_help" id="user_avatar" name="image" type="file" required="Please fill in the field">
                                </div>
                                
                               <button type="submit" class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-200 dark:focus:ring-blue-800" style="align-items: flex-end;">Register Item</button>
                                   
                              </form>
                                 
                                   <li style="padding-top: 20;">
        <a href="#" class="block p-3 rounded-lg hover:bg-gray-100 group block max-w-xl mx-auto rounded-lg p-6 bg-gray border-gray-900 ring-1 ring-slate-900/5 shadow-lg space-y-3 hover:bg-gray-300 hover:ring-sky-500">
            <div class="font-semibold">Quantity Section</div>
         
            <form action="adminaddquantity" method="POST">
                <div class="mb-6 flex space-x-4" style="align-items: end;">
                    <div class="w-1/2">
                        <input type="number" id="email" name="quant" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" required>
                    </div>
                    <div>
                        <button type="submit" class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">Submit</button>
                    </div>
                </div>
                <div class="mb-6 flex"> 
                    <label for="terms" class="ml-2 text-sm font-sm text-gray-900 dark:text-gray-300">Required to enter quantity of long term products</label>
                </div>
            </form>
          
        </a>
    </li>
                        
                            </div>
                        </div>
                    </div>
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
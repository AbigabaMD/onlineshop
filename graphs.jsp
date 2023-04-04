<%-- 
    Document   : newjsp
    Created on : Aug 5, 2022, 6:02:02 AM
    Author     : dd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*" %>
<%!Integer y[]={};%>
<%!String x[]={};%>
<%ArrayList<Integer> ylabel=new ArrayList<Integer>(Arrays.asList(y));%>
<%ArrayList<String> xlabel=new ArrayList<String>(Arrays.asList(x));%>
<%!ResultSet res;%>

<%!Integer pay[]={};%>
<%!String name[]={};%>
<%ArrayList<Integer> paylabel=new ArrayList<Integer>(Arrays.asList(pay));%>
<%ArrayList<String> namelabel=new ArrayList<String>(Arrays.asList(name));%>
<%!ResultSet rest;%>

<%!Integer s[]={};%>
<%!String t[]={};%>
<%ArrayList<Integer> slabel=new ArrayList<Integer>(Arrays.asList(s));%>
<%ArrayList<String> tlabel=new ArrayList<String>(Arrays.asList(t));%>
<%!ResultSet bred;%>

<%!Integer d[]={};%>
<%!String e[]={};%>
<%ArrayList<Integer> dlabel=new ArrayList<Integer>(Arrays.asList(d));%>
<%ArrayList<String> elabel=new ArrayList<String>(Arrays.asList(e));%>
<%!ResultSet win;%>



<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Graph</title>
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
        <link rel="stylesheet" href="css/grid.css"/>
    </head>
    <body>
         <%
            //Checking whether admin in session or not
            if (session.getAttribute("uname") != null && session.getAttribute("uname") != "") {
        %>
        <jsp:include page="adminHeader.jsp"></jsp:include>
        <br>

      
         
       
       
        <p>  
        <%
        try {
                Class.forName("com.mysql.jdbc.Driver");
                try {
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/shop", "root", "");
                    Statement st = conn.createStatement();
                   
                    //BAR GRAPH
                    res=st.executeQuery("select * from tblproduct");
                    while(res.next()){
                        xlabel.add("'"+res.getString("name")+"'");
                        ylabel.add(res.getInt("likestatus"));
                    }
                    out.println(ylabel);
                    //PIE CHART
                   rest=st.executeQuery("select * from tblorders");
                   while(rest.next()){
                       namelabel.add("'"+rest.getString("product_name")+"'");
                       paylabel.add(rest.getInt("product_price"));
                   }
                  out.println(paylabel);
                    //LINE CHART
                    bred=st.executeQuery("select * from tblorders");
                    while(bred.next()){
                        tlabel.add("'"+bred.getString("category")+"'");
                        slabel.add(bred.getInt("product_price"));
            }
                    win=st.executeQuery("select * from tblorders");
                    while(win.next()){
                        elabel.add("'"+win.getString("order_status")+"'");
                        dlabel.add(win.getInt("order_no"));
            }
            } catch (SQLException e) {
                    e.printStackTrace();
                }
            } catch(ClassNotFoundException e) {
                e.printStackTrace();
            }
        %>
        <div>
           
        <div class="main">
        <div class="charts">
           
            <div class="chart">
                <div>
            <canvas id="line"></canvas>
                </div>
            </div>
          
            <div class="chart">
                <div>
            <canvas id="r2"></canvas>
                </div>
            </div>
            
            <div class="chart">
                <div>
            <canvas id="drr"></canvas>
                </div>
            </div>
             <div class="chart">
                <div>
            <canvas id="great"></canvas>
                </div>
            </div>
        </div>
        </div>
          
        <script src="./js/chart.min.js"></script>
        <script>
    
var ctx = document.getElementById("line").getContext("2d");
var myChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: <%out.println(xlabel);%>,
        datasets: [{
            label: 'Likes for different products',
            data: <%out.println(ylabel);%>,
            backgroundColor: [
                'rgba(168,169,173)'

            ],
            borderColor: 'rgb(41, 155, 99)',
            borderWidth: 1
        }
        
    ]
    },
    options: {
        responsive: true,
        scales:{
        y:{
            title:{
                display:true,
                text:"Number of likes"
            }
        },
        x:{
            title:{
                display:true,
                text:"Kinds of Beverages"
            }
        }
        }
    }
});


        </script>
        <script>
  var ctx2 = document.getElementById('r2').getContext('2d');
var myChart2 = new Chart(ctx2, {
    type: 'pie',
    data: {
        labels: <%out.println(namelabel);%>,

        datasets: [{
            label: 'Trend for the products and their product price',
            data: <%out.println(paylabel);%>,
            backgroundColor: [
                'rgba(41, 155, 99, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(120, 46, 139,1)'

            ],
            borderColor: [
                'rgba(41, 155, 99, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(120, 46, 139,1)'

            ],
            borderWidth: 1
        }]

    },
    options: {
        responsive: true,
        indexAxis: 'Sales',
        "maintainAspectRatio": false
    }
});
</script>

<script>
    var ctx3 = document.getElementById("drr").getContext("2d");
var myChart3 = new Chart(ctx3, {
    type: 'line',
    data: {
        labels: <%out.println(tlabel);%>,
        datasets: [{
            label: 'Trend of productline and product category over a period',
            data: <%out.println(slabel);%>,
            backgroundColor: [
                'rgba(0,0,255)'

            ],
            borderColor: 'rgb(41, 155, 99)',
            borderWidth: 1
        }
        
    ]
    },
    options: {
        responsive: true,
        scales:{
        y:{
            title:{
                display:true,
                text:"Product price"
            }
        },
        x:{
            title:{
                display:true,
                text:"Category"
            }
        }
        }
    }
});




        </script>
        
         <script>
    
var ctx4 = document.getElementById("great").getContext("2d");
var myChart4 = new Chart(ctx4, {
    type: 'doughnut',
    data: {
        labels: <%out.println(elabel);%>,
        datasets: [{
            label: 'Order numbers and Order Status ',
            data: <%out.println(dlabel);%>,
            backgroundColor: [
                'rgba(0,255,0)'

            ],
            borderColor: 'rgb(41, 155, 99)',
            borderWidth:1
        }
        
    ]
    },
    options: {
        responsive: true,
        scales:{
        y:{
            title:{
                display:true,
                text:""
            }
        },
        x:{
            title:{
                display:true,
                text:""
            }
        }
        }
    }
});


        </script>
         <jsp:include page="footer.jsp"></jsp:include>
            <script src="assets/js/jquery-1.10.2.js"></script>
            <script src="assets/js/bootstrap.js"></script>
            <script src="assets/js/custom.js"></script>
        <%
            } else {
                response.sendRedirect("admin-login.jsp");
            }
      %>
        </p>
    </body>
</html>

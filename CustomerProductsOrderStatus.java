

import com.connection.DatabaseConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;


@WebServlet("/CustomerProductsOrderStatus")
public class CustomerProductsOrderStatus extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int statusMode = 0;
            //Taking input from admin order-id to get the order status from the database
            ResultSet rs = DatabaseConnection.getResultFromSqlQuery("select order_status from tblorders where order_no='" + request.getParameter("orderId") + "'");
            while (rs.next()) {
                if (rs.getString(1).equals("Deliver")) {
                    statusMode = DatabaseConnection.insertUpdateFromSqlQuery("update tblorders set order_status='Pending' where order_no='" + request.getParameter("orderId") + "'");
                } else {
                    statusMode = DatabaseConnection.insertUpdateFromSqlQuery("update tblorders set order_status='Deliver' where order_no='" + request.getParameter("orderId") + "'");
                }
            }
            if (statusMode > 0) {
                //Sending response back to admin-all-orders.jsp page when sql query executed sucesfully
                response.sendRedirect("admin-all-orders.jsp");
            } else {
                //Sending response back to admin-all-orders.jsp page
                response.sendRedirect("admin-all-orders.jsp");
            }
        } catch (IOException | SQLException e) {
        }
    }

}

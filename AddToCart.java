
import java.io.IOException;

import com.connection.DatabaseConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/AddToCart")
public class AddToCart extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = 0;

        //Getting all the parameters from the user
        int productId = Integer.parseInt(request.getParameter("productId"));
        String price = request.getParameter("price");
        String category=request.getParameter("product");
        HttpSession hs = request.getSession();
        try {
            //If user session is null user have to re-login
            if ((String) hs.getAttribute("name") == null) {
                response.sendRedirect("customer-login.jsp");
                //Inserting cart details to the database
            } else {
                int customerId = (int) hs.getAttribute("id");
                //Querying to the database.
                int addToCart = DatabaseConnection.insertUpdateFromSqlQuery("insert into tblcart values('" + id + "','" + price + "',1,'" + price + "','" + customerId + "','" + productId + "','" + category + "')");
                if (addToCart > 0) {
                    response.sendRedirect("products.jsp");
                }
            }

        } catch (IOException e) {
        }
    }
}

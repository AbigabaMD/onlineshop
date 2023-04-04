
import java.io.IOException;


import com.connection.DatabaseConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/AddCustomer")
public class AddCustomer extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //Retrieving values from the frontend
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String mobile = request.getParameter("mobile");
        String gender = request.getParameter("gender");
        String address = request.getParameter("address");
        String pincode = request.getParameter("pincode");

        //Creating Session
        HttpSession hs = request.getSession();

        //Inserting all values inside the database
        try {
            //Connecting database connection and querying in the database
            int addCustomer = DatabaseConnection.insertUpdateFromSqlQuery("insert into tblcustomer(address,email,gender,name,password,phone,pin_code)values('" + address + "','" + email + "','" + gender + "','" + name + "','" + password + "','"
                    + mobile + "','" + pincode + "')");

            //If customer registered successfully
            if (addCustomer > 0) {
                String message = "Customer register successfully.";
                //Passing message via session.
                hs.setAttribute("success-message", message);
                //Sending response back to the user/customer
                response.sendRedirect("customer-login.jsp");
            } else {
                //If customer fails to register 
                String message = "Customer registration fail";
                //Passing message via session.
                hs.setAttribute("fail-message", message);
                //Sending response back to the user/customer
                response.sendRedirect("customer-register.jsp");
            }
        } catch (IOException ex) {
        }
    }
}

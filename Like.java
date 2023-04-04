/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import com.connection.DatabaseConnection;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class Like extends HttpServlet {

    
    public void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        String a = request.getParameter("id");
        String liking = request.getParameter("new");
        
        Cookie[] cook = request.getCookies();
        if(cook != null){
        for(Cookie co:cook){
        if(co.getValue().equals(a)){
        liking = request.getParameter("orig");
        
        }
        }
        
        
        
        }
        Cookie ck = new Cookie("ck", a);
        response.addCookie(ck);
        
        try{
           
        
         DatabaseConnection.insertUpdateFromSqlQuery("update tblproduct set likestatus='"+liking+"' where id='"+a+"'");
        RequestDispatcher rs = request.getRequestDispatcher("products.jsp");
        rs.forward(request,response);
        }catch(Exception e){
        out.println("error:" +e.getMessage());
        }
        
        
    }

    

}

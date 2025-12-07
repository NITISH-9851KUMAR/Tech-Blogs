package servlet;


import entities.Message;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/logout-servlet")
public class LogoutServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session= request.getSession();
        session.removeAttribute("CurrentUser");

        Message message= new Message("Logout Successfully");
        session.setAttribute("message", message);
        response.sendRedirect("login-page.jsp");
    }
}

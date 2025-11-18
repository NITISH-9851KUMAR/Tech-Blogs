package servlet;

import dao.*;
import entities.Message;
import entities.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/login")
public class login_servlet extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response)
        throws IOException, ServletException {

        response.setContentType("text/html");
        PrintWriter out= response.getWriter();

        String uName= request.getParameter("email");
        String UPassword= request.getParameter("password");

        // call the login Dao
        User user= new loginDao().getUserByUserNameAndPassword(uName, UPassword);

        if(user==null){
            // login error, could be wrong email or password
            Message message= new Message("Invalid Details! try with another email & Password");
            // Set message in session object
            HttpSession session= request.getSession();
            session.setAttribute("message", message);
            response.sendRedirect("login-page.jsp");
        }
        else{ // if login success
            // Create a session object
            HttpSession session= request.getSession();
            session.setAttribute("CurrentUser", user);
            response.sendRedirect("profile.jsp"); // Redirect it profile page
        }
    }

}

package servlet;

import dao.SignupDao;
import entities.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import javax.servlet.http.HttpSession;

@MultipartConfig
@WebServlet("/signup-servlet")
public class SignUp_Servlet extends HttpServlet{


    public void doPost(HttpServletRequest request, HttpServletResponse response)
        throws IOException, ServletException {

        response.setContentType("text/html");
        PrintWriter out= response.getWriter();

        // Get the Date value
        LocalDateTime dateTime= LocalDateTime.now();
        DateTimeFormatter formatter= DateTimeFormatter.ofPattern("dd-MM-yyyy hh-mm");
        String dateNow= dateTime.format(formatter);

        // Get The value from register-page.jsp
        String uName= request.getParameter("user_name");
        String email= request.getParameter("email");
        String gender= request.getParameter("gender");
        String password= request.getParameter("password");

        // Call Signup Details Entities class for set value of Signup Details
        User user= new User(uName, email, gender, password, dateNow);

        // call SignupDetailsDao for save data into database;
        SignupDao sDao= new SignupDao();
        if (sDao.saveSignupData(user)) {
            response.setStatus(HttpServletResponse.SC_OK);
            out.println("Successfully Register"); // Set the Message

            // set email and password value into session object
            HttpSession session= request.getSession();
            session.setAttribute("email", email);
            session.setAttribute("pass", password);
        } else {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            out.println("Email already exists"); // Set the Message
        }

    }

}

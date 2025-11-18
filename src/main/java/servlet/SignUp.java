package servlet;

import dao.SignupDetailsDao;
import entities.SignupDetailsEn;

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

@MultipartConfig
@WebServlet("/signup-servlet")
public class SignUp extends HttpServlet{


    public void doPost(HttpServletRequest request, HttpServletResponse response)
        throws IOException, ServletException {

        response.setContentType("text/html");
        PrintWriter out= response.getWriter();

        // Get the Date value
        LocalDateTime dateTime= LocalDateTime.now();
        DateTimeFormatter formatter= DateTimeFormatter.ofPattern("dd-MM-yyyy hh-MM");
        String dateNow= dateTime.format(formatter);

        // Get The value from register-page.jsp
        String uName= request.getParameter("user_name");
        String email= request.getParameter("email");
        String gender= request.getParameter("gender");
        String password= request.getParameter("password");

        // Call Signup Details Entities class for set value of Signup Details
        SignupDetailsEn sEn= new  SignupDetailsEn(uName, email, gender, password, dateNow);

        // call SignupDetailsDao for save data into database;
        SignupDetailsDao sDao= new SignupDetailsDao();
        if(sDao.saveSignupData(sEn) == true){
            out.println("Done");
        }else{
            out.println("Some Error Occurred");
        }

    }

}

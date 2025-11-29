package servlet;

import dao.SignupDao;
import entities.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.io.File;

@MultipartConfig
@WebServlet("/signup-servlet")
public class Register_Servlet extends HttpServlet{


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

        // Getting the image information form the client
        Part photoPart= request.getPart("photo");
        // Read photo name as String
        String photoName= photoPart.getSubmittedFileName();
        // Save Photo into the local Folder
        String uploadPath= getServletContext().getRealPath("/img");
        // It Treats as file
        File uploadDir= new File(uploadPath);
        if(!uploadDir.exists()){ // if uploadDir doesn't exist then create this, but in this case it exists
            uploadDir.mkdirs();
        }

        photoPart.write(uploadPath+File.separator+photoName);
        // It Save photo into the local folder

        // Call Signup Details Entities class for set value of Signup Details
        User user= new User(uName, email, gender, password, dateNow , photoName);

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

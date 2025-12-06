package servlet;

import dao.UserDao;
import entities.Message;
import entities.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.http.Part;

@WebServlet("/edit-servlet")
@MultipartConfig
public class UpdateUserServlet extends HttpServlet{

    public void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        PrintWriter out= response.getWriter();
        response.setContentType("text/html");

        // Fetch User data
        int userId= Integer.parseInt(request.getParameter("u_id"));
        String name= request.getParameter("u_name").trim();
        String email= request.getParameter("u_email").trim();
        String gender= request.getParameter("u_gender").trim();
        String password= request.getParameter("u_password").trim();

        // Take the profile pic details
        Part photoPart= request.getPart("u_pic");
        String imageName = photoPart.getSubmittedFileName();

        // get the current user details
        HttpSession session= request.getSession();
        User user= (User) session.getAttribute("CurrentUser");

        String oldPicName= user.getImage();

        // Set the value
        user.setUserId(userId);
        user.setUser_name(name);
        user.setEmail(email);
        user.setGender(gender);
        user.setPassword(password);
        user.setImage(imageName);

        boolean flag= new UserDao().updateUserDetails(user);
        if(flag){
            Message msg= new Message("Update Value Successfully");

            // It gives the path of our image
            String path= request.getServletContext().getRealPath("/img")+File.separator+user.getImage();
            String odlPicPath = request.getServletContext().getRealPath("/img")+File.separator+oldPicName;
            UpdatePhoto.deleteFile(odlPicPath); // delete file

            // call the saveFile for update photo
            if(UpdatePhoto.saveFile(photoPart.getInputStream(), path)){
                msg= new Message("Update Value Successfully");
            }
            session.setAttribute("message", msg);
            response.sendRedirect("profile.jsp");
        }else{
            Message msg= new Message("Something Went Wrong");
            session.setAttribute("message", msg);
            response.sendRedirect("profile.jsp");
        }


    }
}

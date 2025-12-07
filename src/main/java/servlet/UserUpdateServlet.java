package servlet;

import dao.UserDao;
import entities.Message;
import entities.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;
import javax.servlet.http.Part;

@WebServlet("/update-user")
@MultipartConfig
public class UserUpdateServlet extends HttpServlet{

    public void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        response.setContentType("text/html");
        // Fetch User data
        int userId= Integer.parseInt(request.getParameter("u_id"));
        String name= request.getParameter("u_name").trim();
        String email= request.getParameter("u_email").trim();
        String gender= request.getParameter("u_gender").trim();
        String password= request.getParameter("u_password").trim();

        // Take the profile pic details
        Part photoPart= request.getPart("u_pic");
        String newPicName = photoPart.getSubmittedFileName();

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
        user.setImage(newPicName);

        boolean flag= UserDao.updateUserDetails(user);
        if(flag){
            Message msg= new Message("Update User Details Successfully");
            // It gives the path of our image
            String path= request.getServletContext().getRealPath("/img")+File.separator+user.getImage();
            String odlPicPath = request.getServletContext().getRealPath("/img")+File.separator+oldPicName;
            deleteOldPic(odlPicPath); // delete oldPic

            // call the saveFile for update photo
            if(saveNewPic(photoPart.getInputStream(), path)){
                msg= new Message("Update User Details Successfully");
            }
            session.setAttribute("message", msg);
            response.sendRedirect("profile.jsp");
        }else{
            Message msg= new Message("Something Went Wrong");
            session.setAttribute("message", msg);
            response.sendRedirect("profile.jsp");
        }

    }

    // Save New Pic Into LocalFolder
    public static boolean saveNewPic(InputStream inputStream, String path){
        boolean flag= false;
        try{

            byte[] bytes = new byte[inputStream.available()];
            inputStream.read(bytes);

            FileOutputStream fos= new FileOutputStream(path);
            fos.write(bytes);
            fos.flush();
            fos.close();
            flag= true;

        }catch(Exception e){
            e.printStackTrace();
        }

        return flag;
    }

    // Delete Old Pic from LocalFolder
    public static boolean deleteOldPic(String path) {
        boolean flag= false;
        try{
            File file= new File(path);
            flag= file.delete();

        }catch(Exception e){
            e.printStackTrace();
        }
        return flag;
    }

}

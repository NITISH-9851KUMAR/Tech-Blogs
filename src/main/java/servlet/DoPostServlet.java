package servlet;

import dao.PostDao;
import entities.Post;
import entities.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/doPostServlet")
@MultipartConfig
public class DoPostServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        PrintWriter out= response.getWriter();

        int catId= Integer.parseInt(request.getParameter("cid").trim());
        String postTitle= request.getParameter("postTitle").trim();
        String postContent= request.getParameter("postContent").trim();
        String postCode= request.getParameter("postCode").trim();
        Part photoPart= request.getPart("postPic");
        String picName= photoPart.getSubmittedFileName().trim();


        // Get current user id
        HttpSession session= request.getSession();
        User user= (User) session.getAttribute("CurrentUser");

        Post post= new Post(postTitle, postContent, postCode, picName, catId, user.getId());

        if(PostDao.savePost(post)){
            // Also we can write this program outside of if block, it is good thing to write inside this block
            // Because when our db store successfully all data then we store picImage in local folder
            // save photo to the local folder
            String uploadPath= getServletContext().getRealPath("/img");
            // It save to the Local Folder
            photoPart.write(uploadPath+File.separator+picName);
            out.println("Done");
        } else{
            out.println("Something Went Wrong");
        }
    }
}

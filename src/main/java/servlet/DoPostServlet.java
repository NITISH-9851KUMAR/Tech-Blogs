package servlet;

import dao.PostDao;
import entities.Post;
import entities.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
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
        Part par= request.getPart("postPic");
        String picName= par.getSubmittedFileName().trim();

//        out.println(catId);
//        out.println(postTitle);
//        out.println(postContent);
//        out.println(postCode);
//        out.println(picName);

        // Get current user id
        HttpSession session= request.getSession();
        User user= (User) session.getAttribute("currentUser");

        Post post= new Post(postTitle, postContent, postCode, picName, catId, user.getId());

        PostDao postDao= new PostDao();

        if(postDao.savePost(post)){
            out.println("Save Post Details to the Database Successfully!");
        } else{
            out.println("Something Went Wrong");
        }
    }
}

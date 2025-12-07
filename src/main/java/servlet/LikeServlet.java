package servlet;

import dao.LikeDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/like-servlet")
public class LikeServlet extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {

        String operation= request.getParameter("operation");
        int pId= Integer.parseInt(request.getParameter("pid"));
        int uId= Integer.parseInt(request.getParameter("uid"));

        if(operation.equals("like")){
            // class LikeDao for like post
            boolean flag= LikeDao.insertLike(pId, uId);
            response.getWriter().println(flag);
        }

    }

}

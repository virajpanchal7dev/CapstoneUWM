package net.codejava;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/replypost")
public class UserPostReply extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public UserPostReply() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (session != null) {
			
			String pid = request.getParameter("pid");
			
			UserDiscussionDao discussionDao  = new UserDiscussionDao();
			
			try {
				CommonBean postdetail = new CommonBean();
				
				
				postdetail = discussionDao.fetchUserPost(Integer.parseInt(pid));	
				postdetail.setPid(Integer.parseInt(pid));
				
				List<CommonBean> list = new ArrayList<CommonBean>(); 
				
				list = discussionDao.fetchPostsReply(Integer.parseInt(pid));	
				
				if (!list.isEmpty()) {
					
					session.setAttribute("title", "Reply");
					session.setAttribute("postAllReply", list);
					session.setAttribute("postdetail", postdetail);
					session.setAttribute("rcnt", list.get(0).getCount());
					RequestDispatcher dispatcher = request.getRequestDispatcher("postreply.jsp");
					dispatcher.forward(request, response);
					
				}
				else {
					
					session.setAttribute("title", "Reply");
					session.setAttribute("postAllReply", "null");
					session.setAttribute("postdetail", postdetail);
					RequestDispatcher dispatcher = request.getRequestDispatcher("postreply.jsp");
					dispatcher.forward(request, response);
					
				}
				
				/*
				 * session.setAttribute("title", "Reply"); session.setAttribute("postdetail",
				 * postdetail); RequestDispatcher dispatcher =
				 * request.getRequestDispatcher("postreply.jsp"); dispatcher.forward(request,
				 * response);
				 */
				
			} catch (Exception ex) {
				throw new ServletException(ex);
			}
			
			
			
		}
	}
	
}
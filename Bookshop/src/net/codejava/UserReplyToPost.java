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

@WebServlet("/replytopost")
public class UserReplyToPost extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public UserReplyToPost() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (session != null) {
			
			String id = request.getParameter("id");
			String pid = request.getParameter("pid");
			String reply = request.getParameter("reply");
			
			//System.out.println(id + " " + pid +  " " + reply);
			
			UserDiscussionDao discussionDao  = new UserDiscussionDao();
			
			try {
				
				UserPostReplyBean replybean = new UserPostReplyBean();
				replybean.setId(Integer.parseInt(id));
				replybean.setPid(Integer.parseInt(pid));
				replybean.setReply(reply);
				
				discussionDao.insertPostReply(replybean);
				
				List<CommonBean> list = new ArrayList<CommonBean>(); 
				
				list = discussionDao.fetchPostsReply(Integer.parseInt(pid));	
				
				if (!list.isEmpty()) {
					
					session.setAttribute("title", "Reply");
					session.setAttribute("postAllReply", list);
					session.setAttribute("rcnt", list.get(0).getCount());
					RequestDispatcher dispatcher = request.getRequestDispatcher("postreply.jsp");
					dispatcher.forward(request, response);
					
				}
				else {
					
					session.setAttribute("title", "Reply");
					session.setAttribute("postAllReply", "null");
					RequestDispatcher dispatcher = request.getRequestDispatcher("postreply.jsp");
					dispatcher.forward(request, response);
					
				}
				
			} catch (Exception ex) {
				throw new ServletException(ex);
			}
			
			 
		}
	}
	
}

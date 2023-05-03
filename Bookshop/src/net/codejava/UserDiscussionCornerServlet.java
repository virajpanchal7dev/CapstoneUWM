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


@WebServlet("/discussioncorner")
public class UserDiscussionCornerServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public UserDiscussionCornerServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (session != null) {
			
			String id = request.getParameter("id");
			
			UserDiscussionDao discussionDao  = new UserDiscussionDao();
			
			try {
				List<CommonBean> list = new ArrayList<CommonBean>(); 
				
				list = discussionDao.fetchAllUsersPost();	
				
				if (!list.isEmpty()) {
					
					session.setAttribute("title", "Discussion Corner");
					session.setAttribute("allPostList", list);
					session.setAttribute("pcnt", list.get(0).getCount());
					RequestDispatcher dispatcher = request.getRequestDispatcher("discussioncorner.jsp");
					dispatcher.forward(request, response);
					
				}
				else {
					
					session.setAttribute("title", "Discussion Corner");
					session.setAttribute("allPostList", "null");
					RequestDispatcher dispatcher = request.getRequestDispatcher("discussioncorner.jsp");
					dispatcher.forward(request, response);
					
				}
			} catch (Exception ex) {
				throw new ServletException(ex);
			}
			
		}
	}
	
}
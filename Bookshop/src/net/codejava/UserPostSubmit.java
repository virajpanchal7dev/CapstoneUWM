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

@WebServlet("/submitquestion")
public class UserPostSubmit extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public UserPostSubmit() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (session != null) {
			
			String id = request.getParameter("id");
			String category = request.getParameter("category");
			String query = request.getParameter("query");
			
			//System.out.println(id + " " + category +  " " + query);
			
			UserDiscussionDao discussionDao  = new UserDiscussionDao();
			
			try {
				
				UserPosts posts = new UserPosts();
				posts.setId(Integer.parseInt(id));
				posts.setCategory(category);
				posts.setDescription(query);
				
				discussionDao.insertUserPost(posts);
				
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
			
			
			
			/*
			 * session.setAttribute("title", "Discussion Corner");
			 * session.setAttribute("allPostList", "null"); RequestDispatcher dispatcher =
			 * request.getRequestDispatcher("discussioncorner.jsp");
			 * dispatcher.forward(request, response);
			 */
		}
	}
	
}
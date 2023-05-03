package net.codejava;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login")
public class UserLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UserLoginServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		UserDAO userDao = new UserDAO();
		
		try {
			User user = userDao.checkLogin(email, password);
			String destPage = "login.jsp";
			
			if (user != null) {
				HttpSession session = request.getSession();
				
				int userInfo = user.getIsadmin();
				
				String userDetail = null;
				
				if(userInfo == 1)
					userDetail = "Admin";
				else if(userInfo == 2) 
					userDetail = "Prospective Student";
				/*
				 * else if(userInfo == 2) userDetail = "Prospective Student"; else if(userInfo
				 * == 3) userDetail = "Enrolled Student"; else if(userInfo == 4) userDetail =
				 * "Advisor/ Instructor";
				 * 
				 * 
				 */
				
				
				TransportationDao transportationDao  = new TransportationDao();
				UserDiscussionDao discussionDao  = new UserDiscussionDao();
				try {
					// Transportation Request
					List<CommonBean> list = new ArrayList<CommonBean>(); 
					
					list = transportationDao.fetchAllTransportationRequest();
					
					if (!list.isEmpty()) {
						session.setAttribute("tcnt", list.get(0).getCount());
					}
					else {
						session.setAttribute("tcnt", 0);
					}
					
					
					// User List
					List<CommonBean> list1 = new ArrayList<CommonBean>(); 
					
					list1 = userDao.fetchAllUserDetailAdmin();
					
					if (!list1.isEmpty()) {
						session.setAttribute("cnt", list1.get(0).getCount());
					} else {
						session.setAttribute("cnt", 0);
					}
					
					// Discussion List
					List<CommonBean> list2 = new ArrayList<CommonBean>(); 
					
					list2 = discussionDao.fetchAllUsersPost();
					
					if (!list2.isEmpty()) {
						session.setAttribute("pcnt", list2.get(0).getCount());
					} else {
						session.setAttribute("pcnt", 0);
					}
					
				} catch (Exception ex) {
					throw new ServletException(ex);
				}
				
				session.setAttribute("title"," Dashboard");
				session.setAttribute("user", user);
				session.setAttribute("userDetail", userDetail);
				destPage = "dashboard.jsp";
				
			} else {
				String message = "Invalid email/password";
				request.setAttribute("message", message);
			}
			
			RequestDispatcher dispatcher = request.getRequestDispatcher(destPage);
			dispatcher.forward(request, response);
			
		} catch (SQLException | ClassNotFoundException ex) {
			throw new ServletException(ex);
		}
	}

}

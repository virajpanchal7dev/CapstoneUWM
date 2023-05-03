package net.codejava;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/profile")
public class UserProfileServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public UserProfileServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (session != null) {
			//session.removeAttribute("user");
			String id = request.getParameter("id");
			
			
			UserDAO userDao = new UserDAO();
			try {
				UserDetail userDetails = userDao.fetchUserDetail(Integer.parseInt(id));
				//String destPage = "login.jsp";
				
				if (userDetails != null) {
				
					session.setAttribute("title", "User Profile");
					session.setAttribute("userDetails", userDetails);
					RequestDispatcher dispatcher = request.getRequestDispatcher("profile.jsp");
					dispatcher.forward(request, response);
			
				}

			}  catch (SQLException | ClassNotFoundException ex) {
				throw new ServletException(ex);
			}
		}
	
	}
}
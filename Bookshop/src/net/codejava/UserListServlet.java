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

@WebServlet("/allusers")
public class UserListServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public UserListServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (session != null) {
			//session.removeAttribute("user");
			UserDAO userDao = new UserDAO();
			try {
				List<CommonBean> list = new ArrayList<CommonBean>(); 
						
				list = userDao.fetchAllUserDetailAdmin();
				
				if (list != null) {
					
					session.setAttribute("title", "User List");
					session.setAttribute("list", list);
					session.setAttribute("cnt", list.get(0).getCount());
					RequestDispatcher dispatcher = request.getRequestDispatcher("userlist.jsp");
					dispatcher.forward(request, response);
			
				}
	
			}  catch (SQLException | ClassNotFoundException ex) {
				throw new ServletException(ex);
			}
		}
	}
}
package net.codejava;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/dashboard")
public class UserDashboard extends HttpServlet{
	private static final long serialVersionUID = 1L;

	public UserDashboard() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (session != null) {
			//session.removeAttribute("user");
			
			//session.setAttribute("title", userDetail + " Dashboard");
			RequestDispatcher dispatcher = request.getRequestDispatcher("dashboard.jsp");
			dispatcher.forward(request, response);
		}
	}

}

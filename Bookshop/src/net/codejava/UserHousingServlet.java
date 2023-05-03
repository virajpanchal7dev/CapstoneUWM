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


@WebServlet("/housing")
public class UserHousingServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public UserHousingServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (session != null) {
			//session.removeAttribute("user");
			HousingDao housingDao = new HousingDao();
			
			try {
				List<CommonBean> list = new ArrayList<CommonBean>(); 
				
				list = housingDao.fetchHousingLocations();
				
				
				if (!list.isEmpty()) {
				
					
					session.setAttribute("title", "Housing");
					session.setAttribute("housinglist", list);
					RequestDispatcher dispatcher = request.getRequestDispatcher("housing.jsp");
					dispatcher.forward(request, response);
			
				}

			}  catch (Exception ex) {
				throw new ServletException(ex);
			}
			
		}
	}
	
}
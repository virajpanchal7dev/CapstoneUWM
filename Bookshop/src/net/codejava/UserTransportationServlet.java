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

@WebServlet("/transportation")
public class UserTransportationServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public UserTransportationServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (session != null) {
			//session.removeAttribute("user");
			String id = request.getParameter("id");

			String destPage = null;
			String message = null;
			TransportationDao transportationDao  = new TransportationDao();
			
			try {
				
				if(id.equals("1")) {
					
					List<CommonBean> list = new ArrayList<CommonBean>(); 
					
					list = transportationDao.fetchAllTransportationRequest();					
					
					if (!list.isEmpty()) {
						
						session.setAttribute("title", "Arrival and Transportation to MKE");
						session.setAttribute("transportationList", list);
						session.setAttribute("tcnt", list.get(0).getCount());
						RequestDispatcher dispatcher = request.getRequestDispatcher("admintransportationrequest.jsp");
						dispatcher.forward(request, response);
						
					}
					else {
						session.setAttribute("title", "Arrival and Transportation to MKE");
						session.setAttribute("transportationList", "null");
						RequestDispatcher dispatcher = request.getRequestDispatcher("admintransportationrequest.jsp");
						dispatcher.forward(request, response);
					}
						
					
				}
				else if(!id.equals("1")) {
					
					int cnt = transportationDao.checkIfRequested(Integer.parseInt(id));
					int req = 0;
					
					if(cnt == 0) {
						destPage = "transportation.jsp";
					}
					else if(cnt == 1) { 
						
						req = transportationDao.checkAfterRequested(Integer.parseInt(id));
						if(req == 0) {
							destPage = "TransRequestForward.jsp";
							message = "Your request of Transportation from Chicago O'Hare Airport, IL to Milwaukee, WI is in Process. Once approved, you can able to view/ download it. Thanks, UWM - ISSS";				
						}
						else if(req == 1) {
							destPage = "TransRequestForward.jsp";
							message = "Your request of Transportation from Chicago O'Hare Airport, IL to Milwaukee, WI is Approved. You View/ Download the ticket.";				
						}
					}
					
						
					session.setAttribute("req", req);
					session.setAttribute("transportationmessage", message);
					session.setAttribute("title", "Arrival and Transportation to MKE");
					RequestDispatcher dispatcher = request.getRequestDispatcher(destPage);
					dispatcher.forward(request, response);
					
				}
				
				
					
			} catch (Exception ex) {
				throw new ServletException(ex);
			}
			
			
		}
	}
	
}
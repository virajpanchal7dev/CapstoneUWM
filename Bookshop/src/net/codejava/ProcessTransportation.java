package net.codejava;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/processtransportation")
public class ProcessTransportation extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public ProcessTransportation() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		

		String flightdate = request.getParameter("flightdate");
		String arrivaldate = request.getParameter("arrivaldate");
		String id = request.getParameter("id");
		
		
		
		
		HttpSession session = request.getSession();
		
		TransportationDao transportationDao  = new TransportationDao();
		
		try {
			
			int cnt = transportationDao.checkIfRequested(Integer.parseInt(id));
			String destPage = "TransRequestForward.jsp";
			String message = null;
			
			if(cnt == 0) {
				UserTransportationReq transportationReq = new UserTransportationReq();
				transportationReq.setId(Integer.parseInt(id));
				transportationReq.setFlightdate(flightdate);
				transportationReq.setArrivaldate(arrivaldate);
				transportationReq.setRequest(0);
				
				transportationDao.insertTransportationRequest(transportationReq);

				message = "Your request of Transportation from Chicago O'Hare Airport, IL to Milwaukee, WI is in Process. Once approved, you can able to view/ download it. Thanks, UWM - ISSS";
				
			}
			else if(cnt == 1){
			    message = "Your request of Transportation from Chicago O'Hare Airport, IL to Milwaukee, WI is in Process.";
			}
			 

			session.setAttribute("title", "Arrival and Transportation to MKE");
			session.setAttribute("req", cnt);
			session.setAttribute("transportationmessage", message);
			RequestDispatcher dispatcher = request.getRequestDispatcher(destPage);
			dispatcher.forward(request, response);
			
		} catch (Exception ex) {
			throw new ServletException(ex);
		}
	
		
	}
	
}
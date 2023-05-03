package net.codejava;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet("/ticketOps")
@MultipartConfig(maxFileSize = 16177215) // upload file's size up to 16MB
public class TransportationTicketOperations extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public TransportationTicketOperations() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (session != null) {
			

			InputStream inputStream = null; // input stream of the upload file
			
	        // obtains the upload file part in this multipart request
	        
	        

	        TransportationDao transportationDao  = new TransportationDao();
			
			try {
						
				List<CommonBean> list = new ArrayList<CommonBean>(); 
				
				list = transportationDao.fetchAllTransportationRequest();					
				
				if (!list.isEmpty()) {
					
					for (int i = 0; i < list.size(); i++) {
						Part filePart = request.getPart("ticketfile");
				        if (filePart != null) {
				            // prints out some information for debugging
							/*
							 * System.out.println(filePart.getName());
							 * System.out.println(filePart.getSize());
							 * System.out.println(filePart.getContentType()); System.out.println();
							 */

				            // obtains input stream of the upload file
				            inputStream = filePart.getInputStream();
				            System.out.println(filePart.getSize());
				        }
						transportationDao.uploadTicketToPendingRequests(list.get(i).getTid(), inputStream);
						
			        }
					
					
					session.setAttribute("title", "Arrival and Transportation to MKE");
					session.setAttribute("transportationList", "null");
					//session.setAttribute("tcnt", list.get(0).getCount());
					RequestDispatcher dispatcher = request.getRequestDispatcher("admintransportationrequest.jsp");
					dispatcher.forward(request, response);
					
				}
				else {
					session.setAttribute("title", "Arrival and Transportation to MKE");
					session.setAttribute("transportationList", "null");
					RequestDispatcher dispatcher = request.getRequestDispatcher("admintransportationrequest.jsp");
					dispatcher.forward(request, response);
				}
							
				
				
				
				
				
					
			} catch (Exception ex) {
				throw new ServletException(ex);
			}
			
			
		}
	}
	
}
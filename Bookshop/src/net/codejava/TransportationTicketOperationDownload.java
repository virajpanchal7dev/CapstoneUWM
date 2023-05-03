package net.codejava;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ticketOpsDownload")
public class TransportationTicketOperationDownload extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final int BUFFER_SIZE = 4096;   

	public TransportationTicketOperationDownload() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (session != null) {
	        
			String id = request.getParameter("id");
			
	        TransportationDao transportationDao  = new TransportationDao();
			
			try { 
				
				List<CommonBean> list = new ArrayList<CommonBean>(); 
				
				list = transportationDao.fetchTicket(Integer.parseInt(id));
				
				if (!list.isEmpty()) {
					
						String fileName = "Panther Pickup.pdf";
						//String fileName = result.getString("file_name");
		                Blob blob = list.get(0).getTicket();
		                InputStream inputStream = blob.getBinaryStream();
		                int fileLength = inputStream.available();
		                
		                System.out.println("fileLength = " + fileLength);
		                
		                ServletContext context = getServletContext();
		                
		                // sets MIME type for the file download
		                String mimeType = context.getMimeType(fileName);
		                if (mimeType == null) {        
		                    mimeType = "application/octet-stream";
		                }              
		                
		                // set content properties and header attributes for the response
		                response.setContentType(mimeType);
		                response.setContentLength(fileLength);
		                String headerKey = "Content-Disposition";
		                String headerValue = String.format("attachment; filename=\"%s\"", fileName);
		                response.setHeader(headerKey, headerValue);
		 
		                // writes the file to the client
		                OutputStream outStream = response.getOutputStream();
		                 
		                byte[] buffer = new byte[BUFFER_SIZE];
		                int bytesRead = -1;
		                 
		                while ((bytesRead = inputStream.read(buffer)) != -1) {
		                    outStream.write(buffer, 0, bytesRead);
		                }
		                 
		                inputStream.close();
		                outStream.close();             
		                 
					
				} else  {
					System.out.println("File not found");  
				}
				
				
			} catch (Exception ex) {
				throw new ServletException(ex);
			}
			
			
		}
	}
	
}

package net.codejava;

import java.sql.Blob;

public class UserTransportationReq {

	private int tid;
	private int id;
	private String flightdate;
	private String arrivaldate;
	private int request;
	private Blob ticket;
	private String filename;
	
	public int getTid() {
		return tid;
	}
	public void setTid(int tid) {
		this.tid = tid;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFlightdate() {
		return flightdate;
	}
	public void setFlightdate(String flightdate) {
		this.flightdate = flightdate;
	}
	public String getArrivaldate() {
		return arrivaldate;
	}
	public void setArrivaldate(String arrivaldate) {
		this.arrivaldate = arrivaldate;
	}
	public int getRequest() {
		return request;
	}
	public void setRequest(int request) {
		this.request = request;
	}
	public Blob getTicket() {
		return ticket;
	}
	public void setTicket(Blob ticket) {
		this.ticket = ticket;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	
	
	
}

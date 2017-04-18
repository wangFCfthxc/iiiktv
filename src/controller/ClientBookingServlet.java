package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.ClientRegisterBean;
import songDAO.BookingDAO;

@WebServlet("/ClientBookingServlet.controller")
public class ClientBookingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ClientBookingServlet() {}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		ClientRegisterBean clientbean = (ClientRegisterBean)session.getAttribute("clientBean");
		
		if(clientbean == null){
			response.sendRedirect("MessagePage/notClient.html");
		}
		
		String calendar = request.getParameter("calendar");
		String time = request.getParameter("time");
		String num = request.getParameter("num");
		String pkid = request.getParameter("pkId");
		
		int period = 0;
		int number = 0;
		
		
		if(time!=null&&time.length()!=0){
			period = Integer.parseInt(time);
		}
		if(num!=null&&num.length()!=0){
			number = Integer.parseInt(num);
		}
		
		if((calendar!=null&&calendar.length()!=0)&&period!=0&&number!=0){
			BookingDAO dao = new BookingDAO();
			String clientid = clientbean.getClientId();
			dao.setBooking(clientid, calendar, period, number);
			response.sendRedirect("MessagePage/bookingSuccess.html");
		}
		
		if(pkid!=null&&pkid.length()!=0){
			int id = Integer.parseInt(pkid);
			BookingDAO dao = new BookingDAO();
			dao.deleteClientBooking(id);
			response.sendRedirect("Login/queryBooking.jsp");
		}
		
	}

}

package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.ClientRegisterBean;
import songDAO.ClientRegisterDAO;


@WebServlet("/ClientUpLookServlert.controller")
public class ClientUpdateLookupsServlert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ClientUpdateLookupsServlert() {}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		ClientRegisterBean clientbean = null;
		String clientId = null;
		HttpSession session = request.getSession();
		clientbean = (ClientRegisterBean)session.getAttribute("clientBean");
		
		if(clientbean==null){
			response.sendRedirect("MessagePage/notClient.html");
			return;
		}else{
			clientId = clientbean.getClientId();
		}
		
		String tel = request.getParameter("tel");
		
		
		
		
		if((tel.length()!=0&&tel!=null)&&clientId.length()!=0&clientId!=null){
		ClientRegisterDAO dao = new ClientRegisterDAO();
			if(dao.updataClientPhone(tel, clientId)){
				request.getRequestDispatcher("MessagePage/updateSuccess.jsp").forward(request, response);
				return;
			}else{
				request.getRequestDispatcher("MessagePage/erroPage.html").forward(request, response);
				return;
			}
		}
		
		if(clientId.length()!=0&clientId!=null){
			
		}
	}

}

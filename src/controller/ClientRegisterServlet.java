package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import songDAO.ClientRegisterDAO;

@WebServlet("/ClientRegisterServlet.controller")
public class ClientRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public ClientRegisterServlet() {}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
		String years = request.getParameter("years");
		String months = request.getParameter("months");
		String days = request.getParameter("days");

		ClientRegisterDAO dao = new ClientRegisterDAO();

		
		
		//邏輯判斷
		if((name!=null&&name.length()!=0) && (email!=null && email.length()!=0)&&(id!=null&&name.length()!=0)){
						
			if(dao.WhetherRegister(id)!=false){
				HttpSession session = request.getSession();
				session.setAttribute("clientBean", dao.getClientBean(id));
				request.getRequestDispatcher("MessagePage/hasClient.html").forward(request, response);
				return;
			}else{
				//do register view setAttribute Id name email request.forward view
				HttpSession session = request.getSession();
				session.setMaxInactiveInterval(60);
				session.setAttribute("id", id);
				session.setAttribute("name", name);
				session.setAttribute("email", email);
				request.getRequestDispatcher("Login/menberRegister02.jsp").forward(request, response);
				return;
			}
		}
		
		//do clientRegister
		if((tel!=null&&tel.length()!=0)&&(years!=null&&years.length()!=0)&&(months!=null&&months.length()!=0)&&(days!=null&&days.length()!=0)){
			id = (String) request.getSession().getAttribute("id");
			name = (String) request.getSession().getAttribute("name");
			email = (String) request.getSession().getAttribute("email");
			String birth = years + "-" + months + "-" + days;
			if(id!=null&&name!=null&&email!=null){
				System.out.println(id + name + email + birth + tel);
				dao.DecideRegister(id, name, email, birth, tel);
				HttpSession session = request.getSession();
				session.setAttribute("clientBean", dao.getClientBean(id));
				request.getRequestDispatcher("MessagePage/joinSuccess.jsp").forward(request, response);
				return;
			}else{
				response.sendRedirect("MessagePage/overTime.html");
				return;
			}
		}
		
		response.sendRedirect("MessagePage/erroPage.html");
		return;
	}

}

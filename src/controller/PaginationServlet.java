package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import songDAO.PaginationDAO;



@WebServlet(
		urlPatterns={"/paginationServlet.controller"}
		)
public class PaginationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		
		String temp1 = request.getParameter("searchOptions");
		String temp2 = request.getParameter("searchText");
		String temp3 = request.getParameter("pageSearch");
		String temp4 = request.getParameter("paginationMark");
		PaginationDAO dao = new PaginationDAO();
		int pagination = 1;
		if(temp4!=null && temp4.length()!=0){
			pagination = Integer.parseInt(temp4);
		}
		
		if(temp3!=null && temp3.length()!=0){
			request.setAttribute("first", dao.viewSingerPaginationList(temp3, pagination));
			request.setAttribute("second", dao.pageSingerTotal(temp3));
			request.setAttribute("currentPage", pagination);
			request.getRequestDispatcher("processRequest.jsp").forward(request, response);
			return;
		}
		
		if(temp1.equals("songName") && temp2!=null && temp2.length()!=0){
			request.setAttribute("first", dao.viewSongNamePaginationFirst(temp2));
			request.setAttribute("currentPage", pagination);
			request.getRequestDispatcher("processRequest.jsp").forward(request, response);
			return;
		}else if(temp1.equals("singerName") && temp2!=null && temp2.length()!=0){
			request.setAttribute("first", dao.viewSingerPaginationFirst(temp2));
			request.setAttribute("second", dao.pageSingerTotal(temp2));
			request.setAttribute("currentPage", pagination);
			System.out.println(dao.pageSingerTotal(temp2));
			request.getRequestDispatcher("processRequest.jsp").forward(request, response);
			return;
		}
		else{		
			request.getRequestDispatcher("processRequest.jsp").forward(request, response);
			return;
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doGet(request, response);
	}
}

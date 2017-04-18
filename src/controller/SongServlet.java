package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.ClientRegisterBean;
import songDAO.SelectKtvDAO;

@WebServlet("/songServlet.controller")
public class SongServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public SongServlet() {}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		ClientRegisterBean clientbean = null;
		SelectKtvDAO dao = null;
		HttpSession session = request.getSession();
		clientbean = (ClientRegisterBean)session.getAttribute("clientBean");
		
		if(clientbean == null){
			response.sendRedirect("MessagePage/notClient.html");
			return;
		}
		
		String clientId = clientbean.getClientId();
		String songid = request.getParameter("songId");
		String [] ktvid = request.getParameterValues("ktvId");
		int songItem = 0;

		if(songid!=null&&songid.length()!=0){songItem = Integer.parseInt(songid);}
			
		if(songItem!=0&&clientId!=null){
			dao = new SelectKtvDAO();
			dao.getKTVBean(songItem);
			if(dao.setInClientSong(clientId)){
				return;				
			}else{
				return;
			}
		}
		dao = new SelectKtvDAO();
		if(ktvid!=null&&ktvid.length!=0){		
			dao.deleteClientSong(clientId);
			int ktvInt;
			for (String ktvString : ktvid) {
				ktvInt = Integer.parseInt(ktvString);
				dao.getKTVBean(ktvInt);
				dao.setInClientSong(clientId);
			}
			
		}else{
			dao.deleteClientSong(clientId);
		}
		
		response.sendRedirect("Login/clientSongList.jsp");
	}

}

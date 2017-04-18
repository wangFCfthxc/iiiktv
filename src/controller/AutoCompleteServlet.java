package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import songDAO.AutoCompletionDAO;

@WebServlet("/autoCompleteServlet.controller")
public class AutoCompleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	PrintWriter out = null ;
    public AutoCompleteServlet() {}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		out = response.getWriter();
        response.setContentType("text/html");
        response.setHeader("Cache-control", "no-cache, no-store");
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Expires", "-1");
        
        String query = request.getParameter("q");
        String searchOptions = request.getParameter("option");
        JSONArray arrayObj=new JSONArray();
		AutoCompletionDAO dao = new AutoCompletionDAO();
		System.out.println("okok1");
		
		if(searchOptions.equals("singerName")&&query!=null){
			System.out.println(searchOptions);
			List<String> singers = dao.getSingerData(query,"Song_Singer");
			Iterator<String> iterator = singers.iterator();
			while(iterator.hasNext()) {
				arrayObj.put((String)iterator.next());
			}
			out.println(arrayObj.toString());
			return;
		}
		if(searchOptions.equals("songName")&&query!=null){
			List<String> singers = dao.getSingerData(query,"Song_SongName");
			Iterator<String> iterator = singers.iterator();
			while(iterator.hasNext()) {
				arrayObj.put((String)iterator.next());
			}
			out.println(arrayObj.toString());
			return;
		}	
		out.println(arrayObj.toString());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}

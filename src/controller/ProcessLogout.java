package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
public class ProcessLogout extends HttpServlet{
	public void processRequest(HttpServletRequest request, HttpServletResponse response)
				throws IOException, ServletException{
		HttpSession session = request.getSession();
		session.invalidate();
		response.sendRedirect("mainPage.jsp");
		return;	
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		processRequest(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		processRequest(request, response);
	}
}

package controller;

import java.io.IOException;
import java.text.DateFormat;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.*;

@SuppressWarnings("serial")
public class ProcessEditUserSetting extends HttpServlet {
	public void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException, IllegalStateException {

		HttpSession session = request.getSession();
		user normalUser = (user)session.getAttribute("authenticated");

		String name = request.getParameter("name");
		String password = request.getParameter("password");		
		String dateOfBirth = request.getParameter("dateOfBirth");
		String hp = request.getParameter("hp");
		String limit = request.getParameter("limit");
		
		normalUser.setBetLimit(Integer.valueOf(limit));
		normalUser.setPassword(password);
		normalUser.setMobileNo(hp);
		normalUser.setFullname(name);
		normalUser.setDateOfBirth(dateOfBirth);
		
		userDataManager UDM = new userDataManager();
		UDM.modify(normalUser);
		
		response.sendRedirect("/User-Settings.jsp");
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException{
		try{
		processRequest(request, response);
		}catch(IllegalStateException e){
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException{
		try{
		processRequest(request, response);
		}catch(IllegalStateException e){
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}

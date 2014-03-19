package controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.*;

@SuppressWarnings("serial")
public class ProcessAddUser extends HttpServlet {
	public void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException, IllegalStateException {

		String fname = request.getParameter("fname");
		String email = request.getParameter("email");	
		String mobileNo = request.getParameter("mobileNo");
		String dob = request.getParameter("dob");
		String username = request.getParameter("username");		
		String password = request.getParameter("password");
		if(fname.equals("") || email.equals("") || mobileNo.equals("") || dob.equals("") || username.equals("")|| password.equals("")){
			response.sendRedirect("User-Signup.jsp?errMsg=You did not fill up the form!");
			return;
		}
		
		try {
			Date date = new SimpleDateFormat("dd/MM/yyyy").parse(dob);
		} catch (ParseException e) {
			response.sendRedirect("User-Signup.jsp?errMsg=date format error!");
			return;
		}
		
		
		int limit = 500;
		user newUser = new user(username,password,mobileNo,email,fname,dob,limit);
		userDataManager udm = new userDataManager();
		udm.add(newUser);
		response.sendRedirect("mainPage.jsp?errMsg=You had successfully created an account!");
		return;
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

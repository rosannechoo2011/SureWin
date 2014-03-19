package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONValue;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.google.appengine.labs.repackaged.org.json.JSONException;

import model.betHistory;
import model.betHistoryDataManager;
import model.result;
import model.resultDataManager;
import model.user;

@SuppressWarnings("serial")
public class ProcessSaveMatchCart extends HttpServlet {
	public void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException, IllegalStateException {
		
		betHistoryDataManager bhm = new betHistoryDataManager();
		HttpSession session = request.getSession();
		String matchCartItems = (String)session.getAttribute("matchCart");
		if(matchCartItems == null || matchCartItems.equals("")){
			response.sendRedirect("Match-enter4DDetails.jsp?errMsg=You did not add any number to bet");
		}else{
			Object obj = JSONValue.parse(matchCartItems);
			JSONObject reqObj = (JSONObject) obj;
			//creating a new JsonArray
			JSONArray itemArray = new JSONArray();
			Map newJsonItem = new LinkedHashMap();
			
			JSONArray allItem = (JSONArray) reqObj.get("item");	
			if (allItem != null) { 
				int numberOfLoop = allItem.size();				
				for(int i=0;i<numberOfLoop;i++){ 
					JSONObject item = (JSONObject)allItem.get(i);
					
					betHistory bh = new betHistory();
					bh.setDrawDate((String)item.get("drawDate"));
					bh.setBetBig((String)item.get("betBig"));
					bh.setBetSmall((String)item.get("betSmall"));
					bh.setType((String)item.get("type"));
					bh.setBetNumber((String)item.get("betNumber"));
					user loginUser = (user)session.getAttribute("authenticated");
					bh.setUserId(String.valueOf(loginUser.getId()));
					bhm.add(bh);
					
				}
				session.removeAttribute("matchCart");			  
				response.sendRedirect("Dashboard-betHistoryPage.jsp");
				return;
			}else{
				response.sendRedirect("Dashboard-betHistoryPage.jsp");
				return;
			}
			
		}
	
	
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
	
	//this method returns the next id for the items
	public int nextId(String cart){
			Object obj = JSONValue.parse(cart);
			JSONObject reqObj = (JSONObject) obj;		
			JSONArray allItem = (JSONArray) reqObj.get("item");
			int id = 1;
			
			int numberOfLoop = allItem.size();
			for(int i=0;i<numberOfLoop;i++){ 
				JSONObject test = (JSONObject)allItem.get(i);
				String stringId = (String)test.get("id");
				int nextId = Integer.parseInt(stringId);
				if(nextId >= id){
					id = nextId;
				}
			} 				 
			return id+1;
		}
		
}

package controller;

import java.io.IOException;
import java.io.PrintWriter;
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

import model.result;
import model.resultDataManager;

@SuppressWarnings("serial")
public class ProcessRemoveNumberFromMatchCart extends HttpServlet {
	public void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException, IllegalStateException {

		String removeId = request.getParameter("itemRow");

		HttpSession session = request.getSession();
		String matchCartItems = (String)session.getAttribute("matchCart");
		if(matchCartItems == null){
			matchCartItems = " ";
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
					Map individualNumber = new LinkedHashMap();
					String itemID = (String)item.get("id");
					if(!itemID.equals(removeId)){
						individualNumber.put("id", (String)item.get("id"));
						individualNumber.put("drawDate", (String)item.get("drawDate"));
						individualNumber.put("betBig", (String)item.get("betBig"));
						individualNumber.put("betSmall",(String)item.get("betSmall"));
						individualNumber.put("type",(String)item.get("type"));
						individualNumber.put("betNumber", (String)item.get("betNumber"));	
												
						itemArray.add(individualNumber);									
					}										
				}
				newJsonItem.put("item", itemArray);	
				String ItemValue = JSONValue.toJSONString(newJsonItem);
				session.setAttribute("matchCart",ItemValue);				  
				response.sendRedirect("Match-enter4DDetails.jsp");
				return;
			}else{
				response.sendRedirect("Match-enter4DDetails.jsp");
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

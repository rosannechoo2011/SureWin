package model;

import java.util.List;

import com.googlecode.objectify.Objectify;
import com.googlecode.objectify.ObjectifyService;
import com.googlecode.objectify.Query;


public class betHistoryDataManager {
	static{
		ObjectifyService.register(betHistory.class);
	}

	public betHistoryDataManager() {
		// TODO Auto-generated constructor stub
	}
	/**
     * Retrieves all instances that are stored in the data store
     */
	public List<betHistory> retrieveAll() {
    	Objectify ofy = ObjectifyService.begin();

    	Query<betHistory> q = ofy.query(betHistory.class);

    	return q.list();    
    }
	

	/**
     * Retrieves a specific instance of Product from the data store. Note that
     * if you pass an <i>id</i> that is non-existent, it will throw a
     * <i>com.googlecode.objectify.NotFoundException</i>.
     */
    public betHistory retrieve(Long id) {
    	Objectify ofy = ObjectifyService.begin();

    	return ofy.get(betHistory.class, id);
    }
    
    /**
     * Retrieves a specific instance of Product from the data store. Note that
     * if you pass an <i>id</i> that is non-existent, it will throw a
     * <i>com.googlecode.objectify.NotFoundException</i>.
     */
    
    public List<betHistory> retrieveAllUserbetHistory(String userId) {
    	Objectify ofy = ObjectifyService.begin();
    	Query<betHistory> q = ofy.query(betHistory.class);
    	q.filter("userId =", userId);
    	return q.list();    
    }
	
    public List<betHistory> retrieveAllUserbetHistory(Long userId) {
    	Objectify ofy = ObjectifyService.begin();
    	Query<betHistory> q = ofy.query(betHistory.class);
    	q.filter("userId =", String.valueOf(userId));
    	return q.list();    
    }
    
    /**
     * Add an instance to data store
     */
    public void add(betHistory bethistory) {
    	Objectify ofy = ObjectifyService.begin();
    	ofy.put(bethistory);
    }
    
    /**
     * Remove an instance from data store
     */
    public void remove(Long id) {
    	Objectify ofy = ObjectifyService.begin();
    	ofy.delete(betHistory.class, id);    	
    }
    
    /**
     * Update an instance in data store
     */
    public void modify(betHistory bethistory) {
    	Objectify ofy = ObjectifyService.begin();
    	ofy.put(bethistory);
    }
    
    /**
	 * Remove all instances from data store
	 */
	public void removeAll() {
		Objectify ofy = ObjectifyService.begin();
		Query<betHistory> q = ofy.query(betHistory.class);
		ofy.delete(q.list());
	}

}

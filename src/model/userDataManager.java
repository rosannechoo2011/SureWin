package model;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.googlecode.objectify.Objectify;
import com.googlecode.objectify.ObjectifyService;
import com.googlecode.objectify.Query;

/**
 * This class is responsible to interacts with the database
 * to perform the CRUD(Create,Read,Update & Delete) functions of Product
 */

public class userDataManager {
	
	static {
		ObjectifyService.register(user.class);
	}
	
	public userDataManager(){
	}
		
	/**
     * Retrieves all instances that are stored in the data store
     */
	public List<user> retrieveAll() {
    	Objectify ofy = ObjectifyService.begin();

    	Query<user> q = ofy.query( user.class);

    	return q.list();    
    }
	

	/**
     * Retrieves a specific instance of Product from the data store. Note that
     * if you pass an <i>id</i> that is non-existent, it will throw a
     * <i>com.googlecode.objectify.NotFoundException</i>.
     */
    public user retrieve(Long id) {
    	Objectify ofy = ObjectifyService.begin();

    	return ofy.get(user.class, id);
    }
    
    /**
     * Retrieves a specific instance of Product from the data store. Note that
     * if you pass an <i>id</i> that is non-existent, it will throw a
     * <i>com.googlecode.objectify.NotFoundException</i>.
     */
    public user retrieve(String username) {
    	Objectify ofy = ObjectifyService.begin();
    	Query<user> q = ofy.query(user.class);
    	q.filter("username =", username);
    	if(q.list() == null || q.list().isEmpty()) {
    		return null;
    	}
    	return q.list().get(0);   
    }
	
    /**
     * Add an instance to data store
     */
    public void add(user user) {
    	Objectify ofy = ObjectifyService.begin();
    	ofy.put(user);
    }
    
    /**
     * Remove an instance from data store
     */
    public void remove(Long id) {
    	Objectify ofy = ObjectifyService.begin();
    	ofy.delete(user.class, id);    	
    }
    
    /**
     * Update an instance in data store
     */
    public void modify(user user) {
    	Objectify ofy = ObjectifyService.begin();
    	ofy.put(user);
    }
    
    /**
	 * Remove all instances from data store
	 */
	public void removeAll() {
		Objectify ofy = ObjectifyService.begin();
		Query<user> q = ofy.query(user.class);
		ofy.delete(q.list());
	}
}

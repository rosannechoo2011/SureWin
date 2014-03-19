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

public class resultDataManager {
	
	static {
		ObjectifyService.register(result.class);
	}
	
	public resultDataManager(){
	}
		
	/**
     * Retrieves all instances that are stored in the data store
     */
	public List<result> retrieveAll() {
    	Objectify ofy = ObjectifyService.begin();

    	Query<result> q = ofy.query( result.class);

    	return q.list();    
    }
	

	/**
     * Retrieves a specific instance of Product from the data store. Note that
     * if you pass an <i>id</i> that is non-existent, it will throw a
     * <i>com.googlecode.objectify.NotFoundException</i>.
     */
    public result retrieve(Long id) {
    	Objectify ofy = ObjectifyService.begin();

    	return ofy.get(result.class, id);
    }
    
    /**
     * Retrieves a specific instance of Product from the data store. Note that
     * if you pass an <i>id</i> that is non-existent, it will throw a
     * <i>com.googlecode.objectify.NotFoundException</i>.
     */
    public result retrieve(String drawDateTime) {
    	Objectify ofy = ObjectifyService.begin();
    	Query<result> q = ofy.query(result.class);
    	q.filter("drawDateTime =", drawDateTime);
    	if(q.list() == null || q.list().isEmpty()) {
    		return null;
    	}
    	return q.list().get(0);   
    }
	
    /**
     * Add an instance to data store
     */
    public void add(result result) {
    	Objectify ofy = ObjectifyService.begin();
    	ofy.put(result);
    }
    
    /**
     * Remove an instance from data store
     */
    public void remove(Long id) {
    	Objectify ofy = ObjectifyService.begin();
    	ofy.delete(result.class, id);    	
    }
    
    /**
     * Update an instance in data store
     */
    public void modify(result result) {
    	Objectify ofy = ObjectifyService.begin();
    	ofy.put(result);
    }
    
    /**
	 * Remove all instances from data store
	 */
	public void removeAll() {
		Objectify ofy = ObjectifyService.begin();
		Query<result> q = ofy.query(result.class);
		ofy.delete(q.list());
	}
}

package model;

import java.util.List;

import com.googlecode.objectify.Objectify;
import com.googlecode.objectify.ObjectifyService;
import com.googlecode.objectify.Query;


public class notificationDataManager {
	static{
		ObjectifyService.register(notification.class);
	}

	public notificationDataManager() {
		// TODO Auto-generated constructor stub
	}
	/**
     * Retrieves all instances that are stored in the data store
     */
	public List<notification> retrieveAll() {
    	Objectify ofy = ObjectifyService.begin();

    	Query<notification> q = ofy.query(notification.class);

    	return q.list();    
    }
	

	/**
     * Retrieves a specific instance of Product from the data store. Note that
     * if you pass an <i>id</i> that is non-existent, it will throw a
     * <i>com.googlecode.objectify.NotFoundException</i>.
     */
    public notification retrieve(Long id) {
    	Objectify ofy = ObjectifyService.begin();

    	return ofy.get(notification.class, id);
    }
    
    /**
     * Retrieves a specific instance of Product from the data store. Note that
     * if you pass an <i>id</i> that is non-existent, it will throw a
     * <i>com.googlecode.objectify.NotFoundException</i>.
     */
    public notification retrieve(String notification) {
    	Objectify ofy = ObjectifyService.begin();
    	Query<notification> q = ofy.query(notification.class);
    	q.filter("userId =", notification);
    	if(q.list() == null || q.list().isEmpty()) {
    		return null;
    	}
    	return q.list().get(0);   
    }
    
    public List<notification> retrieveAllUserNotification(String notification) {
    	Objectify ofy = ObjectifyService.begin();

    	Query<notification> q = ofy.query(notification.class);
    	q.filter("userId =", notification);
    	return q.list();    
    }
	
    /**
     * Add an instance to data store
     */
    public void add(notification notification) {
    	Objectify ofy = ObjectifyService.begin();
    	ofy.put(notification);
    }
    
    /**
     * Remove an instance from data store
     */
    public void remove(Long id) {
    	Objectify ofy = ObjectifyService.begin();
    	ofy.delete(notification.class, id);    	
    }
    
    /**
     * Update an instance in data store
     */
    public void modify(notification notification) {
    	Objectify ofy = ObjectifyService.begin();
    	ofy.put(notification);
    }
    
    /**
	 * Remove all instances from data store
	 */
	public void removeAll() {
		Objectify ofy = ObjectifyService.begin();
		Query<notification> q = ofy.query(notification.class);
		ofy.delete(q.list());
	}

}

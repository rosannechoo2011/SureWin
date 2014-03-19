package model;

import java.io.Serializable;

import javax.persistence.Id;

import com.googlecode.objectify.annotation.Cached;
@Cached

@SuppressWarnings("serial")
public class notification implements Serializable {
	@Id private Long id;
    private String userId;
    private String dateTime;
    private String message;

    
	public notification() {}
	
	public notification(Long id,String userId,String dateTime,String message){
		this.id = id;
		this.userId=userId;
		this.message=message;
		this.dateTime=dateTime;	
	}
	
	public notification(String userId,String dateTime,String message){
		this.userId=userId;
		this.message=message;
		this.dateTime=dateTime;	
	}
    public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getDateTime() {
		return dateTime;
	}

	public void setDateTime(String dateTime) {
		this.dateTime = dateTime;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}


}

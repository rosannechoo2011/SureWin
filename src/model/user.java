package model;

import java.io.Serializable;

import javax.persistence.Id;

import com.googlecode.objectify.annotation.Cached;
@Cached

@SuppressWarnings("serial")

public class user implements Serializable{
    @Id private Long id;
    private String username;
    private String password;
    private String mobileNo;
    private String email;
    private String fullName;
    private String dateOfBirth;
    private int betLimit;

    public user() {}
    
    public user(String username,String password,String mobileNo,String email,String fullName,String dateOfBirth,int betLimit) {
    	this.username=username;
    	this.password=password;
    	this.mobileNo=mobileNo;
    	this.email=email;
    	this.fullName=fullName;
    	this.dateOfBirth=dateOfBirth;
    	this.betLimit=betLimit;
    	    	
    }
    
    
    public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getMobileNo() {
		return mobileNo;
	}

	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFullname() {
		return fullName;
	}

	public void setFullname(String fullName) {
		this.fullName = fullName;
	}

	public String getDateOfBirth() {
		return dateOfBirth;
	}

	public void setDateOfBirth(String dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	public int getBetLimit() {
		return betLimit;
	}

	public void setBetLimit(int betLimit) {
		this.betLimit = betLimit;
	}


}

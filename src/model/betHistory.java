package model;

import java.io.Serializable;

import javax.persistence.Id;

import com.googlecode.objectify.annotation.Cached;
@Cached

@SuppressWarnings("serial")
public class betHistory implements Serializable {
	@Id private Long id;
    private String userId;
    private String drawDate;
    private String betBig;
    private String betSmall;
    private String type;
    private String betNumber;
    
	public betHistory() {}
	
	public betHistory(String userId,String drawDate, String betBig,String betSmall, String type, String betNumber){
		this.userId=userId;
		this.drawDate = drawDate;
		this.betBig=betBig;
		this.betSmall=betSmall;
		this.type=type;
		this.betNumber=betNumber;
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

	public String getDrawDate() {
		return drawDate;
	}

	public void setDrawDate(String drawDate) {
		this.drawDate = drawDate;
	}

	public String getBetBig() {
		return betBig;
	}

	public void setBetBig(String betBig) {
		this.betBig = betBig;
	}

	public String getBetSmall() {
		return betSmall;
	}

	public void setBetSmall(String betSmall) {
		this.betSmall = betSmall;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getBetNumber() {
		return betNumber;
	}

	public void setBetNumber(String betNumber) {
		this.betNumber = betNumber;
	}
	
	

}

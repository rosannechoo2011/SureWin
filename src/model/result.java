package model;

import java.io.Serializable;

import javax.persistence.Id;

import com.googlecode.objectify.annotation.Cached;
@Cached
/*
 *There are multiple numbers in the mainPrize, each concated by "=" 
 * please access localhost:8888/processAddResult.do to add in records into the result database
 */

@SuppressWarnings("serial")
public class result implements Serializable {
	@Id private Long id;
	private String drawDateTime;
	private String mainPrize;
	private String starterPrize;
	private String consolationPrize;
	
	public result(){}
	
	public result(String drawDateTime,String mainPrize, String starterPrize, String consolationPrize){
		this.drawDateTime=drawDateTime;
		this.mainPrize=mainPrize;
		this.starterPrize=starterPrize;
		this.consolationPrize=consolationPrize;		
	}
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getDrawDateTime() {
		return drawDateTime;
	}
	public void setDrawDateTime(String drawDateTime) {
		this.drawDateTime = drawDateTime;
	}
	public String getMainPrize() {
		return mainPrize;
	}
	public void setMainPrize(String mainPrize) {
		mainPrize = mainPrize;
	}
	public String getStarterPrize() {
		return starterPrize;
	}
	public void setStarterPrize(String starterPrize) {
		this.starterPrize = starterPrize;
	}
	public String getConsolationPrize() {
		return consolationPrize;
	}
	public void setConsolationPrize(String consolationPrize) {
		this.consolationPrize = consolationPrize;
	}
	
	
	
}

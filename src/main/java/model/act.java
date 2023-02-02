package model;

import java.util.Date;

public class act {
	
	String id;
	String kinds;
	int act_number;
	String act_type;
	int act_mile;
	int act_pay;
	Date act_date;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getKinds() {
		return kinds;
	}
	public void setKinds(String kinds) {
		this.kinds = kinds;
	}
	public int getAct_number() {
		return act_number;
	}
	public void setAct_number(int act_number) {
		this.act_number = act_number;
	}
	public String getAct_type() {
		return act_type;
	}
	public void setAct_type(String act_type) {
		this.act_type = act_type;
	}
	public int getAct_mile() {
		return act_mile;
	}
	public void setAct_mile(int act_mile) {
		this.act_mile = act_mile;
	}
	public int getAct_pay() {
		return act_pay;
	}
	public void setAct_pay(int act_pay) {
		this.act_pay = act_pay;
	}
	public Date getAct_date() {
		return act_date;
	}
	public void setAct_date(Date act_date) {
		this.act_date = act_date;
	}
	
	@Override
	public String toString() {
		return "act [id=" + id + ", kinds=" + kinds + ", act_number=" + act_number + ", act_type=" + act_type
				+ ", act_mile=" + act_mile + ", act_pay=" + act_pay + ", act_date=" + act_date + "]";
	}
	

}

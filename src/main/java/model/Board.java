package model;

import java.util.Date;

public class Board {
	int index;
	String id;
	Date not_date;
	Date mod_date;
	String title;
	String context;
	String p_type;
	Date end_date;
	String picture;
	int goal;
	int raised;
	String reword;
	String location;
	String act_time;
	String day;
	Date v_start;
	Date v_end;
	String v_type;
	String field;
	String boardid;
	
	public int getIndex() {
		return index;
	}
	public void setIndex(int index) {
		this.index = index;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getNot_date() {
		return not_date;
	}
	public void setNot_date(Date not_date) {
		this.not_date = not_date;
	}
	public Date getMod_date() {
		return mod_date;
	}
	public void setMod_date(Date mod_date) {
		this.mod_date = mod_date;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContext() {
		return context;
	}
	public void setContext(String context) {
		this.context = context;
	}
	public String getP_type() {
		return p_type;
	}
	public void setP_type(String p_type) {
		this.p_type = p_type;
	}
	public Date getEnd_date() {
		return end_date;
	}
	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public int getGoal() {
		return goal;
	}
	public void setGoal(int goal) {
		this.goal = goal;
	}
	public int getRaised() {
		return raised;
	}
	public void setRaised(int raised) {
		this.raised = raised;
	}
	public String getReword() {
		return reword;
	}
	public void setReword(String reword) {
		this.reword = reword;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getAct_time() {
		return act_time;
	}
	public void setAct_time(String act_time) {
		this.act_time = act_time;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public Date getV_start() {
		return v_start;
	}
	public void setV_start(Date v_start) {
		this.v_start = v_start;
	}
	public Date getV_end() {
		return v_end;
	}
	public void setV_end(Date v_end) {
		this.v_end = v_end;
	}
	public String getV_type() {
		return v_type;
	}
	public void setV_type(String v_type) {
		this.v_type = v_type;
	}
	public String getField() {
		return field;
	}
	public void setField(String field) {
		this.field = field;
	}
	public String getBoardid() {
		return boardid;
	}
	public void setBoardid(String boardid) {
		this.boardid = boardid;
	}
	
	
}

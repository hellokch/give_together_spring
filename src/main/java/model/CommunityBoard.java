package model;

import java.util.Date;

public class CommunityBoard {
	int index;
	String id;
	String title;
	String context;
	String name;
	String content;
	Date not_date;
	String is_notice;
	String picture;
	String boardid;
	String file1;
// file commit
	public String getId() {
		return id;
		}
	public void setId(String id) {
		this.id = id;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getIs_notice() {
		return is_notice;
	}
	public void setIs_notice(String content) {
		this.is_notice = is_notice;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public String getBoardid() {
		return boardid;
	}
	public void setBoardid(String boardid) {
		this.boardid = boardid;
	}
	public String getFile1() {
	return file1;
	}
	public void setFile1(String file1) {
	this.file1 = file1; 
	}
	public Date getNot_date() {
	return not_date;
	}
	public void setNot_date(Date not_date) {
		this.not_date = not_date;
	}
		public int getIndex() {
		return index;
	}
	public void setIndex(int index) {
		this.index = index;
	}

	@Override
	public String toString() {
		return "CommunityBoard [index=" + index + ", id=" + id + ", title=" + title + ", context=" + context + ", name="
				+ name + ", content=" + content + ", not_date=" + not_date + ", is_notice=" + is_notice + ", picture="
				+ picture + ", boardid=" + boardid + ", File1=" + file1 + "]";
	  }
}
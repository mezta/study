package com.bean;

public class News {
	private int nid;
	private String title;
	private String content;
	private String startdate;

	public int getNid() {
		return nid;
	}

	public void setNid(int nid) {
		this.nid = nid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getStartdate() {
		return startdate;
	}

	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}

	@Override
	public String toString() {
		return "News [nid=" + nid + ", title=" + title + ", content=" + content + ",startdate=" + startdate + "]";
	}

}

package com.bean;

public class Msg {
	private int mid;
	private String mtitle;
	private String msender;
	private String mreceiver;
	private int mcontent;
	private String msendtime;
	private String readflag;
	private User user;
	private int mprize;
	private int uid;
	private String mletter;
	private String aprize;
	private int mcount;
	private String uname;

	public int getMid() {
		return mid;
	}

	public void setMid(int mid) {
		this.mid = mid;
	}

	public String getMtitle() {
		return mtitle;
	}

	public void setMtitle(String mtitle) {
		this.mtitle = mtitle;
	}

	public String getMsender() {
		return msender;
	}

	public void setMsender(String msender) {
		this.msender = msender;
	}

	public String getMreceiver() {
		return mreceiver;
	}

	public void setMreceiver(String mreceiver) {
		this.mreceiver = mreceiver;
	}

	public int getMcontent() {
		return mcontent;
	}

	public void setMcontent(int mcontent) {
		this.mcontent = mcontent;
	}

	public String getMsendtime() {
		return msendtime;
	}

	public String getMletter() {
		return mletter;
	}

	public void setMmletter(String mletter) {
		this.mletter = mletter;
	}

	public void setMsendtime(String msendtime) {
		this.msendtime = msendtime;
	}

	public String getReadflag() {
		return readflag;
	}

	public void setReadflag(String readflag) {
		this.readflag = readflag;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public int getMprize() {
		return mprize;
	}

	public void setMprize(int mprize) {
		this.mprize = mprize;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public String getAprize() {
		return aprize;
	}

	public void setAprize(String aprize) {
		this.aprize = aprize;
	}

	public int getMcount() {
		return mcount;
	}

	public void setMcount(int mcount) {
		this.mcount = mcount;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	@Override
	public String toString() {
		return "Msg [mid=" + mid + ", mtitle=" + mtitle + ", msender=" + msender + ", mreceiver=" + mreceiver
				+ ", mcontent=" + mcontent + ", msendtime=" + msendtime + ", readflag=" + readflag + ", user=" + user
				+ ", mprize=" + mprize + ", uid= " + uid + ", aprize=" + aprize + ", mcount=" + mcount + "]";
	}

}

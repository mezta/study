package com.bean;

public class ClockIn {
	private int cid;
	private int eid;
	private String cstarttime;
	private String cdate;
	private String cendtime;
	private int clateFlag;
	private int makeupFlag;
	private User user;
	private String cpic;
	private int countc;
	private String ctitle;
	private int cprize;
	
	public int getCprize() {
		return cprize;
	}

	public void setCprize(int cprize) {
		this.cprize = cprize;
	}

	public String getCtitle() {
		return ctitle;
	}

	public void setCtitle(String ctitle) {
		this.ctitle = ctitle;
	}

	public int getCountc() {
		return countc;
	}

	public void setCountc(int countc) {
		this.countc = countc;
	}


	public String getCpic() {
		return cpic;
	}

	public void setCpic(String cpic) {
		this.cpic = cpic;
	}

	
	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public int getEid() {
		return eid;
	}

	public void setEid(int eid) {
		this.eid = eid;
	}

	public String getCstarttime() {
		return cstarttime;
	}

	public void setCstarttime(String cstarttime) {
		this.cstarttime = cstarttime;
	}

	public String getCdate() {
		return cdate;
	}

	public void setCdate(String cdate) {
		this.cdate = cdate;
	}

	public String getCendtime() {
		return cendtime;
	}

	public void setCendtime(String cendtime) {
		this.cendtime = cendtime;
	}

	public int getClateFlag() {
		return clateFlag;
	}

	public void setClateFlag(int clateFlag) {
		this.clateFlag = clateFlag;
	}

	public int getMakeupFlag() {
		return makeupFlag;
	}

	public void setMakeupFlag(int makeupFlag) {
		this.makeupFlag = makeupFlag;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	@Override
	public String toString() {
		return "ClockIn [cid=" + cid + ", eid=" + eid + ", cstarttime=" + cstarttime + ", cdate=" + cdate
				+ ", cendtime=" + cendtime + ", clateFlag=" + clateFlag + ", makeupFlag=" + makeupFlag + ", user="
				+ user + ", cpic=" + cpic + ", countc=" + countc + ", ctitle=" + ctitle + ", cprize=" + cprize + "]";
	}

}

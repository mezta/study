package com.bean;

public class User {

	private int uid;
	private String uname;
	private String upass;
	private String telephone;
	private String email;
	private String nickName;
	private String upic;
	private int audit;
	private int age;
	private int letter;

	@Override
	public String toString() {
		return "User [uid=" + uid + ", uname=" + uname + ", upass=" + upass + ", telephone=" + telephone + ", email="
				+ email + ", nickName=" + nickName + ", upic=" + upic + ", audit=" + audit + ", age=" + age + ", letter=" + letter + "]";
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getUpass() {
		return upass;
	}

	public void setUpass(String upass) {
		this.upass = upass;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getUpic() {
		return upic;
	}

	public void setUpic(String upic) {
		this.upic = upic;
	}

	public int getAudit() {
		return audit;
	}

	public void setAudit(int audit) {
		this.audit = audit;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public int getLetter() {
		return letter;
	}

	public void setLetter(int letter) {
		this.letter = letter;
	}
	
}

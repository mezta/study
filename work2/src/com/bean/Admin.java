package com.bean;

import org.springframework.stereotype.Controller;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;;
public class Admin {
   private int aid;
   private String aname;
   private String apass;
   private String email;
   private String nickName;
   private String apic;
public int getAid() {
	return aid;
}
public void setAid(int aid) {
	this.aid = aid;
}
public String getAname() {
	return aname;
}
public void setAname(String aname) {
	this.aname = aname;
}
public String getApass() {
	return apass;
}
public void setApass(String apass) {
	this.apass = apass;
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
public String getApic() {
	return apic;
}
public void setApic(String apic) {
	this.apic = apic;
}
@Override
public String toString() {
	return "Admin [aid=" + aid + ", aname=" + aname + ", apass=" + apass + ", email=" + email + ", nickName=" + nickName
			+ ", apic=" + apic + "]";
}
   
}

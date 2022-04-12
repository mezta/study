package com.controller;

import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.util.Strings;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bean.Admin;
import com.services.AdminServices;
@Controller
@RequestMapping("/adminUser")
public class AdminUserController {
	@Autowired
	private AdminServices adminServices;
	
	
	@RequestMapping("/forgot")
	public String forgot(Admin admin,Model model,HttpSession session) {
		 if(Strings.isBlank(admin.getEmail())&&Strings.isBlank(admin.getApass())) {
			 return "admin/forgot";
		 }else {
			 return adminServices.updPwd(admin, model, session);
		 }
	}
}

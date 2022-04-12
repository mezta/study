package com.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.bean.Admin;
import com.mysql.jdbc.StringUtils;
import com.services.AdminServices;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private AdminServices adminServices;

	@RequestMapping("/adminlogin")
	public String login(Admin admin, Model model, HttpSession session) {
		if (StringUtils.isNullOrEmpty(admin.getAname()) && StringUtils.isNullOrEmpty(admin.getApass())
				&& session.getAttribute("admin") == null) {
			// 第一次进入页面 session为空 并且
			return "admin/login";
		} else {
			return adminServices.login(admin, model, session);
		}
	}

	@RequestMapping("/logout")
	public String logout(Admin admin, Model model, HttpSession session) {
		session.setAttribute("admin", null);
		model.addAttribute("mess", "账号登出");
		return "admin/login";
	}

	// 综合信息管理
	@RequestMapping("/msgManage")
	public String getMsgManage(HttpSession session, Model model, String eid) {
		return adminServices.getMsgManage(model);
	}

	// 修改密码页面跳转
	@RequestMapping("/getAdminInfomation")
	public String getAdminInfomation(HttpSession session, Model model, int aid) {
		return adminServices.getAdminInfomation(model, aid);
	}

	// 修改密码操作
	@RequestMapping("/setAdminInfomation")
	public String setAdminInfoMation(Model model, HttpServletRequest request, MultipartFile mypic, Admin admin,
			HttpSession session) {
		return adminServices.setAdminInfomation(admin, model, request, mypic, session);
	}

}

package com.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.bean.User;
import com.mysql.jdbc.StringUtils;
import com.services.EmpMsgServices;
import com.services.UserServices;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserServices userServices;

	@Autowired
	private EmpMsgServices empMsgServices;

	@RequestMapping("getMain")
	public String getMain(Integer currPage, Model model, HttpSession session, String uid) {
		if (currPage == null) {
			currPage = 1;
		}
		return userServices.getMain(currPage, model, session, uid);
	}

	@RequestMapping("getMainuid")
	public String getMainuid(Integer currPage, Model model, HttpSession session, String uid) {
		if (currPage == null) {
			currPage = 1;
		}
		return userServices.getMainuid(currPage, model, session, uid);
	}

	// 登录
	@RequestMapping("login")
	public String login(User user, Model model, HttpSession session) {
		if (StringUtils.isNullOrEmpty(user.getUname()) && StringUtils.isNullOrEmpty(user.getUpass())
				&& session.getAttribute("user") == null) {
			// 第一次进入页面 session为空 并且
			return "user/getMain";
		} else {
			return userServices.login(user, model, session);
		}

	}

	// 注册
	@RequestMapping("register")
	public String register(User user, Model model, HttpSession session) {
		return userServices.register(user, model, session);

	}

	// 退出登录
	@RequestMapping("quit")
	public String quit(Model model, HttpSession session) {
		session.removeAttribute("userMain");
		return "redirect:/";
	}

	@RequestMapping("getCast")
	public String getCast(Model model, HttpSession session, String uid) {
		return userServices.getCast(model, session, uid);
	}

	// 删除单个订单
	@RequestMapping("/deleteMsgByID")
	public String deleteMsgByID(Model model, int id, int uid) {
		return empMsgServices.deleteMsgByID(id, uid);
	}

	// 修改个人信息页面跳转
	@RequestMapping("/getUserInfomation")
	public String getUserInfomation(HttpSession session, Model model, int uid) {
		return userServices.getUserInfomation(model, uid);
	}

	// 修改密码操作
	@RequestMapping("/setUserInfoMation")
	public String setUserInfoMation(Model model, HttpServletRequest request, MultipartFile mypic, User user,
			HttpSession session) {
		return userServices.setUserInfoMation(user, model, request, session);
	}

	//
	@RequestMapping("getLogin")
	public String getLogin() {
		return "user/login";
	}
}

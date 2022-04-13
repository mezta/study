package com.services;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.bean.User;

public interface UserServices {
	// 注册用户
	public String register(User user, Model model, HttpSession session);

	// 用户登录
	public String login(User user, Model model, HttpSession session);

	// 登录用户后台
	public String userMain(HttpSession session);

	public String getMain(int currPage, Model model, HttpSession session, String uid);

	public String getCast(Model model, HttpSession session, String uid);

	// 修改个人信息跳转
	public String getUserInfomation(Model model, int uid);

	// 修改密码操作
	// public String setUserInfoMation(User user,Model model,HttpServletRequest
	// req,MultipartFile mypic,HttpSession session);
	// 修改密码操作xin

	public String setUserInfoMation(User user, Model model, HttpServletRequest req, HttpSession session);

	public String getMainuid(int currPage, Model model, HttpSession session, String uid);

}

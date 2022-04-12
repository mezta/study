package com.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.bean.News;
import com.bean.User;
import com.services.CheckServices;
import com.services.NewsServices;

@Controller
@RequestMapping("/admin")
public class CheckController {
	// 自动注入用户的services
	@Autowired
	private CheckServices checkServices;

	// 用户首页
	@RequestMapping("/checkIndex")
	public String checkIndex(Integer currPage, Model model, String Ulname) {
		if (currPage == null) {
			currPage = 1;
		}
		System.err.println("currPage---"+currPage);
		System.err.println("model---"+model);
		System.err.println("Ulname---"+Ulname);
		System.err.println("444444444-----"+checkServices.getLimitCheck(currPage, model, Ulname));
		return checkServices.getLimitCheck(currPage, model, Ulname);
		
	}
	
	@RequestMapping("/selectUser")
	public String selectUser(Model model,int currPage,String Ulname) {
		return checkServices.selectUser(model,1,Ulname);
	}

	// 商品新增跳转
	@RequestMapping("/getAddUser")
	public String getAddUser(Model model) {
		System.err.println("model-------"+model);
		return checkServices.getAddUser(model);
	}

	// 新增和修改操作
	@RequestMapping("/addUser")
	public String addUser(User user,Model model,
			 HttpServletRequest request) {
		System.err.println("jinru----------------");
		System.err.println("user-----------"+user);
		System.err.println("model----------"+model);
		System.err.println("request-----------"+request);
		return checkServices.addUser(user, model, request);
	}

	// 通过查询单个id返回修改页面
	@RequestMapping("/getCheckByID")
	public String getCheckByID(int id, Model model) {
		return checkServices.getCheckByID(id, model);
		
	}

	// 删除用户
	@RequestMapping("/deleteCheckById")
	public String deleteCheckById(Integer id, Model model) {
		checkServices.deleteCheckById(id);
		return checkServices.getLimitCheck(1,model,null);
	}

}

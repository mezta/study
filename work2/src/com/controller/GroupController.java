package com.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bean.Grouptable;
import com.services.GroupServices;

@Controller
@RequestMapping("/groups")
public class GroupController {
	@Autowired
	private GroupServices groupServices;

	@RequestMapping("/groupIndex")
	public String groupIndex(Integer currPage, Model model, String TName) {
		if (currPage == null) {
			currPage = 1;
		}
		return groupServices.getLimitGroups(currPage, model, TName);
	}

	// 新增会员套餐跳转
	@RequestMapping("/getAllGroups")
	public String getAllGroups(Model model) {
		return groupServices.getAllGroups(model);
	}

	// 新增会员套餐
	@RequestMapping("/getAddGroup")
	public String getAddGroup(Model model) {
		return groupServices.getAddGroup(model);
	}

	// 新增或修改操作
	@RequestMapping("/addGroup")
	public String addGroup(Grouptable grouptable, Model model) {
		return groupServices.addGroup(grouptable, model);
	}

	// 通过查询单个id返回修改页面
	@RequestMapping("/getGroupsByID")
	public String getGroupsByID(Integer gid, Model model, Integer currPage) {
		return groupServices.getGroupsByID(gid, model);
	}

	// 删除单个商品
	@RequestMapping("/deleteGroupsByID")
	public String deleteGroupsByID(Integer gid, Model model) {
		groupServices.deleteGroupsByID(gid, model);
		return groupServices.getLimitGroups(1, model, null);
	}

	// 新增会员套餐跳转
	@RequestMapping("/getAllGroup")
	public String getAllGroup(Integer currPage, Model model, String TName, HttpSession session) {
		if (currPage == null) {
			currPage = 1;
		}
		return groupServices.getAllGroup(currPage, model, TName, session);
	}

}

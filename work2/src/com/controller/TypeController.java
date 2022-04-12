package com.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bean.Type;
import com.services.TypeServices;

@Controller
@RequestMapping("/type")
public class TypeController {
	@Autowired
	private TypeServices typeServices;

	// 分类首页
	@RequestMapping("/typeIndex")
	public String typeIndex(Integer currPage, Model model, String lTname) {
		if (currPage == null) {
			currPage = 1;
		}
		return typeServices.getLimitType(currPage, model, lTname);
	}

	// 分类新增和修改操作
	@RequestMapping("/addType")
	public String addType(Type type, Model model, HttpSession session) {
		return typeServices.addType(type, model, session);
	}

	@RequestMapping("/selectType")
	public String selectType(Model model) {
		return typeServices.selectType(model, 1);
	}

	@RequestMapping("/getAllTypes")
	public String getAllTypes(Integer currPage, Model model, String lTname) {
		if (currPage == null) {
			currPage = 1;
		}
		return typeServices.getAllTypes(currPage, model, lTname);
	}

	@RequestMapping("/selectTypeByID")
	public String selectTypeByID(Integer tid, Model model) {
		String url = typeServices.selectTypeByID(tid, model);
		return url;
	}

	@RequestMapping("/userGetTypeById")
	public String userGetTypeById(Integer tid, Model model) {
		return typeServices.userGetTypeById(tid, model);
	}

	// 删除单个分类
	@RequestMapping("/deleteTypeById")
	public String deleteTypeById(Integer tid, Model model, HttpSession session) {
		return typeServices.deleteTypeById(model, tid);
	}
}

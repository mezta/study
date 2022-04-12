package com.services;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.bean.Type;

public interface TypeServices {
	// 获取分页
	public String getLimitType(int currPage, Model model, String lTname);

	public String addType(Type type, Model model, HttpSession session);

	public String selectType(Model model, int currPage);

	public String selectTypeByID(int tid, Model model);

	// 删除分类
	public String deleteTypeById(Model model, int tid);

	public String getAllTypes(Model model);

	public String userGetTypeById(int tid, Model model);

	public String getAllTypes(int currPage, Model model, String lTname);

}

package com.services;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.bean.Course;

public interface CourseServices {
	// 获取分页
	public String getLimitCourse(int currPage, Model model, String CName);

	// 获取添加课程页面
	public String getAddCourse(Model model);

	// 新增课程
	public String addCourse(Course course, Model model);

	// 通过id获取课程
	public String getCourseByID(int cid, Model model);

	// 修改课程
//	public String updateCourse(Course course,Model model);
	// 删除课程
	public String deleteCourseByID(int cid, Model model);

	public String getAllCourse(Model model);

	public String getAllCourse(int currPage, Model model, String CName);

	public String getCourseByName(Model model, String TName, HttpSession session);

	public String getuserAllCourse(Model model, String CName, HttpSession session);

}

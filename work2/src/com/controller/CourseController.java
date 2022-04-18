package com.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bean.Course;
import com.services.CourseServices;

@Controller
@RequestMapping("/course")
public class CourseController {

	@Autowired
	CourseServices courseServices;

	@RequestMapping("/courseIndex")
	public String courseIndex(Integer currPage, Model model, String CName) {
		if (currPage == null) {
			currPage = 1;
		}
		return courseServices.getLimitCourse(currPage, model, CName);
	}

	// 项目新增跳转
	@RequestMapping("/getAddCourse")
	public String getAddCourse(Model model) {
		return courseServices.getAddCourse(model);
	}

	// 新增和修改操作
	@RequestMapping("/addCourse")
	public String addCourse(Course course, Model model) {
		return courseServices.addCourse(course, model);
	}

	// 通过查询单个id返回修改页面
	@RequestMapping("/getCourseByID")
	public String getCourseByID(Integer cid, Model model, Integer currPage) {
		return courseServices.getCourseByID(cid, model);
	}

	// 删除单个项目
	@RequestMapping("/deleteCourseByID")
	public String deleteCourseByID(Integer cid, Model model) {
		courseServices.deleteCourseByID(cid, model);
		return courseServices.getLimitCourse(1, model, null);
	}

	// 查询全部项目
	@RequestMapping("/getAllCourse")
	public String getAllCourse(Integer currPage, Model model, String CName) {
		if (currPage == null) {
			currPage = 1;
		}
		return courseServices.getAllCourse(currPage, model, CName);

	}

	// 查询类似项目
	@RequestMapping("/getAllCourseByName")
	public String getAllCourseByName(Model model, String TName, HttpSession session) {
		return courseServices.getCourseByName(model, TName, session);

	}

	// 查询类似项目
	@RequestMapping("/getAllCourseByNamea")
	public String getAllCourseByNameA(Model model, String CName, HttpSession session) {
		return courseServices.getuserAllCourse(model, CName, session);

	}

	/*
	 * // 查询类似项目id
	 * 
	 * @RequestMapping("/getAllCourseByID") public String getAllCourseById(Integer
	 * coachid, Model model) { return courseServices.getCourseById(coachid, model);
	 * 
	 * }
	 */

}

package com.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.bean.Coach;
import com.services.CoachService;

@Controller
@RequestMapping("/coach")
public class CoachController {

	@Autowired
	private CoachService coachService;

	@RequestMapping("/coachIndex")
	public String coachIndex(Integer currPage, Model model, String IName) {

		if (currPage == null) {
			currPage = 1;
		}
		return coachService.getLimitCoach(currPage, model, IName);
	}

	// 查询所有教练
	@RequestMapping("/getAllCoachList")
	public String getAllCoachList(Model model) {
		return coachService.getAllCoachList(model);
	}

	// 新增教练跳转
	@RequestMapping("/getAddCoach")
	public String getAddCoach(Model model) {
		return coachService.getAddCoach(model);
	}

	// 新增教练操作
	@RequestMapping("/addCoach")
	public String addCoach(Coach coach, MultipartFile mypic, Model model, HttpServletRequest request) {
		return coachService.addCoach(coach, mypic, model, request);
	}

	// 通过查询单个id返回修改页面
	@RequestMapping("/getCoachByID")
	public String getCoachByID(Integer id, Model model, Integer currPage) {
		return coachService.getCoachByID(id, model);
	}

	// 删除单个教练
	@RequestMapping("/deleteCoachByID")
	public String deleteCoachByID(Integer id, Model model) {
		coachService.deleteCoachByID(id, model);
		return coachService.getLimitCoach(1, model, null);
	}

	// 查询所有教练
	@RequestMapping("/getAllCoach")
	public String getAllCoachs(Model model) {
		return coachService.getAllCoach(model);
	}

	@RequestMapping("/getAllCoachs")
	public String getAllCoach(Integer currPage, Model model, String IName) {
		if (currPage == null) {
			currPage = 1;
		}
		return coachService.getAllCoach(currPage, model, IName);
	}

	// 通过查询单个id返回修改页面
	@RequestMapping("/userGetCoachById")
	public String userGetCoachById(Integer id, Model model, Integer currPage) {
		return coachService.userGetCoachById(id, model);
	}
}

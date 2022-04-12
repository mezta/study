package com.services;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.bean.Coach;

public interface CoachService {

	public String getLimitCoach(Integer currPage, Model model, String IName);

	// 新增教练
	public String addCoach(Coach coach, MultipartFile mypic, Model model, HttpServletRequest request);

	public String getCoachByID(int id, Model model);

	// 修改教练
	public String updateCoach(Coach coach, Model model, MultipartFile mypic, HttpServletRequest request);

	// 删除教练
	public String deleteCoachByID(int id, Model model);

	// 获取添加教练页面
	public String getAddCoach(Model model);

	public String getAllCoach(Model model);

	public String getAllCoachList(Model model);

	public String userGetCoachById(int id, Model model);

	String getAllCoachs(Model model);

	String getAllCoach(Integer currPage, Model model, String IName);

}

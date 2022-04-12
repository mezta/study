package com.services;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.bean.News;
import com.bean.User;

public interface CheckServices {
	//获取分页
	public String getLimitCheck(int currPage, Model model,String Ulname);
	
	//通过id查询用户
	public String getCheckByID(int id, Model model);
	
	public String selectUser(Model model, int currPage,String Ulname);
	
    //获取添加用户页面
	public String getAddUser(Model model);
	
    //添加用户
	public String addUser(User user, Model model,HttpServletRequest request);
	
    //删除用户
	public String deleteCheckById(int id);

	
	
}

package com.services;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.bean.Admin;
import com.bean.Config;
import com.bean.User;

public interface ConfigServices {
	//获取图片路径
	public String getPicUrl();
	//设置图片上传路径
	public String setPicUrl(Config config,Model model);
	//获取路径
}

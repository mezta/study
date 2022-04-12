package com.controller;

import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.util.Strings;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bean.Admin;
import com.bean.Config;
import com.services.AdminServices;
import com.services.ConfigServices;
@Controller
@RequestMapping("/config")
public class ConfigController {
	@Autowired
	private ConfigServices configServices;
	//获取配置
	@RequestMapping("/getConfig")
	public String getConfig(Config config,Model model,HttpSession session) {
		model.addAttribute("value", configServices.getPicUrl());
		model.addAttribute("id",1);
		model.addAttribute("name", "配置文件上传地址");
		return "admin/updateConfig";
	}
	@RequestMapping("/setConfig")
	public String setConfig(Config config,Model model,HttpSession session) {
		return configServices.setPicUrl(config,model);
	}
	
}

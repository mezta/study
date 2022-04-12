package com.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.bean.Config;
import com.dao.ConfigDao;
import com.mysql.jdbc.StringUtils;

import jdk.nashorn.internal.objects.annotations.Where;

@Service("configServices")
public class ConfigServicesImpl implements ConfigServices {
	// 自动注入dao
	@Autowired
	ConfigDao configDao;
	//自动驻入services
	@Autowired
	private AdminServices adminServices;
	@Override
	public String getPicUrl() {
		// TODO Auto-generated method stub
		Config config = configDao.getConfig();
		return config.getValue();
	}

	@Override
	public String setPicUrl(Config config,Model model) {
		if (StringUtils.isNullOrEmpty(config.getValue())) {
			
			return "admin/updateConfig";
		}
		int t = 0;
		t = configDao.setConfig(config);
		if (t > 0) {
			return adminServices.getMsgManage(model);
		} else {
			model.addAttribute("value", this.getPicUrl());
			model.addAttribute("id",1);
			model.addAttribute("name", "配置文件上传地址");
			return "admin/updateConfig";
		}
	}

}

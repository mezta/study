package com.services;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.bean.News;
import com.bean.Type;
import com.bean.User;
import com.dao.CheckDao;
import com.dao.ConfigDao;
import com.dao.UserDao;
import com.mysql.jdbc.StringUtils;
import com.sun.jmx.snmp.internal.SnmpSecuritySubSystem;
import com.util.PicUploadUtil;

import jdk.nashorn.internal.runtime.JSONFunctions;

@Service("ChecksSerivces")
public class CheckServicesImpl implements CheckServices {
	@Autowired
	private CheckDao checkDao;

	@Override
	public String getLimitCheck(int currPage, Model model, String Ulname) {

		if ("".equals(Ulname)) {
			Ulname = null;
		}
		int pageSize = 3;
		int countPage = 0;
		// 获取所有用户
		List<User> limits = checkDao.selectUser(Ulname);
		int len = limits.size();
		countPage = len / pageSize;
		if (len % pageSize > 0) {
			countPage = countPage + 1;
		}
		if (currPage > countPage) {
			currPage = currPage - 1;
		}
		int begin = (currPage - 1) * pageSize;
		int end = begin + pageSize;
		if (currPage == countPage) {
			end = len;
		}
		List<User> limitCheck = checkDao.getLimitCheck(begin, pageSize, Ulname);

		model.addAttribute("count", limits.size());
		model.addAttribute("currPage", currPage);
		model.addAttribute("countPage", countPage);
		model.addAttribute("Ulname", Ulname);
		model.addAttribute("limitCheck", limitCheck);

		return "admin/check";
	}

	// 处理时间 返回固定时间类型的系统当前时间
	public String getFormateDate(String dateFormate) {
		SimpleDateFormat sdf = new SimpleDateFormat(dateFormate);
		String resultStr = sdf.format(new Date());
		return resultStr;
	}

	@Override
	public String getAddUser(Model model) {
		
		model.addAttribute("mess", null);
		model.addAttribute("uid", 0);
		
		return "admin/userAddOrUpd";
	}

	@Override
	public String addUser(User user, Model model, HttpServletRequest request) {
		if(user==null||StringUtils.isNullOrEmpty(user.getUname())) {
			//点新增进入页面
			model.addAttribute("uid", 0);
			return "admin/userAddOrUpd";
		}else {
			int t=0;
			//点击修改或者添加之后成功
			if(user.getUid()==0) {//成功添加
				t=checkDao.addUser(user);
				
			}else if(user.getUid()!=0){
				//修改成功失败
					t=checkDao.updUser(user);
			}
			if(t>0) {
				//添加成功
				model.addAttribute("mess", "用户添加或修改成功");
				return this.getLimitCheck(1,model,null);
			}else {
				//失败
				model.addAttribute("mess", "用户添加或修改失败");
				return "admin/userAddOrUpd";
			}
		}	
		
	}

	@Override
	public String selectUser(Model model, int currPage, String Ulname) {

		List<User> users = checkDao.selectUser(Ulname);
		model.addAttribute("users", users);
		model.addAttribute("count", users.size());
		model.addAttribute("currPage", 1);
		return "admin/check";
	}

	@Override
	public String getCheckByID(int id, Model model) {

		User check = checkDao.getCheckByID(id);

		model.addAttribute("check", check);
		model.addAttribute("uid", id);
		return "admin/userAddOrUpd";
	}

	@Override
	public String deleteCheckById(int id) {
		checkDao.deleteCheckById(id);
		return null;
	}

}
package com.services;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.bean.Admin;
import com.bean.Msg;
import com.bean.User;
import com.dao.AdminDao;
import com.dao.ClockInDao;
import com.dao.MsgDao;
import com.dao.NewsDao;
import com.dao.UserDao;
import com.mysql.jdbc.StringUtils;
import com.util.DateUtil;
import com.util.PicUploadUtil;

@Service("adminServices")
public class AdminServicesImpl implements AdminServices {

	@Autowired
	AdminDao adminDao;

	// 自动驻入dao
	@Autowired
	ClockInDao clockInDao;
	// 自动注入dao
	@Autowired
	MsgDao msgDao;
	// 自动注入用户dao
	@Autowired
	UserDao userDao;
	// 自动注入订单信息dao
	@Autowired
	NewsDao newsDao;
	// 自动注入配置service
	@Autowired
	ConfigServices configServices;

	@Override
	public String login(Admin admin, Model model, HttpSession session) {
		// TODO Auto-generated method stub
		Admin a = adminDao.login(admin);
		if (a != null || session.getAttribute("admin") != null) {
			session.setAttribute("admin", a);
			model.addAttribute("mess", "登录成功");
			System.out.println(
					"session.getAttribute(\"admin\")---------------" + session.getAttribute("admin").toString());
			return "admin/test";
		} else {
			model.addAttribute("mess", "账号或密码错误");
			return "admin/login";
		}
	}

	/**
	 * 
	 */
	@Override
	public String updPwd(Admin admin, Model model, HttpSession session) {
		if (StringUtils.isNullOrEmpty(admin.getApass())) {
			model.addAttribute("mess", "修改密码失败,密码不允许为空");
			return "admin/forgot";
		}
		int i = adminDao.updPwd(admin);
		System.out.println("i-----------------------------------" + i);
		if (i > 0) {
			model.addAttribute("mess", "修改密码成功,.请重新登录");
			return "admin/login";
		} else {
			model.addAttribute("mess", "修改密码失败,请确认email地址正确");
			return "admin/forgot";
		}
	}

	@Override
	public String getMsgManage(Model model) {
		DateUtil dateUtil = new DateUtil();
		List<User> empList = userDao.getEmpNoAudit(0, 0);
		List<User> notclockinList = userDao.getAllNoClockIn(dateUtil.getNowFormatDate("yyyy-MM-dd"));

		List<Msg> msgList = msgDao.getMsgNoReadByLimit(0, 0);
		model.addAttribute("noAuditNum", empList.size());
		model.addAttribute("noclockNum", notclockinList.size());
		model.addAttribute("msgNum", msgList.size());
		return "admin/msgManage";
	}

	/**
	 * 修改密码跟个人信息
	 */
	@Override
	public String getAdminInfomation(Model model, int aid) {
		Admin admin = adminDao.getAdmin(aid);
		model.addAttribute("adminInfomation", admin);
		return "admin/updateAdminInfo";
	}

	@Override
	public String setAdminInfomation(Admin admin, Model model, HttpServletRequest req, MultipartFile mypic,
			HttpSession session) {
		PicUploadUtil picUtil = new PicUploadUtil();
		// TODO Auto-generated method stub
		try {
			if (!mypic.isEmpty()) {
				String urlPath = configServices.getPicUrl();
				Map<String, String> resultMap = picUtil.uploadOneFile(urlPath, mypic, req);
				String path = resultMap.get("path");
				admin.setApic(path);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
			model.addAttribute("mess", "图片上传错误");
			return "admin/updateAdminInfo";
		}
		int t = 0;
		t = adminDao.setAdmin(admin);

		if (t > 0) {
			session.setAttribute("admin", admin);
			return this.getMsgManage(model);
			// return "redirect:/admin/logout";
		} else {
			return "admin/updateAdminInfo";
		}
	}
}

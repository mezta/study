package com.services;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.bean.ClockIn;
import com.bean.Msg;
import com.bean.News;
import com.bean.User;
import com.dao.ClockInDao;
import com.dao.MessageDao;
import com.dao.MsgDao;
import com.dao.NewsDao;
import com.dao.TypeDao;
import com.dao.UserDao;
import com.util.CardValidator;
import com.util.DateUtil;

@Service("userServices")
public class UserServicesImpl implements UserServices {

	@Autowired
	private TypeDao typeDao;
	@Autowired
	private UserDao userDao;
	@Autowired
	private NewsDao newsdao;
	@Resource
	private CardValidator cardValidator;
	// 自动注入消息
	@Autowired
	private MsgDao msgDao;
	// 自动注入配置service
	@Autowired
	private ConfigServices configServices;
	@Autowired
	private ClockInDao clockInDao;
	@Autowired
	private MessageDao messageDao;

	@Override
	public String getMain(int currPage, Model model, HttpSession session, String uid) {
		List<Msg> allMsg = msgDao.getAlls(uid);
		System.err.println(allMsg.toString());
		model.addAttribute("msgs", allMsg);
		model.addAttribute("uid", uid);

		// return null;
		return "user/orderList";
	}

	@Override
	public String getMainuid(int currPage, Model model, HttpSession session, String uid) {
		DateUtil dateUtil = new DateUtil();
		List<Msg> Msgs = new ArrayList<Msg>();
		String mletter = "支付成功";
		List<Msg> allMsg = msgDao.getAll(uid, mletter);
		List<Msg> allcourse = msgDao.getAllcourse(uid, mletter);
		Msg[] a = new Msg[allMsg.size() + allcourse.size()];
		int i = 0;
		for (Msg d : allMsg) {
			a[i] = d;
			++i;
		}
		for (Msg d : allcourse) {
			a[i] = d;
			i++;
		}
		for (int j = 0; j < a.length; j++) {
			String end = dateUtil.Dates(a[j].getMsender());
			msgDao.updateMsgByIddaty(a[j].getMid(), end);
			if (a[j].getMreceiver() == "已到期") {
				continue;
			}
			int day = Integer.parseInt(dateUtil.Date(a[j].getMsender()));
			// 判断会员到期
			if (day <= 5) {
				Collections.addAll(Msgs, a[j]);
			}
		}
		model.addAttribute("daqi", Msgs);
		List<Msg> allMsgs = msgDao.getAll(uid, mletter);
		allMsgs.addAll(allcourse);
		model.addAttribute("msgs", allMsgs);
		int id = Integer.parseInt(uid);
		User user = userDao.getUser(id);
		model.addAttribute("userfomation", user);
		model.addAttribute("uid", uid);
		return "user/personal";
	}

	@Override
	public String login(User user, Model model, HttpSession session) {
		User u1 = userDao.login(user);
		// System.err.println(u1.getUid());
		if (u1 != null) {

			List<News> imNews = messageDao.getMainNews();
			List<News> aNews = messageDao.getAnews();

			model.addAttribute("imNews", imNews);
			model.addAttribute("aNews", aNews);
			model.addAttribute("mess", "登录成功");

			// 将用户保存在session域中
			session.setAttribute("userMain", u1);
			session.setAttribute("userInfo", user);
			List<Msg> Msgs = new ArrayList<Msg>();
			DateUtil dateUtil = new DateUtil();
			System.err.println(u1.getUid());
			String id = u1.getUid() + " ";
			String mletter = "支付成功";
			List<Msg> allMsg = msgDao.getAll(id, mletter);
			List<Msg> allcourse = msgDao.getAllcourse(id, mletter);
			Msg[] a = new Msg[allMsg.size() + allcourse.size()];
			int i = 0;
			for (Msg d : allMsg) {
				a[i] = d;
				i++;
			}
			for (Msg d : allcourse) {
				a[i] = d;
				i++;
			}
			for (int j = 0; j < a.length; j++) {
				String end = dateUtil.Dates(a[j].getMsender());
				// System.err.println(end);
				msgDao.updateMsgByIddaty(a[j].getMid(), end);
				if (a[j].getMreceiver().equals("已到期")) {
					continue;
				}
				// int day = Integer.parseInt(end.substring(0, 1));
				int day = Integer.parseInt(dateUtil.Date(a[j].getMsender()));
				// 判断会员到期
				System.err.println("时间  ++++++++++++" + day);
				if (day <= 5) {
					Collections.addAll(Msgs, a[j]);
				}
			}
			model.addAttribute("daqi", Msgs);
			return "user/mains";
		} else if (user.getUname() == null) {
			model.addAttribute("mess", "用户名或密码错误");
			return "user/login";
		} else {
			model.addAttribute("mess", "用户名或密码错误");
			return "user/login";
		}

	}

	@Override
	public String register(User user, Model model, HttpSession session) {

		// 开始注册
		int t = userDao.selectUser(user);
		if (t > 0) {
			model.addAttribute("register", "已有同名用户，请登录");
			return "user/login";
		} else {
			int i = userDao.addUser(user);
			if (i > 0) {
				// 注册成功后登录
				model.addAttribute("register", "注册成功请登录");
				model.addAttribute("user", user);
				// 重定向
				System.err.println("register==" + "注册成功请登录");
				return "user/login";
			} else {
				// 注册失败
				model.addAttribute("mess", "注册失败");
				return "user/register";
			}
		}
	}

	@Override
	public String userMain(HttpSession session) {
		return "main";
	}

	@Override
	public String getCast(Model model, HttpSession session, String uid) {

		List<ClockIn> clock = clockInDao.getClockByUid(uid);

		model.addAttribute("clock", clock);
		model.addAttribute("uid", uid);

		return "user/cast";
	}

	/**
	 * 修改密码跟个人信息
	 */
	@Override
	public String getUserInfomation(Model model, int uid) {
		User user = userDao.getUser(uid);
		model.addAttribute("userMain", user);
		return "user/updateUserInfo";
	}

	/*
	 * @Override public String setUserInfoMation(User user, Model model,
	 * HttpServletRequest req, MultipartFile mypic,HttpSession session) {
	 * PicUploadUtil picUtil=new PicUploadUtil(); // TODO Auto-generated method stub
	 * try { if(!mypic.isEmpty()) { String urlPath=configServices.getPicUrl();
	 * Map<String, String> resultMap=picUtil.uploadOneFile(urlPath,mypic,req);
	 * String path=resultMap.get("path"); user.setUpic(path); } }catch(Exception ex)
	 * { ex.printStackTrace(); model.addAttribute("mess", "图片上传错误"); return
	 * "user/updateUserInfo"; } int t=0; t=userDao.setUser(user);
	 * 
	 * if (t>0) { session.setAttribute("user", user);
	 * model.addAttribute("mess","个人信息修改成功！"); return "user/login"; }else{ return
	 * "user/updateUserInfo"; } }
	 */
	@Override
	public String setUserInfoMation(User user, Model model, HttpServletRequest req, HttpSession session) {
		/*
		 * PicUploadUtil picUtil=new PicUploadUtil(); // TODO Auto-generated method stub
		 * try { if(!mypic.isEmpty()) { String urlPath=configServices.getPicUrl();
		 * Map<String, String> resultMap=picUtil.uploadOneFile(urlPath,mypic,req);
		 * String path=resultMap.get("path"); user.setUpic(path); } }catch(Exception ex)
		 * { ex.printStackTrace(); model.addAttribute("mess", "图片上传错误"); return
		 * "user/updateUserInfo"; }
		 */
		int t = 0;
		t = userDao.setUser(user);

		if (t > 0) {
			session.setAttribute("user", user);
			model.addAttribute("mess", "个人信息修改成功！");
			return "user/login";
		} else {
			return "user/updateUserInfo";
		}
	}
}

package com.services;

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
		List<Msg> allMsg = msgDao.getAll(uid);
		System.err.println(allMsg.toString());
		model.addAttribute("msgs", allMsg);
		model.addAttribute("uid", uid);

		// return null;
		return "user/orderList";
	}

	@Override
	public String login(User user, Model model, HttpSession session) {
		User u1 = userDao.login(user);
		if (u1 != null) {

			List<News> imNews = messageDao.getMainNews();
			List<News> aNews = messageDao.getAnews();

			model.addAttribute("imNews", imNews);
			model.addAttribute("aNews", aNews);
			model.addAttribute("mess", "登录成功");

			// 将用户保存在session域中
			session.setAttribute("userMain", u1);
			session.setAttribute("userInfo", user);

			return "user/mains";
		} else if (user.getUname() == null) {
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
		model.addAttribute("userfomation", user);
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

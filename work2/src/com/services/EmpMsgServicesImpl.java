package com.services;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.bean.Course;
import com.bean.Grouptable;
import com.bean.Msg;
import com.bean.User;
import com.dao.CourseDao;
import com.dao.GroupDao;
import com.dao.MsgDao;
import com.dao.UserDao;
import com.util.DateUtil;
import com.util.LimitPageUtil;

@Service("empMsgServices")
public class EmpMsgServicesImpl implements EmpMsgServices {
	@Autowired
	MsgDao msgDao;
	@Autowired
	UserDao userDao;
	@Autowired
	GroupDao groupDao;
	@Autowired
	CourseDao courseDao;

	@Override
	public String getListByLimit(Model model, Integer rid, Integer pageNo, Integer pageSize, String likeTitle) {
		LimitPageUtil pageUtil = new LimitPageUtil();
		// 总数据条数
		int msgCount = msgDao.getMsgCount(0, likeTitle);
		Map<String, Integer> resultMap = pageUtil.getBeginRecordAndPageSize(msgCount, pageNo, pageSize);
		// 分页数据

		List<Msg> msgList = msgDao.getListMsg(0, resultMap.get("beginRecord"), pageSize, likeTitle);

		model.addAttribute("countPage", resultMap.get("countPage"));
		System.err.println(resultMap.get("countPage"));
		model.addAttribute("likeTitle", likeTitle);
		model.addAttribute("count", msgCount);
		model.addAttribute("currentPage", pageNo);
		model.addAttribute("msgList", msgList);
		return "admin/empMsgManage";
	}

	@Override
	public String addMsgView(Model model, Integer id) {
		Msg msg = new Msg();
		if (id != null && id != 0) {
			msg = msgDao.getMsgById(id);
		}
		List<User> emps = userDao.getEmpAuditlist();
		model.addAttribute("msg", msg);
		model.addAttribute("emps", emps);
		return "admin/empMsgAdd";
	}

	@Override
	public String updateMsg(String out, String mletter) {
		msgDao.updateMsg(mletter, out);
		return "user/mains";
	}

	@Override
	public String addMsg(Model model, Msg msg, HttpSession session) {
		System.err.println(msg.getReadflag());
		msg.setUname(msg.getUname().toString());
		User u = (User) session.getAttribute("userMain");
		if (u != null) {
			if ("1".equals(msg.getReadflag())) {
				userDao.updUserLetter(msg.getMprize(), u.getUid());
				Grouptable grouptable = groupDao.getGroupsByID(msg.getMcontent());
				DateUtil dateUtil = new DateUtil();
				msg.setMsender(dateUtil.findDate(grouptable.getDay()));
				msg.setMtitle(new Date().getTime() + "");
				msg.setMmletter("未支付");
				msgDao.addMsg(msg);
				return "user/buy";
			} else if ("2".equals(msg.getReadflag())) {
				userDao.updUserLetter(msg.getMprize(), u.getUid());
				msg.setMtitle(new Date().getTime() + "");
				msg.setMmletter("未支付");
				msgDao.addMsg(msg);
				return "user/buyshop";
			} else if ("3".equals(msg.getReadflag())) {
				userDao.updUserLetter(msg.getMprize(), u.getUid());
				Course course = courseDao.getCourseByID(msg.getMcontent());
				System.err.println("course-----------------" + course);
				DateUtil dateUtil = new DateUtil();
				String dayString = course.getNum() + "";
				msg.setMsender(dateUtil.findDate(dayString));
				msg.setMtitle(new Date().getTime() + "");
				msg.setMmletter("未支付");
				msgDao.addMsg(msg);
				return "user/buy";
			} else {
				userDao.updUserLetter1(msg.getMcount(), u.getUid());
				msg.setMtitle(new Date().getTime() + "");
				msg.setMmletter("支付成功");
				int msgnum = msgDao.addMsgl(msg);
				if (msgnum <= 0) {
					model.addAttribute("mess", "兑换失败");
				} else {
					model.addAttribute("mess", "兑换成功");
				}
				return this.getEmpMsgByUid(u.getUid(), model);
			}

		} else {
			model.addAttribute("mess", "请先登录");
			return "redirect:/user/getMain?uid=" + u.getUid();
		}
	}

//	@Override
//	public String addMsg(Model model, Msg msg, HttpSession session) {
//		System.err.println(msg.getReadflag());
//		msg.setUname(msg.getUname().toString());
//		User u = (User) session.getAttribute("userMain");
//		if (u != null) {
//			if ("1".equals(msg.getReadflag())) {
//				userDao.updUserLetter(msg.getMcount(), u.getUid());
//				int msgnum = msgDao.addMsg(msg);
//				if (msgnum <= 0) {
//					model.addAttribute("mess", "购买失败");
//				} else {
//					model.addAttribute("mess", "购买成功");
//				}
//				return this.getEmpMsgByUid(u.getUid(), model);
//			} else if ("2".equals(msg.getReadflag())) {
//				userDao.updUserLetter(msg.getMcount(), u.getUid());
//				int msgnum = msgDao.addMsg(msg);
//				if (msgnum <= 0) {
//					model.addAttribute("mess", "购买失败");
//				} else {
//					model.addAttribute("mess", "购买成功");
//				}
//				return this.getEmpMsgByUid(u.getUid(), model);
//			} else {
//				userDao.updUserLetter1(msg.getMcount(), u.getUid());
//				int msgnum = msgDao.addMsgl(msg);
//				if (msgnum <= 0) {
//					model.addAttribute("mess", "兑换失败");
//				} else {
//					model.addAttribute("mess", "兑换成功");
//				}
//				return this.getEmpMsgByUid(u.getUid(), model);
//			}
//
//		} else {
//			model.addAttribute("mess", "请先登录");
//			return "redirect:/user/getMain?uid=" + u.getUid();
//		}
//	}

	private String getEmpMsgByUid(int uid, Model model) {
		List<Msg> msgList = msgDao.getAmsg(uid);
		model.addAttribute("msgs", msgList);
		return "user/orderList";
	}

	public String delMsg(Model model, Integer id) {
		int msgNum = msgDao.delMsg(id);
		if (msgNum <= 0) {
			model.addAttribute("mess", "删除失败");
		} else {
			model.addAttribute("mess", "删除成功");
		}
		return getListByLimit(model, 0, 1, 3, null);
	}

	@Override
	public String getAmsg(int uid) {

		List<Msg> msgCount = msgDao.getAmsg(uid);

		return "user/orderList";
	}

	@Override
	public String deleteMsgByID(int id, int uid) {
		System.err.println(id);
		msgDao.delMsg(id);
		return "redirect:/user/getMain?uid=" + uid;
	}

	@Override
	public Msg getAmsgNum(String mimtle) {
		return msgDao.getAmsgNum(mimtle);
	}
}

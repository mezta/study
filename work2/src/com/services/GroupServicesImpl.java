package com.services;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.bean.Coach;
import com.bean.Course;
import com.bean.Grouptable;
import com.bean.News;
import com.bean.User;
import com.dao.CoachDao;
import com.dao.CourseDao;
import com.dao.GroupDao;
import com.dao.NewsDao;

@Service("GroupServices")
public class GroupServicesImpl implements GroupServices {
	@Autowired
	private GroupDao groupDao;
	@Autowired
	private CourseDao courseDao;
	@Autowired
	private CoachDao coachDao;
	@Autowired
	private NewsDao newsDao;

	@Override
	public String getLimitGroups(int currPage, Model model, String TName) {
		// 一旦课程名称为""的时候赋值为null
		if ("".equals(TName)) {
			TName = null;
		}
		// 处理分页
		int pageSize = 4;
		int countPage = 0;
		List<Grouptable> allGroups = groupDao.getAllGroups(TName);
		System.err.println(allGroups);
		int len = allGroups.size();
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
		System.err.println(len);
		System.err.println(currPage);
		List<Grouptable> limitGroups = groupDao.getLimitGroups(begin, pageSize, TName);
		System.err.println(len);
		System.err.println(currPage);
		model.addAttribute("count", len);
		model.addAttribute("groupList", limitGroups);
		model.addAttribute("currPage", currPage);
		model.addAttribute("countPage", countPage);
		model.addAttribute("TName", TName);
		List<Course> course = courseDao.getAllCourses();
		model.addAttribute("course", course);

		return "admin/group";
	}

	// 处理时间 返回固定时间类型的系统当前时间
	public String getFormateDate(String dateFormate) {
		SimpleDateFormat sdf = new SimpleDateFormat(dateFormate);
		String resultStr = sdf.format(new Date());
		return resultStr;
	}

	@Override
	public String getAddGroup(Model model) {
		List<Course> course = courseDao.getAllCourses();
		model.addAttribute("course", course);
		model.addAttribute("gid", 0);
		return "admin/groupAddOrUpd";
	}

	@Override
	public String getAllGroups(Model model) {
		List<Grouptable> allGroups = groupDao.getAllGroupsList();
		model.addAttribute("allGroups", allGroups);
		System.err.println(allGroups);
		return "user/groups";
	}

	@Override
	public String getAllGroup(int currPage, Model model, String TName, HttpSession session) {
		// 一旦套餐名称为""的时候赋值为null
		if ("".equals(TName)) {
			TName = null;
		}
		// 处理分页
		int pageSize = 4;
		int countPage = 0;
		List<Grouptable> allGroups = groupDao.getAllGroups(TName);
		int len = allGroups.size();
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
		List<Grouptable> limitGroups = groupDao.getLimitGroups(begin, pageSize, TName);
		User u = (User) session.getAttribute("userMain");
		model.addAttribute("count", len);
		model.addAttribute("groupList", limitGroups);
		model.addAttribute("currPage", currPage);
		model.addAttribute("countPage", countPage);
		model.addAttribute("TName", TName);
		List<Course> course = courseDao.getAllCourses();
		model.addAttribute("course", course);
		List<Grouptable> allGroup = groupDao.getAllGroupsList();
		model.addAttribute("allGroups", allGroup);
		List<Coach> coach = coachDao.getAllCoachs();
		model.addAttribute("coach", coach);
		List<News> news = newsDao.AllNews();
		model.addAttribute("news", news);
		// System.err.println(allGroup);
		return "user/groupsList";
	}

	@Override
	public String addGroup(Grouptable grouptable, Model model) {

		int t = 0;
		if (grouptable.getGid() == 0) {
			t = groupDao.addGroup(grouptable);
		} else {
			t = groupDao.updateGroups(grouptable);
		}
		if (t > 0) {
			return this.getLimitGroups(1, model, null);
		} else {
			model.addAttribute("mess", "添加或者修改失败");
			return "admin/groupAddOrUpd";
		}
	}

	@Override
	public String getGroupsByID(int gid, Model model) {
		Grouptable grouptable = groupDao.getGroupsByID(gid);
		List<Course> course = courseDao.getAllCourses();
		model.addAttribute("course", course);
		model.addAttribute("grouptable", grouptable);

		model.addAttribute("mess", null);
		model.addAttribute("gid", gid);
		return "admin/groupAddOrUpd";
	}

	@Override
	public String deleteGroupsByID(int gid, Model model) {
		groupDao.deleteGroupsByID(gid);
		model.addAttribute("mess", "删除成功！");
		return null;
	}

	@Override
	public String getAllGroup(Model model) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String userGetGroupById(int gid, int cid, Model model, HttpSession session) {
		Grouptable grouptable = groupDao.getGroupsByID(gid);
		User u = (User) session.getAttribute("userMain");
		model.addAttribute("grouptable", grouptable);
		model.addAttribute("user", u);
		Course course = courseDao.getCourseByID(cid);
		model.addAttribute("course", course);
		model.addAttribute("mess", null);
		model.addAttribute("gid", gid);
		return "user/group";
	}
}

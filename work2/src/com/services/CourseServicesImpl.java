package com.services;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.bean.Coach;
import com.bean.Course;
import com.bean.Grouptable;
import com.bean.News;
import com.dao.CoachDao;
import com.dao.CourseDao;
import com.dao.GroupDao;
import com.dao.NewsDao;
import com.pojo.courses;

@Service("CourseSerivces")
public class CourseServicesImpl implements CourseServices {
	@Autowired
	private CourseDao courseDao;
	@Autowired
	private CoachDao coachDao;
	@Autowired
	private NewsDao newsDao;
	@Autowired
	private GroupDao groupDao;

	@Override
	public String getLimitCourse(int currPage, Model model, String CName) {
		// 一旦课程名称为""的时候赋值为null
		if ("".equals(CName)) {
			CName = null;
		}
		System.out.println("jinru ------------2");
		// 处理分页
		int pageSize = 2;
		int countPage = 0;
		List<courses> allCourse = courseDao.getAllCourse(CName);
		System.err.println(allCourse);
		System.out.println("jinru ------------3");
		int len = allCourse.size();
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

		List<courses> limitCourse = courseDao.getLimitCourse(begin, pageSize, CName);
		System.err.println(len);
		System.err.println(currPage);
		System.err.println(countPage);
		model.addAttribute("count", len);
		model.addAttribute("courseList", limitCourse);
		model.addAttribute("currPage", currPage);
		model.addAttribute("countPage", countPage);
		model.addAttribute("CName", CName);

		return "admin/course";
	}

	// 处理时间 返回固定时间类型的系统当前时间
	public String getFormateDate(String dateFormate) {
		SimpleDateFormat sdf = new SimpleDateFormat(dateFormate);
		String resultStr = sdf.format(new Date());
		return resultStr;
	}

	@Override
	public String getAddCourse(Model model) {
		List<Coach> coach = courseDao.getAllCoach();
		model.addAttribute("coach", coach);
		model.addAttribute("cid", 0);
		return "admin/courseAddOrUpd";
	}

	@Override
	public String addCourse(Course course, Model model) {

		int t = 0;
		if (course.getCid() == 0) {
			t = courseDao.addCourse(course);
		} else {
			t = courseDao.updateCourse(course);
		}
		if (t > 0) {
			return this.getLimitCourse(1, model, null);
		} else {
			model.addAttribute("mess", "添加或者修改失败");
			return "admin/courseAddOrUpd";
		}
	}

	@Override
	public String getCourseByID(int cid, Model model) {
		Course course = courseDao.getCourseByID(cid);
		List<Coach> coach = courseDao.getAllCoach();
		model.addAttribute("coach", coach);
		model.addAttribute("course", course);

		model.addAttribute("mess", null);
		model.addAttribute("cid", cid);
		return "admin/courseAddOrUpd";
	}

//	@Override
//	public String updateCourse(Course course, Model model) {
//		return null;
//	}

	@Override
	public String deleteCourseByID(int cid, Model model) {
		courseDao.deleteCourseByID(cid);
		model.addAttribute("mess", "删除成功！");
		return null;
	}

	@Override
	public String getAllCourse(int currPage, Model model, String CName) {
		// 一旦课程名称为""的时候赋值为null
		if ("".equals(CName)) {
			CName = null;
		}
		// 处理分页
		int pageSize = 5;
		int countPage = 0;
		List<courses> allCourse = courseDao.getAllCourse(CName);
		int len = allCourse.size();
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
		List<courses> limitCourse = courseDao.getLimitCourse(begin, pageSize, CName);
		model.addAttribute("count", len);
		model.addAttribute("courseList", limitCourse);
		model.addAttribute("currPage", currPage);
		model.addAttribute("countPage", countPage);
		model.addAttribute("CName", CName);
		List<Course> course = courseDao.getAllCourses();
		model.addAttribute("course", course);
		List<Coach> coach = coachDao.getAllCoachs();
		model.addAttribute("coach", coach);
		List<News> news = newsDao.AllNews();
		model.addAttribute("news", news);
		model.addAttribute("mess", null);
		return "user/courseList";
	}

	@Override
	public String getAllCourse(Model model) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getCourseByName(Model model, String TName) {
		List<Grouptable> allGroups = groupDao.getAllGroupByName(TName);

		System.err.println(allGroups);
		model.addAttribute("groupList", allGroups);
		List<Course> course = courseDao.getAllCourses();
		model.addAttribute("course", course);
		List<Coach> coach = coachDao.getAllCoachs();
		model.addAttribute("coach", coach);
		List<News> news = newsDao.AllNews();
		model.addAttribute("news", news);
		return "user/groupsList";
	}

	/*
	 * @Override public String getCourseById(int coachid, Model model) {
	 * List<Course> course = courseDao.getCourseID(coachid);
	 * model.addAttribute("courseList", course); List<Coach> coach =
	 * coachDao.getAllCoachs(); model.addAttribute("coach", coach); List<News> news
	 * = newsDao.AllNews(); model.addAttribute("news", news);
	 * model.addAttribute("mess", null); return "user/courseList"; }
	 */
}

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

import com.bean.Coach;
import com.bean.Course;
import com.bean.News;
import com.dao.CoachDao;
import com.dao.CourseDao;
import com.dao.NewsDao;
import com.util.PicUploadUtil;

@Service("CoachService")
public class CoachServiceImpl implements CoachService {
	@Autowired
	private CoachDao coachDao;
	@Autowired
	private CourseDao courseDao;
	@Autowired
	private ConfigServices configServices;

	@Autowired
	private NewsDao newsDao;

	@Override
	public String getLimitCoach(Integer currPage, Model model, String IName) {
		// 一旦教练名称为""的时候赋值为null
		if ("".equals(IName)) {
			IName = null;
		}
		System.out.println("jinru ------------2");
		// 处理分页
		int pageSize = 3;
		int countPage = 0;
		List<Coach> allCoach = coachDao.getAllCoach(IName);
		System.out.println("jinru ------------3");
		int len = allCoach.size();
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

		List<Coach> limitCoach = coachDao.getLimitCoach(begin, pageSize, IName);

		model.addAttribute("count", len);
		model.addAttribute("coachList", limitCoach);
		model.addAttribute("currPage", currPage);
		model.addAttribute("countPage", countPage);
		model.addAttribute("IName", IName);

		return "admin/coachList";
	}

	@Override
	public String getAddCoach(Model model) {
		model.addAttribute("mess", null);
		model.addAttribute("id", 0);
		return "admin/coachAddOrUpd";
	}

	// 处理时间 返回固定时间类型的系统当前时间
	public String getFormateDate(String dateFormate) {
		SimpleDateFormat sdf = new SimpleDateFormat(dateFormate);
		String resultStr = sdf.format(new Date());
		return resultStr;
	}

	@Override
	public String addCoach(Coach coach, MultipartFile mypic, Model model, HttpServletRequest request) {
		PicUploadUtil picUtil = new PicUploadUtil();
		System.out.println("mypic---------------" + mypic);
		try {
			if (!mypic.isEmpty()) {
				String urlPath = configServices.getPicUrl();
				Map<String, String> resultMap = picUtil.uploadOneFile(urlPath, mypic, request);
				String path = resultMap.get("path");
				coach.setPic(path);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
			model.addAttribute("mess", "图片没有上传失败");
			return "admin/coachAddOrUpd";
		}

		int t = 0;
		System.err.println(coach.getId());
		if (coach.getId() == 0) {
			t = coachDao.addCoach(coach);
		} else {
			t = coachDao.updateCoach(coach);
		}
		if (t > 0) {
			return this.getLimitCoach(1, model, null);
		} else {
			model.addAttribute("mess", "添加或者修改失败");
			return "admin/coachAddOrUpd";
		}
	}

	@Override
	public String getCoachByID(int id, Model model) {
		Coach coach = coachDao.getCoachByID(id);
		String picNew = coach.getPic().substring(coach.getPic().lastIndexOf("/") + 1);
		coach.setPic(picNew);
		model.addAttribute("coach", coach);
		model.addAttribute("mess", null);
		model.addAttribute("id", id);
		return "admin/coachAddOrUpd";
	}

	@Override
	public String getAllCoachs(Model model) {
		List<Coach> coach = coachDao.getAllCoachs();
		List<News> news = newsDao.getAllNewsList();
		model.addAttribute("news", news);
		model.addAttribute("coach", coach);
		model.addAttribute("mess", null);
		return "user/coachList";
	}

	@Override
	public String getAllCoach(Integer currPage, Model model, String IName) {
		// 一旦教练名称为""的时候赋值为null
		if ("".equals(IName)) {
			IName = null;
		}
		// 处理分页
		int pageSize = 4;
		int countPage = 0;
		List<Coach> allCoach = coachDao.getAllCoach(IName);
		int len = allCoach.size();
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
		List<Coach> limitCoach = coachDao.getLimitCoach(begin, pageSize, IName);
		model.addAttribute("count", len);
		model.addAttribute("coachList", limitCoach);
		model.addAttribute("currPage", currPage);
		model.addAttribute("countPage", countPage);
		model.addAttribute("IName", IName);

		List<Coach> coach = coachDao.getAllCoachs();
		List<News> news = newsDao.getAllNewsList();
		model.addAttribute("news", news);
		model.addAttribute("coach", coach);
		model.addAttribute("mess", null);
		return "user/coach";
	}

	@Override
	public String userGetCoachById(int id, Model model) {
		Coach coach = coachDao.getCoachByID(id);
		List<Coach> coachs = coachDao.getAllCoachs();
		List<Course> course = courseDao.getCourseID(id);
		model.addAttribute("course", course);
		model.addAttribute("coach", coach);
		model.addAttribute("coachs", coachs);
		List<News> news = newsDao.getAllNewsList();
		model.addAttribute("news", news);
		model.addAttribute("mess", null);
		model.addAttribute("id", id);
		return "user/coachList";
	}

	@Override
	public String getAllCoachList(Model model) {
		List<Coach> coach = coachDao.getAllCoachs();

		model.addAttribute("coach", coach);
		model.addAttribute("mess", null);
		return "user/coachMain";
	}

	@Override
	public String updateCoach(Coach coach, Model model, MultipartFile mypic, HttpServletRequest request) {
		return null;
	}

	@Override
	public String deleteCoachByID(int id, Model model) {
		coachDao.deleteCoachByID(id);
		model.addAttribute("mess", "删除成功！");
		return "admin/coachList";
	}

	@Override
	public String getAllCoach(Model model) {
		// TODO Auto-generated method stub
		return null;
	}
}

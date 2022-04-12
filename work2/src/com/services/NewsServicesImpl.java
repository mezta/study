package com.services;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.bean.Coach;
import com.bean.News;
import com.bean.Type;
import com.dao.CoachDao;
import com.dao.NewsDao;

@Service("NewsSerivces")
public class NewsServicesImpl implements NewsServices {
	@Autowired
	private NewsDao newsDao;
	@Autowired
	private CoachDao coachDao;

	@Override
	public String getLimitNews(int currPage, Model model, String lTitle) {
		// 一旦公告名称为""的时候赋值为null
		if ("".equals(lTitle)) {
			lTitle = null;
		}
		// 处理分页
		int pageSize = 1;
		int countPage = 0;
		List<News> allNews = newsDao.getAllNews(lTitle);
		int len = allNews.size();
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
		List<News> limitNews = newsDao.getLimitNews(begin, pageSize, lTitle);

		model.addAttribute("count", len);
		model.addAttribute("newsList", limitNews);
		model.addAttribute("currPage", currPage);
		model.addAttribute("countPage", countPage);
		model.addAttribute("lTitle", lTitle);
		List<Type> types = newsDao.getAllType();
		model.addAttribute("types", types);
		return "admin/news";
	}

	// 处理时间 返回固定时间类型的系统当前时间
	public String getFormateDate(String dateFormate) {
		SimpleDateFormat sdf = new SimpleDateFormat(dateFormate);
		String resultStr = sdf.format(new Date());
		return resultStr;
	}

	@Override
	public String getAddNews(Model model) {
		List<Type> types = newsDao.getAllType();
		model.addAttribute("types", types);
		model.addAttribute("mess", null);
		model.addAttribute("nid", 0);
		return "admin/newsAddOrUpd";
	}

	@Override
	public String addNews(News news, Model model) {
		int t = 0;
		if (news.getNid() == 0) {
			t = newsDao.addNews(news);
		} else {
			t = newsDao.updateNews(news);
		}
		if (t > 0) {
			return this.getLimitNews(1, model, null);
		} else {
			model.addAttribute("mess", "添加或者修改失败");
			return "admin/newsAddOrUpd";
		}
	}

	@Override
	public String getNewsByID(int nid, Model model) {
		News news = newsDao.getNewsByID(nid);
		model.addAttribute("news", news);

		model.addAttribute("mess", null);
		model.addAttribute("nid", nid);
		return "admin/newsAddOrUpd";
	}

	@Override
	public String userGetNewsById(int nid, Model model) {
		News news = newsDao.getNewsByID(nid);
		model.addAttribute("news", news);
		List<News> newss = newsDao.getAllNewsList();
		model.addAttribute("newss", newss);
		List<Coach> coach = coachDao.getAllCoachs();
		model.addAttribute("coach", coach);
		model.addAttribute("mess", null);
		model.addAttribute("nid", nid);
		return "user/newsDetails";
	}

	@Override
	public String updateNews(News news, Model model, MultipartFile mypic, HttpServletRequest request) {
		return null;
	}

	@Override
	public String deleteNewsByID(int id) {
		newsDao.deleteNewsByID(id);
		return null;
	}

	@Override
	public String getAllNews(int currPage, Model model, String lTitle) {
		// 一旦公告名称为""的时候赋值为null
		if ("".equals(lTitle)) {
			lTitle = null;
		}
		// 处理分页
		int pageSize = 7;
		int countPage = 0;
		List<News> allNews = newsDao.getAllNews(lTitle);
		int len = allNews.size();
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
		List<News> limitNews = newsDao.getLimitNews(begin, pageSize, lTitle);

		model.addAttribute("count", len);
		model.addAttribute("newsList", limitNews);
		model.addAttribute("currPage", currPage);
		model.addAttribute("countPage", countPage);
		model.addAttribute("lTitle", lTitle);
		List<Type> types = newsDao.getAllType();
		model.addAttribute("types", types);

		List<News> news = newsDao.getAllNewsList();
		model.addAttribute("news", news);
		List<Coach> coach = coachDao.getAllCoachs();
		model.addAttribute("coach", coach);
		model.addAttribute("mess", null);
		return "user/news";
	}

	@Override
	public String getAllNews(Model model) {
		// TODO Auto-generated method stub
		return null;
	}
}

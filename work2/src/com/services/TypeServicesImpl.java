package com.services;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.bean.Coach;
import com.bean.News;
import com.bean.Type;
import com.dao.CoachDao;
import com.dao.NewsDao;
import com.dao.TypeDao;
import com.mysql.jdbc.StringUtils;

@Service("typeServices")
public class TypeServicesImpl implements TypeServices {
	@Autowired
	private TypeDao typeDao;
	@Autowired
	private CoachDao coachDao;
	@Autowired
	private NewsDao newsDao;

	@Override
	public String getLimitType(int currPage, Model model, String lTname) {
		// 一旦搜索为""的时候赋值为null
		if ("".equals(lTname)) {
			lTname = null;
		}
		// 处理分页
		int pageSize = 1;
		int countPage = 0;
		List<Type> allType = typeDao.getAllType(lTname);
		int len = allType.size();
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

		List<Type> limitType = typeDao.getLimitType(begin, pageSize, lTname);

		model.addAttribute("count", len);
		model.addAttribute("limitType", limitType);
		model.addAttribute("currPage", currPage);
		model.addAttribute("countPage", countPage);
		model.addAttribute("lTname", lTname);
		List<Type> types = typeDao.getAllType(lTname);
		model.addAttribute("types", types);
		return "admin/newsType";
	}

	// 处理时间 返回固定时间类型的系统当前时间
	public String getFormateDate(String dateFormate) {
		SimpleDateFormat sdf = new SimpleDateFormat(dateFormate);
		String resultStr = sdf.format(new Date());
		return resultStr;
	}

	@Override
	public String addType(Type type, Model model, HttpSession session) {
		model.addAttribute("type", type);
		if (type == null || StringUtils.isNullOrEmpty(type.getTname())) {
			// 点新增进入页面
			return "admin/newsTypeAddOrUpd";
		} else {
			int t = 0;
			// 点击修改或者添加之后成功
			if (type.getTid() == 0 && !StringUtils.isNullOrEmpty(type.getTname())) {// 成功添加
				t = typeDao.addType(type);

			} else if (type.getTid() != 0 && !StringUtils.isNullOrEmpty(type.getTname())) {
				// 修改成功失败
				t = typeDao.updateType(type);
			}
			if (t > 0) {
				// 添加成功
				model.addAttribute("mess", "活动操作成功");
				return this.getLimitType(1, model, null);
			} else {
				// 失败
				model.addAttribute("mess", "活动操作失败");
				return "admin/newsTypeAddOrUpd";
			}
		}
	}

	@Override
	public String selectType(Model model, int currPage) {

		List<Type> types = typeDao.selectType();
		model.addAttribute("types", types);
		model.addAttribute("count", types.size());
		model.addAttribute("currPage", 1);
		return "admin/newsType";
	}

	@Override
	public String getAllTypes(int currPage, Model model, String lTname) {
		// 一旦搜索为""的时候赋值为null
		if ("".equals(lTname)) {
			lTname = null;
		}
		// 处理分页
		int pageSize = 6;
		int countPage = 0;
		List<Type> allType = typeDao.getAllType(lTname);
		int len = allType.size();
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

		List<Type> limitType = typeDao.getLimitType(begin, pageSize, lTname);

		model.addAttribute("count", len);
		model.addAttribute("limitType", limitType);
		model.addAttribute("currPage", currPage);
		model.addAttribute("countPage", countPage);
		model.addAttribute("lTname", lTname);
		List<Type> types = typeDao.getAllType(lTname);
		model.addAttribute("types", types);

		List<Type> type = typeDao.getAllTypes();
		model.addAttribute("types", type);
		List<Coach> coach = coachDao.getAllCoachs();
		model.addAttribute("coach", coach);
		List<News> news = newsDao.AllNews();
		model.addAttribute("news", news);
		return "user/tips";
	}

	@Override
	public String selectTypeByID(int tid, Model model) {
		Type type = typeDao.selectTypeByID(tid);
		model.addAttribute("type", type);
		return "admin/newsTypeAddOrUpd";
	}

	@Override
	public String userGetTypeById(int tid, Model model) {
		Type type = typeDao.userGetTypeById(tid);
		model.addAttribute("type", type);
		List<Coach> coach = coachDao.getAllCoachs();
		model.addAttribute("coach", coach);
		List<News> news = newsDao.AllNews();
		model.addAttribute("news", news);
		return "user/typeDetails";
	}

	@Override
	public String deleteTypeById(Model model, int tid) {
		typeDao.deleteTypeById(tid);
		model.addAttribute("mess", "删除成功");
		return "redirect:/type/typeIndex";
	}

	@Override
	public String getAllTypes(Model model) {
		// TODO Auto-generated method stub
		return null;
	}

}

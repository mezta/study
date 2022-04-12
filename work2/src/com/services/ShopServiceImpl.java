package com.services;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.bean.Coach;
import com.bean.News;
import com.bean.Shop;
import com.bean.User;
import com.dao.CoachDao;
import com.dao.NewsDao;
import com.dao.ShopDao;
import com.dao.UserDao;
import com.util.PicUploadUtil;

@Service("ShopService")
public class ShopServiceImpl implements ShopService {
	@Autowired
	private ShopDao shopDao;
	@Autowired
	private ConfigServices configServices;
	@Autowired
	private CoachDao coachDao;
	@Autowired
	private NewsDao newsDao;
	@Autowired
	private UserDao UserDao;

	@Override
	public String getLimitShop(Integer currPage, Model model, String IName) {
		// 一旦教练名称为""的时候赋值为null
		if ("".equals(IName)) {
			IName = null;
		}
		System.out.println("jinru ------------2");
		// 处理分页
		int pageSize = 3;
		int countPage = 0;
		List<Shop> allShop = shopDao.getAllShop(IName);
		System.out.println("jinru ------------3");
		int len = allShop.size();
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

		List<Shop> limitShop = shopDao.getLimitShop(begin, pageSize, IName);

		model.addAttribute("count", len);
		model.addAttribute("shopList", limitShop);
		model.addAttribute("currPage", currPage);
		model.addAttribute("countPage", countPage);
		model.addAttribute("IName", IName);

		return "admin/shopList";
	}

	@Override
	public String getAddShop(Model model) {
		model.addAttribute("mess", null);
		model.addAttribute("shopid", 0);
		return "admin/shopAddOrUpd";
	}

	// 处理时间 返回固定时间类型的系统当前时间
	public String getFormateDate(String dateFormate) {
		SimpleDateFormat sdf = new SimpleDateFormat(dateFormate);
		String resultStr = sdf.format(new Date());
		return resultStr;
	}

	@Override
	public String addShop(Shop shop, MultipartFile mypic, Model model, HttpServletRequest request) {
		PicUploadUtil picUtil = new PicUploadUtil();
		try {
			if (!mypic.isEmpty()) {
				String urlPath = configServices.getPicUrl();
				Map<String, String> resultMap = picUtil.uploadOneFile(urlPath, mypic, request);
				String path = resultMap.get("path");
				shop.setPic(path);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
			model.addAttribute("mess", "图片没有上传失败");
			return "admin/shopAddOrUpd";
		}
		int t = 0;
		System.err.println(shop.getShopid());
		if (shop.getShopid() == 0) {
			t = shopDao.addShop(shop);
		} else {
			t = shopDao.updateShop(shop);
		}
		if (t > 0) {
			return this.getLimitShop(1, model, null);
		} else {
			model.addAttribute("mess", "添加或者修改失败");
			return "admin/shopAddOrUpd";
		}
	}

	@Override
	public String getShopByID(int shopid, Model model) {
		Shop shop = shopDao.getShopByID(shopid);
		String picNew = shop.getPic().substring(shop.getPic().lastIndexOf("/") + 1);
		shop.setPic(picNew);
		model.addAttribute("shop", shop);
		List<Coach> coach = coachDao.getAllCoachs();
		model.addAttribute("coach", coach);
		List<News> news = newsDao.AllNews();
		model.addAttribute("news", news);
		model.addAttribute("mess", null);
		model.addAttribute("shopid", shopid);
		return "admin/shopAddOrUpd";
	}

	@Override
	public String getAllShop(Integer currPage, Model model, String IName, HttpSession session) {
		// 一旦教练名称为""的时候赋值为null
		if ("".equals(IName)) {
			IName = null;
		}
		System.out.println("jinru ------------2");
		// 处理分页
		int pageSize = 4;
		int countPage = 0;
		List<Shop> allShop = shopDao.getAllShop(IName);
		System.out.println("jinru ------------3");
		int len = allShop.size();
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

		List<Shop> limitShop = shopDao.getLimitShop(begin, pageSize, IName);

		model.addAttribute("count", len);
		model.addAttribute("shopList", limitShop);
		model.addAttribute("currPage", currPage);
		model.addAttribute("countPage", countPage);
		model.addAttribute("IName", IName);

		List<Shop> shop = shopDao.getAllShops();
		User u = (User) session.getAttribute("userMain");
		List<Coach> coach = coachDao.getAllCoachs();
		model.addAttribute("coach", coach);
		List<News> news = newsDao.AllNews();
		model.addAttribute("news", news);
		model.addAttribute("shop", shop);
		model.addAttribute("user", u);
		model.addAttribute("mess", null);
		return "user/shop";
	}

	@Override
	public String userGetShopById(int uid, int shopid, Model model, HttpSession session) {
		Shop shop = shopDao.getShopByID(shopid);
		User us = UserDao.getUser(uid);
		model.addAttribute("user", us);
		User u = (User) session.getAttribute("userMain");
		model.addAttribute("shop", shop);
		// model.addAttribute("user", u);
		List<Coach> coach = coachDao.getAllCoachs();
		model.addAttribute("coach", coach);
		List<News> news = newsDao.AllNews();
		model.addAttribute("news", news);
		model.addAttribute("mess", null);
		model.addAttribute("shopid", shopid);
		return "user/shopList";
	}

	@Override
	public String userGetShopId(int shopid, Model model, HttpSession session) {
		Shop shop = shopDao.getShopByID(shopid);
		User u = (User) session.getAttribute("userMain");
		model.addAttribute("shop", shop);
		model.addAttribute("user", u);
		List<Coach> coach = coachDao.getAllCoachs();
		model.addAttribute("coach", coach);
		List<News> news = newsDao.AllNews();
		model.addAttribute("news", news);
		model.addAttribute("mess", null);
		model.addAttribute("shopid", shopid);
		return "user/shopList";
	}

	@Override
	public String deleteShopByID(int shopid, Model model) {
		shopDao.deleteShopByID(shopid);
		model.addAttribute("mess", "删除成功！");
		return "admin/shopList";
	}

	@Override
	public String getAllShop(Model model, HttpSession session) {
		// TODO Auto-generated method stub
		return null;
	}
}

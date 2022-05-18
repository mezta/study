package com.util;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.mysql.jdbc.StringUtils;

public class PicUploadUtil {
//	图片上传路径
	public Map<String, String> uploadOneFile(String urlPath, MultipartFile myfile, HttpServletRequest request) {
		Map<String, String> resultMap = new HashMap();
		// 获取当前时间并设置日期格式
		SimpleDateFormat sdFormat = new SimpleDateFormat("yyyyMMdd");
		String pathMid = sdFormat.format(new Date());

		// 获取配置文件的图片上传路径
		String realpath = urlPath;
		if (StringUtils.isNullOrEmpty(realpath)) {
			realpath = request.getServletContext().getRealPath("uploadfile");
		}
		realpath = realpath + "/" + pathMid;
		System.out.println("===realpath===" + realpath);
		File pathfile = new File(realpath);
		// 判断文件是否存在
		if (!pathfile.exists()) {
			pathfile.mkdirs();
		}
		// 得到上传时的文件名
		String filename = myfile.getOriginalFilename();
		String suffixList = "jpg,gif,png,ico,bmp,jpeg";
		String type = filename.substring(filename.lastIndexOf(".") + 1, filename.length());
		// 判断截取下来的类型是不是定义的上类型
		if (suffixList.contains(type.toLowerCase())) {
			File tagrgetFile = new File(realpath, filename);
			try {
				// 复制该文件
				myfile.transferTo(tagrgetFile);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println(e.getMessage());
			}
			// 拼接完整的路径
			String path = "/uploadfile/" + pathMid + "/" + filename;
			resultMap.put("filename", filename);
			resultMap.put("realpath", realpath);
			resultMap.put("pathMid", pathMid);
			resultMap.put("path", path);
			return resultMap;
		} else {
			return null;
		}
	}
}

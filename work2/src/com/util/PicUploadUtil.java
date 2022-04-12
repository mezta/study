package com.util;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;

import com.dao.ConfigDao;
import com.mysql.jdbc.StringUtils;
import com.services.ConfigServices;

public class PicUploadUtil {
//	图片上传路径
	public Map<String, String> uploadOneFile(String urlPath,MultipartFile myfile,
			 HttpServletRequest request) {
//		 String realpath=request.getServletContext().
//				 getRealPath("uploadfile");
		 Map<String,String> resultMap=new HashMap();
		 SimpleDateFormat sdFormat=new SimpleDateFormat("yyyyMMdd");
		 String pathMid=sdFormat.format(new Date());
		 //获取配置文件的图片上传路径
		 String realpath=urlPath;
		 if (StringUtils.isNullOrEmpty(realpath)) {
			 realpath=request.getServletContext().getRealPath("uploadfile");
		}
		 realpath=realpath+"/"+pathMid;
		 System.out.println("===realpath==="+realpath);
		 File pathfile=new File(realpath);
		 if(!pathfile.exists()) {
			 System.out.println(11);
			 pathfile.mkdirs();
		 }
		 System.out.println(22222);
		 String filename=myfile.getOriginalFilename();
		//********************************************//
		 String suffixList = "jpg,gif,png,ico,bmp,jpeg";
		 String type=filename.substring
				 (filename.lastIndexOf(".")+1,filename.length());
		 if(suffixList.contains(type.toLowerCase())) {
			//******************************************//
			 File tagrgetFile=new File(realpath,filename);
			 try {
				myfile.transferTo(tagrgetFile);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println(e.getMessage());
			}
			 String path="/uploadfile/"+pathMid+"/"+filename;
			 resultMap.put("filename",filename);
			 resultMap.put("realpath",realpath);
			 resultMap.put("pathMid",pathMid);
			 resultMap.put("path", path);
			 return resultMap;
		 }else {
			return null ;
		 }
	  }
}

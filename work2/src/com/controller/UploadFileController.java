package com.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
@Controller
public class UploadFileController {
     @RequestMapping("/uploadOneFile")
	 public String uploadOneFile(MultipartFile myfile,
			 HttpServletRequest request) {
		 String realpath=request.getServletContext().
				 getRealPath("uploadfile");
		 System.out.println(realpath);
		 File pathfile=new File(realpath);
		 if(!pathfile.exists()) {
			 pathfile.mkdirs();
		 }
		 String filename=myfile.getOriginalFilename();
		//********************************************//
		 String suffixList = "jpg,gif,png,ico,bmp,jpeg";
		 String type=filename.substring
				 (filename.lastIndexOf(".")+1,filename.length());
		 if(suffixList.contains(type.toLowerCase())) {
			//******************************************//
			 request.setAttribute("filename", filename);
			 File tagrgetFile=new File(realpath,filename);
			 try {
				myfile.transferTo(tagrgetFile);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println(e.getMessage());
			}
			return "succ" ;
		 }else {
			return "error" ;
		 }
		 
		 
		 
	 }
     
     @RequestMapping("uploadMultiFile")
     public String uploadMultiFile(MultipartFile[] myfile,
			 HttpServletRequest request) {
		 String realpath=request.getServletContext().
				 getRealPath("uploadfile");
		 System.out.println(realpath);
		 File pathfile=new File(realpath);
		 if(!pathfile.exists()) {
			 pathfile.mkdirs();
		 }
		List<String> filenames=new ArrayList<String>(); 
		 for(int i=0;i<myfile.length;i++) {
			 String filename=myfile[i].getOriginalFilename();
			 filenames.add(filename);
			  File tagrgetFile=new File(realpath,filename);
			 try {
				myfile[i].transferTo(tagrgetFile);
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
		 }
		request.setAttribute("filenames", filenames);
		return "succ" ;
		 
		 
	 }
}

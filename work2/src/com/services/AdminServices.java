package com.services;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.bean.Admin;
import com.bean.User;

public interface AdminServices {
      public String login(Admin admin,Model model,HttpSession session);
      //修改密码通过email
      public String updPwd(Admin admin,Model model,HttpSession session);
      //消息管理综合
      public String getMsgManage(Model model);
      //修改密码跳转
      public String getAdminInfomation(Model model,int aid);
      //修改密码操作
      public String setAdminInfomation(Admin admin,Model model,HttpServletRequest req,MultipartFile mypic,HttpSession session);
}

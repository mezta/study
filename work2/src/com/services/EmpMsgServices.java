package com.services;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.bean.Msg;

public interface EmpMsgServices {

	public String getListByLimit(Model model, Integer rid, Integer pageNo, Integer pageSize, String likeTitle);

	public String addMsg(Model model, Msg msg, HttpSession session);

	public String delMsg(Model model, Integer id);

	public String getAmsg(int uid);

	public Msg getAmsgNum(String mimtle);

	public String addMsgView(Model model, Integer id);

	public String deleteMsgByID(int id, int uid);

	public String updateMsg(String out, String mletter, HttpSession session);

	public String selectMsgByID(int mid, Model model);

}

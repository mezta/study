package com.services;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.bean.Grouptable;

public interface GroupServices {

	public String getLimitGroups(int currPage, Model model, String TName);

	public String getAddGroup(Model model);

	public String addGroup(Grouptable grouptable, Model model);

	public String getGroupsByID(int gid, Model model);

	public String deleteGroupsByID(int gid, Model model);

	public String getAllGroups(Model model);

	public String getAllGroup(Model model);

	public String getAllGroup(int currPage, Model model, String TName, HttpSession session);

	public String userGetGroupById(int gid, int cid, Model model, HttpSession session);

}

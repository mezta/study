package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bean.Grouptable;

public interface GroupDao {

	public List<Grouptable> getAllGroups(@Param("TName") String TName);

	// 获取分页
	public List<Grouptable> getLimitGroups(@Param("pageNo") int pageNo, @Param("pageSize") int pageSize,
			@Param("TName") String TName);

	public Grouptable getGroupsByID(int gid);

	public int addGroup(Grouptable grouptable);

	public int updateGroups(Grouptable grouptable);

	public int deleteGroupsByID(int gid);

	public List<Grouptable> getAllGroupsList();

	public List<Grouptable> getAllGroupByName(@Param("TName") String TName);

}

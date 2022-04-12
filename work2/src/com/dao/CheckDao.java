package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.bean.User;

@Mapper
@Repository("checkDao")
public interface CheckDao {

    //获取分页
	public List<User> getLimitCheck(@Param("pageNo")int pageNo, @Param("pageSize")int pageSize,@Param("Ulname")String Ulname);
    //通过id获取用户信息
	public User getCheckByID(int id);
	//获取用户信息
	public User getAllUser();
    //获取用户列表
	public List<User> selectUser(@Param("Ulname")String Ulname);
	//根据id删除用户
	public int deleteCheckById(int id);
	
	public int addUser(User user);
	
	public int updUser(User user);
	
}

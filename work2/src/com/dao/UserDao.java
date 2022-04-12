package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.bean.Admin;
import com.bean.User;

@Mapper
@Repository("userDao")
public interface UserDao {

	public User login(User user);

	public int emptyCart(int uid);

	// 获取用户信息
	public User getUserByUid(@Param("uid") int uid);

	// 修改用户密码
	public int updPwd(User user);

	// 修改用户
	public int updateCheck(@Param("uid") int uid);
	
	public int updateUser(User user);

	// 注册用户
	public int addUser(User user);
	
	public List<User> getLimitUser(@Param("pageNo")int pageNo, @Param("pageSize")int pageSize);
	
	public List<User> getAll();

	public List<User> getLimit(@Param("pageNo") int pageNo, @Param("pageSize") int pageSize);
    
	public int updUser(User user);

	public List<User> getEmpNoAudit(@Param("pageNo") int pageNo, @Param("pageSize") int pageSize);

	public List<User> getEmpAuditlist();

	public List<User> getAllNoClockIn(@Param("date") String date);
    //查询是否有同名用户
	public int selectUser(User user);
	
	 //获取信息
	public User getUser(@Param("uid") int uid);
	
	//修改信息
	public int setUser(User user);

	public int updUserLetter(@Param("letter") int letter, @Param("uid") int uid);
	
	public int updUserLetter1(@Param("letter") int letter, @Param("uid") int uid);
	
}

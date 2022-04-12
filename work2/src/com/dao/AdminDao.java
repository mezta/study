package com.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.bean.Admin;
@Mapper
@Repository
public interface AdminDao {
   public Admin login (Admin admin);
   //修改密码通过eamil
   public int updPwd(Admin admin);
   //获取信息
   public Admin getAdmin(@Param("aid") int aid);
   //修改信息
   public int setAdmin( Admin admin);
}

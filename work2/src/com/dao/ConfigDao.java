package com.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.bean.Config;
@Mapper
@Repository
public interface ConfigDao {
	//获取文件上传配置信息
   public Config getConfig();
   //设置文件上传信息
   public int setConfig(Config config);
}

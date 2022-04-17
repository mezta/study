package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bean.Coach;
import com.bean.Course;
import com.pojo.courses;

public interface CourseDao {

	// 获取符合条件的所有项目
	public List<courses> getAllCourse(@Param("CName") String CName);

	// 获取分页
	public List<courses> getLimitCourse(@Param("pageNo") int pageNo, @Param("pageSize") int pageSize,
			@Param("CName") String CName);

	// 获取符合条件的所有项目
	public List<Course> getAllCourses();

	// 获取教练
	public List<Coach> getAllCoach();

	// 新增项目
	public int addCourse(Course course);

	// 获取项目通过id
	public Course getCourseByID(int cid);

	// 获取项目通过id
	public List<Course> getCourseID(int coachid);

	// 修改项目
	public int updateCourse(Course course);

	// 通过id删除项目
	public int deleteCourseByID(int cid);

	// 获取项目通过id
	public List<courses> getuserAllCourse(String CName);

}

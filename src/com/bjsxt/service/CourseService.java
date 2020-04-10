package com.bjsxt.service;

import java.util.List;
import java.util.Map;

import com.bjsxt.pojo.Course;
import com.bjsxt.pojo.Teacher;


public interface CourseService {

	//查询所有课程，教师信息
	List<Course> selCourse();
	
	//查询所有的课程
	List<Course> selAllCourse();
	
	//根据cno删除课程信息
	int deleteCourse(int cno);
	
	//根据cnos删除课程信息
	int deleteCourses(int[] cnos);
	
	//添加课程信息
	int insertCourse(Course course);
	
	//根据cno查询课程信息
	Course selCourseByCno(int cno);
	
	//根据cno更新课程信息
	int updateCourse(Course course);
	
	//添加cno，tno到TC表
	int insertTC(int cno,int tno);
	
	//检查tc表中是否存在
	Map<Object, Object> selTC(int cno,int tno);
}

package com.bjsxt.service;

import java.util.List;

import com.bjsxt.pojo.Teacher;


public interface TeacherService {

	List<Teacher> selTeacher();
	
	//根据系别查询教师
	List<Teacher> selTeacherByDept(String dept);
	
	//根据tno删除教师
	int deleteTeacherByTno(int tno);
	
	//根据tnos删除教师
	int deleteTeachers(int[] tnos);
	
	//添加教师信息
	int insertTeacher(Teacher teacher);
	
	//根据tno查询教师信息
	Teacher selTeacherByTno(int tno);
	
	//修改教师信息
	int updateTeacher(Teacher teacher);
}

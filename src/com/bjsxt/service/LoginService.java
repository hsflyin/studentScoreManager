package com.bjsxt.service;

import com.bjsxt.pojo.Student;
import com.bjsxt.pojo.Teacher;
import com.bjsxt.pojo.User;

public interface LoginService {

	/**
	 * 查询用户登录
	 */
	User selUserService(String username,String userpwd);
	Teacher selTeacher(String username,String userpwd);
	Student selStudent(String username,String userpwd);
	
	//学生修改密码
	int changePwd(String newpwd,int sno);
	
	
	//教师修改密码
	int changePwdTeacher(String newpwd,int tno);
	
}

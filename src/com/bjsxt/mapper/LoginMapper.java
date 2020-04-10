package com.bjsxt.mapper;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.bjsxt.pojo.Student;
import com.bjsxt.pojo.Teacher;
import com.bjsxt.pojo.User;


public interface LoginMapper {
	
	@Select("select * from user where username = #{0} and userpwd = #{1} ")
	User selUser(String username,String userpwd);
	
	@Select("select * from teacher where tno = #{param1} and pwd = #{param2}")
	Teacher selTeacher(String username,String userpwd);
	
	@Select("select * from student where sid = #{param1} and pwd = #{param2}")
	Student selStudent(String username,String userpwd);
	
	//学生修改密码
	@Update("update student set pwd = #{param1} where sno = #{param2}")
	int changePwd(String newpwd,int sno);
	
	//教师修改密码
	@Update("update teacher set pwd = #{param1} where tno = #{param2}")
	int changePwdTeacher(String newpwd,int tno);
	
}

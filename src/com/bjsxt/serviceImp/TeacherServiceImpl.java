package com.bjsxt.serviceImp;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bjsxt.mapper.ClazzMapper;
import com.bjsxt.mapper.TeacherMapper;
import com.bjsxt.pojo.Clazz;
import com.bjsxt.pojo.Teacher;
import com.bjsxt.service.ClazzService;
import com.bjsxt.service.TeacherService;

@Service
public class TeacherServiceImpl implements TeacherService {

	@Autowired
	private TeacherMapper teacherMapper;

	@Override
	public List<Teacher> selTeacher() {
		return teacherMapper.selTeacher();
	}

	@Override
	public List<Teacher> selTeacherByDept(String dept) {
		return  teacherMapper.selTeacherByDept(dept);
	}

	@Override
	public int deleteTeacherByTno(int tno) {
		return teacherMapper.deleteTeacherByTno(tno);
	}

	@Override
	public int insertTeacher(Teacher teacher) {
		return teacherMapper.insertTeacher(teacher);
	}

	@Override
	public Teacher selTeacherByTno(int tno) {
		return teacherMapper.selTeacherByTno(tno);
	}

	@Override
	public int updateTeacher(Teacher teacher) {
		return teacherMapper.updateTeacher(teacher);
	}

	@Override
	public int deleteTeachers(int[] tnos) {
		return teacherMapper.deleteTeachers(tnos);
	} 
	


}

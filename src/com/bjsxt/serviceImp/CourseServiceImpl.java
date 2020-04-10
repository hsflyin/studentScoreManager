package com.bjsxt.serviceImp;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bjsxt.mapper.CourseMapper;
import com.bjsxt.pojo.Course;
import com.bjsxt.pojo.Teacher;
import com.bjsxt.service.CourseService;

@Service
public class CourseServiceImpl implements CourseService {

	@Autowired
	private CourseMapper courseMapper;

	@Override
	public List<Course> selCourse() {
		return courseMapper.selCourse();
	}

	@Override
	public int deleteCourse(int cno) {
		return courseMapper.deleteCourse(cno);
	}

	@Override
	public int deleteCourses(int[] cnos) {
		return courseMapper.deleteCourses(cnos);
	}

	@Override
	public int insertCourse(Course course) {
		return courseMapper.insertCourse(course);
	}

	@Override
	public Course selCourseByCno(int cno) {
		return courseMapper.selCourseByCno(cno);
	}

	@Override
	public int updateCourse(Course course) {
		return courseMapper.updateCourse(course);
	}

	@Override
	public int insertTC(int cno, int tno) {
		return courseMapper.insertTC(cno, tno);
	}

	@Override
	public Map<Object, Object> selTC(int cno, int tno) {
		return courseMapper.selTC(cno, tno);
	}

	@Override
	public List<Course> selAllCourse() {
		return courseMapper.selAllCourse();
	}

	
}

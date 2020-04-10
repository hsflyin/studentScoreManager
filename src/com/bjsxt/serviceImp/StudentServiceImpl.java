package com.bjsxt.serviceImp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bjsxt.mapper.StudentMapper;
import com.bjsxt.pojo.CouTeaStu;
import com.bjsxt.pojo.Course;
import com.bjsxt.pojo.Student;
import com.bjsxt.service.StudentService;

@Service
public class StudentServiceImpl implements StudentService{

	@Autowired
	private StudentMapper studentMapper;
	
	@Override
	public List<Student> selAllStudent(int num,int size) {
		int nums = (num-1)*size;
		List<Student> list = studentMapper.selAllStudent(nums,size);
		return list;
	}

	@Override
	public int deleteStudent(int sno) {
		int i = studentMapper.deleteStudent(sno);
		return i;
	}

	
	@Override
	public int deleteStudents(int[] sids) {
		int i = studentMapper.deleteStudents(sids);
		return i;
	}

	@Override
	public int addStudent(Student student) {
		int i = studentMapper.insertStudent(student);
		return i;
	}

	@Override
	public Student selStudentBySno(int sno) {
		Student student = studentMapper.selStudentBySno(sno);
		return student;
	}
	
	@Override
	public Student selStudentBySid(int sid) {
		Student student = studentMapper.selStudentBySid(sid);
		return student;
	}

	@Override
	public int updateStudentBySid(Student student) {
		int i = studentMapper.updateStudentBySid(student);
		return i;
	}

	@Override
	public List<Student> selStudentLike(Student student) {
		List<Student> list = studentMapper.selStudentLike(student);
		return list;
	}

	@Override
	public int selStudentCount() {
		return studentMapper.selStudentCount();
	}

	@Override
	public int selLikeStudentCount(Student student) {
		return studentMapper.selLikeStudentCount(student);
	}

	@Override
	public List<Student> selStudentLike1(String likeid, String likename, int num, int size) {
		int nums = (num-1)*size;
		return studentMapper.selStudentLike1(likeid, likename, nums, size);
	}

	@Override
	public Student selStudentCourse(int sno) {
		return studentMapper.selStudentCourse(sno);
	}

	@Override
	public int stuChooseCourse(List<CouTeaStu> list) {
		return studentMapper.stuChooseCourse(list);
	}

	@Override
	public List<CouTeaStu> selectCouTeaStu(List<CouTeaStu> list) {
		return studentMapper.selectCouTeaStu(list);
	}

	@Override
	public List<Course> selselectedCourse(String sno) {
		return studentMapper.selselectedCourse(sno);
	}

	@Override
	public List<CouTeaStu> teacherSetScore(String tno) {
		return studentMapper.teacherSetScore(tno);
	}

	@Override
	public int setScore(int ctsid, double score) {
		return studentMapper.setScore(ctsid, score);
	}

	@Override
	public List<CouTeaStu> selStudentScore(String tno) {
		return studentMapper.selStudentScore(tno);
	}

	@Override
	public List<CouTeaStu> selLikeStudentScore(String tno, String sid, String sname, String cname) {
		return studentMapper.selLikeStudentScore(tno, sid, sname, cname);
	}

	@Override
	public List<CouTeaStu> selStudentScoreDesc(String tno) {
		return studentMapper.selStudentScoreDesc(tno);
	}

	@Override
	public List<CouTeaStu> selStudentScoreAsc(String tno) {
		return studentMapper.selStudentScoreAsc(tno);
	}

	@Override
	public List<CouTeaStu> selLikeStudentScoreAsc(String tno, String sid, String sname, String cname) {
		return studentMapper.selLikeStudentScoreAsc(tno, sid, sname, cname);
	}

	@Override
	public List<CouTeaStu> selLikeStudentScoreDesc(String tno, String sid, String sname, String cname) {
		return studentMapper.selLikeStudentScoreDesc(tno, sid, sname, cname);
	}


}

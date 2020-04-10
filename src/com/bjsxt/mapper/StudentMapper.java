package com.bjsxt.mapper;

import java.util.List;

import com.bjsxt.pojo.CouTeaStu;
import com.bjsxt.pojo.Course;
import com.bjsxt.pojo.Student;

public interface StudentMapper {

	List<Student> selAllStudent(int nums,int size);
	
	//总条数
	int selStudentCount();
	
	//总条数
	int selLikeStudentCount(Student student);
	
	int deleteStudent(int sno);
	
	int deleteStudents(int[] sids);
	
	//添加学生
	int insertStudent(Student student);
	
	//根据学号查询学生
	Student selStudentBySid(int sid);
	
	Student selStudentBySno(int sno);
	
	Student selStudentCourse(int sno);
	
	//修改学生     
	int updateStudentBySid(Student student);
	
	//模糊查询学生信息
	List<Student> selStudentLike(Student student);
	
	List<Student> selStudentLike1(String likeid,String likename,int nums,int size);
	
	//学生选课
	int stuChooseCourse(List<CouTeaStu> list);
	
	//检查cts表中是否存在
	List<CouTeaStu> selectCouTeaStu(List<CouTeaStu> list);

	//查看已选课程
	List<Course> selselectedCourse(String sno);
	
	//查看评分课程
	List<CouTeaStu> teacherSetScore(String tno);
	
	//评分
	int setScore(int ctsid,double score);
	
	//查看已评分课程
	List<CouTeaStu> selStudentScore(String tno);
	List<CouTeaStu> selStudentScoreDesc(String tno);
	List<CouTeaStu> selStudentScoreAsc(String tno);
	
	//模糊查询学生成绩
	List<CouTeaStu> selLikeStudentScore(String tno,String sid,String sname,String cname);
	List<CouTeaStu> selLikeStudentScoreAsc(String tno,String sid,String sname,String cname);
	List<CouTeaStu> selLikeStudentScoreDesc(String tno,String sid,String sname,String cname);
	
	
}

package com.bjsxt.controller;


import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bjsxt.pojo.CouTeaStu;
import com.bjsxt.pojo.Course;
import com.bjsxt.pojo.Student;
import com.bjsxt.pojo.SxtPageUtil;
import com.bjsxt.service.StudentService;
import com.google.gson.Gson;

@Controller
public class StudentController {

	@Autowired 
	private StudentService studentService;
	
	
	
	@RequestMapping("studentMessage")
	public String studentMessage(String likeid,String likename,@RequestParam(defaultValue="1") int num,@RequestParam(defaultValue="10") int size,HttpServletRequest req){
		if((likeid!=null&&likeid!="")||(likename!=null&&likename!="")){
			System.out.println("likeid="+likeid+"---likename="+likename);
			Student student = new Student();
			if(likeid!=""&&likeid!=null){
				student.setSid(Integer.parseInt(likeid));
			}
			if(likename!=""&&likename!=null){
				student.setSname(likename);
			}
			
			int total = studentService.selLikeStudentCount(student);
			SxtPageUtil<Student> pageStudentList = new SxtPageUtil<>(num+"", size+"", total);
			List<Student> list = studentService.selStudentLike1(likeid,likename,num,size);
			pageStudentList.setList(list);
			req.getSession().setAttribute("pageStudentList", pageStudentList);
			req.setAttribute("likeid", likeid);
			req.setAttribute("likename", likename);
			return "student";
		}else{
			List<Student> list = studentService.selAllStudent(num,size);
			System.out.println(list);
			if(list!=null){
				int total = studentService.selStudentCount();
				SxtPageUtil<Student> pageStudentList = new SxtPageUtil<>(num+"", size+"", total);
				pageStudentList.setList(list);
				req.getSession().setAttribute("pageStudentList", pageStudentList);
				return "student";
			}else{
				return "error";
			}
		}
	}
	
	@RequestMapping("teacherSelectStudent")
	public String teacherSelectStudent(String likeid,String likename,@RequestParam(defaultValue="1") int num,@RequestParam(defaultValue="10") int size,HttpServletRequest req){
		if((likeid!=null&&likeid!="")||(likename!=null&&likename!="")){
			System.out.println("likeid="+likeid+"---likename="+likename);
			Student student = new Student();
			if(likeid!=""&&likeid!=null){
				student.setSid(Integer.parseInt(likeid));
			}
			if(likename!=""&&likename!=null){
				student.setSname(likename);
			}
			
			int total = studentService.selLikeStudentCount(student);
			SxtPageUtil<Student> pageStudentList = new SxtPageUtil<>(num+"", size+"", total);
			List<Student> list = studentService.selStudentLike1(likeid,likename,num,size);
			pageStudentList.setList(list);
			req.getSession().setAttribute("pageStudentList", pageStudentList);
			req.setAttribute("likeid", likeid);
			req.setAttribute("likename", likename);
			return "teacherSelectStudent";
		}else{
			List<Student> list = studentService.selAllStudent(num,size);
			System.out.println(list);
			if(list!=null){
				int total = studentService.selStudentCount();
				SxtPageUtil<Student> pageStudentList = new SxtPageUtil<>(num+"", size+"", total);
				pageStudentList.setList(list);
				req.getSession().setAttribute("pageStudentList", pageStudentList);
				return "teacherSelectStudent";
			}else{
				return "error";
			}
		}
	}
	
	
	@RequestMapping("deleteStudent")
	public String deleteStudent(String sno){
		int i = studentService.deleteStudent(Integer.parseInt(sno));
		if(i > 0){
			return "redirect:studentMessage";
		}else{
			return "error";
		}
	}
	
	@RequestMapping("deleteStudents")
	public String deleteStudents(String varids,HttpServletRequest req){
		String[] sids = varids.split(",");
		int[] ints = new int[sids.length];
		for (int i = 0; i < sids.length; i++) {
			ints[i] = Integer.parseInt(sids[i]); 
		}
		int i = studentService.deleteStudents(ints);
		if(i > 0){
			return "redirect:studentMessage";
		}else{
			return "error";
		}
	}

	@RequestMapping("addStudent")
	public String addStudent(Student student,HttpServletRequest req){
		System.out.println("StudentController.addStudent()"+student);  
		int i = studentService.addStudent(student);
		
		if(i > 0){
			return "redirect:studentMessage";
		}else{
			return "error";
		}
	}
	
	@RequestMapping(value="selSno",produces="text/html;charset=utf-8")
	@ResponseBody
	public String selSno(String sno){
		Student student = studentService.selStudentBySno(Integer.parseInt(sno));
		System.out.println(student);
		String json = new Gson().toJson(student);
		return json;
	}
	
	@RequestMapping(value="selSid",produces="text/html;charset=utf-8")
	@ResponseBody
	public String selSid(String sid){
		Student student = studentService.selStudentBySid(Integer.parseInt(sid));
		String json = new Gson().toJson(student);
		return json;
	}
	
	//studentInf.jsp中查询学生信息
	@RequestMapping("selStudentInf")
	public String selStudentInf(String sno,HttpServletRequest req){
		Student student = studentService.selStudentCourse(Integer.parseInt(sno));
		if(student!=null){
			req.getSession().setAttribute("studentInformation", student);
			return "studentInf";
		}
		return "error";
	}
	
	@RequestMapping("updateStudent")
	public String updateStudent(Student student){
		System.out.println("StudentController.addStudent()"+student);
		int i = studentService.updateStudentBySid(student);
		if(i>0){
			return "redirect:studentMessage";
		}
		return "error";
	}
	
	@RequestMapping(value="selStudentLike",produces="text/html;charset=utf-8")
	public String selStudentLike(String likeid,String likename,@RequestParam(defaultValue="1") int num,@RequestParam(defaultValue="10") int size,HttpServletRequest req){
		System.out.println("likeid="+likeid+"---likename="+likename);
		Student student = new Student();
		if(likeid!=""&&likeid!=null){
			student.setSid(Integer.parseInt(likeid));
		}
		if(likename!=""&&likename!=null){
			student.setSname(likename);
		}
		
		int total = studentService.selLikeStudentCount(student);
		SxtPageUtil<Student> pageStudentList = new SxtPageUtil<>(num+"", size+"", total);
		List<Student> list = studentService.selStudentLike1(likeid,likename,num,size);
		pageStudentList.setList(list);
		req.getSession().setAttribute("pageStudentList", pageStudentList);
		req.setAttribute("likeid", likeid);
		req.setAttribute("likename", likename);
		return "student";
	}
	
	@RequestMapping("stuChooseCourse")
	@ResponseBody
	public String stuChooseCourse(String varcnos,String sno,HttpServletRequest req){
		List<CouTeaStu> list = new ArrayList<>();
		String[] str = varcnos.split("_");
		for(int i = 0 ;i < str.length ;i++){
			CouTeaStu couTeaStu = new CouTeaStu();
			String[] str1 = str[i].split(",");
			for(int j = 0; j < str1.length; j++){
				if(str1[0]!=""&&str1[1]!=""&&sno!=""){
					couTeaStu.setCno(Integer.parseInt(str1[0]));
					couTeaStu.setTno(Integer.parseInt(str1[1]));
					couTeaStu.setSno(Integer.parseInt(sno));
				}
			}
			list.add(couTeaStu);
		}
		System.out.println(list);
		List<CouTeaStu> list1 = studentService.selectCouTeaStu(list);
		if(list1!=null&&list1.size()!=0){
			return "2";
		}else{
			int i = studentService.stuChooseCourse(list);
			if(i>0){
				return "1";
			}else{
				return "0";
			}
		}
	}

	@RequestMapping("selselectedCourse")
	public String selselectedCourse(String sno,HttpServletRequest req){
		List<Course> list = studentService.selselectedCourse(sno);
		if(list!=null){
			req.getSession().setAttribute("selectedCourse", list);
			return "selectedcourse";
		}else{
			return "error";
		}
	}
	
	@RequestMapping("selCourseScore")
	public String selCourseScore(String sno,HttpServletRequest req){
		List<Course> list = studentService.selselectedCourse(sno);
		if(list!=null){
			req.getSession().setAttribute("selectedCourse", list);
			return "courseScore";
		}else{
			return "error";
		}
	}
	
	@RequestMapping("teacherSetScore")
	public String teacherSetScore(String tno,HttpServletRequest req){
		List<CouTeaStu> list = studentService.teacherSetScore(tno);
		System.out.println(list);
		if(list!=null){
			req.getSession().setAttribute("selectedTeacherScore", list);
			return "teacherScore";
		}else{
			return "error";
		}
	}
	
	@RequestMapping("setScore")
	@ResponseBody
	public String setScore(String ctsid,String score){
		int i = studentService.setScore(Integer.parseInt(ctsid),Double.parseDouble(score));
		if(i>0){
			return "true";
		}else{
			return "false";
		}
	}
	
	@RequestMapping("selStudentScore")
	public String selStudentScore(String likesid,String likesname,String likecname,String tno,HttpServletRequest req){
		if((likesid!=null&&likesid!=""&&!("undefined").equals(likesid))||(likesname!=null&&likesname!=""&&!("undefined").equals(likesname))||(likecname!=null&&likecname!=""&&!("undefined").equals(likecname))){
			List<CouTeaStu> list = studentService.selLikeStudentScore(tno, likesid, likesname, likecname);
			if(list!=null){
				req.getSession().setAttribute("StudentScoreList", list);
				req.setAttribute("likesid", likesid);
				req.setAttribute("likesname", likesname);
				req.setAttribute("likecname", likecname);
				return "StudentScore";
			}else{
				return "error";
			}
		}else{
			List<CouTeaStu> list = studentService.selStudentScore(tno);
			if(list!=null){
				req.getSession().setAttribute("StudentScoreList", list);
				return "StudentScore";
			}else{
				return "error";
			}
		}
	}
	
	@RequestMapping("updateScore")
	@ResponseBody
	public String updateScore(String ctsid,String score){
		int i = studentService.setScore(Integer.parseInt(ctsid),Double.parseDouble(score));
		if(i>0){
			return "true";
		}else{
			return "false";
		}
	}
	
	@RequestMapping(value="selStudentScoreAsc",produces="text/html;charset=utf-8")
	public String selStudentScoreAsc(String likesid,String likesname,String likecname,String tno,HttpServletRequest req){
		if((likesid!=null&&likesid!=""&&!("undefined").equals(likesid))||(likesname!=null&&likesname!=""&&!("undefined").equals(likesname))||(likecname!=null&&likecname!=""&&!("undefined").equals(likecname))){
			try {
				likesname = URLDecoder.decode(likesname,"utf-8");
				likecname = URLDecoder.decode(likecname,"utf-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			List<CouTeaStu> list = studentService.selLikeStudentScoreAsc(tno, likesid, likesname, likecname);
			if(list!=null){
				req.getSession().setAttribute("StudentScoreList", list);
				req.setAttribute("likesid", likesid);
				req.setAttribute("likesname", likesname);
				req.setAttribute("likecname", likecname);
				req.setAttribute("sort", "asc");
				return "StudentScore";
			}else{
				return "error";
			}
		}else{
			List<CouTeaStu> list = studentService.selStudentScoreAsc(tno);
			if(list!=null){
				req.getSession().setAttribute("StudentScoreList", list);
				req.setAttribute("sort", "asc");
				return "StudentScore";
			}else{
				return "error";
			}
		}
	}
	
	@RequestMapping(value="selStudentScoreDesc",produces="text/html;charset=utf-8")
	public String selStudentScoreDesc(String likesid,String likesname,String likecname,String tno,HttpServletRequest req){
		if((likesid!=null&&likesid!=""&&!("undefined").equals(likesid))||(likesname!=null&&likesname!=""&&!("undefined").equals(likesname))||(likecname!=null&&likecname!=""&&!("undefined").equals(likecname))){
			try {
				likesname = URLDecoder.decode(likesname,"utf-8");
				likecname = URLDecoder.decode(likecname,"utf-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			List<CouTeaStu> list = studentService.selLikeStudentScoreDesc(tno, likesid, likesname, likecname);
			if(list!=null){
				req.getSession().setAttribute("StudentScoreList", list);
				req.setAttribute("likesid", likesid);
				req.setAttribute("likesname", likesname);
				req.setAttribute("likecname", likecname);
				req.setAttribute("sort", "desc");
				return "StudentScore";
			}else{
				return "error";
			}
		}else{
			List<CouTeaStu> list = studentService.selStudentScoreDesc(tno);
			if(list!=null){
				req.getSession().setAttribute("StudentScoreList", list);
				req.setAttribute("sort", "desc");
				return "StudentScore";
			}else{
				return "error";
			}
		}
	}
	
	
}

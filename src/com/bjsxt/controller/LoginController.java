package com.bjsxt.controller;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bjsxt.pojo.Student;
import com.bjsxt.pojo.Teacher;
import com.bjsxt.pojo.User;
import com.bjsxt.service.LoginService;

@Controller
public class LoginController {

	//login
	@Resource LoginService loginServiceImpl;
	
	@RequestMapping("login")
	public String userlogin(String username,String userpwd,String role,HttpServletRequest req){
		//System.out.println("LoginController.userlogin2()"+username+" "+userpwd+"---"+role);
		if(role.equals("1")){
			System.out.println("管理员");
			return "main";
//			User user = loginServiceImpl.selUserService(username, userpwd);
//			if(user!=null){
//				req.getSession().setAttribute("user",user);
//				return "main";
//			}else{
//				req.setAttribute("message", "用户名或密码错误");
//				return "login";
//			}
		}else if(role.equals("2")){
			System.out.println("教师");
			Teacher teacher = loginServiceImpl.selTeacher(username, userpwd);
			if(teacher!=null){
				req.getSession().setAttribute("user",teacher);
				return "main";
			}else{
				req.setAttribute("message", "用户名或密码错误");
				return "login";
			}
		}else if(role.equals("3")){
			System.out.println("学生");
			Student student = loginServiceImpl.selStudent(username, userpwd);
			if(student!=null){
				req.getSession().setAttribute("user",student);
				return "main";
			}else{
				req.setAttribute("message", "用户名或密码错误");
				return "login";
			}
		}else{
			return "error";
		}
		
	}
		
	@RequestMapping("loginout")
	public String userloginout(HttpServletRequest req){
		req.getSession().removeAttribute("user");
		return "redirect:/login.jsp";
	}
	
	@RequestMapping("changePwd")
	@ResponseBody
	public String changePwd(String newpwd,String sno) {
		int i = loginServiceImpl.changePwd(newpwd, Integer.parseInt(sno));
		if(i>0){
			return "1";
		}else{
			return "0";
		}
	}
	
	@RequestMapping("changePwdTeacher")
	@ResponseBody
	public String changePwdTeacher(String newpwd,String tno) {
		System.out.println("newpwd"+"----"+newpwd+"----"+tno);
		int i = loginServiceImpl.changePwdTeacher(newpwd, Integer.parseInt(tno));
		if(i>0){
			return "1";
		}else{
			return "0";
		}
	}
}

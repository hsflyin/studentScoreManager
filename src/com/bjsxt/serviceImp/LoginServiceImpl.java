package com.bjsxt.serviceImp;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bjsxt.mapper.LoginMapper;
import com.bjsxt.pojo.Student;
import com.bjsxt.pojo.Teacher;
import com.bjsxt.pojo.User;
import com.bjsxt.service.LoginService;

@Service
public class LoginServiceImpl implements LoginService {

	
	@Autowired
	private LoginMapper loginMapper;
	
	@Override
	public User selUserService(String username, String userpwd) {
		return loginMapper.selUser(username, userpwd);
	}

	@Override
	public Teacher selTeacher(String username, String userpwd) {
		return loginMapper.selTeacher(username, userpwd);
	}

	@Override
	public Student selStudent(String username, String userpwd) {
		return loginMapper.selStudent(username, userpwd);
	}

	@Override
	public int changePwd(String newpwd, int sno) {
		return loginMapper.changePwd(newpwd, sno);
	}

	@Override
	public int changePwdTeacher(String newpwd, int tno) {
		return loginMapper.changePwdTeacher(newpwd, tno);
	}

}

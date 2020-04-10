package com.bjsxt.serviceImp;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bjsxt.mapper.ClazzMapper;
import com.bjsxt.pojo.Clazz;
import com.bjsxt.service.ClazzService;

@Service
public class ClazzServiceImpl implements ClazzService {

	@Autowired
	private ClazzMapper clazzMapper; 
	
	@Override
	public List<Clazz> selClazz() {
		return clazzMapper.selClazz();
	}

	@Override
	public int deleteClazz(int clazzno) {
		return clazzMapper.deleteClazz(clazzno);
	}

	@Override
	public int insertClazz(Clazz clazz) {
		return clazzMapper.insertClazz(clazz);
	}

	@Override
	public Clazz selClazzByClazzno(Clazz clazz) {
		return clazzMapper.selClazzByClazzno(clazz);
	}

	@Override
	public int updateClazz(Clazz clazz) {
		return clazzMapper.updateClazz(clazz);
	}

	@Override
	public int deleteByClazzno(int[] clazznos) {
		return clazzMapper.deleteByClazzno(clazznos);
	}


}

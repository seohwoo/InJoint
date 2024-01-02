package com.injoit.mvc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.injoit.mvc.repository.TestMapper;

@Service
public class TestServiceImpl implements TestService{

	
	@Autowired
	private TestMapper mapper;
	
	@Override
	public int count() {
		return mapper.count();
	}

}

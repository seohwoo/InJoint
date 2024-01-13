package com.injoit.mvc.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.injoit.mvc.bean.EmployeeDTO;
import com.injoit.mvc.repository.SecurityMapper;

public class CustomUserDetailsService implements UserDetailsService {

	@Autowired
	private SecurityMapper mapper;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		EmployeeDTO dto = mapper.read(username);	
		return dto == null ? null : new CustomUser(dto);
	}
	
	
}


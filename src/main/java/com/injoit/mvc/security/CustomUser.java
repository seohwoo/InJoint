package com.injoit.mvc.security;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.injoit.mvc.bean.EmployeeDTO;

import lombok.Getter;

@Getter
public class CustomUser extends User {
	private EmployeeDTO dto;
	public CustomUser(String username, String password, Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
	}

	public CustomUser(EmployeeDTO dto) {
		super(dto.getEmployeenum(), dto.getPw(), dto.getAuthList().stream()
				.map(auth -> new SimpleGrantedAuthority(auth.getAuth()))
									.collect(Collectors.toList()));
		this.dto = dto;
	}
}

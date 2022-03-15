package com.one.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.one.dto.ManagerVO;

public class Manager implements UserDetails {

	private ManagerVO manager;
	public Manager(ManagerVO manager) {
		this.manager = manager;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		List<GrantedAuthority> roles = new ArrayList<GrantedAuthority>();
		roles.add(new SimpleGrantedAuthority("A103"));
		return roles;
	}

	@Override
	public String getPassword() {
		return manager.getManagerPwd();
	}

	@Override
	public String getUsername() {
		return manager.getManagerId();
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return true;
	}

	public ManagerVO getManagerVO() {
		return this.manager;
	}
}

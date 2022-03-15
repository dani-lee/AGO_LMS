package com.one.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.one.dto.AdminVO;
import com.one.dto.ManagerVO;

public class Admin implements UserDetails {

	private AdminVO admin;
	public Admin(AdminVO admin) {
		this.admin = admin;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		List<GrantedAuthority> roles = new ArrayList<GrantedAuthority>();
		roles.add(new SimpleGrantedAuthority("A104"));
		return roles;
	}

	@Override
	public String getPassword() {
		return admin.getAdminPwd();
	}

	@Override
	public String getUsername() {
		return admin.getAdminId();
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

	public AdminVO getAdminVO() {
		return this.admin;
	}
}

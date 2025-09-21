package com.javaweb.service.Impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.javaweb.model.dto.MyUserDetail;
import com.javaweb.model.dto.RoleDTO;
import com.javaweb.model.dto.UserDTO;
import com.javaweb.service.IUserService;


@Service
public class CustomUserDetailsService implements UserDetailsService{
	
	@Autowired
	private IUserService userService;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		UserDTO userDTO = userService.findOneByUserNameAndEnable(username, 1);
		if(userDTO==null) {
			throw new UsernameNotFoundException("UserName khong hop le!");
		}
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		for(RoleDTO item : userDTO.getRoles()) {
			authorities.add(new SimpleGrantedAuthority("ROLE_"+item.getCode()));
		}
		MyUserDetail myUserDetail = new MyUserDetail(username, userDTO.getPassWord(), true, true, true, true, authorities);
		BeanUtils.copyProperties(userDTO, myUserDetail);
		return myUserDetail;
	}
	
	

}

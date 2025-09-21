package com.javaweb.model.dto;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

public class MyUserDetail extends User{
	
	  public MyUserDetail(String username, String password, boolean enabled, boolean accountNonExpired, boolean credentialsNonExpired, boolean accountNonLocked, Collection<? extends GrantedAuthority> authorities) {
	        super(username, password, enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, authorities);
	    }
	  
	  private int id;
	  private String userName;
	  public int getId() {
		  return id;
	  }
	  public void setId(int id) {
		  this.id = id;
	  }
	  public String getUserName() {
		  return userName;
	  }
	  public void setUserName(String userName) {
		  this.userName = userName;
	  }
	  
	  

}

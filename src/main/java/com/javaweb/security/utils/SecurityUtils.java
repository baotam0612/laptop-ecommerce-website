package com.javaweb.security.utils;

import com.javaweb.model.dto.MyUserDetail;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;

import java.util.ArrayList;
import java.util.List;

public class SecurityUtils {


    // lay thong tin user login
	 public static MyUserDetail getPrincipal() {
	        return (MyUserDetail) (SecurityContextHolder
	                .getContext()).getAuthentication().getPrincipal();
	    }

        // lay thong tin quyen cua user
	    public static List<String> getAuthorities() {
	        List<String> results = new ArrayList<>();
	        List<GrantedAuthority> authorities = (List<GrantedAuthority>)(SecurityContextHolder.getContext().getAuthentication().getAuthorities());
	        for (GrantedAuthority authority : authorities) {
	            results.add(authority.getAuthority());
	        }
	        return results;
	    }
	    

	  

}

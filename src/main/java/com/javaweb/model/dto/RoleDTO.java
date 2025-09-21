package com.javaweb.model.dto;

import com.javaweb.entity.RoleEntity;

public class RoleDTO extends AbstractDTO<RoleEntity>{
	
	private static final long serialVersionUID = 5830885581031027382L;
	
	private String name;
	private String code;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
}

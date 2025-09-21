package com.javaweb.model.dto;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class UserDTO extends AbstractDTO<UserDTO>{
	private String userName;
	private String passWord;
	private int enabled;
	private List<RoleDTO> roles = new ArrayList<RoleDTO>();
	private String roleName;
	private String roleCode;
	private Map<String, String> rolesDTO = new HashMap<String, String>();
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassWord() {
		return passWord;
	}
	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}
	public int getEnabled() {
		return enabled;
	}
	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}
	public List<RoleDTO> getRoles() {
		return roles;
	}
	public void setRoles(List<RoleDTO> roles) {
		this.roles = roles;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public String getRoleCode() {
		return roleCode;
	}
	public void setRoleCode(String roleCode) {
		this.roleCode = roleCode;
	}
	public Map<String, String> getRolesDTO() {
		return rolesDTO;
	}
	public void setRolesDTO(Map<String, String> rolesDTO) {
		this.rolesDTO = rolesDTO;
	}
	
	
	

}

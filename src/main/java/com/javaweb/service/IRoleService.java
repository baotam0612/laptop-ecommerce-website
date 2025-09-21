package com.javaweb.service;

import java.util.List;
import java.util.Map;

import com.javaweb.model.dto.RoleDTO;

public interface IRoleService {
	List<RoleDTO> findAll();
	Map<String,String> getRoles();
}

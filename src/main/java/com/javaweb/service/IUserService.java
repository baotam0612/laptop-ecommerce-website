package com.javaweb.service;

import com.javaweb.model.dto.UserDTO;

public interface IUserService {
	
	UserDTO findOneByUserNameAndEnable(String userName,int enabled);

}

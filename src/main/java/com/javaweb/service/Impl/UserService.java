package com.javaweb.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaweb.converter.UserConverter;
import com.javaweb.model.dto.UserDTO;
import com.javaweb.repository.UserRepository;
import com.javaweb.service.IUserService;


@Service
public class UserService implements IUserService{
	
	 @Autowired
	  private UserRepository userRepository;

	@Autowired
	private UserConverter userConverter;
	
	@Override
	public UserDTO findOneByUserNameAndEnable(String userName, int enabled) {
		 return userConverter.convertToDto(userRepository.findOneByUserNameAndEnabled(userName, enabled));	  
	}
	
	

}
